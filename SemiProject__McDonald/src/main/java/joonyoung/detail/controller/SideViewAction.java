package joonyoung.detail.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import joonyoung.detail.model.*;

public class SideViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		super.getMenuCategoryList(request);

		
		InterDetailDAO idao = new DetailDAO();
		
		
		

		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		
		
		
		
		// 제품번호를 가지고서 해당제품의 정보를 조회해오기
		DetailVO ivo = idao.selectOneProductByitem_no(item_no);
		//System.out.println("ivo : "+ ivo);
		// 제품번호를 가지고서 해당제품의 디테일 정보를 조회해오기
		DetailDetailVO ivo_detail = idao.selectOneProduct_DetailByitem_no(item_no);
		
		// 제품번호를 가지고서 해당제품 다음 정보를 조회해오기
	    DetailVO ivo_next = idao.selectOneProductByitem_no(item_no-1);
	   // System.out.println("ivo_next : "+ ivo_next);
				
		// 제품번호를 가지고서 해당제품 이전 정보를 조회해오기
	    DetailVO ivo_prev = idao.selectOneProductByitem_no(item_no+1);
		
	    
	    // 넘어온 제품번호가 속한 카테고리가 테이블에서 몇개나 있는지 조회하기
	    DetailVO ivo_GetCategoryLength = idao.getCategoryLength(item_no);
		
		
		if(ivo == null || ivo_detail == null ) {
			// "GET" 방식이므로 사용자가 웹브라우저 주소 창에서 장난쳐서 존재하지 않는 제품번호를 입력한 경우
			
			 String message = "검색하신 제품은 존재하지 않습니다.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	         super.setRedirect(false);
	         super.setViewPage("/WEB-INF/joonyoung/msg.jsp");
		}
		
		else {
			// 제품이 있는 경우
			request.setAttribute("ivo", ivo); // ivo 가 null 이 아닙니다!
			request.setAttribute("ivo_detail", ivo_detail);
			request.setAttribute("ivo_next", ivo_next);
			request.setAttribute("ivo_prev", ivo_prev);
			request.setAttribute("ivo_GetCategoryLength", ivo_GetCategoryLength);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/joonyoung/detail/sideView.jsp");
		}
		
	}

}