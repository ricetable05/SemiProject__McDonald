package jangjh.member.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;
import jangjh.member.model.MemberVO;

public class MemberRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/member/memberRegister.jsp");
		}
		else {
			
			String member_name = request.getParameter("member_name");
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String hp1 = request.getParameter("hp1");
			String hp2 = request.getParameter("hp2");
			String hp3 = request.getParameter("hp3");
			String postcode = request.getParameter("postcode"); 
			String address = request.getParameter("address");
			String detail_address = request.getParameter("detail_address");
			String ref_address = request.getParameter("ref_address");
			String birthyyyy = request.getParameter("birthyyyy");
			String birthmm = request.getParameter("birthmm");
			String birthdd = request.getParameter("birthdd");
			
			String member_tel = hp1+hp2+hp3;
			
			String birthday = birthyyyy+birthmm+birthdd; //19930425
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyddmm");
			
			Date format = (Date) sdf.parse(birthday);
			
			MemberVO member = new MemberVO( userid,  pwd,  member_name,  email,  member_tel,  postcode, address,  detail_address,  ref_address,  birthday);
			
			String message = "";
			String loc = "";
			
			try {
			InterMemberDAO mdao = new MemberDAO();
			
			int n = mdao.registerMember(member);
			
			if(n==1) {
				message = "회원가입 성공";
				loc = request.getContextPath()+"/main.run"; //시작페이지로 이동한다.
			}
			}catch(SQLException e) {
				message = "SQL구문 오류발생";
				loc = request.getContextPath()+"/login/login.run"; //자바스크립트를 이용한 이전페이지로 이동한다.
				e.printStackTrace();
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/msg.jsp");
		}
		
	}

}
