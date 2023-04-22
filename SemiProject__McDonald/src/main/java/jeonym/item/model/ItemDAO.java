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
	    
	}// end of public ProductDAO
	
	
	
	
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
	}
	
}
