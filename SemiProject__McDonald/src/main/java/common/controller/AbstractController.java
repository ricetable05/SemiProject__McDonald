package common.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jeonym.item.model.InterItemDAO;
import jeonym.item.model.ItemDAO;
import parksj.menu.model.InterMenuDAO;
import parksj.menu.model.MenuDAO;

public abstract class AbstractController implements InterCommand{

	// interface 의 Override 를 implements 한 클래스가 아니라
	// 해당 클래스를 상속받는 자식 클래스가 override 하도록 하기 위해 abstract 를 사용한다.
	
	
	// === 다음의 나오는 것은 우리끼리한 약속이다. === 
	
	// ※ VIEW 단 페이지(.JSP)로 이동시 forward 방법(dispatcher)으로 해야 하는데 
	//   자식 클래스에서는 부모 클래스에서 생성해둔 메소드 호출시 아래와 같이 하면 된다.
	//	 super.setRedirect(false); 
	//   super.setViewPage("/WEB-INF/index.jsp");
	
	
	// ※ URL 주소를 변경하여 페이지 이동시
	//   sendRedirect 방법으로 해야하는데 
	//	 super.setRedirect(true); 
	// 	 super.setViewPage("registerMember.up");	 
	
	
	// 필드 (field)
	private boolean isRedirect = false ;
	// isRedirect 변수의 값이 false 이라면, view 단 페이지(.jsp)로 forward(dispatcher) 하겠다는 말이다.
	// isRedirect 변수의 값이 true 이라면, sendRedirect 로 하겠다는 말이다.
	
	private String viewPage;
	// viewPage 는 isRedirect 값이 false 이라면, view단 페이지(.jsp) 의 경로명이 되고,
	// viewPage 는 isRedirect 값이 true 이라면 이동해야할 URL 주소가 된다.

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getViewPage() {
		return viewPage;
	}

	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	//////////////////////////////////////////////////////////////////////////////////
	
    // 카테고리 리스트를 가져오는 메소드
    public void getCategoryList(HttpServletRequest request) throws SQLException {
      
       InterItemDAO idao = new ItemDAO();
      
       List<Map<String, String>> categoryList = idao.getCategoryList(); // VO가 아닌 Map 을 사용한다.
      
       if(categoryList.size() > 0) {
          request.setAttribute("categoryList", categoryList);
       }
       else {
          System.out.println("카테고리가 존재하지 않습니다.");
       }
      
    }
	
	 
	//***** 제품목록(Category)을 보여줄 메소드 생성하기 ***** //
    public void getMenuCategoryList(HttpServletRequest request) throws SQLException {
        
    	InterMenuDAO pdao = new MenuDAO();
    	List<Map<String, String>> menucategoryList= pdao.getMenuCategoryList();
    	      
    	request.setAttribute("menucategoryList", menucategoryList);
    	      
    	}//end of public void getMenuCategoryList(HttpServletRequest request)
	
}
