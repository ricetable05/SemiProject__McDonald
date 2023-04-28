package daan.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import daan.item.ItemDAO;

public class OrderVerificationAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String str_cart_arr = request.getParameter("str_cart_arr");

		JSONArray cart_arr = new JSONArray(str_cart_arr);
		// System.out.println("\n2. cart_arr => \n"+cart_arr);
		// [ cart_arr
		// 	[
		// 		{"item_price":6700,"item_name":"맥크리스피™ 클래식 버거","item_no":105},
		//		{"item_price":2800,"item_name":"후렌치 후라이","item_no":304},
		//		{"item_price":2400,"item_name":"코카-콜라","item_no":523}
		// 	]
		// ]

		int set_count_discount = 0;
		
		List<Integer> arr_item_no = new ArrayList<>();
		
		for(Object obj_singleOrder: cart_arr) {
			
			// singleOrder instanceof JSONArray ➡️ true
			JSONArray singleOrder = (JSONArray) obj_singleOrder;
			
			if(singleOrder.length() > 1) {
				set_count_discount += 1000;
			}
			for(Object obj_item:singleOrder) {
				JSONObject item = (JSONObject) obj_item;
				arr_item_no.add((Integer) item.get("item_no"));
			}
		}
		
		ItemDAO ido = new ItemDAO();
		int priceSum = ido.getPriceSum(arr_item_no);
		
		int priceSum_w_discount = priceSum-set_count_discount;
		
		if(priceSum_w_discount < 15000) {
			priceSum_w_discount += 3000;
		}
		
		String str_total = request.getParameter("total");
		
		try {
			
			int total = Integer.parseInt(str_total);
		
			String message = "";
			
			if(priceSum_w_discount == total) {
				
				message = "가격이 일치합니다. 결제를 진행합니다.";
			} else {
				message = "가격이 일치하지 않음";
			}
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("message", message);
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/daan/jsonView.jsp");
			
		} catch(NumberFormatException e ) {
			System.out.println("Error: 가격 오류.\n 가격은 문자열이 되거나 21억을 넘을 수 없습니다.");
			return;
		}
		
	}

}
