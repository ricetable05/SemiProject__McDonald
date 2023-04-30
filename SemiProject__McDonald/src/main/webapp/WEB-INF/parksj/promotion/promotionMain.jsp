<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- burger CSS --%> 
 <link rel="stylesheet" href="<%= request.getContextPath()%>/css/promotion/promotion.css" type="text/css"/>

<style type="text/css">

.topimage{
background:url(<%= request.getContextPath() %>/images/프로모션상단이미지.jpg) 50% 50% no-repeat;
}


</style>

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>
<!-- 메인 컨테이너 시작-->
<div class="MCcontent">
	<div class="topimage">
		<div class="toptext" style="padding-top: 50px;">
			<h1 class="titDep1">맥도날드 프로모션</h1>
		</div>
		<div class="toptext2">
			<ul>
				<li class="listfirst"><a href="<%= request.getContextPath()%>/main.run">Home</a></li>
				<li class="listsecond"><a href="<%= request.getContextPath()%>/promotion/promotionMain.run">맥도날드 프로모션</a></li>
			</ul>
		</div>
	</div>
	<!-- 상단이미지 끝-->
	
		<div class="container-2" style="width: 80%; position: relative; margin:auto; margin-bottom: 40px;" >
			<div class="row"style="width:100%; padding-left: 8%;">
			
				<div id="indexdetail" class="card col-3 mb-3" style="width: 18rem; padding-right: 0px; padding-left: 0px;">
				  <div class="divshadow">
					<img src="<%= request.getContextPath() %>/images/index3.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
					  <div class="card-body">
					    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">상콤달콤! <br/> 자두 천도복숭아 칠러 출시!</h5>
					    <a href="<%= request.getContextPath() %>/promotion/drinkProm.run" class="stretched-link"></a>
					  </div>
				  </div>
				</div>
				
				<div id="indexdetail" class="card col-3 mb-3" style="width: 18rem; padding-right: 0px; padding-left: 0px;">
					<div class="divshadow" id="spec">
					  <img src="<%= request.getContextPath() %>/images/index2.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
					  <div class="card-body" style="padding-top:38px;">
					    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">단짠촉촉 맥그리들 is back!</h5>
					    <a href="<%= request.getContextPath() %>/promotion/mcMorningProm.run" class="stretched-link"></a>
					  </div>
				  </div>
				</div>
				
				<div id="indexdetail" class="card col-3 mb-3" style="width: 18rem; padding-right: 0px; padding-left: 0px;">
				  <div class="divshadow">
					  <img src="<%= request.getContextPath() %>/images/index.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
					  <div class="card-body">
					    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">68년 노하우의 클래스 <br/> 1955 트리플 어니언</h5>
					    <a href="<%= request.getContextPath() %>/promotion/burgerProm.run" class="stretched-link"></a>
					  </div>
				  </div>
				</div>
				
				<div id="indexdetail" class="card col-3 mb-3" style="width: 18rem; padding-right: 0px; padding-left: 0px;">
				  <div class="divshadow">
					  <img src="<%= request.getContextPath() %>/images/index5.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
					  <div class="card-body">
					    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">갓성비 간식 맛집<br/>맥도날드 해피스낵!</h5>
					    <a href="<%= request.getContextPath() %>/promotion/sideProm.run" class="stretched-link"></a>
					  </div>
				  </div>
				</div>
				
				<div id="indexdetail" class="card col-3 mb-3" style="width: 18rem; padding-right: 0px; padding-left: 0px;">
				  <div class="divshadow">
					  <img src="<%= request.getContextPath() %>/images/index7.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
					  <div class="card-body">
					    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">첫 적립 시 2000포인트 제공!<br/>새로워진 맥도날드 리워드!</h5>
					    <a href="<%= request.getContextPath() %>/promotion/rewardProm.run" class="stretched-link"></a>
					  </div>
				  </div>
				</div>
				
			</div>
		</div>
		
	
	
	</div>

<!-- 메인 컨테이너 끝-->

<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>

