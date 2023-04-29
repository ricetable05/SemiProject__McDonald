package jeonym.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jeonym.item.model.*;
import java.util.*;

public class OrderMainAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		// 로그인 했는지 안했는지 여부 알아오기
		// HttpSession session = request.getSession();
		// MemberVO loginuser = (MemberVO)session.getAttribute("loginuser"); 
		
		// 메인 페이지에 보여줄 상품 List 가져오기
		InterItemDAO idao = new ItemDAO();
		List<ItemVO> OrderMainItemList = idao.getOrderMainItemList();
				
		// TODO.. 로그인 했을 때만 주문 메인 페이지에 보여줄 상품 List 가져오기
		request.setAttribute("OrderMainItemList", OrderMainItemList);
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jeonym/order/order_menu_index.jsp");
		
		
		
	}

}
