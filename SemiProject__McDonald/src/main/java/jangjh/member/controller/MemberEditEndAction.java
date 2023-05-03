package jangjh.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;
import jangjh.member.model.MemberVO;

public class MemberEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // get or post
		
		String message = "";
		String loc = "";
		
		if("POST".equalsIgnoreCase(method)) {   
			
			String userid = request.getParameter("userid");	
			String pwd = request.getParameter("pwd");	
			String member_name = request.getParameter("member_name");			// form 태그의 것을 받아온다.	
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
			
			// 온전한 연락처
			String member_tel = hp1 + hp2 + hp3;
			
			// 온전한 생년월일
			String birthday = birthyyyy + birthmm + birthdd;    // 19930425
			
			// 파라미터가 있는 MemberVO를 가져온다.
			MemberVO member = new MemberVO(userid, pwd, member_name, email, member_tel, postcode, address, detail_address, ref_address, birthday);
			// DAO 에 MemberVO member를 보내주려고 한다.
			
			
			try {
				InterMemberDAO mdao = new MemberDAO();
				int n = mdao.updateMember(member);
				
				
				if ( n==1 ) {
					
					HttpSession session = request.getSession();
					MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
					
					loginuser.setMember_name(member_name);
					loginuser.setPwd(pwd);
					loginuser.setEmail(email);
					loginuser.setMember_tel(member_tel);
					loginuser.setPostcode(postcode);
					loginuser.setAddress(address);
					loginuser.setDetail_address(detail_address);
					loginuser.setRef_address(ref_address);
					loginuser.setBirthday(birthyyyy + birthmm + birthdd);
					
					message = "회원정보 수정 성공";
				}
				
			}catch(SQLException e) {
				message = "SQL구문 오류 발생";
				e.printStackTrace();
			}
				
		}
		else {			
			// *** POST 방식으로 넘어온 것이 아니라면 ***
			message = "비정상적인 경로를 통해 들어왔습니다. ";
		
			}// end of else 	
			
			loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동한다.
			
			request.setAttribute("message", message) ;
			request.setAttribute("loc", loc) ;
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/msg.jsp");
	}

}
