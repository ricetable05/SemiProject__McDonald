package jangjh.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;

public class DuplicatePwdCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		
		if("POST".equalsIgnoreCase(method)) {
			
			String pwd = request.getParameter("pwd");
			String userid = request.getParameter("userid");
			
			InterMemberDAO mdao = new MemberDAO();
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("pwd", pwd);
			paraMap.put("userid", userid);
			
			int n = mdao.duplicatePwdCheck(paraMap); // 중복되면 1 아니면 0
			
			if(n != 1) { // 중복이 아닐때
				n = mdao.pwdUpdate(paraMap);
			}
			else {
				n = -1; // 중복일때
			}
	
			JSONObject jsonObj = new JSONObject();
			// n ==> 1 이라면 현재 사용중인 암호와 동일한 암호를 새암호로 준 경우
			// n ==> 0 이라면 현재 사용중인 암호와 다른 새암호로 준 경우
			
			jsonObj.put("n", n); // {"n" : 0} 또는 {"n" : 1}
			String json = jsonObj.toString(); // "{"n" : 0}" 또는 "{"n" : 1}"
			
			request.setAttribute("json", json);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/jsonview.jsp");
				
		
		}
		
	}

}
