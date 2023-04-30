package daan.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import daan.item.ItemDAO;
import daan.item.ItemVO;

public class EditOptionAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ItemDAO idao = new ItemDAO();

		JSONArray parentJsonArr = new JSONArray();
		
		JSONArray childJsonArr = new JSONArray();
		
		// 사이드 전제품 가져오기
		List<ItemVO> sidesList = idao.getItemsbyCategory(3);
		for(ItemVO side : sidesList) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("item_no", side.getItem_no());
			jsonObj.put("name", side.getItem_name());
			jsonObj.put("image", side.getItem_image());
			jsonObj.put("price", side.getItem_price());
			childJsonArr.put(jsonObj);
		}
		parentJsonArr.put(childJsonArr);
		
		// 음료 전제품 가져오기
		childJsonArr = new JSONArray();
		List<ItemVO> drinksList = idao.getItemsbyCategory(5);
		for(ItemVO drink : drinksList) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("item_no", drink.getItem_no());
			jsonObj.put("name", drink.getItem_name());
			jsonObj.put("image", drink.getItem_image());
			jsonObj.put("price", drink.getItem_price());
			childJsonArr.put(jsonObj);
		}
		parentJsonArr.put(childJsonArr);
		
		String json = parentJsonArr.toString();
		
		request.setAttribute("json", json);
		
		String index = request.getParameter("session_index");
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/daan/jsonView.jsp");
	}

}
