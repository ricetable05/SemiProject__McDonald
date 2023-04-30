<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Story > 맥도날드 품질 이야기</title>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/quality/qualityView.css" type="text/css"/>

<style type="text/css">

.topimage{
background:url(<%= request.getContextPath() %>/images/품질이야기상단이미지.jpg) 50% 50% no-repeat;
}


</style>

 <script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>


<script type="text/javascript">




</script>

</head>
<body>

<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>

<div>


				<div class="topimage">
			      <div class="toptext">
			         <h1 class="titDep1">버거</h1>
			         <p style="margin-top: 15px;">빅맥<sub>®</sub>에서 맥스파이시<sub>®</sub> 상하이버거까지, </p>
			         <p>주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.</p>
			      </div>
			      <div class="toptext2">
			         <ul>
			            <li class="listfirst"><a href="<%= request.getContextPath()%>/main.run">Home</a></li>
			            <li class="listsecond"><a href="<%= request.getContextPath()%>/menu/burgerMain.run">Menu</a></li>
			         </ul>
			      </div>
			   </div>

				
					<!-- 유튜브 동영상 넣기 시작 -->
					 <div class="embed-responsive embed-responsive-21by9">
				
							<iframe width="560" height="315" src="https://www.youtube.com/embed/u2hLpzjQgvc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		
				     </div>
					 <!-- 유튜브 동영상 넣기 끝 -->	
					 
					 
					 <div></div>





</div>

<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>

</body>
</html>