package daan.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.MemberVO;

public class PlaceOrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boolean isLogined = super.checkLogin(request);
		
		String name = "";
		String email = "";
		
		if(isLogined) {
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			name = loginuser.getMember_name();
			email = loginuser.getEmail();
		} else {
			name = "홍길동";
			email = "000000000@gmail.com";
		}

		String str_totalFinal = request.getParameter("totalFinal");
		int totalFinal = Integer.parseInt(str_totalFinal);
		String str_deliveryFee = request.getParameter("deliveryFee");
		int deliveryFee = Integer.parseInt(str_deliveryFee);
		

		String delivery_loc = request.getParameter("delivery_loc");
		
		request.setAttribute("productName", "SIST_맥도날드_Test");
	 	request.setAttribute("productPrice", totalFinal);
	 	request.setAttribute("name", name);
	 	request.setAttribute("email", email);
	 	request.setAttribute("mobile", "01000000000");
	 	
	 	
		request.setAttribute("totalFinal", totalFinal);
		request.setAttribute("deliveryFee", deliveryFee);
		request.setAttribute("delivery_loc", delivery_loc);
	 	
	 	super.setRedirect(false);
		super.setViewPage("/WEB-INF/daan/paymentGateway.jsp");
	 	// super.setViewPage("/WEB-INF/daan/paymentGateway2.jsp");
	}

}
