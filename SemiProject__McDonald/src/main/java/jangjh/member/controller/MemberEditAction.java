package jangjh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.MemberVO;

public class MemberEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			// 내정보(회원정보) 를 수정하기 위한 전제조건은 먼저 로그인을 해야 하는 것이다.
			if(super.checkLogin(request)) {
					// 로그인을 했으면
					
					HttpSession session = request.getSession();
					MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
					
					String userid = request.getParameter("userid");
					
					if(loginuser.getUserid().equals(userid)) {
						// 로그인한 사용자가 자신의 정보를 수정
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/jangjh/member/memberEdit.jsp");
						
					}
					else {
						
						// 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
						String message= "다른 사람의 정보는 수정할 수 없습니다.";
						String loc = "javascript:history.back()";
						
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/jangjh/msg.jsp");
					}
				}
				else {
					// 로그인을 안 했으면
					String message= "로그인을 해주세요!!";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/jangjh/msg.jsp");
					
				}// end of if() -----------------------------------------------------
		
	}

}
