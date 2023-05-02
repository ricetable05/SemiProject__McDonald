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

import org.json.JSONObject;

import jangjh.member.model.MemberVO;

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
					   + " where fk_category_no = ?"
					   + " order by item_no asc ";
			
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
			
			int int_item_no = Integer.parseInt(item_no);
			
			conn = ds.getConnection();
			
			String sql = "select item_no, item_name, item_price "
					   + " from tbl_item "
					   + " where item_no = ? ";
			
			if("1".equals(is_set)) {
				
				if(int_item_no < 200) {
					sql += "or  item_no = 303 or item_no = 504";
				} else {
					sql += "or  item_no = 300 or item_no = 519";
				}
			}
			
			sql += " order by item_no asc ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, int_item_no);
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


	public int recordTblOrder(int is_delivery_price, MemberVO loginuser, int total, String delivery_loc) throws SQLException {
		
		int fk_odr_no = 0;
		conn = ds.getConnection();
		conn.setAutoCommit(false);
		
		try {
				String sql	= " INSERT INTO tbl_order(odr_no, fk_userid, fk_store_id, is_delivery, delivery_time, odr_date, is_delivery_price, delivery_loc, total) "
							+ " VALUES(tbl_order_seq.nextval, ?, '001', 0, sysdate, sysdate, ?, ?, ?) ";
				
				pstmt = conn.prepareStatement(sql);

				String userid = "";
				try {
					userid = loginuser.getUserid();
				} catch (NullPointerException e) {
					userid = "eomjh";
				}
				
				pstmt.setString(1, userid);
				pstmt.setInt(2, is_delivery_price);
				pstmt.setString(3, delivery_loc);
				pstmt.setInt(4, total);
				
				rs = pstmt.executeQuery();
				rs.next();
				
				sql	= " select odr_no "
					+ " from "
					+ " ( "
					+ " select rownum AS rn, odr_no "
					+ " from tbl_order "
					+ " order by rownum desc "
					+ " ) "
					+ " where rownum = 1 ";
			
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				rs.next();
				
				fk_odr_no = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			conn.setAutoCommit(true);
			close();
		}
		return fk_odr_no;
	}


	
	public void recordTblOrderList(JSONObject item, int is_set, int quantity, int fk_odr_no) throws SQLException {
		
		conn = ds.getConnection();
		conn.setAutoCommit(false);
		
		try {
				String sql	= " INSERT INTO tbl_order_list(odr_product_no, fk_odr_no, fk_item_no, item_name, quantity, item_price, is_set) "
							+ " VALUES(tbl_order_list_seq.nextval, ?, ?, ?, ?, ?, ? )";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, fk_odr_no);
				pstmt.setInt(2, (Integer) item.get("item_no"));
				pstmt.setString(3, (String) item.get("item_name"));
				pstmt.setInt(4, quantity);
				pstmt.setInt(5, (Integer) item.get("item_price"));
				pstmt.setInt(6, is_set);
				
				pstmt.executeUpdate();
				
				
		} catch (SQLException e) {
			e.printStackTrace();
			conn.rollback();
		} finally {
			conn.setAutoCommit(true);
			close();
		}
		
	}

	public int checkOrderCompleted(String[] arr_odr_no) throws SQLException {
		
		int cnt_check = 0;
		
		conn = ds.getConnection();
		conn.setAutoCommit(false);
		
		try {	
			
			String sql = "";
			
			for(String odr_no : arr_odr_no) {
	
				sql	= " update tbl_order set is_delivery = 1, delivery_time = sysdate "
					+ " where odr_no ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(odr_no));
				
				pstmt.executeUpdate();
				rs.next();
				
				cnt_check++;
			
			}
			
		} catch (SQLException e) {
				e.printStackTrace();
				conn.rollback();
		} finally {
			conn.setAutoCommit(true);
			close();
		}
		
		return cnt_check;
	}

	public int[] getSetMenusPrices() throws SQLException {
		
		int[] SetMenusPrices = new int[4];
		
		conn = ds.getConnection();
		
		try {	
			
			String sql 	= " select item_price "
						+ " from tbl_item "
						+ " where item_no IN(300,303,504,519) "
						+ " order by item_no ";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				int n =0;
				
				while(rs.next()) {
					SetMenusPrices[n] = rs.getInt(1);
					n++;
				}
			
		} finally {
			close();
		}

		return SetMenusPrices;
	}
	
	
}
