package joonyoung.detail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import joonyoung.detail.model.DetailDAO;
import joonyoung.detail.model.InterDetailDAO;

public class Get_lead_item_noAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
	    String method = request.getMethod();
		
		String item_no = request.getParameter("item_no");
		String fk_category_no = request.getParameter("fk_category_no");
		
		String message = "";
		String loc="";

		
		if("POST".equalsIgnoreCase(method)) {
			
			InterDetailDAO dtdao = new DetailDAO();
			
			Map<String,String> paraMap = new HashMap<>();
			
			paraMap = dtdao.get_leadinfo(item_no,fk_category_no);
			
			JSONObject jsobj = new JSONObject();
			
		//	 System.out.println("fk_category_no : " + fk_category_no);
			
			jsobj.put("lead_item_name", paraMap.get("lead_item_name"));
			jsobj.put("lead_item_no", paraMap.get("lead_item_no"));
			jsobj.put("lead_item_image", paraMap.get("lead_item_image"));

			String json = jsobj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/joonyoung/detail/jsonview.jsp");
			
		}
		else { // GET 방식일떄
			
			message = "잘못된 접근 방식입니다.";
			loc =  request.getContextPath() +"/main.run";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/joonyoung/msg.jsp");
			
			
		}
		
	}
		
		
}


