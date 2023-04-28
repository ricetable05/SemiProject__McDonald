<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- burger CSS --%> 
 <link rel="stylesheet" href="<%= request.getContextPath()%>/css/promotion/promotion.css" type="text/css"/>

<style type="text/css">

@font-face {
  font-family:SpeedeeK;
  font-weight:400;
  font-style:normal;
  src: url(../css/font/Speedee_K_L.woff) format('woff')}
@font-face {
  font-family:SpeedeeK;
  font-weight:500;
  font-style:normal;
  src: url(../css/font/Speedee_K_L.woff) format('woff')}
@font-face {
  font-family:SpeedeeK;
  font-weight:600;
  font-style:normal;
  src: url(../css/font/Speedee_K_L.woff) format('woff')} 

.user-warp{
background:url(<%= request.getContextPath() %>/images/top_image/프로모션상단이미지.jpg) 50% 50% no-repeat;
}

.titl{
border-bottom:solid 4px black;
height: 140px;
padding-top: 20px;
padding-bottom: 16px;
}

.tex{
border:solid 0px red;
height: 100px;
padding-top: 20px;
padding-bottom: 20px;
font-family:SpeedeeK;
font-weight:600;

}

.btnArea{
margin-top:100px;
text-align:center; 
display:flex;
justify-content:space-between;
margin-top:60px;
}


.btnMC{
margin:0 12px; 
display:inline-block; 
color:#292929; 
font-weight:600; 
background:#ffbc0d
}

.btnM{
min-width:172px;
padding:0 38px;
font-size:15px;
line-height:70px;
border-radius:70px
}

.btnArea .next
{width:70px;
height:70px;
font-size:1px;
transform:rotate(180deg);
border: none;
} 

.btnMC:hover{
	color: black;
	text-decoration: none;
}

.next{
background:url(<%= request.getContextPath()%>/images/jangjh_img/btn_bbs_prev.png);
}



</style>

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>
<!-- 메인 컨테이너 시작-->
<div class="MC_content">
	<!-- 상단이미지 시작-->
	<div class="user-warp">
		<div class="user-image"></div>
		<div class="user-text">
			<h1 class="titDep1">맥도날드 프로모션</h1>
		</div>
		<div class="user-text2">
			<ul>
				<li class="listfirst"><a href="<%= request.getContextPath()%>/main.run">Home</a></li>
				<li class="listsecond"><a href="<%= request.getContextPath()%>/promotion/promotionMain.run">맥도날드 프로모션</a></li>
			</ul>
		</div>
	</div>
	<!-- 상단이미지 끝-->
	<div class="container" style="width: 100%; position: relative; margin-bottom: 40px;" >
		<div class="titl">
			<div class="tex">
				<h2 style="font-size:15pt;">상콤달콤!</h2>
				<h2 style="font-size:15pt;">NEW 자두 천도복숭아 칠러 출시!</h2>
			</div>
		</div>
		<div class="main" style="margin-top: 50px;">
			<img src="<%= request.getContextPath()%>/images/jangjh_img/promotion_1.jpg" style="width:100%;">
		</div>
		
		<hr>
		
		<div class="btnArea">
			<a href="<%= request.getContextPath()%>/promotion/promotionMain.run" role="button" class="btnMC btnM"><span>목록보기</span></a>
			<button type="button" onclick="location.href='<%= request.getContextPath()%>/promotion/mcMorningProm.run'" class="next"></button>
		</div>
	</div>
		
		
	
	
</div>

<!-- 메인 컨테이너 끝-->



<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>