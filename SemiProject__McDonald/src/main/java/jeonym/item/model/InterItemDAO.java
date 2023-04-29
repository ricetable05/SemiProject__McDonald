package jeonym.item.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterItemDAO {

	// 주문 메인 페이지에 보여줄 상품 List 가져오기
	List<ItemVO> getOrderMainItemList() throws SQLException;

	// 카테고리 리스트 가져오는 메소드
	List<Map<String, String>> getCategoryList() throws SQLException;

	// 페이징처리를 위해 totalPage를 구하는 메소드
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 제품목록 리스트를 가져오는 메소드
	List<ItemVO> getItemList(Map<String, String> paraMap) throws SQLException;

	// item_no 가 존재하는지 여부 파악 메소드
	boolean is_Exist_item_no(Map<String, String> paraMap) throws SQLException;

	// 제품의 상세정보페이지를 위해 제품하나를 select 하는 메소드
	ItemDetailVO selectOneItem(Map<String, String> paraMap) throws SQLException;

	// 하나의 제품의 모든 정보를 가져오는 메소드
	ItemVO selectOneItem_total_info(String pk_fk_item_no) throws SQLException;

	// 카테고리에 따른 시퀀스를 채번해오는 메소드
	Map<String, String> getItem_no_by_category(String fk_category_no) throws SQLException;

	// 제품정보 수정 메소드
	int updateItemInfo(String pk_fk_item_no, ItemVO ivo) throws SQLException;
	
}
