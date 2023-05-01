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
		String str_quantity_arr = request.getParameter("str_quantity_arr");

		JSONArray cart_arr = new JSONArray(str_cart_arr);
		// System.out.println("\n2. cart_arr => \n"+cart_arr);
		// [ cart_arr
		// 	[
		// 		{"item_price":6700,"item_name":"맥크리스피™ 클래식 버거","item_no":105},
		//		{"item_price":2800,"item_name":"후렌치 후라이","item_no":304},
		//		{"item_price":2400,"item_name":"코카-콜라","item_no":523}
		// 	]
		// ]
		JSONArray quantity_arr = new JSONArray(str_quantity_arr);
		int[] i_arr = new int[quantity_arr.length()];
		int quantity_i = 0;
		for(Object obj_quantity:quantity_arr) {
			int quantity_value = (Integer) obj_quantity;
			i_arr[quantity_i] = quantity_value;
			quantity_i++;
		}
		
		
		int priceSum_before_set_discount = 0;
		int set_count = 0;
		int i=0;
		List<Integer> arr_item_no = null;
		
		for(Object obj_singleOrder: cart_arr) {
			
			arr_item_no = new ArrayList<>();
			
			// singleOrder instanceof JSONArray ➡️ true
			JSONArray singleOrder = (JSONArray) obj_singleOrder;
			
			if(singleOrder.length() > 1) {
				set_count += (1*i_arr[i]);
			}
			
			for(Object obj_item:singleOrder) {
				JSONObject item = (JSONObject) obj_item;
				arr_item_no.add((Integer) item.get("item_no"));
			}
			ItemDAO ido = new ItemDAO();
			priceSum_before_set_discount += i_arr[i]*ido.getPriceSum(arr_item_no);
			i++;
		}
		int set_discount = set_count * 1000;
		
		int priceSum_after_set_discount = priceSum_before_set_discount-set_discount;
		
		// 배달비 - 15000원이 넘지 않으면 배달비용을 추가한다.
		if(priceSum_after_set_discount < 15000) {
			priceSum_after_set_discount += 3000;
		}
		System.out.println("DB 상 결제 금액 확인 => "+priceSum_after_set_discount);
		String str_total = request.getParameter("total");
		
		try {
			
			int total = Integer.parseInt(str_total);
		
			String message = "";
			
			if(priceSum_after_set_discount == total) {
				
				message = "success";
			} else {
				message = "fail";
			}
			JSONObject jsonObj = new JSONObject();
																				// # IMPORTANT 주문테이블에 총결제금액을 담는다면 아래의 총결제 금액을 담아야 합니다.			
																				// jsonObj.put("priceSum_w_discount", priceSum_w_discount);
			
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
