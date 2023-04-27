package jeonym.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jeonym.item.model.InterItemDAO;
import jeonym.item.model.ItemDAO;
import jeonym.item.model.ItemVO;

public class ItemUpdateAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		// 관리자만 할 수 있게
		
		InterItemDAO idao = new ItemDAO();
		
		super.getCategoryList(request);
		String pk_fk_item_no = request.getParameter("pk_fk_item_no");
		
		ItemVO ivo = idao.selectOneItem_total_info(pk_fk_item_no);
		
		request.setAttribute("ivo", ivo);
		
		
		setRedirect(false);
		setViewPage("/WEB-INF/jeonym/item/itemUpdate.jsp");
		
	}

}
