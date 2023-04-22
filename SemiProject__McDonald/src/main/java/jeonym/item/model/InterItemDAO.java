package jeonym.item.model;

import java.sql.SQLException;
import java.util.List;

public interface InterItemDAO {

	// 주문 메인 페이지에 보여줄 상품 List 가져오기
	List<ItemVO> getOrderMainItemList() throws SQLException; 
	
}
