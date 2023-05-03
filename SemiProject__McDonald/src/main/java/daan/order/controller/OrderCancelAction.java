package daan.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import daan.item.ItemDAO;
import jangjh.member.model.MemberVO;

public class OrderCancelAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			String method = request.getMethod();
			
			if("POST".equalsIgnoreCase(method)) {
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				
				ItemDAO idao = new ItemDAO();
				
				int result = idao.cancelOrder(loginuser);
				
				String message = "";
				
				
				if(result == 1) {
					message = "주문취소 완료! 주문 페이지로 이동합니다.";
				} else {
					message = "주문취소 실패. 고객센터로 연결 바랍니다.";
				}
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("message", message);
				
				String json = jsonObj.toString();
				
				
				request.setAttribute("json", json);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/daan/jsonView.jsp");
				
				
			} else {
				// GET 방식 차단
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jangjh/main/main.jsp");
			}
		
		
	}

}
