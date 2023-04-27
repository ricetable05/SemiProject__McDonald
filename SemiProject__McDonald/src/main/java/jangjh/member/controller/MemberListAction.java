package jangjh.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jangjh.member.model.InterMemberDAO;
import jangjh.member.model.MemberDAO;
import jangjh.member.model.MemberVO;

public class MemberListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null && loginuser.getUserid().equals("admin")) {
			// 관리자로 로그인 했을 때만 
			
			InterMemberDAO mdao = new MemberDAO();
			
			String searchType = request.getParameter("searchType");
			// 회원목록 페이지로 보여줄 때 즉, 처음에는 넘어온 값이 없다. 그러므로 searchType 에는 null 이 들어온다.
			// 회원목록 페이지에서 "검색" 버튼을 클릭시 넘어온다. 그러므로 searchType 에는 null 이 아닌 어떤 값이 들어온다.
			
			
			String searchWord = request.getParameter("searchWord"); 
			// 회원목록 페이지로 보여줄 때 즉, 처음에는 넘어온 값이 없다. 그러므로 searchWord 에는 null 이 들어온다.
			// 회원목록 페이지에서 "검색" 버튼을 클릭시 넘어온다. 그러므로 searchWord 에는 null 이 아닌 어떤 값이 들어온다.
			
			
			/////////////////////////////////////////////////////////////////////////////////////////
			
			if(searchType == null || 
			   (!"member_name".equals(searchType) && !"userid".equals(searchType) && !"email".equals(searchType)) ) {  // searchType이 name이 아니고 userid도 아니고 email도 아닌 경우  
				searchType = "";
			}
			
			if(searchWord == null || 
			  (searchWord != null && searchWord.trim().isEmpty())) { // null은 아니지만 공백
				searchWord = "";
			}
			
			
			Map<String, String> paraMap = new HashMap<>();
					
			paraMap.put("searchType", searchType);
			paraMap.put("searchWord", searchWord);
			
			
			// ** 페이징 처리를 안한 모든 회원 또는 검색한 회원 목록 보여주기 ** //
		/*	
			List<MemberVO> memberList = mdao.selectMember(paraMap);
		*/
			// *** 페이징 처리를 한 모든 회원 또는 검색한 회원 목록 보여주기 *** //
			String currentShowPageNo = request.getParameter("currentShowPageNo");
			// currentShowPageNo 은 사용자가 보고자 하는 페이지바의 페이지 번호이다.
			// 메뉴에서 회원목록만을 클릭했을 경우에는 currentShowPageNo 는 null 이 된다.
			// currentShowPageNo 가 null 이라면 currentShowPageNo 를 1 페이지로 바꾸어야 한다.
			
			String sizePerPage = request.getParameter("sizePerPage");
			// 한 페이지당 화면상에 보여줄 회원의 갯수
			// 메뉴에서 회원목록만을 클릭했을 경우에는 sizePerPage 는 null 이 된다.
			// sizePerPage 가 null 이라면 sizePerPage 를 10으로 바꾸어야 한다.
			// "10" 또는 "5" 또는 "3"
			
			if(currentShowPageNo == null) {
				currentShowPageNo = "1";
			}
			
			if(sizePerPage == null ||
			  !("3".equals(sizePerPage) || "5".equals(sizePerPage) || "10".equals(sizePerPage))) {
				// (!"3".equals(sizePerPage) && !"5".equals(sizePerPage) && !"10".equals(sizePerPage)) 와 같다.
				// sizePerPage 에 3 , 5 , 10 이외의 다른 문자가 들어오게 되면 false 가 되고 false 의 not(!)은 true 이므로 무조건 10이 된다.
				sizePerPage = "10";
			}
			
			// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 숫자가 아닌 문자를 입력한 경우 또는 
			// int 범위를 초과한 숫자를 입력한 경우라면 currentShowPageNo 는 1 페이지로 만든다.
			// 또한 currentShowPageNo 이 0 이하이면 currentShowPageNo 는 1 페이지로 만든다. ====  
			try {
				
				if(Integer.parseInt(currentShowPageNo) < 1) { // paraMap에 값이 들어가기 전에 처리해야한다.
					currentShowPageNo = "1";
				}				
				
			}catch (NumberFormatException e) {
				currentShowPageNo = "1"; 
			}
			
			paraMap.put("currentShowPageNo", currentShowPageNo); //조회하고자하는 페이지번호	
			paraMap.put("sizePerPage", sizePerPage); 			 //한페이지당 보여줄 행의 개수

			
			// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
			int totalPage = mdao.getTotalPage(paraMap);
			
			
			if(Integer.parseInt(currentShowPageNo) > totalPage) { 
				currentShowPageNo = "1";
				paraMap.put("currentShowPageNo", currentShowPageNo);
			}
			
			// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에
			// totalPage 보다 큰 값을 입력하여 장난친 경우에는 1페이지로 가게끔 막아주기
			
			List<MemberVO> memberList = mdao.selectPagingMember(paraMap);
			
			request.setAttribute("memberList", memberList);	
			request.setAttribute("searchType", searchType);
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("sizePerPage", sizePerPage);
			
			
			// **** ==== 페이지바 만들기 시작 ==== **** //
			
			int blockSize = 10; 
			// blockSize는 블럭 당 보여지는 페이지 번호의 개수이다.
			//  10
			
			int loop = 1; 
			//  loop 는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 개수(지금은 10개) 까지만 증가하는 용도이다.
			//  1 ~ 10
			
			// !!!! 다음은 pageNo 를 구하는 공식이다. !!!! //
			// ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1
			int pageNo  = (( Integer.parseInt(currentShowPageNo) - 1) / blockSize) * blockSize + 1; 
			// pageNo 는 페이지바에서 보여지는 첫번째 번호이다.
			
			
			
			// **** [맨처음][이전] 만들기 **** //
			String pageBar = "";
			
			pageBar += "<li class='page-item'><a class='page-link' href='memberList.run?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+1+"&sizePerPage="+sizePerPage+"'>[맨처음]</a></li>"; // bootstrap 에 있는 pageBar 이다.
			
			if(pageNo != 1) {
				pageBar += "<li class='page-item'><a class='page-link' href='memberList.run?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo - 1)+"&sizePerPage="+sizePerPage+"'>[이전]</a></li>"; // bootstrap 에 있는 pageBar 이다.
			}
			// 맨처음 페이지를 제외한 나머지 페이지에는 이전 버튼이 있다.
			
			
			while(!(loop > blockSize || pageNo > totalPage )) { // while 문을 빠져나오는 조건 2개
																// 페이지바를 만들어주는 것
				
			if(pageNo == Integer.parseInt(currentShowPageNo)) {	
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>"; // bootstrap 에 있는 pageBar 이다.
			}
			else {	
				pageBar += "<li class='page-item'><a class='page-link' href='memberList.run?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>" + pageNo + "</a></li>"; // bootstrap 에 있는 pageBar 이다.
			}
																								 
				
				loop++; // 1 2 3 4 5 6 7 8 9 10
				
				pageNo++; //  1  2  3  4  5  6  7  8  9 10
						  // 11 12 13 14 15 16 17 18 19 20
						  // 21 22 23 24 25 26 27 28 29 30
						  // 31 32 33 34 35 36 37 38 39 40
						  // 41 42
				
			} // end of while ---------------------------------------------------------------
			
			// **** [다음][마지막] 만들기 **** //

			if(pageNo <= totalPage) {
				pageBar += "<li class='page-item'><a class='page-link' href='memberList.run?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>[다음]</a></li>"; // bootstrap 에 있는 pageBar 이다.
			}
			
			pageBar += "<li class='page-item'><a class='page-link' href='memberList.run?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+totalPage+"&sizePerPage="+sizePerPage+"'>[마지막]</a></li>"; // bootstrap 에 있는 pageBar 이다.
			
			request.setAttribute("pageBar", pageBar);

			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/member/memberList.jsp");
			
			
		}
		else {
			// 로그인을 안한 경우 또는 일반 사용자로 로그인 한 경우
			
			String message = "관리자만 접근이 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message",message);
			request.setAttribute("loc",loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jangjh/msg.jsp");
		}
		
	}

}
