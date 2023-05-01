<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<%
	String ctxPath = request.getContextPath();
	//      /MyMVC
%>    

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/member/memberList.css" type="text/css"/>


<style type="text/css">

	.bg1 {
	  background-image: url(<%= ctxPath%>/images/품질이야기상단이미지.jpg);  
	  background-clip: border-box;
	} 	
		 
		
</style>

<script type="text/javascript">
	$(document).ready(function(){
	 			
	 if("${requestScope.searchType}" != "" && "${requestScope.searchWord}" != ""){ // searchType 이나 searchWord에 문제가 없는 경우에만 값을 넣어주겠다.	
			
		    $("select#searchType").val("${requestScope.searchType}");
			$("input#searchWord").val("${requestScope.searchWord}");
			
		}
		
		$("select#sizePerPage").val("${requestScope.sizePerPage}");
		
		
		$("input#searchWord").keyup(function(e){
			
			if( e.keyCode == '13'){ // e.keyCode 인걸 잘 기억하자!
				goSearch();
			}
			
		});
		
		// select 태그에 대한 이벤트는 click 이 아니라 change 이다.
		$("select#sizePerPage").bind("change", function(){
			goSearch();
		});
		
		
		// 특정 회원을 클릭하면 그 회원의 상세정보를 보여주도록 한다.
		$("tr.memberInfo").click( (e) => {
			//alert($(e.target).parent().find(".userid").text());
			
			const userid = $(e.target).parent().find(".userid").text();
			location.href="<%=ctxPath%>/member/memberOneDetail.run?userid="+userid;
		});
		
	}); // end of $(document).ready(function(){}) ---------------------------
	
	// Function Declaration
	function goSearch(){
		
		const frm = document.memberFrm;

		frm.action = "memberList.run"; // 본인에게 action
		frm.method = "get";
		frm.submit();
	}// end of function goSearch()---------------------------------------------- 
	
	
</script>

	<div>
	  <p class="bg1" style="text-align: center; font-weight:600;">회원전체 목록</p>
	</div>
	
	
	<form name="memberFrm" style="text-align: center ">
		<select id="searchType" name="searchType">
			<option value="">선택하세요</option>
			<option value="member_name">회원명</option>	
			<option value="userid">아이디</option>
			<option value="email">이메일</option>
		</select>
		
		<input type="text" id="searchWord" name="searchWord" />
		 
		<input type="text" style="display:none;"/>
		
		<button type="button" class="btn btn-secondary" style="margin-left:10px; margin-right:30px; font-weight:600;" onclick="goSearch();">검색</button> <%-- type="button" 은 꼭 넣도록 하자 --%>
		
		<span style="color: red; font-weight: bold; font-size: 12pt;">페이지당 회원명수:&nbsp;</span>
      	<select id="sizePerPage" name="sizePerPage">
	         <option value="10">10개</option>
	         <option value="5">5개</option>
	         <option value="3">3개</option>
      	</select>
	</form>

	<table id="memberTbl" class="table" style="width: 90%; margin-top: 20px; text-align: center; ">
        <thead>
           <tr style="font-size: 14pt;">
              <th>아이디</th>
              <th>회원명</th> 
              <th>이메일</th>
           </tr> 
        </thead>
        
        <tbody>

    		<c:if test="${not empty requestScope.memberList}">
    			<c:forEach var="mvo" items="${requestScope.memberList}" > 
   					<tr class="memberInfo"  style="font-size: 12pt;">
			           <td class="userid">${mvo.userid}</td>
			           <td>${mvo.member_name}</td>
			           <td style=" ">${mvo.email}</td>
          			</tr>
    			</c:forEach>
    		</c:if>
        
        	<c:if test="${empty requestScope.memberList}">
    			<tr>
	    		   <td colspan="3">가입된 회원이 없습니다.</td>
    			</tr>    	
    		</c:if>

        </tbody>
    </table>	
    
	<nav class="my-5">
        <div style='display:flex; width:80%; c'>
          <ul class="pagination" style='margin-left: 450px; '>
          	${requestScope.pageBar}
          </ul>
       </div>
    </nav>


<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>