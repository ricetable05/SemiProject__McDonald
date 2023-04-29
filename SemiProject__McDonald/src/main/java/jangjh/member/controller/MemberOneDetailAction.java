package jangjh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;
import jangjh.member.model.MemberVO;


public class MemberOneDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && loginuser.getUserid().equals("admin")) {
			// 관리자로 로그인 했을 때만
			
			String userid = request.getParameter("userid");
			InterMemberDAO mdao = new MemberDAO();
			MemberVO mvo = mdao.memberOneDetail(userid);
			
			request.setAttribute("mvo", mvo);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/member/memberOneDetail.jsp");
			
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
