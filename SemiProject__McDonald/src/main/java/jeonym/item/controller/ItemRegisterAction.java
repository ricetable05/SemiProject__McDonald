package jeonym.item.controller;

import java.io.IOException;
import java.sql.SQLException;
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

public class ItemRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	// 관리자만 할 수 있게
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && "kingkingadmin".equals(loginuser.getUserid())) {
		
			Map<String, String> paraMap = new HashMap<>();
			InterItemDAO idao = new ItemDAO();
			
			String message = "";
			String loc = "";
			
	
		
			String method = request.getMethod(); 
							
			if(!"POST".equalsIgnoreCase(method)) { // get 방식인 경우 ==> 제품목록 페이지에서 제품등록을 누르거나
	
				super.getCategoryList(request); // 제품등록창에서 카테고리 목록 select 안에 값을 넣어주기 위함
				setRedirect(false);
				setViewPage("/WEB-INF/jeonym/item/itemUpdate.jsp");
	
				
			}
			else { // "POST"
				
				MultipartRequest mtrequest = null;
				
				ServletContext svlCtx = session.getServletContext();
				
				// 아래의 부분을 내가 조절을해서 등록하는 카테고리에 해당하는 폴더에 넣어야 한다.
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
				
	
						
				String allergens = mtrequest.getParameter("allergens");
				String fk_category_no = mtrequest.getParameter("fk_category_no"); // 카테고리 번호
				String item_name = mtrequest.getParameter("item_name"); // 제품명
				String item_price = mtrequest.getParameter("item_price"); // 제품가격
				String morning_availability = mtrequest.getParameter("morning_availability"); // 판매시간대
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
				
				String item_image =  mtrequest.getFilesystemName("item_image"); // 제품 이미지 파일명(파일서버에 업로드 되어진 실제파일명)
				
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
		
				// 카테고리 번호에 따른 item seq 과 item detail seq 채번 
				paraMap = idao.getItem_no_by_category(fk_category_no);
				
				ivo.setItem_no(Integer.parseInt(paraMap.get("item_no")));			
				idvo.setPk_fk_item_no(Integer.parseInt(paraMap.get("pk_fk_item_no")));
				ivo.setItemDetailVO(idvo);
				
				
				try {
					
					isSuccess = idao.registItem(ivo, paraMap);
					
					if(isSuccess > 0) {
						
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
							idao.product_Imagefile_Insert(paraMap.get("item_no"), attach_fileName);
	
							
							
						}// end of for ------------------------------------------------------
	
						message = "성공적으로 등록되었습니다.";
						loc = request.getContextPath() + "/item/itemList.run";
								
					}
					else {
	
						message = "등록이 실패하였습니다 ..";
						loc = request.getContextPath() + "/item/itemList.run";
	
					}
	
					
				}catch(SQLException e) {
					e.printStackTrace();
					message = "등록이 실패하였습니다 ㅜㅜ";
					loc = request.getContextPath() + "/item/itemList.run";
											
				}
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
			
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jeonym/msg.jsp");
	
	
				
			}// end of else{} -----------------------------------------------------------------------------------

		} // end of if() 관리자 체크 ---------------------------------------------------
		
		else {
			
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우
			String message = "관리자만 접근이 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jeonym/msg.jsp");
		}
			
	} // end of execute() ------------------------------------------------------------------------------------

}
