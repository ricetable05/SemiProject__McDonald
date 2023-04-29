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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<style type="text/css">

/* -- CSS 로딩화면 구현 시작(bootstrap 에서 가져옴) -- */    
   div.loader {
	  border: 16px solid white;
	  border-radius: 50%;
	  border: 7px dotted #db0007;
	  width: 50px;
	  height: 50px;
	  animation: spin 2s linear infinite; 
	}
   
   @-webkit-keyframes spin {
     0% { -webkit-transform: rotate(0deg); }
     100% { -webkit-transform: rotate(360deg); }
   }
   
   @keyframes spin {
     0% { transform: rotate(0deg); }
     100% { transform: rotate(360deg); }

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("div#circle").hide();
		
		//찾기
		$("button#btnFind").click(function(){
			
			//아이디에 대한 유효성 검사
			const useridVal = $("input#userid").val().trim();
			
			if(useridVal == ""){
				alert("아이디를 입력하세요.")
				return;
			}
			
			//이메일에 대한 정규표현식을 사용한 유효성 검사
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
			const bool = regExp.test($("input#email").val()); // 정규표현식에 맞으면 true 아니면 false 가 나온다.
			
			if(!bool) {
				alert("올바른 이메일을 입력하세요.")
				return;
			}
			
			if(useridVal != "" && bool) {
				$("div#circle").show();
			}
			
		 	const frm = document.pwdFindFrm;
			frm.action = "<%= ctxPath%>/login/pwdFind.run";
			frm.method = "POST";
			frm.submit();
			
		});//end of $("button#btnFind").click(function() -------------------------
		
				
		const method = "${requestScope.method}";
		
		if(method == "POST") {
			
			$("input#userid").val("${requestScope.userid}");
			$("input#email").val("${requestScope.email}");
			$("div#div_findResult").show();
			
			if(${requestScope.sendMailSuccess == true}) {
				$("div#div_btnFind").hide(); 
			}
		}
		else {
			$("div#div_findResult").hide();
		}		
				
		//인증하기
		$("button#btnConfirmCode").click(function(){
			
			const frm = document.verifyCertificationFrm;
			
			frm.userCertificationCode.value = $("input#input_confirmCode").val();
			frm.userid.value = $("input#userid").val();
			
			frm.action = "<%= ctxPath %>/login/verifyCertification.run";
			frm.method = "POST";
			frm.submit();
			
		});
		
		
	});//end of $(document).ready(function() --------------------------------------
	
			
</script>

<form name="pwdFindFrm" style="font-family:SpeedeeK; font-weight:600;">

	<ul style="list-style-type: none">
         <li style="margin: 25px 0">
            <label for="userid" style="display: inline-block; width: 90px; ">아이디</label>
            <input type="text" name="userid" id="userid" size="25" placeholder="ID" autocomplete="off" required />
         </li>
         <li style="margin: 25px 0">
            <label for="email" style="display: inline-block; width: 90px">이메일</label>
            <input type="text" name="email" id="email" size="25" placeholder="abc@def.com" autocomplete="off" required />
         </li>
   </ul>
   
   <div class="my-3" id="div_btnFind">
    <p class="text-center">
       <button type="button" class="btn btn-dark" id="btnFind" style="font-weight: bold;">찾기</button>
    </p>
    <%-- CSS 로딩화면 구현한것--%>
    <div id="circle" style="display: flex">
        <div class="loader" style="margin: auto"></div>
    </div>
   </div>
   
</form>

	<div class="my-3" id="div_findResult" style="font-family:SpeedeeK; font-weight:600;" >
        <p class="text-center">
        	
        	<c:if test="${requestScope.isUserExist == false}">
        		<span style="color: red;">사용자 정보가 없습니다.</span>
        	</c:if>
        	
        	<c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}">
	        	<span style="font-size: 10pt;">인증코드가 ${requestScope.email}메일로 발송되었습니다.</span><br>
	        	<span style="font-size: 10pt;">인증코드를 입력해주세요.</span><br>
	            <input type="text" name="input_confirmCode" id="input_confirmCode" required />
	            <br><br>
	            <button type="button" class="btn btn-dark" id="btnConfirmCode">인증하기</button>
        	</c:if>
        	
        	<c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == false}">
        		<span style="color: red;">메일발송이 실패했습니다.</span><br>
        	</c:if>
        	
        </p>
   </div>
   
<%-- 인증하기 form --%>
<form name="verifyCertificationFrm">
	<input type="hidden" name="userCertificationCode" />
	<input type="hidden" name="userid" />
</form>
   
   