package jangjh.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;

public class Pwd3mAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); //"GET" 또는 "POST"
		
		String userid = request.getParameter("userid");
		System.out.println(userid);
		
		if("POST".equalsIgnoreCase(method)) {
			//암호변경하기 버튼을 클릭한 경우
			
			request.setAttribute("method", method);
			request.setAttribute("userid", userid);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/login/pwd3mChange.jsp");
			
		}
		
		
		
	}

}
