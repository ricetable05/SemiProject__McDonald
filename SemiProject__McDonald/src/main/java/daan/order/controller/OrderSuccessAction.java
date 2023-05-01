package daan.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import daan.item.ItemDAO;
import jangjh.member.model.MemberVO;

public class OrderSuccessAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String str_cart_arr = request.getParameter("cartFinal");
		String str_quantity_arr = request.getParameter("quantityFinal");
		
		String str_totalFinal = request.getParameter("totalFinal");
		int totalFinal = Integer.parseInt(str_totalFinal);
		
		String str_deliveryFee = request.getParameter("deliveryFee");
		int deliveryFee = Integer.parseInt(str_deliveryFee);
		
		String delivery_loc = request.getParameter("delivery_loc");
		
		
		JSONArray cart_arr = new JSONArray(str_cart_arr);
		JSONArray quantity_arr = new JSONArray(str_quantity_arr);
		
		
		int is_delivery_price = 0;
		
		if(deliveryFee > 0) {
			is_delivery_price = 1;
		}

		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		ItemDAO idao = new ItemDAO();
		
		int fk_odr_no = idao.recordTblOrder(is_delivery_price, loginuser, totalFinal, delivery_loc);
		
		int[] q_arr = new int[quantity_arr.length()];
		int quantity_i = 0;
		
		for(Object obj_quantity:quantity_arr) {
			int quantity_value = (Integer) obj_quantity;
			q_arr[quantity_i] = quantity_value;
			quantity_i++;
		}
		
		
		int is_set = 0;
		int index=0;
		
		for(Object obj_singleOrder: cart_arr) {
			
			JSONArray singleOrder = (JSONArray) obj_singleOrder;
			
			for(Object obj_item:singleOrder) {
				JSONObject item = (JSONObject) obj_item;
					
				int item_no = (Integer) item.get("item_no");
				
				if(singleOrder.length() > 1) {
						
					if(item_no < 300) {
						is_set = 1;
					} else {
						is_set = 0;
					}

				} else {
						is_set = 0;
				}
				idao.recordTblOrderList(item,is_set,q_arr[index], fk_odr_no);
			}
			
			index++;
		}
		
		super.setRedirect(true);
		super.setViewPage(request.getContextPath()+"/daan/orderInfo.run");
		
	}

}
