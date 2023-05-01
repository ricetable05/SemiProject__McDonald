package parksj.totalorder.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.MemberVO;
import parksj.totalorder.model.InterTotalOrderDAO;
import parksj.totalorder.model.TotalOrderDAO;
import parksj.totalorder.model.TotalOrderVO;

public class TotalOrderDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && loginuser.getUserid().equals("kingkingadmin")) {
			// 관리자로 로그인 했을 때만
			
			int odr_no = Integer.parseInt(request.getParameter("odr_no"));
			
			InterTotalOrderDAO tdao = new TotalOrderDAO();
			
						
			List<TotalOrderVO> oderDetail = tdao.orderDetailList(odr_no);
			
			request.setAttribute("oderDetail", oderDetail);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/parksj/totalorder/orderDetail.jsp");
			
		}
		else {
			// 로그인을 안한 경우 또는 일반 사용자로 로그인 한 경우
			
			String message = "관리자만 접근이 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message",message);
			request.setAttribute("loc",loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/msg.jsp");
		}
	}

}
