package parksj.menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import parksj.menu.model.InterMenuDAO;
import parksj.menu.model.ItemVO;
import parksj.menu.model.MenuDAO;

public class McMorningJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String category_name = request.getParameter("category_name");
		String start = request.getParameter("start");
		String len = request.getParameter("len");
		
		InterMenuDAO mdao = new MenuDAO();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("category_name", category_name);
		paraMap.put("start", start);
		
		String end = String.valueOf(Integer.parseInt(start)+ Integer.parseInt(len)-1);
		paraMap.put("end", end);
		
		// 특정 카테고리에 속하는 제품들을 조회해오기 (select)
		List<ItemVO> McMnList = mdao.selectCtno(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(McMnList.size()>0) {
			
			for(ItemVO ivo : McMnList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("item_no", ivo.getItem_no()); 
				jsonObj.put("category_id", ivo.getCatevo().getCategory_id());
				jsonObj.put("category_name", ivo.getCatevo().getCategory_name());
				jsonObj.put("item_name", ivo.getItem_name());
				jsonObj.put("item_image", ivo.getItem_image());
				
				jsonArr.put(jsonObj);
			}
			
		}
		else {
			String json = jsonArr.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/parksj/jsonview.jsp");
		}
		
		String json = jsonArr.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/parksj/jsonview.jsp");
		
	}

}
