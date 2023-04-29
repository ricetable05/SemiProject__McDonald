<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<script>
 
 $(document).ready(function(){
	
	 
	 
 });
 
 window.onresize = function() { <%-- 윈도우 창의 크기변화 이벤트 onresize --%>
	  const width = window.innerWidth;	
	  		  
	  console.log(width);
	  
	  if(width <= 991){ <%-- 만약 브라우저 너비가 991 이하가 되면--%>
		  $("div#div_flex1").hide(); <%-- 사이드 메뉴바 hide --%>
		  $("div#div_flex2").hide();
		  $("div#div_flex3").hide();		  
	  }
	  else {
		  $("div#div_flex1").show();
		  $("div#div_flex2").show();
		  $("div#div_flex3").show();
	  }

};
</script>
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>

<style type="text/css">
	body {
		font-family:SpeedeeK;
		font-weight: 600;
	}
	
	div.card-footer{
		background:none;
	}
	
	hr {
		padding:0;
	}
</style>

<section style="background-color:#eee; width:80%; margin:0 auto;">

	<div class="container-fluid px-0 m-0" style="padding-top:8%;">
		   <div id="carouselBanners" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselBanners" data-slide-to="0" class="bg-dark active"></li>
			    <li data-target="#carouselBanners" data-slide-to="1" class="bg-dark"></li>
			    <li data-target="#carouselBanners" data-slide-to="2" class="bg-dark"></li>
			  </ol>
			  
			  
			   <div class="carousel-inner mycarousel mt-4">
			    
				    <div class="carousel-item active">
				      <img src="<%= request.getContextPath() %>/images/banner_1.jpg" class="d-block w-100" alt="..."> 
				      <div class="carousel-caption d-none d-md-block">  
				      </div>
				    </div>
				    <div class="carousel-item">
				      <img src="<%= request.getContextPath() %>/images/banner_2.jpg" class="d-block w-100" alt="...">
				      <div class="carousel-caption d-none d-md-block">
					  </div>		      
				    </div>
				    <div class="carousel-item">
				      <img src="<%= request.getContextPath() %>/images/banner_3.jpg" class="d-block w-100" alt="...">
				      <div class="carousel-caption d-none d-md-block">
					  </div>		      
				    </div>
		    
			  </div> 
			  	        
			</div>
		
			
		  <div class="m-0 pt-1">
				<h4 class="ml-2"><span>세트 주문하기</span>
					<a class="ml-5 text-dark" href="#" style="text-decoration:none">
						<i class="fa-solid fa-caret-right fa-2xs" style="position:relative; top:2px; color: #d21920;"></i><span class="h6"> 세트 메뉴 모두 보기</span>
					</a>
				</h4>
		  </div>
			
		  <%-- <c:if test="${empty requestScope.loginuser }"> --%>
		  <div class="card-deck mb-4">
			  
				<c:forEach var="ivo" items="${requestScope.OrderMainItemList}" varStatus="status">
				  
				  <c:set var="cnt" value="${status.count}"/>
				  
				  <c:if test="${cnt < 6}">
					  <div class="card">
					    <div class="card-body px-0 text-center">
					    
					    	<c:set var="item_img" value="${fn:replace(ivo.item_image,'.png','_nbg.png')}"/>
					    	<img src="<%= request.getContextPath() %>/images/${item_img}" class="card-img-top" alt="...">
					     	<h5 class="">${ivo.item_name}</h5>
					    </div>
					    <hr/>
					    <div class="card-footer border-0 row">
					    	<div class="col-6 p-2 pl-3">
					    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>${ivo.itemDetailVO.calories}kcal
					    	</div>
					    	<div class="col-6 px-0">
					    		<a class="btn h6 btn-fast-order" href="<%= request.getContextPath() %>/#.run?item_no=${ivo.item_no}">빠른주문</a> <%-- get 방식이므로 item_no 에 잘못된 값이 들어가는 것 처리 필요 --%>
					    	</div>
					    </div>
					  </div>
				  </c:if>
				</c:forEach>			  
		</div>
		<%-- </c:if> --%>
		
		<%-- <c:if test="${empty requestScope.loginuser }"> --%>
		<div class="card-deck">
			 <c:forEach var="ivo" items="${requestScope.OrderMainItemList}" varStatus="status">
				  
				  <c:set var="cnt" value="${status.count}"/>
				  
				  <c:if test="${cnt >= 6}">
					  <div class="card">
					    <div class="card-body px-0 text-center">
					    	<c:set var="item_img" value="${fn:replace(ivo.item_image,'.png','_nbg.png')}"/>
					    	<img src="<%= request.getContextPath() %>/images/${item_img}" class="card-img-top" alt="...">
					     	<h5 class="">${ivo.item_name}</h5>
					    </div>
					    <hr/>
					    <div class="card-footer border-0 row">
					    	<div class="col-6 p-2 pl-3">
					    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>${ivo.itemDetailVO.calories}kcal
					    	</div>
					    	<div class="col-6 px-0">
					    		<a class="btn h6 btn-fast-order" href="<%= request.getContextPath() %>/#.run?item_no=${ivo.item_no}">빠른주문</a> <%-- get 방식이므로 item_no 에 잘못된 값이 들어가는 것 처리 필요 --%>
					    	</div>
					    </div>
					  </div>
				  </c:if>
			</c:forEach>
		</div>
		<%-- </c:if> --%>
		
			
	</div>		
</section>

<section style="background-color:#eee; width:80%; margin:0 auto;" class="pt-5">
	<div class="container-fluid px-0">
		
		<h4 class="ml-2">맥딜리버리 이용 방법!</h4>
		<a href="#">
			<img src="<%= request.getContextPath() %>/images/how_mcdelivery_works_ko.png" alt="이미지가 없습니다." width="100%"/>
		</a>
		
	</div>
</section>
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>