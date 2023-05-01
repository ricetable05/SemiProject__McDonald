package daan.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			
			String str_arr_odr_no = request.getParameter("arr_odr_no");
			String[] arr_odr_no = str_arr_odr_no.split("\\,");
			
			ItemDAO idao = new ItemDAO();
			
			int cnt_check = idao.checkOrderCompleted(arr_odr_no);
			
			request.setAttribute("cnt_check", cnt_check);
			
			super.setRedirect(false);
			loc = "";
		} else {
			// 로그인이 안되었거나, 관리자로 로그인하지 않은 경우 클라이언트를 어떤 페이지로 보낼지 설정합니다.
			super.setRedirect(true);
			loc = "";
		}
		
		super.setViewPage(loc);
		
	}

}
