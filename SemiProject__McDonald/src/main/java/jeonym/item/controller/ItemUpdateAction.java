package jeonym.item.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import jangjh.member.model.MemberVO;
import jeonym.item.model.InterItemDAO;
import jeonym.item.model.ItemDAO;
import jeonym.item.model.ItemDetailVO;
import jeonym.item.model.ItemVO;
import jeonym.util.JeonymUtil;


public class ItemUpdateAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && "kingkingadmin".equals(loginuser.getUserid())) {
			Map<String, String> paraMap = new HashMap<>();
			InterItemDAO idao = new ItemDAO();
			
			String message = "";
			String loc = "";
	
			String method = request.getMethod();
			
			
			if(!"POST".equalsIgnoreCase(method)) { // get 방식인 경우 ==> 제품목록 페이지에서 제품등록을 누르거나
												   // 제품상세보기 페이지에서 수정버튼을 누른 경우
	 
				String pk_fk_item_no = request.getParameter("pk_fk_item_no"); // detailList 부터 넘어온 pk_fk_item_no
				
				// pk_fk_item_no에 부적한 타입의 데이터가 들어오는지 검사해야할 것
				try {
					
					// pk_fk_item_no 가 공백이거나 음수인지.
					if( pk_fk_item_no.trim().isEmpty() || Integer.parseInt(pk_fk_item_no) < 0) { 
						
						 message = "제품번호는 공백이거나 음수일 수 없습니다.";
						 loc = "javascript:history.back()";
						 
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
					
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/jeonym/msg.jsp");
						
						return;
					}
					
				
				
				}
				catch(NumberFormatException e) {
				
					 message = "제품번호는 숫자가 아닌 다른 값이 올 수 없습니다.";
					 loc = "javascript:history.back()";
					 
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
				
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/jeonym/msg.jsp");
			
					return;
	
				}
					
				// pk_fk_item_no 가 존재하는지 검사해야할 것
				paraMap.put("item_no", pk_fk_item_no);
				
				if(!idao.is_Exist_item_no(paraMap)) {
	
					message = "존재하지 않는 제품 번호입니다.";
					 loc = "javascript:history.back()";
					 
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
				
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/jeonym/msg.jsp");
			
					return;
			
				}
				
	
				super.getCategoryList(request); // 제품등록창에서 select 안에 값을 넣어주기 위함
					
				ItemVO ivo = idao.selectOneItem_total_info(pk_fk_item_no);
				request.setAttribute("ivo", ivo);
				request.setAttribute("pk_fk_item_no", pk_fk_item_no);
				
				setRedirect(false);
				setViewPage("/WEB-INF/jeonym/item/itemUpdate.jsp");
	
				
			}
			else { // "POST"
				
	
				MultipartRequest mtrequest = null;
				
				ServletContext svlCtx = session.getServletContext();
				String uploadFileDir = svlCtx.getRealPath("/images"); // 실제 images 폴더의 경로가 나온다.
					
					// System.out.println("===== 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir);
		
					try {
						
						mtrequest = new MultipartRequest(request, uploadFileDir, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
						
					}
					catch(IOException e) {
						
						request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10Mb를 초과하여 파일 업로드 실패함.");
						request.setAttribute("loc", "javascript:history.back()");
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/jeonym/msg.jsp");
						return; // 종료
					}
					
	
				String pk_fk_item_no = mtrequest.getParameter("pk_fk_item_no"); // 제품번호
				
				String allergens = mtrequest.getParameter("allergens"); // 알레르기
				String item_name = mtrequest.getParameter("item_name"); // 제품명
				String item_price = mtrequest.getParameter("item_price"); // 제품가격
				String morning_availability = mtrequest.getParameter("morning_availability"); // 판매시간대
				String fk_category_no = mtrequest.getParameter("fk_category_no"); // 카테고리 번호
				String is_burger = mtrequest.getParameter("is_burger"); // 버거여부
				String item_info = mtrequest.getParameter("item_info"); // 제품정보
				String weight_g = mtrequest.getParameter("weight_g"); // 중량(g)
				String weight_ml = mtrequest.getParameter("weight_ml"); // 중량(ml)
				String calories = mtrequest.getParameter("calories"); // 칼로리
				String carbo = mtrequest.getParameter("carbo"); // 당
				String protein = mtrequest.getParameter("protein"); // 단백질
				String fat = mtrequest.getParameter("fat"); // 포화지방
				String sodium = mtrequest.getParameter("sodium"); // 나트륨
				String caffeine = mtrequest.getParameter("caffeine"); // 카페인
				String coa = mtrequest.getParameter("coa"); // 판매시간대
				
				item_info = item_info.replaceAll("<", "&lt;");
				item_info = item_info.replaceAll(">", "&gt;");
				item_info = item_info.replaceAll("\r\n", "<br>");
				
				String item_image =  mtrequest.getOriginalFileName("item_image"); 	// 웹클라이언트의 웹브라우저에서 파일을 업로드 할때 올리는 파일명
				
				if( item_image == null) { item_image = ""; }// 만약 item_image 가 null 이 되는 경우에는 공백으로 처리
							
	
				ItemVO ivo = new ItemVO();
				int isSuccess = 0;
	
				ivo.setFk_category_no(Integer.parseInt(fk_category_no));
				ivo.setItem_name(item_name);
				ivo.setItem_image(item_image);
				ivo.setItem_price(Integer.parseInt(item_price));
				ivo.setMorning_availability(Integer.parseInt(morning_availability));
				ivo.setIs_burger(Integer.parseInt(is_burger));
				ivo.setItem_info(item_info);
				
				ItemDetailVO idvo = new ItemDetailVO();
				
		
				idvo.setWeight_g(Integer.parseInt(JeonymUtil.null_to_zero(weight_g)));
				idvo.setWeight_ml(Integer.parseInt(JeonymUtil.null_to_zero(weight_ml)));
				idvo.setCalories(Integer.parseInt(JeonymUtil.null_to_zero(calories)));
				idvo.setCarbo(Integer.parseInt(JeonymUtil.null_to_zero(carbo)));
				idvo.setProtein(Integer.parseInt(JeonymUtil.null_to_zero(protein)));
				idvo.setFat(Float.parseFloat(JeonymUtil.null_to_zero(fat)));
				idvo.setSodium(Integer.parseInt(JeonymUtil.null_to_zero(sodium)));
				idvo.setCaffeine(Integer.parseInt(JeonymUtil.null_to_zero(caffeine)));
				idvo.setAllergens(JeonymUtil.null_to_zero(allergens));
				idvo.setCoa(JeonymUtil.null_to_zero(coa));
				
				// null_to_empty -> null 이나 공백을 "0" 으로 만듦
		
				ivo.setItemDetailVO(idvo);
	
				try {
					
					isSuccess = idao.updateItemInfo(pk_fk_item_no, ivo);
					
					if(isSuccess > 0) {
						
						// === 추가이미지파일이 있다라면 tbl_product_imagefile 테이블에 제품의 추가이미지 파일명 insert 해주기 ===
			            
			            String str_attachCount = mtrequest.getParameter("attachCount"); 
			               // str_attachCount 이 추가이미지 파일의 개수이다. "" "0" ~ "10" 이 들어온다.
						
			            int attachCount = 0;
			            
			            
						if(!"".equalsIgnoreCase(str_attachCount)) {
							attachCount = Integer.parseInt(str_attachCount);
						}
						
						
						// 첨부파일의 파일명(파일서버에 업로드 되어진 실제파일명) 얻어오기
						for(int i=0;i<attachCount;i++) { // 넘어온 값이 "" 이거나 "0" 인경우에는 for문은 수행되지 않는다.
							
							String attach_fileName = mtrequest.getFilesystemName("attach"+ i);
							
							// tbl_product_imagefile 테이블에 제품의 추가이미지 파일명 insert 해주기
							idao.product_Imagefile_Insert(pk_fk_item_no, attach_fileName);
					
							
						}// end of for ------------------------------------------------------
	
						
						message = "성공적으로 수정되었습니다.";
						loc = request.getContextPath() + "/item/itemList.run";
				
					}
					else {
	
						message = "수정이 실패하였습니다 ..";
						loc = request.getContextPath() + "/item/itemList.run";
	
					}
	
					
				}
				catch(SQLIntegrityConstraintViolationException e) {
					// 제약조건에 위배된 경우 (이미 DB에 존재하는 제품명으로 수정시도시 발생)
					message = "제품명이나 이미지명에 중복은 허용되지 않습니다.";
					loc = "javascript:history.back()";
					
				}
				catch(SQLException e) {
					message = "수정이 실패하였습니다 ㅜㅜ";
					loc = request.getContextPath() + "/item/itemList.run";
										
				}
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
			
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jeonym/msg.jsp");
				
				
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
			
		
	}// end of excute() ------------------------------------------------------------------

}
