package jeonym.item.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterItemDAO {

	// 주문 메인 페이지에 보여줄 상품 List 가져오기
	List<ItemVO> getOrderMainItemList() throws SQLException;

	// 카테고리 리스트 가져오는 메소드
	List<Map<String, String>> getCategoryList() throws SQLException; 
	
}
