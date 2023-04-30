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

public class LoginAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); //"GET" 또는 "POST"
		
		//POST 방식으로 넘어온 것이라면
		if("POST".equalsIgnoreCase(method)) {
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		// ==> 클라이언트의 IP 주소를 알아오는 것 <==
		String access_ip = request.getRemoteAddr();
		
		
		Map<String, String> paraMap = new HashMap<>();
		
		paraMap.put("userid", userid);
		paraMap.put("pwd", pwd);
		paraMap.put("access_ip", access_ip);
		
		InterMemberDAO mdao = new MemberDAO();
		
		MemberVO loginuser = mdao.selectOneMember(paraMap);
		
		if(loginuser != null) {
			
			if(loginuser.getIs_dormant() == 1) {
				
				String message = "로그인을 한지 1년이 지나서 휴면상태가 되었습니다.";
				String loc = request.getContextPath() + "/login/is_dormant.run";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jangjh/msg.jsp");
				
				return; //매소드 종료
			}
			
			//로그인 성공시
			HttpSession session = request.getSession();
			// WAS 메모리에 생성되어져 있는 session을 불러오는 것이다.
			
			session.setAttribute("loginuser", loginuser);
			//session(세션)에 로그인 되어진 사용자정보인 loginuser을 키 이름을 "loginuser"으로 저장시켜주는 것이다.
			
			if(loginuser.isRequirePwdChange()) {
				String message = "비밀번호를 변경하신지 3개월이 지났습니다. 암호를 변경해주세요. !!";
				String loc = request.getContextPath()+"/login/changepwd.run";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jangjh/msg.jsp");
				
				return; //매소드 종료
			}
			else {
				// 비밀번호를 변경한지 3개월 이내인 경우
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/main.run");
				
				return; //매소드 종료
			}
			
		}
		else {
			
			String message = "아이디 또는 비밀번호를 잘못 입력하셨습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/msg.jsp");
			
			return; //매소드 종료
			
		}
		
		
	}
		//POST 방식으로 넘어온 것이 아니라면
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jangjh/login/login.jsp");

	}

}
