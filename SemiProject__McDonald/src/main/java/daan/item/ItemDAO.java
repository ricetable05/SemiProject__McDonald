package daan.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ItemDAO {

	
	private DataSource ds; // DataSource ds 는 apache-tomcat 이 제공하는 DBCP(DB Connection Pool)
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	
	private void close() {
		try {
			if(rs != null) {rs.close(); rs = null;}
			if(conn != null) {conn.close(); conn = null;}
			if(conn!= null) {conn.close(); conn = null;}
			// WEB은 속도가 느려지기 때문에 싱글톤 사용 x
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 생성자
	public ItemDAO() { 
		
		try {
			Context initContext = new InitialContext();
			Context envContext;
			envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public List<ItemVO> getItemsbyCategory(int fk_category_no) throws SQLException {
		
		List<ItemVO> item_list = new ArrayList<>();
		
		try {

			conn = ds.getConnection();
			
			String sql = "select item_no, fk_category_no, item_name, item_image, item_price, "
					   + " morning_availability, is_burger, item_info "
					   + " from tbl_item "
					   + " where fk_category_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fk_category_no);
			rs = pstmt.executeQuery();
	
			while(rs.next()) {
					
				ItemVO item = new ItemVO();
				item.setItem_no(rs.getInt(1));
				item.setFk_category_no(rs.getInt(2));
				item.setItem_name(rs.getString(3));
				item.setItem_image(rs.getString(4));
				item.setItem_price(rs.getInt(5));
				item.setMorning_availability(rs.getInt(6));
				item.setIs_burger(rs.getInt(7));
				item.setItem_info(rs.getString(8));
				item_list.add(item);
				}
			
		} finally {
			close();
		}
	
		return item_list;
	}

	
	
	public List<ItemVO> getOption(String item_no, String is_set) throws SQLException {

		List<ItemVO> item_list = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
				
			String sql = "select item_no, item_name, item_price "
					   + " from tbl_item "
					   + " where item_no = ?";
			
			if("1".equals(is_set)) {
				sql += "or  item_no = 304 or item_no = 523";
			
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(item_no));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
					
				ItemVO item = new ItemVO();
					
				item.setItem_no(rs.getInt(1));
				item.setItem_name(rs.getString(2));
				item.setItem_price(rs.getInt(3));
				item_list.add(item);
			}
			
		} finally {
			close();
		}
		
		return item_list;

	} // end of getOption() -------------------------------

	public int getPriceSum(List<Integer> arr_item_no) throws SQLException {
		
		int priceSum = 0;
		
		conn = ds.getConnection();
		
		try {
			for(int i=0;i<arr_item_no.size();i++) {
			
				String sql = " select item_price "
						   + " from tbl_item "
						   + " where item_no = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, arr_item_no.get(i));
				
				rs = pstmt.executeQuery();
				rs.next();
				
				priceSum += rs.getInt(1);
			}
		} finally {
			close();
		}
		
		return priceSum;
		
	} // end of getPriceSum() -----------------------------
	
	
}
