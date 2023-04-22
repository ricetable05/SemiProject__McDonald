<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<style type="text/css">
	
	table#itemTbl th, table#itemTbl td{
		font-size: 11pt;
		vertical-align: middle;
		text-align: center;
	}
	
	
	ul#category_list {
		width: 202px;
		list-style-type: none;
		padding: 0;
		margin: 0 auto;
	}
	
	ul#category_list > li{
		width: 200px;
		margin: 0px auto 10px auto;
	}
	
	ul#category_list > li:last-child{
		margin: 0px auto;
	}
	
	
	ul#category_list > li:hover{
		background-color: #ccc;
	}
	
	
	ul#category_list li > a{
		text-decoration: none;
		color: black;
		font-weight: bold;
		padding-left:50px;
		width:200px;
		display:inline-block;
	}
	
	<style type="text/css">
	tr.itemInfo:hover {
		background-color: #e6ffe6;
		cursor: pointer;
	}
	
	
	
	
</style>

<script type="text/javascript">
	
	
	
</script>


<div class="container-fluid border border-danger" style="margin-top:100px; background-color:#fafafa;">

	<div class="row">
	
		<div class="container col-md-2 col-lg-3 my-5 p-4">
			<ul id="category_list" class="border border-primary" style="background-color:white">
			<li class="mb-3 mt-0"><a href="<%=request.getContextPath()%>/item/itemList.run">전체 카테고리</a></li>
			<c:forEach var="ctmap" items="${requestScope.categoryList}">
				<li><a href="<%=request.getContextPath()%>/item/itemList.run?category_id=${ctmap.category_id}">${ctmap.category_name}</a></li>
			</c:forEach>
			</ul>
					
		</div>
		
		<div class="container-fluid col-md-10 col-lg-9 mt-5 ">
			<table id="itemTbl" class="table table-bordered" style="width: 90%; margin-top: 20px;">
		        <thead>
		           <tr>
		              <th>제품코드</th>
		              <th>카테고리명</th>
		              <th>제품명</th>
		              <th>제품가격</th>
		              <th>판매시간대</th>
		              <th>제품설명</th>
		           </tr>
		        </thead>
		        
		        <tbody>
		
		    		<c:if test="${not empty requestScope.ItemList}">
		    				<c:forEach var="ivo" items="${requestScope.ItemList}" > <%-- items 에는 배열이나 list 가 온다. --%>
		   					  <tr class="itemInfo">
					              <td class="item_no">${ivo.item_no}</td>
					              <td>${ivo.categoryName}</td>
					              <td>${ivo.item_name}</td>
					              <td><fmt:formatNumber value="${ivo.item_price}" pattern="#,###"/></td>
					              
					              <c:choose>
					              	<c:when test="${ivo.morning_availability eq 0}">
					              	  <td>10:30AM~04:00AM</td>
					              	</c:when>
					              	<c:when test="${ivo.morning_availability eq 1}">
					              	  <td>4:00AM~10:30AM</td>
					              	</c:when>
									<c:otherwise>
									  <td>All time</td>
									</c:otherwise>					              			            
					              </c:choose>
					              
					              <td>					              
						              <c:if test="${fn:length(ivo.item_info) > 10}"> <%-- 10글자 이상인 경우 --%>
							              	<c:set var="item_info" value="${fn:substring(ivo.item_info, 0, 10)}"/>
							              	${item_info}...
						              </c:if>
						              
						              <c:if test="${!(fn:length(ivo.item_info) > 10)}"> <%-- 10글자 이상이 아닌 경우 --%>
							              	${ivo.item_info}
						              </c:if>
					              </td>
		          			  </tr>
		    				</c:forEach>
		    		</c:if>
		        
		        	<c:if test="${empty requestScope.ItemList}">
			    			<tr>
		 	    			  <td colspan="4">가입된 회원이 없습니다.</td>
			    			</tr>    	
		    		</c:if>
		
		        </tbody>
		    </table>	
		    
			<nav class="my-5">
		        <div style='display:flex; width:80%;'>
		          <ul class="pagination" style='margin:auto;'>
		          	${requestScope.pageBar}
		          </ul>
		       </div>
		    </nav>
		</div>
	
	</div>

</div>

<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>