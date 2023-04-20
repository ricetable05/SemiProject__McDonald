package common.controller;

import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.controller.InterMemberDAO;
import member.controller.MemberDAO;


public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		InterMemberDAO mdao = new MemberDAO();
		
		mdao.insertCheck();
		
		setRedirect(false);
		setViewPage("/WEB-INF/index.jsp");		
				
	}

}
