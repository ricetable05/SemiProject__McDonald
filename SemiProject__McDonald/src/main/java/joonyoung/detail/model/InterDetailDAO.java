package joonyoung.detail.model;

import java.sql.SQLException;


public interface InterDetailDAO {




	// 제품번호를 가지고서 해당제품의 정보를 조회해오기
	DetailVO selectOneProductByitem_no(int item_no)throws SQLException;


	// 제품번호를 가지고서 해당제품의 디테일 정보를 조회해오기
	DetailDetailVO selectOneProduct_DetailByitem_no(int item_no)throws SQLException;

	
  


    // 넘어온 제품번호가 속한 카테고리가 테이블에서 몇개나 있는지 조회하기
	DetailVO getCategoryLength(int item_no)throws SQLException;

	
	











	
}
