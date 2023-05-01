package daan.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import daan.item.ItemDAO;
import daan.item.ItemVO;
import jangjh.member.model.MemberVO;

public class OrderInfoAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boolean isLogined = super.checkLogin(request);		
		
		if(isLogined) {
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			request.setAttribute("user_postcode", loginuser.getPostcode());
			request.setAttribute("user_address", loginuser.getAddress());
			request.setAttribute("user_detail_address", loginuser.getDetail_address());
			request.setAttribute("user_ref_address", loginuser.getRef_address());
			
		}
		
		List<ItemVO> item_list = new ArrayList<>();
		
		ItemDAO idao = new ItemDAO();
		
		int fk_category_no  = 1;
		
		Date hourNow = new Date();
		SimpleDateFormat sdfmt = new SimpleDateFormat("HH");
		int int_hourNow = Integer.parseInt(sdfmt.format(hourNow));
		
		if(request.getParameter("fk_category_no") != null) {
			try {
				fk_category_no  = Integer.parseInt(request.getParameter("fk_category_no"));
			} catch(NumberFormatException e) {
				// 문자가 들어온 경우
				fk_category_no  = 1;
			}
			
		} else {
// 처음 방문
			if(int_hourNow >= 4 && int_hourNow <= 10) {
				fk_category_no  = 2;
			} else {
				fk_category_no  = 1	;
			}
		}
		
		item_list = idao.getItemsbyCategory(fk_category_no);
		
		if(item_list.size() < 0) {
			// 없는 카테고리 number 입력한 경우 그냥 1번 또는 2번 보여줌
			item_list = idao.getItemsbyCategory(1);
		}
		
		request.setAttribute("item_list", item_list);
		
		setRedirect(false);
		setViewPage("/WEB-INF/daan/orderInfo.jsp");
		
	}

}
