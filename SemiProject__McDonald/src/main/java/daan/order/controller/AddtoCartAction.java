package daan.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.JSONArray;

import common.controller.AbstractController;
import daan.item.ItemDAO;
import daan.item.ItemVO;

public class AddtoCartAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// ajax로 전송된 값들을 읽고, 개별주문(ex. 빅맥-감자튀김-코카콜라)을 받는다.
		String item_no = request.getParameter("item_no");
		String is_set = request.getParameter("is_set");
		
		ItemDAO idao = new ItemDAO();
		// 단품이면 버거 하나에 대한 ItemVO, 세트라면 버거,사이드,음료에 대한 각각의 ItemVO를 List<ItemVO> 타입으로 리턴.
		List<ItemVO> singleOrder = idao.getOption(item_no, is_set);
		
		JSONArray jsonArr = new JSONArray();
		
		if(singleOrder.size() > 0 ) {
			
			for(ItemVO option : singleOrder) {
				//System.out.println(option.getItem_no()+" 이름 : "+option.getItem_name()+" 가격: ￦"+option.getItem_price());
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("item_no", option.getItem_no());
				jsonObj.put("item_name", option.getItem_name());
				jsonObj.put("item_price", option.getItem_price());
				jsonArr.put(jsonObj);
			};
		}
		
		String json = jsonArr.toString();
		
		request.setAttribute("json", json);
		// System.out.println(json);
		// [
		// 	{"item_price":4300,"item_name":"맥치킨®","item_no":110},
		//	{"item_price":2800,"item_name":"후렌치 후라이","item_no":304},
		//	{"item_price":2400,"item_name":"코카-콜라","item_no":523}
		// ]

		this.setRedirect(false);
		this.setViewPage("/WEB-INF/daan/addtoCart.jsp");
	}

}
