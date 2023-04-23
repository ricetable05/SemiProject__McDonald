package parksj.menu.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MenuDAO implements InterMenuDAO {
	
	private DataSource ds; //DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if(rs != null)    {rs.close();    rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close();  conn=null;}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//생성자
	public MenuDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// tbl_category 테이블에서 카테고리 대분류 번호(category_id), 카테고리명(category_name)을 조회해오기 
	@Override
	public List<Map<String, String>> getMenuCategoryList() throws SQLException {

		List<Map<String, String>> menucategoryList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = " select category_id, category_name "
					   + " from tbl_category "
					   + " order by category_id ";
			
			pstmt = conn.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Map<String, String> map = new HashMap<>();
				map.put("category_id", rs.getString(1));
				map.put("category_name", rs.getString(2));
				
				menucategoryList.add(map);
			}// end of while----------------
			
			
			
		}finally {
			close();
		}
		
		return menucategoryList;
		
	}

	@Override
	public int totalctidCount(String fk_category_no) throws SQLException {
		
		int totalCount = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " select count(*) "
					   + " from TBL_ITEM "
					   + " where fk_snum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fk_category_no);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalCount = rs.getInt(1);
			
		}finally {
			close();
		}
		
		return totalCount;
	}
	
	
	// === Ajax(JSON)를 사용하여 HIT 상품목록을 "더보기" 방식으로 페이징 처리 해주기 위해 스펙별로 제품의 전체개수 알아오기 //
	

}
