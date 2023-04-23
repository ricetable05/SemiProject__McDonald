package parksj.menu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import parksj.menu.model.InterMenuDAO;
import parksj.menu.model.MenuDAO;

public class McMorningMainAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.getMenuCategoryList(request);
		
		InterMenuDAO mdao = new MenuDAO();
		
		// === Ajax(JSON)를 사용하여 버거 상품목록을 "더보기"방식으로 페이징 처리해서 보여주겠다. === //
		int totalCount = mdao.totalctidCount("2");
		
		request.setAttribute("totalCount", totalCount);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/parksj/menu/mc_morning.jsp");
		
	}

}
