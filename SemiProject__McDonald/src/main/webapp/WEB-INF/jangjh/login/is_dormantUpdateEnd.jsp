<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<style type="text/css">

   #div_pwd {
      width: 70%;
      height: 15%;
      margin-bottom: 5%;
      margin-left: 10%;
      position: relative;
   }
   
   #div_pwd2 {
      width: 70%;
      height: 15%;
      margin-bottom: 5%;
      margin-left: 10%;
      position: relative;
   }
   
   #div_updateResult {
      width: 90%;
      height: 15%;
      margin-bottom: 5%;
      margin-left: 10%;      
      position: relative;
   }
   
   #div_btnUpdate {
      width: 70%;
      height: 15%;
      margin-bottom: 5%;
      margin-left: 10%;
      position: relative;
   }

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#btnUpdate").click(function(){
			
				const frm = document.is_dormantUpdateEndFrm;
				frm.action = "<%= ctxPath%>/login/is_dormantUpdateEnd.run";
				frm.method = "POST";
				frm.submit();
			
		});//end of $("button#btnUpdate").click(function() -----------------------
		
	});//end of $(document).ready(function() --------------------------------------
	
			
</script>

<form name="is_dormantUpdateEndFrm" style="font-family:SpeedeeK; font-weight:600;">

   <input type="hidden" name="userid" value="${requestScope.userid}"/>
	
	<c:if test="${requestScope.method == 'GET'}">
		<div id="div_btnUpdate" align="center" style="margin-top: 20px;">
	       <button type="button" class="btn btn-dark" id="btnUpdate">휴면 계정 풀기</button>
	    </div> 
	</c:if>
</form>

	<c:if test="${requestScope.method == 'POST' && requestScope.n == 1}">
		<div id="div_updateResult" align="center" >
	           사용자 ID ${requestScope.userid}님의 휴면 계정이 풀렸습니다.
	    </div> 
	</c:if>

   