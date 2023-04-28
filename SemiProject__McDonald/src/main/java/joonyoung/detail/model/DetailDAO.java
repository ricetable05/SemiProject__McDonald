package joonyoung.detail.model;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;




public class DetailDAO implements InterDetailDAO {

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
	public DetailDAO(){
	    try {

	    	Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
		   
		 }catch (NamingException e) {
			 
			 e.printStackTrace();
	     }
	    
	}// end of public ItemDAO
	
	

	
	
	
	




	
	// 제품번호를 가지고서 해당제품의 정보를 조회해오기
	@Override
	public DetailVO selectOneProductByitem_no(int item_no) throws SQLException {
		
		
		DetailVO ivo = null;
		
	      
	      try {
	          conn = ds.getConnection(); 
	          
	          String sql = " select item_name,item_image,item_info,item_no, fk_category_no "
	          		     + " from tbl_item "
	          		     + " where item_no = ? ";
	          
	          pstmt = conn.prepareStatement(sql);
	          pstmt.setInt(1, item_no);
	          
	          rs = pstmt.executeQuery();
	          
	          if(rs.next()) {
	             
	             String item_name = rs.getString(1);  // 제품이름
	             String item_image = rs.getString(2);        // 제품 이미지
	             String item_info = rs.getString(3);    // 제품 정보설명들....(이미지 아래)
	             int prod_no  = rs.getInt(4);
	             int fk_category_no = rs.getInt(5);
	             
	             
	             ivo = new DetailVO(); 
	             
	             
	             ivo.setItem_name(item_name);
	             ivo.setItem_image(item_image);
	             ivo.setItem_info(item_info);
	             ivo.setItem_no(prod_no);
	             ivo.setFk_category_no(fk_category_no);
	             
	             
	          }// end of if-----------------------------
	          
	      } finally {
	         close();
	      }
	      
	      return ivo;      
		
	}

	
	// 제품번호를 가지고서 해당제품의 디테일 정보를 조회해오기
	@Override
	public DetailDetailVO selectOneProduct_DetailByitem_no(int item_no) throws SQLException {

		
		
		DetailDetailVO ivo_detail = null;
	      
	      try {
	          conn = ds.getConnection(); 
	          
	          String sql = " select decode(nvl(weight_g,-99), -99, '-', weight_g) AS weight_g, "
		          		 + "        decode(nvl(weight_ml,-99), -99, '-', weight_ml) AS weight_ml, "
		          		 + "        decode(nvl(calories,-99), -99, '-', calories) AS calories, "
		          		 + "        decode(nvl(carbo,-99), -99, '-', carbo) AS carbo, "
		          		 + "        decode(nvl(protein,-99), -99, '-', protein) AS protein, "
		          		 + "        decode(nvl(fat,-99), -99, 0, fat) AS fat, "
		          		 + "        decode(nvl(sodium,-99), -99, '-', sodium) AS sodium, "
		          		 + "        decode(nvl(caffeine,-99), -99, '-', caffeine) AS caffeine, "
		          		 + "        nvl2(allergens,allergens,'-') AS allergens, "
		          		 + "        nvl2(coa,coa,'-') AS coa "
		          		 + " from tbl_item_detail "
		          		 + " where pk_fk_item_no = ? ";
	          
	          pstmt = conn.prepareStatement(sql);
	          pstmt.setInt(1, item_no);
	          
	          rs = pstmt.executeQuery();
	          
	          if(rs.next()) {
	        	    	  
	        	  	
	        	  	 
	        	  	 
	             
	        	  String weight_g = rs.getString(1);
	        	  String weight_ml = rs.getString(2);
	        	  String calories = rs.getString(3);       
	        	  String carbo = rs.getString(4);
	        	  String protein = rs.getString(5);
		             float fat = rs.getFloat(6);
		             String sodium = rs.getString(7);
		             String caffeine = rs.getString(8);
		             String allergens = rs.getString(9);    
		             String coa = rs.getString(10);
	        	  

	             
	             ivo_detail = new DetailDetailVO(); 
	             
	             ivo_detail.setWeight_g(weight_g);
	             ivo_detail.setWeight_ml(weight_ml);
	             ivo_detail.setCalories(calories);
	             ivo_detail.setCarbo(carbo);
	             ivo_detail.setProtein(protein);
	             ivo_detail.setFat(fat);
	             ivo_detail.setSodium(sodium);
	             ivo_detail.setCaffeine(caffeine);
	             ivo_detail.setAllergens(allergens);
	             ivo_detail.setCoa(coa);
	             
	             
	             
	             
	          }// end of if-----------------------------
	          
	      } finally {
	         close();
	      }
	      
	      return ivo_detail;   
	}


	


	
	
	
	
	
	
    // 넘어온 제품번호가 속한 카테고리가 테이블에서 몇개나 있는지 조회하기
	@Override
	public DetailVO getCategoryLength(int item_no) throws SQLException {
		
		
		
		DetailVO ivo_GetCategoryLength = null;
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(fk_category_no) "
					   + " from tbl_category A join tbl_item B "
					   + " on A.category_id = B.fk_category_no "
					   + " where fk_category_no in ( "
					   + " select fk_category_no "
					   + " from tbl_item "
					   + " where item_no = ? "
					   + " ) ";
			
			  pstmt = conn.prepareStatement(sql);
			
	          pstmt.setInt(1, item_no);
	          
	          rs = pstmt.executeQuery();
			
		      if(rs.next()) {
		             
		             int ctLength = rs.getInt(1);  // 제품이름
		             
		             
		             
		             ivo_GetCategoryLength = new DetailVO(); 
		             
		             
		             ivo_GetCategoryLength.setCtLength(ctLength);
		          
		             
		             
		          }// end of if-----------------------------
			
			
			
		}finally {
			close();
		}
		
		return ivo_GetCategoryLength;
		
		
		
	}



	
	
	

	

	
}
