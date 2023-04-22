package jangjh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;

public class IdDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); //"GET" 또는 "POST"
		
		if("POST".equalsIgnoreCase(method)) {
			
			String userid = request.getParameter("userid");
			
			InterMemberDAO mdao = new MemberDAO();
			boolean isExists = mdao.idDulicateCheck(userid);
			
			JSONObject jsonObj = new JSONObject();// {}
			jsonObj.put("isExists", isExists);    // {"isExists": true}
											      // {"isExists": false}
			
			String json = jsonObj.toString(); // 문자열 형태인 "{"isExists": true}" 또는 "{"isExists": false}"으로 만들어준다.
			
			//System.err.println(">>> 확인용 json => "+ json);
			// >>> 확인용 json => {"isExists":true}
			// >>> 확인용 json => {"isExists":false}
			
			request.setAttribute("json", json);
			
			//super.setRedirect(false);
			  super.setViewPage("/WEB-INF/jangjh/jsonview.jsp");
		}
	}

}
