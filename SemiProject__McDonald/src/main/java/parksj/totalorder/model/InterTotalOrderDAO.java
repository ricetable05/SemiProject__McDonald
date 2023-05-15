package parksj.totalorder.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface InterTotalOrderDAO {
	
	// 페이징 철를 위한 검색이 있는 또는 검색이 없는 주문내역에 대한 총페이지 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;
	
	// 페이징 처리한 모든 주문내역 또는 검색한 회원의 주문내역 보여주기
	List<TotalOrderVO> selectPagingOrder(Map<String, String> paraMap) throws SQLException;
	
	// order_no 값을 입력받아서 주문번호 한건에 대한 정보 불러오기
	TotalOrderVO oneOrder(int odr_no) throws SQLException;
	
	// 주문번호 order_no 의 상세 주문내역
	List<OrderDetailVO> orderDetail(int odr_no) throws SQLException;
	
		

}
