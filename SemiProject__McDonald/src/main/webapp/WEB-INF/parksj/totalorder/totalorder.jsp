<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<%
	String ctxPath = request.getContextPath();
	//      /MyMVC
%>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/totalorder/totalorder.css" type="text/css"/>

<style type="text/css">
	
	.topimage{
		background:url(<%= request.getContextPath() %>/images/품질이야기상단이미지.jpg) 50% 50% no-repeat;
	}
	

</style>


<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

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
		
		
		<%-- $(document).on("click", "tr.totalOrderInfo", function(e) {
			  const userid = $(this).find(".userid").text();
			  location.href = "<%= request.getContextPath()%>/totalOrder/totalOrderDetail.run?userid="+userid;
		}); --%>
		
		$("tr.totalOrderInfo").click( (e) => {
			/* alert($(e.target).parent().find(".odr_no").text()); */
			/* alert("헤헤헤"); */
			
			 const odr_no = $(e.target).parent().find(".odr_no").text();
			location.href="<%= ctxPath%>/totalorder/totalOrderDetail.run?odr_no="+odr_no;
			<%-- location.href="<%=ctxPath%>/detail/burgerView.run?item_no="+odr_no;--%>
		});
		
		
	}); // end of $(document).ready(function(){}) ---------------------------
	
	
	// Function Declaration
	function goSearch(){
		
		const frm = document.totalOrderFrm;

		frm.action = "totalOrderMain.run"; // 본인에게 action
		frm.method = "get";
		frm.submit();
	}// end of function goSearch()---------------------------------------------- 
	
	
</script>    



<div class="MCcontent">
	<div class="topimage">
		<div class="toptext" style="padding-top: 40px;">
			<c:if test="${requestScope.userid == 'kingkingadmin'}">
				<h1 class="titDep1">전체주문내역</h1>
			</c:if>
			<c:if test="${requestScope.userid != 'kingkingadmin'}">
				<h1 class="titDep1">나의주문내역</h1>
			</c:if>	
		</div>
	</div>
	
	
	<c:if test="${requestScope.userid == 'kingkingadmin'}">
		<form name="totalOrderFrm" style="text-align: center; margin-left:10%; ">
		<select id="searchType" name="searchType">
			<option value="">선택하세요</option>
			<option value="odr_no">주문번호</option>	
			<option value="fk_userid">아이디</option>
		</select>
		
		<input type="text" id="searchWord" name="searchWord" />
		 
		<input type="text" style="display:none;"/>
		
		<button type="button" class="btn btn-secondary" style="margin-left:10px; margin-right:30px; font-weight:600;" onclick="goSearch();">검색</button> <%-- type="button" 은 꼭 넣도록 하자 --%>
		
		<span style="color: red; font-weight: bold; font-size: 12pt;">페이지당 주문건수:&nbsp;</span>
      	<select id="sizePerPage" name="sizePerPage">
	         <option value="10">10개</option>
	         <option value="5">5개</option>
	         <option value="3">3개</option>
      	</select>
	</form>
	</c:if>	
	<c:if test="${requestScope.userid != 'kingkingadmin'}">
		<form name="totalOrderFrm" style="text-align: center; margin-left:10%; display:none;">
			<select id="searchType" name="searchType">
				<option value="">선택하세요</option>
				<option value="odr_no">주문번호</option>	
				<option value="fk_userid">아이디</option>
			</select>
			
			<input type="text" id="searchWord" name="searchWord" />
			 
			<input type="text" style="display:none;"/>
			
			<button type="button" class="btn btn-secondary" style="margin-left:10px; margin-right:30px; font-weight:600;" onclick="goSearch();">검색</button> <%-- type="button" 은 꼭 넣도록 하자 --%>
			
			<span style="color: red; font-weight: bold; font-size: 12pt;">페이지당 주문건수:&nbsp;</span>
	      	<select id="sizePerPage" name="sizePerPage">
		         <option value="10">10개</option>
		         <option value="5">5개</option>
		         <option value="3">3개</option>
	      	</select>
		</form>
	</c:if>	
	
	

	<table id="totalOrderTbl" class="table" style="width: 90%; margin-top: 20px; text-align: center; margin-left: 5%;">
        <thead>
           <tr style="font-size: 14pt;">
              <th>주문번호</th>
              <th>회원아이디</th>
              <th>주문일자</th>
              <th>배달상태</th>
           </tr> 
        </thead>
        
        <tbody style="text-align: center;">

    		<c:if test="${not empty requestScope.totalOderList}">
    			<c:forEach var="mvo" items="${requestScope.totalOderList}" > <%-- items 에는 배열이나 list 가 온다. --%>
   					<tr class="totalOrderInfo"  style="font-size: 12pt;">
   					   <td class="odr_no">${mvo.odr_no}</td>
			           <td>${mvo.fk_userid}</td>
			           <td>${mvo.odr_date}</td>
			           <td>
			           		<c:choose>
			                    <c:when test="${mvo.is_delivery eq 0}">배송전</c:when>
			                    <c:when test="${mvo.is_delivery eq 1}">배송완료</c:when>
			                </c:choose>
			           </td>
          			</tr>
    			</c:forEach>
    		</c:if>
        
        	<c:if test="${empty requestScope.totalOderList}">
    			<tr>
	    		   <td colspan="6">주문내역이 없습니다.</td>
	    		   
    			</tr>    	
    		</c:if>

        </tbody>
    </table>	
    <%-- 
	<nav class="my-5" style="margin-left: 30%;" >
        <div style='display:flex; width:80%; c'>
          <ul class="pagination">${requestScope.pageBar}</ul>
       </div>
    </nav> --%>
    
   <nav class="my-5" id="page-item" style="margin-left: 30%;" >
        <div style='display:flex; width:80%; c'>
          <ul class="pagination" id="page-link">${requestScope.pageBar}</ul>
       </div>
    </nav>   
</div>
	
</body>
<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>	
