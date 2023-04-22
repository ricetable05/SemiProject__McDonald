package jangjh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class LoginAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); //"GET" 또는 "POST"
		
		if(!"POST".equalsIgnoreCase(method)) {
			//POST 방식으로 넘어온 것이 아니라면
			
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return; //execute(HttpServletRequest request, HttpServletResponse response) 메소드 종료함
 			
		}
		
	}

}
