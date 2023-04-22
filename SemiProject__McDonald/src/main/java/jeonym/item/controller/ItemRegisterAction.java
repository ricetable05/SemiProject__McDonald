package jeonym.item.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.MemberVO;



public class ItemRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	/*
	 	TODO .. 관리자로 로그인했을 때만 처리
	 	
		HttpSession session = request.getSession();

		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && "admin".equals(loginuser.getUserid())) {
			// 관리자(admin) 으로 로그인 했을 경우
			
			// 카테고리 목록을 조회해오기 
		
			
		
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/myshop/admin/productRegister.jsp");	
		}
		else {
			
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우
			String message = "관리자만 접근이 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jeonym/msg.jsp");
		}
	*/
		// 카테고리 목록을 조회해오기  
		super.getCategoryList(request);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jeonym/item/itemRegister.jsp");	// 제품등록 페이지
		
		
	}

}
