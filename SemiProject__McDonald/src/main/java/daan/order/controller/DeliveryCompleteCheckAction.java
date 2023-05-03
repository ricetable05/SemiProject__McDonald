package daan.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import daan.item.ItemDAO;
import jangjh.member.model.MemberVO;

public class DeliveryCompleteCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		boolean isLogined = super.checkLogin(request);
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String loc = "";
		
		if(isLogined && "kingkingadmin".equals(loginuser.getUserid())) {
			
			String odr_no = request.getParameter("odr_no");
			System.out.println("odr_no => "+odr_no);
			ItemDAO idao = new ItemDAO();
			
			int complete_check = idao.checkOrderCompleted(odr_no);
			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("complete_check", complete_check);
			
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			loc = "/WEB-INF/daan/jsonView.jsp";
		} else {
			// 로그인이 안되었거나, 관리자로 로그인하지 않은 경우 클라이언트를 어떤 페이지로 보낼지 설정합니다.
			super.setRedirect(true);
			loc = "/WEB-INF/jangjh/main/main.jsp";
		}
		
		super.setViewPage(loc);
		
	}

}
