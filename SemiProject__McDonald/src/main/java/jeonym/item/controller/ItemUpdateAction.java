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
import jeonym.item.model.InterItemDAO;
import jeonym.item.model.ItemDAO;
import jeonym.item.model.ItemDetailVO;
import jeonym.item.model.ItemVO;
import jeonym.util.JeonymUtil;


public class ItemUpdateAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		// 관리자만 할 수 있게
		
		
		HttpSession session = request.getSession();
		Map<String, String> paraMap = new HashMap<>();
		InterItemDAO idao = new ItemDAO();
		
		String message = "";
		String loc = "";

		String method = request.getMethod();
		
		

		// pk_fk_item_no에 부적한 타입의 데이터가 들어오는지 검사해야할 것
		// pk_fk_item_no 가 존재하는지 검사해야할 것
		
		
		
		
		if(!"POST".equalsIgnoreCase(method)) { // get 방식인 경우 ==> 제품목록 페이지에서 제품등록을 누르거나
											   // 제품상세보기 페이지에서 수정버튼을 누른 경우

			String pk_fk_item_no = request.getParameter("pk_fk_item_no"); // detailList 부터 넘어온 pk_fk_item_no
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
			
				// 아래의 부분을 내가 조절을해서 등록하는 카테고리에 해당하는 폴더에 넣어야 한다.
				
				
			String uploadFileDir = svlCtx.getRealPath("/images/item"); // 실제 images 폴더의 경로가 나온다.
				
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
				

			String pk_fk_item_no = mtrequest.getParameter("pk_fk_item_no"); 
			
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
			
			// null_to_empty -> null 이나 공백을 "0" 으로 만듦
			
			
			ivo.setItemDetailVO(idvo);

			
			try {
				
				isSuccess = idao.updateItemInfo(pk_fk_item_no, ivo);
				
				if(isSuccess > 0) {
					// 수정이 된다면 해당 제품의 이미지를 다른 폴더에 집어 넣어야 한다.
					message = "성공적으로 수정되었습니다.";
					loc = request.getContextPath() + "/item/itemList.run";
							
				}
				else {

					message = "수정이 실패하였습니다 ..";
					loc = request.getContextPath() + "/item/itemList.run";

				}

				
			}catch(SQLException e) {
				e.printStackTrace();
				message = "수정이 실패하였습니다 ㅜㅜ";
				loc = request.getContextPath() + "/item/itemList.run";
										
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
		
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jeonym/msg.jsp");
			
			
		}
		
	}// end of excute

}
