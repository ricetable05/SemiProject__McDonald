package jeonym.item.model;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jeonym.util.JeonymUtil;

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
					   + "                order by 1 desc "
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

	
	// 제품의 상세정보페이지를 위해 제품하나를 select 하는 메소드
	@SuppressWarnings("null")
	@Override
	public ItemDetailVO selectOneItem(Map<String, String> paraMap) throws SQLException{

		ItemDetailVO idvo = null; // null 이라면 제품에 대한 정보가 없는 것인데 이미 Exist 여부를 검사했기 때문에 괜찮다.
		try {
			
			conn = ds.getConnection();			
			
			String sql  = " select pk_fk_item_no, item_name, weight_g, weight_ml "
						+ "           , calories, carbo, protein, fat, sodium, caffeine "
						+ "           , allergens, coa, item_info, item_image, fk_category_no "
						+ " from "
						+ " ( "
						+ "    select pk_fk_item_no, item_name, weight_g, weight_ml "
						+ "           , calories, carbo, protein, fat, sodium, caffeine "
						+ "           , allergens ,coa "
						+ "    from tbl_item_detail "
						+ "    where pk_fk_item_no = ? "
						+ " ) IDT "
						+ " JOIN "
						+ " ( "
						+ "    select item_no, item_info, item_image, fk_category_no "
						+ "    from tbl_item "
						+ " ) I "
						+ " on IDT.pk_fk_item_no = I.item_no ";

					   
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("item_no"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idvo = new ItemDetailVO();
				
				idvo.setPk_fk_item_no(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(1))));
				idvo.setItem_name(JeonymUtil.null_to_zero(rs.getString(2)));
				idvo.setWeight_g(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(3))));
				idvo.setWeight_ml(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(4))));
				idvo.setCalories(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(5))));
				idvo.setCarbo(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(6))));
				idvo.setProtein(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(7))));
				idvo.setFat(Float.parseFloat(JeonymUtil.null_to_zero(rs.getFloat(8)))); // fat은 소수점 단위가 나온다.
				idvo.setSodium(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(9))));
				idvo.setCaffeine(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(10))));
				
				idvo.setAllergens(JeonymUtil.null_to_zero(rs.getString(11)));
				idvo.setCoa(JeonymUtil.null_to_zero(rs.getString(12)));

				ItemVO ivo = new ItemVO();
				ivo.setItem_info(rs.getString(13)); // not null
				ivo.setItem_image(rs.getString(14)); // not null
				ivo.setFk_category_no(rs.getInt(15)); // not null
				
				idvo.setIvo(ivo); // itemDetailVO 의 ItemVO 객체타입 필드에 담는다.

				
			}

			
		} finally {
			close();
		}
		
		return idvo;

		
	} // end of 	public ItemDetailVO selectOneItem(Map<String, String> paraMap) throws SQLException{} ---------------

	@Override
	public ItemVO selectOneItem_total_info(String pk_fk_item_no) throws SQLException {
	
		ItemVO ivo = null; // null 이라면 제품에 대한 정보가 없는 것인데 이미 Exist 여부를 검사했기 때문에 괜찮다.
		try {
			
			conn = ds.getConnection();			
			
			String sql  = " select I.item_name, fk_category_no, item_image, item_price "
						+ "           , morning_availability, is_burger, item_info, weight_g, weight_ml, calories "
						+ "           , carbo, protein, fat, sodium, caffeine, allergens, coa "
						+ " from "
						+ " ( "
						+ "    select * "
						+ "    from tbl_item_detail "
						+ "    where pk_fk_item_no = ? "
						+ " ) IDT "
						+ " JOIN tbl_item I "
						+ " on IDT.pk_fk_item_no = I.item_no ";

					   
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pk_fk_item_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				ivo = new ItemVO();
				
				ivo.setItem_name(JeonymUtil.null_to_zero(rs.getString(1)));
				ivo.setFk_category_no(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(2))));
				ivo.setItem_image(JeonymUtil.null_to_zero(rs.getString(3)));
				ivo.setItem_price(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(4))));
				ivo.setMorning_availability(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(5))));
				ivo.setIs_burger(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(6))));
				ivo.setItem_info(JeonymUtil.null_to_zero(rs.getString(7)));
				
				
				
				ItemDetailVO idvo = new ItemDetailVO();
				
				idvo.setWeight_g(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(8))));
				idvo.setWeight_ml(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(9))));
				idvo.setCalories(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(10))));
				idvo.setCarbo(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(11))));
				idvo.setProtein(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(12))));
				idvo.setFat(Float.parseFloat(JeonymUtil.null_to_zero(rs.getFloat(13)))); // fat은 소수점 단위가 나온다.
				idvo.setSodium(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(14))));
				idvo.setCaffeine(Integer.parseInt(JeonymUtil.null_to_zero(rs.getString(15))));
				idvo.setAllergens(JeonymUtil.null_to_zero(rs.getString(16)));
				idvo.setCoa(JeonymUtil.null_to_zero(rs.getString(17)));
				
				ivo.setItemDetailVO(idvo);
				
			}

			
		} finally {
			close();
		}
		
		return ivo;
		
	} // end of public ItemVO selectOneItem_total_info(String pk_fk_item_no) throws SQLException {} ------------------

	@Override
	public Map<String, String> getItem_no_by_category(String fk_category_no) throws SQLException {

		Map<String, String> paraMap = new HashMap<>();
		
		try {
	            
				conn = ds.getConnection();
	            
				String seq_name = "";
				String detail_seq_name = "";
				
				int item_no = 0;
				int pk_fk_item_no = 0;
				
				switch (fk_category_no) {

					case "1":
						seq_name = "TEST_ITEM_BURGER_SEQ";
						detail_seq_name = "TEST_ITEM_BURGER_DETAIL_SEQ";
						break;
					case "2":
						seq_name = "TEST_ITEM_MC_MORNING_SEQ";
						detail_seq_name = "TEST_ITEM_MC_MORNING_DETAIL_SEQ";						
						break;
					case "3":
						seq_name = "TEST_ITEM_SIDE_SEQ";
						detail_seq_name = "TEST_ITEM_SIDE_DETAIL_SEQ";
						break;
					case "4":
						seq_name = "TEST_ITEM_DESSERT_SEQ";
						detail_seq_name = "TEST_ITEM_DESSERT_DETAIL_SEQ";
						break;
					case "5":
						seq_name = "TEST_ITEM_DRINK_SEQ";
						detail_seq_name = "TEST_ITEM_DRINK_DETAIL_SEQ";
						break;
					
				default:
					System.out.println("존재하지 않는 카테고리 no 입니다.");
					break;
				}
				
				
	            String sql = " select "+seq_name+".nextval AS ITEM_NO "
	            		   + " from dual ";
	            		   
	            	                        
	            pstmt = conn.prepareStatement(sql); 
	            rs = pstmt.executeQuery();
	            
	            rs.next();
	            item_no = rs.getInt(1);
	            paraMap.put("item_no", String.valueOf(item_no));
	            
	            
	            /////////////////////////////////////////////////////////////////////
	            sql = " select "+detail_seq_name+".nextval AS PK_FK_ITEM_NO "
	            	+ " from dual ";
	            		   
	            	                        
	            pstmt = conn.prepareStatement(sql); 
	            rs = pstmt.executeQuery();
	            
	            rs.next();
	            pk_fk_item_no = rs.getInt(1);
	            paraMap.put("pk_fk_item_no", String.valueOf(pk_fk_item_no));

	            
	            
         } finally {
            close();
         }
	         
	     return paraMap;

		
	} // end of public Map<String, String> getItem_no_by_category(String fk_category_no) throws SQLException {} ------------------------

	@Override
	public int updateItemInfo(String pk_fk_item_no, ItemVO ivo) throws SQLException{

		// image 를 변경했는지 아닌지 검사해야 할것임
		// ivo.getItem_image 가 "" 인지 아닌지 검사해야할 것임
		int isSuccess = 0;
		int n1 = 0, n2 = 0;

		
		
		try {
			conn = ds.getConnection();
			
			String sql = " update test_tbl_item set fk_category_no = ? "
					+ "  , item_name = ? , item_price = ? , morning_availability = ? , is_burger = ? , item_info = ? ";
				
			if(!"".equals(ivo.getItem_image())) {
				   sql += " , item_image = ? ";
			}
			
			sql		+= " where item_no = ? ";

			pstmt = conn.prepareStatement(sql);
			
			if(ivo.getItem_image() != null && !ivo.getItem_image().trim().isEmpty()) { // 이미지를 올린 경우				
				pstmt.setInt(1, ivo.getFk_category_no());
				pstmt.setString(2, ivo.getItem_name());
				pstmt.setInt(3, ivo.getItem_price());		
				pstmt.setInt(4, ivo.getMorning_availability());
				pstmt.setInt(5, ivo.getIs_burger());
				pstmt.setString(6, ivo.getItem_info());
				pstmt.setString(7, ivo.getItem_image());
				pstmt.setInt(8, Integer.parseInt(pk_fk_item_no));
			}
			else { // 이미지가 없는 경우
				pstmt.setInt(1, ivo.getFk_category_no());
				pstmt.setString(2, ivo.getItem_name());
				pstmt.setInt(3, ivo.getItem_price());		
				pstmt.setInt(4, ivo.getMorning_availability());
				pstmt.setInt(5, ivo.getIs_burger());
				pstmt.setString(6, ivo.getItem_info());
				pstmt.setInt(7, Integer.parseInt(pk_fk_item_no));				
			}
			
			
			n1 = pstmt.executeUpdate();
			
			sql =	 " update test_tbl_item_detail set item_name = ?, weight_g = to_number(?), weight_ml = to_number(?) "
					+ "                      ,calories = to_number(?) , carbo = to_number(?) , protein = to_number(?) , fat = to_number(?) "
					+ "                      , sodium = to_number(?) , caffeine = to_number(?) , allergens = ? , coa = ? "
					+ " where pk_fk_item_no = ? ";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ivo.getItem_name());
			pstmt.setString(2, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getWeight_g()));
			pstmt.setString(3, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getWeight_ml()));
			pstmt.setString(4, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCalories()));
			pstmt.setString(5, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCarbo()));
			pstmt.setString(6, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getProtein()));
			pstmt.setString(7, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getFat()));
			pstmt.setString(8, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getSodium()));
			pstmt.setString(9, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCaffeine()));
			pstmt.setString(10, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getAllergens()));
			pstmt.setString(11, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCoa()));
			pstmt.setInt(12, Integer.parseInt(pk_fk_item_no));	
			
			
			n2 = pstmt.executeUpdate();
			
			isSuccess = n1 * n2;
			
			System.out.println("n1 * n2 : " + n1 * n2);
			
		}
		finally {
			close();
		}
		
		
		return isSuccess;
		
	}

	
	// 제품 등록 메소드
	@Override
	public int registItem(ItemVO ivo, Map<String, String> paraMap) throws SQLException {

		int isSuccess = 0;
		int n3 = 0, n4 = 0;

		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into test_tbl_item values( ?, ?, ?, ?, ?, ?, ?, ? ) ";
				


			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(paraMap.get("item_no")));
			pstmt.setInt(2, ivo.getFk_category_no());
			pstmt.setString(3, ivo.getItem_name());
			pstmt.setString(4, ivo.getItem_image());
			pstmt.setInt(5, ivo.getItem_price());		
			pstmt.setInt(6, ivo.getMorning_availability());
			pstmt.setInt(7, ivo.getIs_burger());
			pstmt.setString(8, ivo.getItem_info());
			
			n3 = pstmt.executeUpdate();
			
			
			sql = " insert into test_tbl_item_detail values( ? , ?, to_number(?), to_number(?), to_number(?), to_number(?) "
				+ ", to_number(?), to_number(?), to_number(?), to_number(?), ?, ? )";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(paraMap.get("pk_fk_item_no")));
			pstmt.setString(2, ivo.getItem_name());
			pstmt.setString(3, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getWeight_g()));
			pstmt.setString(4, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getWeight_ml()));
			pstmt.setString(5, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCalories()));
			pstmt.setString(6, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCarbo()));
			pstmt.setString(7, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getProtein()));
			pstmt.setString(8, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getFat()));
			pstmt.setString(9, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getSodium()));
			pstmt.setString(10, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCaffeine()));
			pstmt.setString(11, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getAllergens()));
			pstmt.setString(12, JeonymUtil.zero_to_empty(ivo.getItemDetailVO().getCoa()));
			
			
			n4 = pstmt.executeUpdate();
			
			isSuccess = n3 * n4;
			
			
		}
		finally {
			close();
		}
		
		
		return isSuccess;
	}


	
}
