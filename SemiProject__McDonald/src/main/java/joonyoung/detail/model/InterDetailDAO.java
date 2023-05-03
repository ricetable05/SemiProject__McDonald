package joonyoung.detail.model;

import java.sql.SQLException;
import java.util.Map;


public interface InterDetailDAO {




	// 제품번호를 가지고서 해당제품의 정보를 조회해오기
	DetailVO selectOneProductByitem_no(int item_no)throws SQLException;


	// 제품번호를 가지고서 해당제품의 디테일 정보를 조회해오기
	DetailDetailVO selectOneProduct_DetailByitem_no(int item_no)throws SQLException;

	
  





//////////////////////////////////////////////////////////////////////////////// 
	
	// 이전 호버 이미지 제품이름 가져오기
	Map<String, String> get_laginfo(String item_no, String fk_category_no)throws SQLException;

	// 이후 호버 이미지 제품이름 가져오기
	Map<String, String> get_leadinfo(String item_no, String fk_category_no)throws SQLException;


	// item_no 가 DB에 존재하는지 여부 파악
	boolean is_Exist_item_no(Map<String, String> paraMap)throws SQLException;

	
	











	
}
