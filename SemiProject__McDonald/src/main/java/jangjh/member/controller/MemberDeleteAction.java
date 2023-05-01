package jangjh.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;
import jangjh.member.model.MemberVO;

public class MemberDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		InterMemberDAO mvo = new MemberDAO();
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String message = "";
		String loc = "";
		
		if(loginuser != null && "kingkingadmin".equals(loginuser.getUserid())) {

			String userid = request.getParameter("userid");
		
			if(userid != null && !userid.trim().isEmpty()) {
				
				int result = mvo.deleteMember(userid);
				
				if(result == 1) {
					
					message = "성공적으로 삭제되었습니다.";
					loc = request.getContextPath() + "/member/memberList.run";
		
				}
				else {
					
					message = "삭제에 실패했습니다.";
					loc = "javascript:history.back()";
					
				}			
				
			}
				
			
		}
		else {
			
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우
			message = "관리자만 접근이 가능합니다.";
			loc = request.getContextPath() + "/main.run";
			
		}

		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jangjh/msg.jsp");
		
	}

}
