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

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/login/pwd3mChange.css" type="text/css"/>
    

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#btnUpdate").click(function(){
			
			const pwd = $("input#pwd").val();
			const pwd2 = $("input#pwd2").val();
			
			const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
			
			const bool = regExp.test(pwd);
			
			if(!bool) {
				
				alert("암호는 8글자 이상 15글자 이하에 영문자, 숫자, 특수기호가 혼합되어야만 합니다.");
				
				$("input#pwd").val("");
				$("input#pwd2").val("");
				
				return;
			}
			else if(bool && pwd != pwd2) {
				
				alert("암호가 일치하지 않습니다.");
				
				$("input#pwd").val("");
				$("input#pwd2").val("");
				
				return;
			}
			else {
				
				$.ajax({
			   		 url:"<%= ctxPath%>/member/duplicatePwdCheck.run", 
			   		 data:{"pwd":$("input#pwd").val(), "userid":"${sessionScope.loginuser.userid}"},
					 type:"post",
					 dataType:"json",
					 async: false,
			         success:function(json){ // 파라미터 json 에 {"isExists":true} 또는 {"isExists":false} 이 들어오게 된다.
							
			        	 if(json.n == -1){
			        		alert("중복된 비밀번호는 사용할 수 없습니다.");
			        		$("input#pwd").val("");
			        		$("input#pwd2").val("");
						 }          
			        	 else if(json.n == 1){
			        		 
			        		alert("ID: ${sessionScope.loginuser.userid}의 비밀번호가 변경되었습니다.");
						    	
							// 자기 닫고 부모창 href 이동
			        		parent.location.href="<%= ctxPath%>/";
			    			self.close();
			        	 }
			        	 else{ // 0
			        		 alert("비밀번호 수정 실패 하였습니다.");
			        	 }
			          
			          },
			          
			           error: function(request, status, error){ // 페이지없으면 404 에러
			             alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			           }
			      
			   		});
			}
			
		});//end of $("button#btnUpdate").click(function() -----------------------
		
	});//end of $(document).ready(function() --------------------------------------
	
			
</script>

<form name="pwd3mchangeEndFrm" style="font-family:SpeedeeK; font-weight:600; m">

   <div id="div_pwd" align="center">
      <span>새암호</span><br/> 
      <input type="password" name="pwd" id="pwd" size="25" placeholder="PASSWORD" required />
   </div>
   
   <div id="div_pwd2" align="center">
      <span>새암호확인</span><br/>
      <input type="password" id="pwd2" size="25" placeholder="PASSWORD" required />
   </div>

   <input type="hidden" name="userid" value="${sessionScope.loginuser.userid}"/>
	
		<div id="div_btnUpdate" align="center">
	       <button type="button" class="btn btn-dark" id="btnUpdate">암호변경하기</button>
	    </div> 

</form>

	<c:if test="${requestScope.method == 'POST' && requestScope.n == 1}">
		<div id="div_updateResult" align="center" >
	        사용자 ID ${requestScope.userid}님의 암호가 새롭게 변경되었습니다.
	    </div> 
	</c:if>

   