package jangjh.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jangjh.member.model.*;

public class IdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod(); // "GET" 또는 "POST"
		
		if("POST".equalsIgnoreCase(method)) {
			// 아이디 찾기 모달창에서 찾기 버튼을 클릭했을 경우
			
			String member_name = request.getParameter("member_name");
			String email = request.getParameter("email");
			
			InterMemberDAO mdao = new MemberDAO();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("member_name", member_name);
			paraMap.put("email", email);
			
			 String userid = mdao.findUserid(paraMap);
			 
			 if(userid != null) {
				 request.setAttribute("userid", userid);
			 }
			 else {
				 request.setAttribute("userid", "존재하지 않습니다.");
			 }
			 
			 request.setAttribute("member_name", member_name);
			 request.setAttribute("email", email);
			 
		}//end of if("POST".equalsIgnoreCase(method)) --------------------------------
		
		request.setAttribute("method", method);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jangjh/login/idFind.jsp");
	}

}
