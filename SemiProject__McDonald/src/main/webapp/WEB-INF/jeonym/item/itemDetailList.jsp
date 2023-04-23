<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Required meta tags --%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<%-- Optional JavaScript --%>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script> 

   
<!DOCTYPE html>

<div class="container-fluid col-md-10 col-lg-9 mt-5 ">
			<table id="itemTbl" class="table table-bordered" style="width: 90%; margin-top: 20px;">
		        <thead>
		        </thead>
		        
		        <tbody>
				
		    		<c:if test="${not empty requestScope.idvo}">
		    			      <tr class="itemDetailInfo">
		    			      	  <td>제품명</td>
					              <td class="item_name">${requestScope.idvo.item_name}</td>
		          			  </tr>
		    			      <tr>
		    			      	  <td>중량(g)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.weight_g eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.weight_g > 0}">${requestScope.idvo.weight_g}</c:if>
					              </td>
		          			  </tr>
		    			      <tr>
		    			      	  <td>중량(ml)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.weight_ml eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.weight_ml > 0}">${requestScope.idvo.weight_ml}</c:if>
					              </td>
		          			  </tr>
		    			      <tr>
		    			      	  <td>열량(kcal)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.calories eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.calories > 0}">${requestScope.idvo.calories}</c:if>
					              </td>
		          			  </tr>
		    			      <tr>
		    			      	  <td>당(g)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.carbo eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.carbo > 0}">${requestScope.idvo.carbo}</c:if>					              
					              </td>
		          			  </tr>
		    			      <tr>
		    			      	  <td>단백질(g)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.protein eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.protein > 0}">${requestScope.idvo.protein}</c:if>					              
					              </td>
		          			  </tr>
		    			      <tr>
		    			      	  <td>포화지방(g)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.fat eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.fat > 0}">${requestScope.idvo.fat}</c:if>					              
					              </td>
		          			  </tr>
							  <tr>
		    			      	  <td>나트륨(g)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.sodium eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.sodium > 0}">${requestScope.idvo.sodium}</c:if>					              
								  </td>
		          			  </tr>		          			  
							  <tr>
		    			      	  <td>카페인(mg)</td>
					              <td>
					              	<c:if test="${requestScope.idvo.caffeine eq 0}">-</c:if>
					              	<c:if test="${requestScope.idvo.caffeine > 0}">${requestScope.idvo.caffeine}</c:if>					              
								  </td>
		          			  </tr>
							  <tr>
		    			      	  <td>알레르기 정보</td>
					              <td>${requestScope.idvo.allergens}</td>
		          			  </tr>
							  <tr>
		    			      	  <td>원산지 정보</td>
					              <td>${requestScope.idvo.coa}</td>
		          			  </tr>

		          			  
		          			  
		          			  
		    				
		    		</c:if>
		        
		        	<c:if test="${empty requestScope.idvo}">
			    			<tr>
		 	    			  <td colspan="4">등록된 제품이 없습니다.</td>
			    			</tr>    	
		    		</c:if>
		
		        </tbody>
		    </table>	
</div>
