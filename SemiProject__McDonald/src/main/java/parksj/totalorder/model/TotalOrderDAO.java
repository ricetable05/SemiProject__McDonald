package parksj.totalorder.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class TotalOrderDAO implements InterTotalOrderDAO {
	
	
	private DataSource ds;    // DataSource ds 는 아파치톰켓이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 사용한 자원을 반납하는 close() 매소드 생성하기
	private void close() {
		try {
			if(rs != null) { rs.close(); rs=null;}
			if(pstmt != null) { pstmt.close(); pstmt=null;}
			if(conn != null) { conn.close(); conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// 생성자
	public TotalOrderDAO() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");      // lookup(이름) 이 중요한 것이다. web.xml 부분의 이름, context.xml 이름과 모두 같아야 한다. 이 것이 배치 서술자인 web.xml 로 가고 context.xml 로 간다. 
		    
		} catch(NamingException e) {
			e.printStackTrace();
		}
	     
	}
	
	// 페이징 철를 위한 검색이 있는 또는 검색이 없는 주문내역에 대한 총페이지 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {

		int totalPage = 0;    
		  
        try {
       	 
           conn = ds.getConnection();
           
           String sql = " select ceil(count(*)/?) "
                      + " from tbl_member "
                      + " where userid != 'admin' ";
           
           String colname = paraMap.get("searchType");
           String searchWord = paraMap.get("searchWord");
           
           if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
              sql += " and " + colname + " like '%'|| ? ||'%' " ;
             
           }
                       
           pstmt = conn.prepareStatement(sql); 
                       
           pstmt.setString(1, paraMap.get("sizePerPage"));
           
           if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
              pstmt.setString(2, searchWord);
           }
           
           rs = pstmt.executeQuery();
           
           rs.next();
           
           totalPage = rs.getInt(1);
                    
        } finally {
           close();
        }
        
        return totalPage;

		
	}

	// 페이징 처리한 모든 주문내역 또는 검색한 회원의 주문내역 보여주기
	@Override
	public List<TotalOrderVO> selectPagingOrder(Map<String, String> paraMap) throws SQLException {
		List<TotalOrderVO> totalOrderList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select odr_no, fk_userid, odr_date, is_delivery "
					   + "    from "
					   + "    (  "
					   + "        select rownum AS RNO, odr_no, fk_userid, odr_date, is_delivery "
					   + "        from "
					   + "        ( "
					   + "         select odr_no, fk_userid, odr_date, is_delivery "
					   + "         from tbl_order "
					   + "         where fk_userid != 'admin' ";
			
			String colname = paraMap.get("searchType");
			String searchWord = paraMap.get("searchWord");
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));  
			int sizePerPage =  Integer.parseInt(paraMap.get("sizePerPage"));
			
			if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) {
				
				sql += " and " + colname + " like '%' || ? || '%' "; // 이메일은 암호화 처리되기 때문에 전체 이메일을 검색창에 입력해야한다.
				
			}
			
				  sql += "         order by odr_date desc "
				   	   + "        )V "
					   + "    )T "
					   + " where RNO between ? and ? ";
				  
				  pstmt = conn.prepareStatement(sql);
					
				/*
					  === 페이징 처리 공식 === 
					  WHERE RNO between (조회하고자하는 페이지번호 * 한페이지당 보여줄 행의개수) - (한페이지당보여줄 행의개수 - 1) and (조회하고자하는 페이지번호 * 한페이지당 보여줄 행의개수);
				 */
						
				if(!"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty()) { // 검색어가 있는 경우
					pstmt.setString(1, searchWord);
					pstmt.setInt(2,(currentShowPageNo * sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(3,(currentShowPageNo * sizePerPage));
				}
				else { // 검색이 없는 경우
					pstmt.setInt(1,(currentShowPageNo * sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(2,(currentShowPageNo * sizePerPage));
				}
		
				rs = pstmt.executeQuery();	  
				
				while(rs.next()) {
					
					TotalOrderVO totalOrder = new TotalOrderVO();
					
					totalOrder.setOdr_no(rs.getInt("odr_no"));
					totalOrder.setFk_userid(rs.getString("fk_userid"));
					totalOrder.setOdr_date(rs.getString("odr_date"));
					totalOrder.setIs_delivery(rs.getInt("is_delivery"));
					
					
					totalOrderList.add(totalOrder);
				} // end of while(rs.next)) ----------------------------------------------------------------------
			
		} finally {
			close();
		}
		
		return totalOrderList;
	}
	
	

	// order_no 값을 입력받아서 주문번호 1건에 대한 상세정보를 알아오기
	
	@Override
	public List<OrderDetailVO> orderDetailList(int odr_no) throws SQLException {

			List<OrderDetailVO> orderDetailList = new ArrayList<>();
			
			try {
				conn = ds.getConnection();
				
				String sql = " select odr_product_no, fk_item_no, item_name, item_price, quantity, is_set, odr_no, fk_userid, is_delivery, odr_date "
	                       + " from ( "
	                       + "    select * "
	                       + "    from tbl_order_list L "
	                       + "    JOIN tbl_order O "
	                       + "    ON L.fk_odr_no = O.odr_no "
	                       + " ) V"
	                       + " where odr_no = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, odr_no);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					OrderDetailVO dvo = new OrderDetailVO();
					dvo.setOdr_product_no(rs.getInt(1));
					dvo.setFk_item_no(rs.getInt(2));
					dvo.setItem_name(rs.getString(3));
					dvo.setItem_price(rs.getInt(4));
					dvo.setQuantity(rs.getInt(5));
					dvo.setIs_set(rs.getInt(6));
					
					TotalOrderVO tvo = new TotalOrderVO();
					tvo.setOdr_no(rs.getInt(7));
					tvo.setFk_userid(rs.getString(8));
					tvo.setIs_delivery(rs.getInt(9));
					tvo.setOdr_date(rs.getString(10));
					dvo.setTotalOrderVO(tvo);
					
					orderDetailList.add(dvo);
					
				}
				
			}finally {
				close();
			}
			
			return orderDetailList;
			
	}

}
