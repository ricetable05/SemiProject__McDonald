package jeonym.item.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.MemberVO;
import jeonym.item.model.InterItemDAO;
import jeonym.item.model.ItemDAO;
import jeonym.item.model.ItemDetailVO;
import jeonym.item.model.ItemVO;

public class ItemDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	HttpSession session = request.getSession();
	MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	
	if(loginuser != null && "kingkingadmin".equals(loginuser.getUserid())) {
			// 관리자(kingkingadmin) 으로 로그인 했을 경우
		
			InterItemDAO idao = new ItemDAO();
			
			
			Map<String, String> paraMap = new HashMap<>();
			boolean wrong_data_in_url = false; // url 에 잘못된 값을 입력했는지 여부 알아오기
			String item_no = request.getParameter("item_no").trim();
			
			String message = "";
			String loc = "";
	
			
			if(item_no != null) {
				
			try {
	
					// item_no 가 공백인지 여부
					if(item_no.trim().isEmpty()) {				
						message = "item_no는 공백이 될 수 없습니다.";		
						wrong_data_in_url = true;
					}
					// item_no 에 음수가 오는지 검사하는 여부										
					else if(Integer.parseInt(item_no) < 0) {
						
						message = "item_no 는 음수가 될 수 없습니다.";
						loc = "javascript:history.back()";
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						
						setRedirect(false);
						setViewPage("/WEB-INF/jeonym/msg.jsp"); // error 메시지
						
						return;		
					}

					paraMap.put("item_no",item_no);
					boolean is_Exist_item_no = idao.is_Exist_item_no(paraMap); // item_no 가 DB에 존재하는지 여부 파악

					if(!is_Exist_item_no) {
						message = "item_no 가 DB에 존재하지 않습니다.";
						wrong_data_in_url = true;
					}

				}
				catch(NumberFormatException e) { // 유효하지 않은 문자를 item_no 로 입력하는 경우	
				
					boolean isDigit = true;
					
					char charArr[] = item_no.trim().toCharArray();
					for(int i=0;i<charArr.length; i++) {
						
						if(!Character.isDigit(charArr[i])) {
							isDigit = false;
							break;
						}
						
					}
					
					if(isDigit) {
						
						message = "item_no 의 범위가 int 를 벗어났습니다.";
						wrong_data_in_url = true;
						
					}
					else {
						
						message = "item_no는 문자형태가 올 수 없습니다.";
						wrong_data_in_url = true;
						
					}

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
	
		} // end of if() 관리자 체크 ---------------------------------------------------
		
		else {
			
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우
			String message = "관리자만 접근이 가능합니다.";
			String loc = request.getContextPath() + "/main.run";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jeonym/msg.jsp");
		}

			
	} // end of excute
}
