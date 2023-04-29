package parksj.menu.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterMenuDAO {
	
	// tbl_category 테이블에서 카테고리 대분류 번호(cnum), 카테고리코드(code), 카테고리명(cname)을 조회해오기 
	List<Map<String, String>> getMenuCategoryList() throws SQLException;
	
	// === Ajax(JSON)를 사용하여 HIT 상품목록을 "더보기" 방식으로 페이징 처리 해주기 위해 카테고리아이디별로 제품의 전체개수 알아오기 //
	int totalctidCount(String fk_category_no) throws SQLException;
	
	// 특정 카테고리에 속하는 제품들을 조회해오기 (select)
	List<ItemVO> selectCtno(Map<String, String> paraMap) throws SQLException;




}
