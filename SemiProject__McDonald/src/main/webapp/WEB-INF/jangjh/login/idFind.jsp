<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<script type="text/javascript">

	$(document).ready(function(){
		
		const method = "${requestScope.method}";
		//console.log("method=> "+ method);
		
		if(method == "GET") {
			$("div#div_findResult").hide();
		}
		else if(method == "POST") {
			$("input#member_name").val("${requestScope.member_name}"); 
			$("input#email").val("${requestScope.email}"); 
		}
		
		$("button#btnFind").click(function(){
			// 성명 대한 정규표현식을 사용한 유효성 검사
			const name_bool = $("input#member_name").val().trim();
			
			if(!name_bool) {
				alert("성명을 입력해 주세요")
				return;
			}
			
			//이메일에 대한 정규표현식을 사용한 유효성 검사
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
			const email_bool = regExp.test($("input#email").val()); // 정규표현식에 맞으면 true 아니면 false 가 나온다.
			
			if(!email_bool) {
				alert("올바른 이메일을 입력하세요.")
				return;
			}
			
			const frm = document.idFindFrm;
			frm.action = "<%= ctxPath %>/login/idFind.run";
			frm.method = "POST";
			frm.submit();
			 
		});
		
	});//end of $(document).ready(function() --------------------------------------
	
	// 아이디 찾기 모달창에 입력한 input 태그 value 값 초기화 시키기
	function func_form_reset_empty(){
		
		document.querySelector("form[name='idFindFrm']").reset();
		
		$("div#div_findResult > p.text-center").empty();
		
	}//end of function func_form_reset_empty() ------------------------------------
			
			
</script>

<form name="idFindFrm">

	<ul style="list-style-type: none">
	
         <li style="margin: 25px 0">
            <label for="member_name" style="display: inline-block; width: 90px">성명</label>
            <input type="text" name="member_name" id="member_name" size="25" placeholder="홍길동" autocomplete="off" required />
         </li>
         
         <li style="margin: 25px 0">
            <label for="email" style="display: inline-block; width: 90px">이메일</label>
            <input type="text" name="email" id="email" size="25" placeholder="McDonald@gmail.com" autocomplete="off" required />
         </li>
         
   </ul>
   
   <div class="my-3">
	    <p class="text-center">
	       <button type="button" class="btn btn-dark" id="btnFind">찾기</button>
	    </p>
   </div>

</form>

	<div class="my-3" id="div_findResult">
        <p class="text-center" style="font-family:SpeedeeK; font-weight: 600;">
          ID :&nbsp;&nbsp; <span style="color: #ff1a1a;">${requestScope.userid}</span> 
        </p>
   </div>