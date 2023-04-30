<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<%
	String ctxPath = request.getContextPath();
	//      /MyMVC
%>

<style type="text/css">
	
	
	
	.topimage {
		position: relative;
		border: solid 0px green;
		width:100%;
		height: 226px;
		margin-top: 136px;
	}
	
	.topimage:before {
		content:"";
		width:100%;
		height:100%;
		position:absolute;
	}
	
	
	.toptext{
		border: solid 0px red;
	    width: 1146px;
	    height: 150px;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    font-size:14pt;
	    color: #fff;
		font-family:SpeedeeK;
	  	font-style:normal;
	  	font-weight:600;
  		text-align: center;
	}
	
	
	
	.titDep1{display:block;
		 font-size: 55pt; 
		 line-height:1;
		 font-family:SpeedeeK;
  		 font-style:normal;
	}
	
	.topimage{
		background:url(<%= request.getContextPath() %>/images/품질이야기상단이미지.jpg) 50% 50% no-repeat;
	}
	
	.maincontent{
		border: solid 0px red;
		padding-left: 10%;
		
	}
	
	tr.totalOrderInfo:hover {
		cursor: pointer;
		color: #db0007;
	}
	
	body {
		font-family:SpeedeeK; 
		font-weight:600;
		margin-top: 138px;
	}
	
	table {
	}
	
	 .page-link {
	  color: #000; 
	  background-color: #fff;
	  border: 1px solid #ccc; 
	}
	
	.page-item.active .page-link {
	 z-index: 1;
	 color: white;
	 font-weight:bold;
	 background-color: #29293d;
	 border-color: #ccc;
	 
	}
		
	p {
	  border: 1em violet;
	  padding: 55px;
	  font-size: 35pt; 
	  color: white;
	  
	}
	
	
	.pagination{
	    width: 600px;	    
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
		
		
		$(document).on("click", "tr.totalOrderInfo", function(e) {
			  const odr_no = $(this).find(".odr_no").text();
			  location.href = "<%= request.getContextPath()%>/totalOrder/totalOrderDetail.run?odr_no=" + odr_no;
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

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<div class="MCcontent">
	<div class="topimage">
		<div class="toptext" style="padding-top: 40px;">
			<h1 class="titDep1">전체주문내역</h1>
		</div>
	</div>
	
	<div class="maincontent">
		<form name="totalOrderFrm" style="text-align: center ">
			<select id="searchType" name="searchType">
				<option value="">선택하세요</option>
				<option value="order_num">주문번호</option>	
				<option value="userid">아이디</option>
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
	
		<table id="totalOrderTbl" class="table" style="width: 90%; margin-top: 20px; text-align: center; ">
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
	    			<c:forEach var="ovo" items="${requestScope.totalOderList}" > <%-- items 에는 배열이나 list 가 온다. --%>
	   					<tr class="totalOrderInfo"  style="font-size: 12pt;">
	   					   <td class="odr_no">${ovo.odr_no}</td>
				           <td>${ovo.fk_userid}</td>
				           <td>${ovo.odr_date}</td>
				           <td>
				           		<c:choose>
				                    <c:when test="${ovo.is_delivery eq 0}">배송전</c:when>
				                    <c:when test="${ovo.is_delivery eq 1}">배송완료</c:when>
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
	    
		<nav class="my-5" style="padding-left: 25%;" >
	        <div style='display:flex; width:80%; c'>
	          <ul class="pagination">${requestScope.pageBar}</ul>
	       </div>
	    </nav>
	</div>
	
</div>
<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>	
