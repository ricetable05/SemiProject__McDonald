package daan.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class PlaceOrderAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String str_totalFinal = request.getParameter("totalFinal").substring(2);
		int totalFinal = Integer.parseInt(str_totalFinal);
		
		request.setAttribute("productName", "test_맥도날드");
	 	request.setAttribute("productPrice", totalFinal);
	 	request.setAttribute("email", "000000000@gmail.com");
	 	request.setAttribute("name", "홍길동");
	 	request.setAttribute("mobile", "01000000000");
	 		
	 		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/daan/paymentGateway.jsp");
	}

}
