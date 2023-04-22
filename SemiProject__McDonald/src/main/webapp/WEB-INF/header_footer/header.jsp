<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <%-- Required meta tags --%>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <%-- Bootstrap CSS --%>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
 
 <%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
 
<%-- header footer CSS --%> 
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header_footer/header_footer.css" type="text/css"/>
 
 <%-- Optional JavaScript --%>
 <script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>
 <script src="<%=request.getContextPath()%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script> 

<%-- jQueryUI CSS 및 JS  --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />  
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<script type="text/javascript">
	
	<%-- 네비게이션 시작 --%>
	$(document).ready(function(){
		
		$("ul.depth2").hide(); // 처음에는 depth2 메뉴를 hide()
		
		
 		$("li.nav-item").mouseover(		
			function(e){
				$("ul.depth2").show(); // header 메뉴에 마우스를 over 하면 depth2 메뉴 보여줌
					
				$("header").mouseover(function(){ // 그 이후는 header 안에 있다면 depth2 메뉴는 hide 되지 않다가
					$("ul.depth2").show();
				})
			}
		);
		
		$("header").mouseout(function(){ // 마우스가 header를 벗어날 때 hide() 함 
			$("ul.depth2").hide();
		})
		

	
		$("button.navbar-toggler").click(function(){
			$("nav.navbar").toggleClass("fixed-top");
			$("a.btn").toggle();
		});
		
		
		$("li.nav-item > a").mouseover(		
				function(e){
					$(e.target).find("span").addClass("menuhover");
				}
		);
		
 		$("li.nav-item > a >span").mouseover(		
				function(e){
					$(e.target).parent().find("span").addClass("menuhover");
				}
		);
 		

		$("li.nav-item").mouseout(		
				function(e){
					$("li.nav-item > a > span").removeClass("menuhover");
				}
		);
	});
	
</script>



<meta charset="UTF-8">
<title>맥도날드</title>
</head>
<body>

	<header>
	
		<nav class="navbar navbar-expand-lg fixed-top border mx-0 px-4" style="background-color: #fff;">
		
		<div style="display:flex; margin:0 auto;">
		<!-- Brand/logo --> <!-- Font Awesome 6 Icons -->
		<a class="navbar-brand ml-5 mt-1" href="#"><img src="<%=request.getContextPath() %>/images/header_footer/logo.png" alt="이미지가 존재하지 않습니다."/></a>
		
		<!-- 아코디언 같은 Navigation Bar 만들기 -->
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	      <span class="navbar-toggler-icon"><a href="#" style="color: #000;"><i class="fa-regular fa-square-caret-down fa-3x"></i></a></span>
	    </button>
		
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		  <ul class="navbar-nav" style="font-size: 16pt;">
		     
		     <li class="nav-item active">
		        <a class="nav-link menufont_size pt-5 pl-5 ml-5" href="#"><span>Menu</span></a>
		        <ul class="depth2" style="position: relative; left: 45px;"><%-- 평소에 가려지는 부분 --%>
						<li><a href="#">버거</a></li>
						<li><a href="#">맥런치</a></li>
						<li><a href="#">사이드</a></li>
						<li><a href="#">디저트</a></li>
						<li><a href="#">맥카페&음료</a></li>
				</ul>
		     </li>
		     <li class="nav-item">
		     	<a class="nav-link menufont_size pt-5 pl-5 ml-5" href="#"><span>Store</span></a>
	     		<ul class="depth2" style="position: relative;left: 45px;"><%-- 평소에 가려지는 부분 --%>
						<li><a href="#">맥딜리버리</a></li>
				</ul>
		     </li>
			 <li class="nav-item">
              <a class="nav-link menufont_size pt-5 pl-2 ml-5" href="#"><span>What's New</span></a>
				<ul class="depth2" style="position: relative;left: 25px;"><%-- 평소에 가려지는 부분 --%>
					<li><a href="#">프로모션</a></li>
				</ul>              
             </li>
             <li class="nav-item">
              <a class="nav-link menufont_size pt-5 pl-5 ml-5" href="#"><span>Story</span></a>
				<ul class="depth2" style="position: relative;left: 45px;"><%-- 평소에 가려지는 부분 --%>
							<li><a href="#">맥도날드 품질 이야기</a></li>
							<li><a href="#">맥도날드 사람들</a></li>
				</ul>              
              
             </li>
             
          	<li id="login" class="nav-item pt-3 px-3" style="margin-left:5%;">
				<a class="btn btn-white hMenu mb-4 py-2 mt-4 text-warning" href="<%= request.getContextPath() %>/login.run">로그인</a><%-- 로그인 창 --%>
			</li >
			<li class="nav-item pt-3 px-3">
				<a class="btn btn-white hMenu mb-4 py-2 mt-4 text-warning">주문하기</a>
			</li >
			
		  </ul>
		</div>
		
    </div>
    
    
	    <div id="div_flex1">
	      <a href="#"><img src="<%= request.getContextPath() %>/images/header_footer/btn_story.png"></a>
	    </div>
	    <div id="div_flex2">
	         <a href="<%= request.getContextPath() %>/order/orderMain.run"><img src="<%= request.getContextPath() %>/images/header_footer/btn_delivery.png"></a>
	    </div>
	    <div id="div_flex3">
	         <a href="#"><img src="<%= request.getContextPath() %>/images/header_footer/btn_top.png"></a>
	    </div>
	</nav>
		
	</header>

	