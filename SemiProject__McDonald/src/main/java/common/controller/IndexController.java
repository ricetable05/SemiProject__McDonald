package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.controller.InterMemberDAO;
import member.controller.MemberDAO;


public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		InterMemberDAO mdao = new MemberDAO();
		
		
		setRedirect(false);
		setViewPage("/WEB-INF/index.jsp");		
				
	}

}
