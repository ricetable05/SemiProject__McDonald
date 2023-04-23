package jeonym.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class ItemDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String item_no = request.getParameter("item_no");
		
		request.setAttribute("item_no", item_no);
		
		setRedirect(false);
		setViewPage("/WEB-INF/jeonym/item/itemDetailList.jsp");
		
	}

}
