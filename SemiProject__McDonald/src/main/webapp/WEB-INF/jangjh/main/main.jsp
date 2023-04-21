<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>맥도날드</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    
    <style type="text/css">
    
    #name {
    	font-size: 40pt;
    	font-family:'Malgun Gothic';
    	font-weight: bold;
    	text-align: center; 
    }
    
    #indexdetail {
    	margin-left: 70px;
    	
    }
    
    #carouselExampleIndicators {
    	margin-top: 138px;
    }
    
    </style>
    
  </head>
</head>
<body>
	
	
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
		      <img src="<%= request.getContextPath() %>/images/main_image/carousel1.jpg" class="d-block w-100" alt="..."> <!-- d-block 은 display: block; 이고  w-100 은 width 의 크기는 <div class="carousel-item active">의 width 100% 로 잡으라는 것이다. -->
		      <div class="carousel-caption d-none d-md-block"> <!-- d-none 은 display : none; 이므로 화면에 보이지 않다가, d-md-block 이므로 d-md-block 은 width 가 768px이상인 것에서만 display: block; 으로 보여라는 말이다.  --> 
			  </div>
		    </div>
		    
		    <div class="carousel-item">
		      <img src="<%= request.getContextPath() %>/images/main_image/carousel2.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <img src="<%= request.getContextPath() %>/images/main_image/carousel3.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <img src="<%= request.getContextPath() %>/images/main_image/carousel4.jpg" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <img src="<%= request.getContextPath() %>/images/main_image/carousel5.png" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
			  </div>		      
		    </div>
		    
		    <div class="carousel-item">
		      <img src="<%= request.getContextPath() %>/images/main_image/carousel6.jpg" class="d-block w-100" alt="...">
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
	<div id="name">McDonald's LIVE</div> 
	<br>
	<!-- McDonald's LIVE 제목 끝 --> 
	
	<!-- McDonald's LIVE 내용물 시작 -->
	<div class="container">
      <div class="row">
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">68년 노하우의 클래스 <br/> 1955 트리플 어니언</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index2.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">단짠촉촉 맥그리들 is back!</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index3.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">상콤달콤! <br/> NEW 자두 천도복숭아 칠러 출시!</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index4.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">2주간 포인트 더블로 쌓고,<br/>2주 후엔 할인 혜택 받자!</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index5.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">갓성비 간식 맛집<br/>맥도날드 해피스낵!</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index6.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">맥도날드와 함께 성장할 <br/>크루와 매니저 찾습니다.</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index7.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">우리가 엄격해질수록 <br/>버거는 더 맛있어지니까!</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index8.png" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">0.1초에 1잔!<br/>매일 마시는 커피를 더 맛있게</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index9.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">상콤달콤! <br/> NEW 자두 천도복숭아 칠러 출시!</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index10.jpg" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">‘로날드 맥도날드<br/>어린이 축구교실’ 은 무엇인가요?</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
		
		<div id="indexdetail" class="card mb-3" style="width: 18rem;">
		  <img src="<%= request.getContextPath() %>/images/main_image/index11.png" class="card-img-top" alt="프로모션" style="width: 100%" />
		  <div class="card-body">
		    <h5 class="card-title">귀하의 토지,건물에 맥도날드를 유치하세요.</h5>
		    <a href="#" class="stretched-link"></a>
		  </div>
		</div>
	  </div>
	</div>
	<!-- McDonald's LIVE 내용물 끝 -->
	
	<!-- 더보기 버튼 시작 -->
		<div class="text-center" id="btn_more" style="background-color: #FFFFFF; border: solid 0px;">
		<img src="<%= request.getContextPath() %>/images/main_image/btn_more.png">
	    </div>
	<!-- 더보기 버튼 끝 -->
	
	<!-- Optional JavaScript -->
    <script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.bundle.min.js" type="text/javascript"></script>

<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>