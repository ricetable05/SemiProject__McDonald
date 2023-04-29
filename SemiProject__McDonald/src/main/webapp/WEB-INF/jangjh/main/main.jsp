<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>맥도날드</title>
    
<style type="text/css">
    
    #name {
    	font-size: 40pt;
    	text-align: center; 
    }
    
    #indexdetail {
    	margin-left: 70px;
    	
    }
    
    #carouselExampleIndicators {
    	margin-top: 138px;
    }
    
    .divshadow {
	box-shadow: 3px 5px 3px #4950576e;
	height: 100%;
	border-radius: 3%;
	}
	
	#sepc{
	    padding-top: 35px;
	}
	
	#indexdetail{
		border-bo-radius: 3%;
		border: solid 0px;
	}
	    
</style>
    
  </head>
</head>
<body>
	
	<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>
	
	<!-- carousel 시작 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
		  </ol>
		  
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <a href="<%= request.getContextPath() %>/promotion/drinkProm.run">
		      	<img src="<%= request.getContextPath() %>/images/carousel1.jpg" class="d-block w-100" >
		      </a> 
		      <div class="carousel-caption d-none d-md-block"> 
			  	
			  </div>
		    </div>
		    
		    <div class="carousel-item">
		      <a href="<%= request.getContextPath() %>/promotion/burgerProm.run">
		      	<img src="<%= request.getContextPath() %>/images/carousel2.jpg" class="d-block w-100">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <a href="<%= request.getContextPath() %>/promotion/sideProm.run">
		      	<img src="<%= request.getContextPath() %>/images/carousel3.jpg" class="d-block w-100">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <a href="<%= request.getContextPath() %>/menu/mcMorningMain.run">
		      	<img src="<%= request.getContextPath() %>/images/carousel4.jpg" class="d-block w-100">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <a href="<%= request.getContextPath() %>/menu/dessertMain.run">
		      	<img src="<%= request.getContextPath() %>/images/carousel5.png" class="d-block w-100">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <a href="<%= request.getContextPath() %>/promotion/mcMorningProm.run">
		      	<img src="<%= request.getContextPath() %>/images/carousel6.jpg" class="d-block w-100">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		  </div>
		  
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" >
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	 </div>
	 <!-- carousel 끝 -->	
	 
	 <!-- 유튜브 동영상 넣기 시작 -->
	 <div class="embed-responsive embed-responsive-21by9">
     	<iframe width="560" height="315" src="https://www.youtube.com/embed/QEZSigcGokE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
     </div>
	 <!-- 유튜브 동영상 넣기 끝 -->	
	 
	<!-- McDonald's LIVE 제목 시작 --> 
	<br><br>	
	<div id="name" style="font-family:SpeedeeK; font-weight:600;">McDonald's LIVE</div> 
	<br>
	<!-- McDonald's LIVE 제목 끝 --> 
	
	<!-- McDonald's LIVE 내용물 시작 -->
	<div class="container">
      <div class="row">
      
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">68년 노하우의 클래스<br/>1955 트리플 어니언</h5>
			    <a href="<%= request.getContextPath() %>/promotion/burgerProm.run" class="stretched-link"></a>
			  </div>
		  </div>
		</div>

		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index2.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">단짠촉촉 맥그리들<br>is back!</h5>
			    <a href="<%= request.getContextPath() %>/promotion/mcMorningProm.run" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
		
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index3.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">상콤달콤!<br>자두 천도복숭아 칠러!</h5>
			    <a href="<%= request.getContextPath() %>/promotion/drinkProm.run" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
		
		
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index4.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">2주간 포인트 더블로 쌓고,<br/>2주 후엔 할인 혜택 받자!</h5>
			    <a href="<%= request.getContextPath() %>" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
		
		
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index5.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">갓성비 간식 맛집<br/>맥도날드 해피스낵!</h5>
			    <a href="<%= request.getContextPath() %>/promotion/sideProm.run" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
		
		
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index6.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">맥도날드와 함께 성장할 <br/>크루와 매니저 찾습니다.</h5>
			    <a href="<%= request.getContextPath() %>" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
		
		
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index7.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">첫 적립 시 2000포인트!<br/>새로워진 맥도날드 리워드!</h5>
			    <a href="<%= request.getContextPath() %>/promotion/rewardProm.run" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
		
		
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index8.png" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">우리가 엄격해질수록 <br/>버거는 더 맛있어지니까!</h5>
			    <a href="<%= request.getContextPath() %>" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
		
		
		<div id="indexdetail" class="card col-3 mb-3" style="width: 19rem; padding-right: 0px; padding-left: 0px;">
		  <div class="divshadow">
			<img src="<%= request.getContextPath() %>/images/index9.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
			  <div class="card-body">
			    <h5 class="card-title" style="text-align: center; font-family:SpeedeeK; font-weight:600;">0.1초에 1잔!<br/>매일 커피를 더 맛있게</h5>
			    <a href="<%= request.getContextPath() %>" class="stretched-link"></a>
			  </div>
		  </div>
		</div>
	  </div>
	</div>
	<!-- McDonald's LIVE 내용물 끝 -->
	

<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>