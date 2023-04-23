package jeonym.item.model;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ItemDAO implements InterItemDAO {

	private Connection conn ;
	private PreparedStatement pstmt ; 
	private ResultSet rs ;
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP( DB Connection Pool ) 이다.
	
	
	
	// 사용한 자원을 반납하는 close() 메소드
	private void close() {
		try {
			if ( rs != null ) {rs.close(); rs= null ;}
			if ( pstmt != null ) {pstmt.close(); pstmt= null ;}
			if ( conn != null ) {conn.close(); conn= null ;}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // end of close 
	
	// 생성자
	public ItemDAO(){
	    try {

	    	Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
		   
		 }catch (NamingException e) {
			 
			 e.printStackTrace();
	     }
	    
	}// end of public ItemDAO
	
	
	
	
	@Override
	public List<ItemVO> getOrderMainItemList() throws SQLException {
		
		List<ItemVO> OrderMainItemList = new ArrayList<>(); // 빈 ArrayList 객체 생성
		
		try {
			
			conn = ds.getConnection();
			String sql = " select item_no, item_name, item_image, calories "
					   + " from "
					   + " ( "
					   + "    select item_no, item_name, item_image "
					   + "    from tbl_item "
					   + " ) IT "
					   + " JOIN  "
					   + " ( "
					   + " select pk_fk_item_no, calories "
					   + " from tbl_item_detail "
					   + " ) ITD "
					   + " on IT.item_no = ITD.pk_fk_item_no "
					   + " where IT.item_no between 100 and 109 ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ItemVO ivo = new ItemVO();
				
				ivo.setItem_no(rs.getInt(1));
				ivo.setItem_name(rs.getString(2));
				ivo.setItem_image(rs.getString(3));
				
				ItemDetailVO idvo = new ItemDetailVO(); // ItemDetailVO 객체 생성
				idvo.setCalories(rs.getInt(4));
				ivo.setItemDetailVO(idvo); // ItemVO 의 ItemDetailVO 필드의 ItemDetailVO 객체에 set 한다.
				
				OrderMainItemList.add(ivo);

			}

		}
		finally {
			close();
		}
		return OrderMainItemList;
	} // end of public List<ItemVO> getOrderMainItemList() throws SQLException {} -------------------

	@Override
	public List<Map<String, String>> getCategoryList() throws SQLException {

		List<Map<String, String>> categoryList = new ArrayList<>(); // 빈 ArrayList 객체 생성
		
		try {
			
			conn = ds.getConnection();
			String sql = " select category_id, category_name "
					   + " from tbl_category "
					   + " order by 1 ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Map<String, String> ctMap = new HashMap<>();
				
				ctMap.put("category_id", String.valueOf(rs.getInt(1)));
				ctMap.put("category_name", rs.getString(2));
				
				categoryList.add(ctMap);

			}

		}
		finally {
			close();
		}
		return categoryList;
		
		
	} // end of public List<Map<String, String>> getCategoryList() throws SQLException {} -----------------

	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException{

		int totalPage = 0;
		String columnName = "";
        
		try {
	            conn = ds.getConnection();
	            
	            String sql = " select ceil(count(*)/10) " // sizePerPage 일단 10으로 고정
	            		   + " from tbl_item ";
	            	                        
	            if(!"".equals(paraMap.get("category_id"))) {
	            	columnName = paraMap.get("category_id");    
	            	sql += " where fk_category_no = " + columnName; // tbl_item 에는 fk_category_no 라는 이름으로 존재함
	            }
	             
	            pstmt = conn.prepareStatement(sql); 
	                        
	            rs = pstmt.executeQuery();
	            
	            rs.next();
	            
	            totalPage = rs.getInt(1);
	                     
	            
         } finally {
            close();
         }
	         
	     return totalPage;
		
		
	}// end of public int getTotalPage(Map<String, String> paraMap) throws SQLException{} -----------------

	@Override
	public List<ItemVO> getItemList(Map<String, String> paraMap) throws SQLException {
		
		List<ItemVO> ItemList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();			
			String sql = " select item_no, category_name, item_name, item_price, morning_availability, item_info "
					   + " from "
					   + " ( "
					   + "    select rownum as RNO, item_no, category_name, item_name, item_price, morning_availability, item_info "
					   + "    from( "
					   + "            ( "
					   + "                select item_no, fk_category_no, item_name, item_price, morning_availability, item_info "
					   + "                from tbl_item "
					   + "                order by 1 "
					   + "            ) I  "
					   + "            JOIN "
					   + "            ( "
					   + "                select category_id, category_name "
					   + "                from tbl_category ";
					   
				   if( paraMap.get("category_id") != null && !paraMap.get("category_id").trim().isEmpty()) { // category_id 가 "" 인지 아닌지에 따라 sql 문이 달라짐
					   sql += "       where category_id = ? ";
				   }
					   	   
				   sql += "            ) C "
					   + "            on I.fk_category_no = C.category_id "
					   + "    ) "
					   + " )     "
					   + " where RNO between ? and ? ";
			// SQL 문 안에 ;(세미콜론)이 들어가면 안된다. 그러면, SYNTAX 에러가 뜸
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = 10; // 한 페이지당 화면상에 보여줄 제품의 갯수는 10 으로 한다.
			
			if(paraMap.get("category_id") != null && !paraMap.get("category_id").trim().isEmpty()) {
						
				pstmt.setInt(1, Integer.parseInt(paraMap.get("category_id")));
				pstmt.setInt(2,(currentShowPageNo * sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(3,(currentShowPageNo * sizePerPage));
			}
			else {
				pstmt.setInt(1,(currentShowPageNo * sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(2,(currentShowPageNo * sizePerPage));
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ItemVO ivo = new ItemVO();
				
				ivo.setItem_no(rs.getInt("ITEM_NO"));
				ivo.setCategoryName(rs.getString("CATEGORY_NAME"));
				ivo.setItem_name(rs.getString("ITEM_NAME"));
				ivo.setItem_price(rs.getInt("ITEM_PRICE"));
				ivo.setMorning_availability(rs.getInt("MORNING_AVAILABILITY"));
				ivo.setItem_info(rs.getString("ITEM_INFO"));
				
				ItemList.add(ivo);
				
	             
			} // end of while(){} ------------------------------------------
	
		} finally {
			close() ;
		}
		
		return ItemList;
		
	}// end of 	public List<ItemVO> getItemList(Map<String, String> paraMap) throws SQLException {} --------------

	
	// item_no 가 존재하는지 여부 파악 메소드
	@Override
	public boolean is_Exist_item_no(Map<String, String> paraMap) throws SQLException{
		
		boolean is_Exist_item_no = false;
		try {
			
			conn = ds.getConnection();			
			String sql  = " select * "
						+ " from tbl_item "
						+ " where item_no = ? ";
					   
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("item_no"));
			rs = pstmt.executeQuery();

			is_Exist_item_no = rs.next(); // 존재하면 true 존재하지 않으면 false
	
		} finally {
			close() ;
		}
		
		return is_Exist_item_no;
		
	} // end of public boolean is_Exist_item_no(Map<String, String> paraMap) throws SQLException {} -------------
	
}
