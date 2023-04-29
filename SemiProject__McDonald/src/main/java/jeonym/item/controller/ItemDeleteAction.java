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

public class ItemDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 관리자만 할 수 있도록 하고
		// fk_item_no 가 null 이거나 잘못된 값이 넘어왔을 때 history.back() 할 것
		
		InterItemDAO idao = new ItemDAO();
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		Map<String, String> paraMap = new HashMap<>();

		
		String message = "";
		String loc = "";

		
		if(loginuser != null && "kingkingadmin".equals(loginuser.getUserid())) {

			String pk_fk_item_no = request.getParameter("pk_fk_item_no");
		
			paraMap.put("item_no", pk_fk_item_no);
			
			boolean isExist = idao.is_Exist_item_no(paraMap);
					
			
			try {
			
				if(pk_fk_item_no != null && !pk_fk_item_no.trim().isEmpty() && !(Integer.parseInt(pk_fk_item_no) < 0 ) && isExist ) {
					
					int result = idao.deleteItem(pk_fk_item_no);
					
					if(result > 0) {
						
						message = "성공적으로 삭제되었습니다.";
						loc = request.getContextPath() + "/item/itemList.run";

					}
					else {
						
						message = "삭제에 실패했습니다.";
						loc = "javascript:history.back()";
						
					}			
					
				}
				else {									
					message = "제품번호가 유효하지 않습니다.";
					loc = "javascript:history.back()";
				}
				

			}
			catch(NumberFormatException e) {
				message = "제품번호는 숫자이외에 올 수 없습니다.";
				loc = "javascript:history.back()";
			}
			
			
		}
		else {
			
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우
			message = "관리자만 접근이 가능합니다.";
			loc = "javascript:history.back()";
			
		}

		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jeonym/msg.jsp");

		
	}// end of execute() -------------------------------------------------------------------------------------------

}
