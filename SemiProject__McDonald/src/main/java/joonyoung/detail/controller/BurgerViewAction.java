package joonyoung.detail.controller;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import joonyoung.detail.model.*;

public class BurgerViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		String itemno = request.getParameter("item_no").trim();
		
		boolean wrong_data_in_url = false; // url 에 잘못된 값을 입력했는지 여부 알아오기

		InterDetailDAO idao = new DetailDAO();

		
		String message ="";
		String loc = "";
		

		if(!"POST".equalsIgnoreCase(method) ) { // "get" 
			
			
			
			if(itemno != null) {
				
				//System.out.println("itemno :" + itemno);
				
		
	
			
				
				
					try {
						
						// item_no 가 공백인지 여부
						if(itemno.trim().isEmpty()) {
							//System.out.println("공백입니다.");
							message = "item_no는 공백이 될 수 없습니다.";		
							wrong_data_in_url = true;
							
							loc = "javascript:history.back()";
							request.setAttribute("message", message);
							request.setAttribute("loc", loc);
							
							setRedirect(false);
							setViewPage("/WEB-INF/joonyoung/msg.jsp");
							
							return;
						}// end of if(itemno.trim().isEmpty())-----------------------------------
						
						
						
						
						
					
						// item_no 에 음수가 오는지 검사하는 여부
						else if(Integer.parseInt(itemno.trim()) < 0) {
							
						//	System.out.println("음수입니다.");
							message = "itemno 는 음수가 될 수 없습니다.";
							wrong_data_in_url = true;
							
							loc = "javascript:history.back()";
							request.setAttribute("message", message);
							request.setAttribute("loc", loc);
							
							setRedirect(false);
							setViewPage("/WEB-INF/joonyoung/msg.jsp");
							
							return;
						}// end of else if(Integer.parseInt(itemno.trim()) < 0) -----------------------------
						
						// item_no 가 존재하는지 여부
						Map<String, String> paraMap = new HashMap<>();
						paraMap.put("itemno",itemno);
						
						// item_no 가 DB에 존재하는지 여부 파악
						boolean is_Exist_item_no = idao.is_Exist_item_no(paraMap); 
						
						if(!is_Exist_item_no) {
							message = "itemno 가 DB에 존재하지 않습니다.";
							
							wrong_data_in_url = true;
							
							loc = "javascript:history.back()";
							request.setAttribute("message", message);
							request.setAttribute("loc", loc);
							
							setRedirect(false);
							setViewPage("/WEB-INF/joonyoung/msg.jsp");
							
							return;
							
						}// end of if(!is_Exist_item_no)----------------------
						
						
						
						
					}// end of try -------------------------------------
					
					
					catch(NumberFormatException e) { // 유효하지 않은 문자를 item_no 로 입력하는 경우   
			            
			               	   boolean isDigit = true;
			               
				               char charArr[] = itemno.trim().toCharArray();
				               for(int i=0;i<charArr.length; i++) {
				                  
				                  if(charArr[i] != '-' && !Character.isDigit(charArr[i]) ) {
				                	  
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

	
							if(!wrong_data_in_url) { // 맞다면, 정상적으로 실행합니다.
								
									// System.out.println("안녕하세요");
									
									int item_no = Integer.parseInt(itemno);
						
									
									// 제품번호를 가지고서 해당제품의 정보를 조회해오기
									DetailVO ivo = idao.selectOneProductByitem_no(item_no);
									//System.out.println("ivo : "+ ivo);
									// 제품번호를 가지고서 해당제품의 디테일 정보를 조회해오기
									DetailDetailVO ivo_detail = idao.selectOneProduct_DetailByitem_no(item_no);
									
						
							
									
									// 제품이 있는 경우
									request.setAttribute("ivo", ivo); // ivo 가 null 이 아닙니다!
									request.setAttribute("ivo_detail", ivo_detail);
									
								    super.setRedirect(false);
									super.setViewPage("/WEB-INF/joonyoung/detail/burgerView.jsp");
								
							}// end of if(!wrong_data_in_url)
							
							else {
								
								loc = "javascript:history.back()";
								request.setAttribute("message", message);
								request.setAttribute("loc", loc);
								
								setRedirect(false);
								setViewPage("/WEB-INF/joonyoung/msg.jsp"); // error 메시지
							}// end of else-------

			}
		
							else { // itemno 가 null 이라면
								
								message = "item_no 는 null 이 될 수 없습니다.";
								loc = "javascript:history.back()";
								request.setAttribute("message", message);
								request.setAttribute("loc", loc);
								
								setRedirect(false);
								setViewPage("/WEB-INF/joonyoung/msg.jsp"); // error 메시지
							}// end of else--------------

				}

		
				else {
					// "post" 방식이므로 사용자가 웹브라우저 주소 창에서 장난쳐서 존재하지 않는 제품번호를 입력한 경우
				
					 message = "검색하신 제품은 존재하지 않습니다.";
			          loc = "javascript:history.back()";
			         
			         request.setAttribute("message", message);
			         request.setAttribute("loc", loc);
			         
			         super.setRedirect(false);
			         super.setViewPage("/WEB-INF/joonyoung/msg.jsp");
				}
		
		
		
		
	}

}