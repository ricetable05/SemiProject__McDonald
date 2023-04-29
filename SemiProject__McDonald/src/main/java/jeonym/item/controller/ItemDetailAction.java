package jeonym.item.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jeonym.item.model.InterItemDAO;
import jeonym.item.model.ItemDAO;
import jeonym.item.model.ItemDetailVO;
import jeonym.item.model.ItemVO;

public class ItemDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// TODO.. 관리자가 아닌 다른 사람이 검색하는지 여부
		InterItemDAO idao = new ItemDAO();
		
		boolean wrong_data_in_url = false; // url 에 잘못된 값을 입력했는지 여부 알아오기
		String item_no = request.getParameter("item_no");
		
		String message = "";
		String loc = "";

		
		if(item_no != null) {
			
			
			// item_no 가 공백인지 여부
			if(item_no.trim().isEmpty()) {				
				message = "item_no는 공백이 될 수 없습니다.";		
				wrong_data_in_url = true;
			}

			// int 범위를 넘어서거나 문자등이 들어올 경우
			try {
			
				// item_no 에 음수가 오는지 검사하는 여부
				if(Integer.parseInt(item_no) < 0) {
					message = "item_no 는 음수가 될 수 없습니다.";
					wrong_data_in_url = true;
				}
				
			}
			catch(NumberFormatException e) { // 유효하지 않은 문자를 item_no 로 입력하는 경우	
				message = "item_no 가 유효한 값이 아닙니다.";
				wrong_data_in_url = true;
			}
			
			
			// item_no 가 존재하는지 여부
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("item_no",item_no);
			
			boolean is_Exist_item_no = idao.is_Exist_item_no(paraMap); // item_no 가 DB에 존재하는지 여부 파악
			
			if(!is_Exist_item_no) {
				message = "item_no 가 DB에 존재하지 않습니다.";
				wrong_data_in_url = true;
			}

			if(!wrong_data_in_url) {
				
				ItemDetailVO idvo = idao.selectOneItem(paraMap);
				
				request.setAttribute("idvo", idvo);
				
				setRedirect(false);
				setViewPage("/WEB-INF/jeonym/item/itemDetailList.jsp");
				
			}
			else {

				loc = "javascript:history.back()";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				setRedirect(false);
				setViewPage("/WEB-INF/jeonym/msg.jsp"); // error 메시지
			}
			
			
			
		}
		else { // item_no 가 null 이라면
			
			message = "item_no 는 null 이 될 수 없습니다.";
			loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			setRedirect(false);
			setViewPage("/WEB-INF/jeonym/msg.jsp"); // error 메시지

			
		}

		
	}
}
