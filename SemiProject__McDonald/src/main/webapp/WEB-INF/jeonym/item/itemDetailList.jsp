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


<style type="text/css">
	
	body{
		 
	}
	
	table#itemTbl{
		font-family:SpeedeeK;
  		font-weight:400;
  		background-color: white;
  		border:none;
  		margin:0 auto;
	}
	
	table#itemTbl > tbody > tr:first-child{
		height:100px;
	}
	
	table#itemTbl > tbody > tr > td:first-child {
		width: 130px;
		vertical-align: middle;
		font-family:SpeedeeK;
		font-weight: 600;
		border-right: 2px solid grey;
		 
	}
	
	table#itemTbl td {
		border-bottom: 2px solid grey; 
		border-top: none;
	}

	img#top_img {
	
		min-width: 100%;
		height: 100px;
		padding: 0 4% 0 0;
		
	}
</style>
   
   
<script type="text/javascript">
	
	$(document).ready(function(){
		
		
		
		$("button#itemUpdateBtn").click(function(){
			
			const pk_fk_item_no = '${requestScope.idvo.pk_fk_item_no}';
			
			self.close();
			window.opener.goItemUpdate(pk_fk_item_no);
			//alert('클릭됨');
		});
		
		$("button#itemDeleteBtn").click(function(){
			
			if(confirm('정말로 삭제하시겠습니까?')){

				const pk_fk_item_no = '${requestScope.idvo.pk_fk_item_no}';
				
				self.close();
				window.opener.goItemDelete(pk_fk_item_no);
				//alert('클릭됨');
			}
			
		});

		
	});

</script>   
<!DOCTYPE html>
<body>
	
	<div class="container-fluid col-md-10 col-lg-9 px-0">
				<img id="top_img" src="<%=request.getContextPath()%>/images/품질이야기상단이미지.jpg" style="margin:0"/>
				<table id="itemTbl" class="table" style="width: 90%; padding-top:1px;">
			        <thead>
			        </thead>
			        
			        <tbody>
					
			    		<c:if test="${not empty requestScope.idvo}">
			    				  
			    			      <tr class="itemDetailInfo">
			    			      	  <td style="border-top: 2px solid grey;">제품명</td>
						              <td class="item_name" style="border-top: 2px solid grey; vertical-align: middle; text-align: center; font-weight:600; font-size:30pt;">${requestScope.idvo.item_name}</td>
			          			  </tr>
			          			  <tr>
			          			  	   <td>제품사진</td>	
			    				  	   <td style="text-align:center;background: none;"><img src="<%=request.getContextPath()%>/images/${requestScope.idvo.ivo.item_image}" width="250" height="200"/></td>
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
						              <td>
						              	<c:if test="${requestScope.idvo.allergens eq '0'}">-</c:if>
						              	<c:if test="${requestScope.idvo.allergens ne '0'}">${requestScope.idvo.allergens}</c:if>					              					              
			          			  </tr>
								  <tr>
			    			      	  <td>원산지 정보</td>
						              <td>
						              	<c:if test="${requestScope.idvo.coa eq '0'}">-</c:if>
						              	<c:if test="${requestScope.idvo.coa ne '0'}">${requestScope.idvo.coa}</c:if>					              					              					              
						              </td>
			          			  </tr>
								  <tr>
			    			      	  <td>제품 상세정보</td>
						              <td>
											${requestScope.idvo.ivo.item_info}					              					              					              
						              </td>
			          			  </tr>
			  
			    				
			    		</c:if>
			        
			        	<c:if test="${empty requestScope.idvo}">
				    			<tr>
			 	    			  <td colspan="4">등록된 제품이 없습니다.</td>
				    			</tr>    	
			    		</c:if>
			
			        </tbody>
			    </table>
			    <div class="pl-4 pt-1">
			    	<button type="button" id="itemUpdateBtn" class="ml-2 btn btn-info">제품정보 수정</button>
			    	<button type="button" id="itemDeleteBtn" class="ml-2 btn btn-danger">제품정보 삭제</button>
			    </div>
			    
			     	
	</div>
</body>