package jeonym.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class OrderMainAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		setRedirect(false);
		setViewPage("/WEB-INF/jeonym/order/order_menu_index.jsp");
		
	}

}
