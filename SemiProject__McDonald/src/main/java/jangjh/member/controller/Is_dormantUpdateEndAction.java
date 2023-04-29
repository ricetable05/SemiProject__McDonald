package jangjh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;

public class Is_dormantUpdateEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod(); //"GET" 또는 "POST"
		
		String userid = request.getParameter("userid");
		String access_ip = request.getRemoteAddr();
		
		if("POST".equalsIgnoreCase(method)) {
			//암호변경하기 버튼을 클릭한 경우
			
			InterMemberDAO mdao = new MemberDAO();
			
			int n = mdao.login_date_insert(userid,access_ip);
			
			request.setAttribute("n",n);
			
		}
		
		request.setAttribute("method", method);
		request.setAttribute("userid", userid);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jangjh/login/is_dormantUpdateEnd.jsp");
		
	}

}
