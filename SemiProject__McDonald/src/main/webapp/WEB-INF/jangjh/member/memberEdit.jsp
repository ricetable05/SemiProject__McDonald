<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	String ctxPath = request.getContextPath();
	//		/MyMVC
%>
<!DOCTYPE html>
<html>
<head>
 <%-- Required meta tags --%>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <%-- Bootstrap CSS --%>
 <link rel="stylesheet" href="<%=ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
 
 <%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
 
<%-- header footer CSS --%> 
 <link rel="stylesheet" href="<%=ctxPath%>/css/header_footer/header_footer.css" type="text/css"/>
 
 <%-- Optional JavaScript --%>
 <script src="<%=ctxPath%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>
 <script src="<%=ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script> 
 
<%-- jQueryUI CSS 및 JS  --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />  
<script type="text/javascript" src="<%=ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/member/memberEdit.css" type="text/css"/>

    <title>회원 정보 수정</title>
    
</head> 
<body>
<script type="text/javascript">
	
	let b_flag_email_change = false;
	// 이메일 값 변경여부 알아오기 위한 용도
	
	let b_flag_postcode_change = false;
	// 우편번호 변경여부 알아오기 위한 용도
	
	let b_flag_emailDuplicate_click = false;
	//"이메일중복확인"을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
	
	let b_flag_zipcodeSearch_click = false;
	//"우편번호찾기"을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
	
	$(document).ready(function(){
		
		$("span.error").hide();
		
		$("input:text[id='member_name']").focus();
		 
 		$("input:text[id='member_name']").blur( function(e) {  
 			
 			if( $(e.target).val().trim() == "" ){
 				
 				$("table#tblMemberRegister :input").prop("disabled", true); // table 안의 모든 input 태그를 disabled 한다.
 	 			$(e.target).prop("disabled", false);
 				
 				// 입력하지 않거나 공백만 입력했을 경우
 				$(e.target).next().show();
 				$(e.target).focus();
 				
  			}
 			else{
 				
 				// 공백만이 아닌 글자를 입력했을 경우
 				$("table#tblMemberRegister :input").prop("disabled", false);	
 				$(e.target).parent().find("span.error").hide();
 				
 			}

		});// 아이디가 name인 것은 포커스를 잃어버렸을 경우 이벤트(blur)를 처리해주는 것이다.
		
		
		$("input:password[id='pwd']").blur( function(e) { 
 			
			const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
		
			const bool = regExp.test($(e.target).val()); // 정규표현식에 맞으면 true 아니면 false가 나온다.
			
			if(!bool){
				
				// 정규표현식에 위배된 경우
				$("table#tblMemberRegister :input").prop("disabled", true); 
				$(e.target).prop("disabled", false);
 				$(e.target).next().show();
 				
			}
			else{
				
				// 정규표현식에 위배되지 않은 경우
				$("table#tblMemberRegister :input").prop("disabled", false); 
				$(e.target).parent().find("span.error").hide();
 				
			}

		});// 아이디가 pwd인 것은 포커스를 잃어버렸을 경우 이벤트(blur)를 처리해주는 것이다.
		
		$("input:password[id='pwdcheck']").blur( function(e) { 
			
			if($("input:password[id='pwd']").val() != $(e.target).val()){
				// 암호와 암호 확인 값이 다른경우
				
				$("table#tblMemberRegister :input").prop("disabled", true); 
				$(e.target).prop("disabled", false);
				$("input:password[id='pwd']").prop("disabled", false).focus();
				
 				$(e.target).next().show();
				
			}
			else{
				
				// 암호와 암호 확인 값이 같은 경우
				$("table#tblMemberRegister :input").prop("disabled", false); 
				$(e.target).parent().find("span.error").hide();
 				
			}

		});// 아이디가 pwdcheck인 것은 포커스를 잃어버렸을 경우 이벤트(blur)를 처리해주는 것이다.
		
		$("input:text[id='email']").blur( function(e) { 
 			
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
			const bool = regExp.test($(e.target).val()); // 정규표현식에 맞으면 true 아니면 false 가 나온다.
			
			if(!bool){
				
				// 이메일이 정규표현식에 위배된 경우
				$("table#tblMemberRegister :input").prop("disabled", true); 
				$(e.target).prop("disabled", false);
 				$(e.target).next().show();
 				
			}
			else{
				
				// 이메일이 정규표현식에 위배되지 않은 경우
				$("table#tblMemberRegister :input").prop("disabled", false); 
				$(e.target).parent().find("span.error").hide();
 				
			}
			
		});// 아이디가 email인 것은 포커스를 잃어버렸을 경우 이벤트(blur)를 처리해주는 것이다.
		
		
		$("input:text[id='hp2']").blur( function(e) { 
			
			const regExp = /^[1-9][0-9]{2,3}$/g; // 1~9 까지 1글자 0~9까지가 2글자~3글자 => 총 3글자~4글자
		
			const bool = regExp.test($(e.target).val()); // 정규표현식에 맞으면 true 아니면 false 가 나온다.
			
			if(!bool){
				
				// 국번이 정규표현식에 위배된 경우
				$("table#tblMemberRegister :input").prop("disabled", true); 
				$(e.target).prop("disabled", false);
 				$(e.target).next().show();
 				
			}
			else{
				
				// 국번이 정규표현식에 위배되지 않은 경우
				$("table#tblMemberRegister :input").prop("disabled", false); 
				$(e.target).parent().find("span.error").hide();
 				
			}

		});// 아이디가 hp2 인 것은 포커스를 잃어버렸을 경우 이벤트(blur)를 처리해주는 것이다.
		
		$("input:text[id='hp3']").blur( function(e) { 
			
			// const regExp = /^[0-9]{4}$/g; // 1~9 까지 1글자 0~9까지가 2글자~3글자 => 총 3글자~4글자
			const regExp = /^\d{4}$/ // 숫자가 4자리만 들어오도록 검사해주는 정규표현식 객체 생성 
			
			const bool = regExp.test($(e.target).val()); // 정규표현식에 맞으면 true 아니면 false 가 나온다.
			
			if(!bool){
				
				// 마지막 전화번호 4자리가 정규표현식에 위배된 경우
				$("table#tblMemberRegister :input").prop("disabled", true); 
				$(e.target).prop("disabled", false);
 				$(e.target).next().show();
 				
			}
			else{
				
				// 마지막 전화번호 4자리가 정규표현식에 위배되지 않은 경우
				$("table#tblMemberRegister :input").prop("disabled", false); 
				$(e.target).parent().find("span.error").hide();
 				
			}

		});// 아이디가 hp3 인 것은 포커스를 잃어버렸을 경우 이벤트(blur)를 처리해주는 것이다.
		$("span[id='zipcodeSearch']").click(function(){
			
			 new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                let addr = ''; // 주소 변수
		                let extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("ref_address").value = extraAddr;
		                
		                } else {
		                    document.getElementById("ref_address").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detail_address").focus();
		            }
		        }).open();
						
		});
        
		
		
		$("input#birthyyyy").keyup(function(e){
			
			alert("생년월일은 키보드로 입력하지 마시고 마우스로 선택하세요!!");
			$(e.target).val("1950");
		});
		
		// 생년월일중 월에 값넣어주기
		let html = "";
		
		for(let i=1; i<=12; i++) {
			if(i<10){
				html += "<option>0"+i+"</option>";
			}
			else{
				html += "<option>"+i+"</option>";
			}
		} //end of for ----------------------------------------------
		
		$("select#birthmm").html(html);
		
		// 생년월일중 일에 값넣어주기
		let dd_html = "";
	      for(let i=1; i<=31; i++) {
	         
	         if(i<10) {
	            dd_html += "<option>0"+i+"</option>";
	            <%--
		            // !!!! 중요 !!!!
		            // 확장자가 html 인 문서에서는 백틱 사용시 변수는 ${변수명} 으로 사용하면 된다.
		            // 그런데 확장자가 jsp 인 문서에서는 백틱 사용시 변수를 ${변수명} 으로 사용해 버리면
		            // request영역에 저장된 값을 불러들이는 ${requestScope.키값} 으로 인식해서 
		            // ${변수명}을 request 영역에 저장된 변수를 불러들이는 것으로 사용되어진다.
		            // 그래서 확장자가 jsp 인 문서에서는 백틱 사용시 $앞에 반드시 \를 붙여주어야 올바르게 동작한다.
	            --%>
	         }
	         else {
	            dd_html += "<option>"+i+"</option>";
	         }
	         
	      }// end of for---------------------
		
		  $("select#birthdd").html(dd_html);
		
	      
	      const birthday = "${sessionScope.loginuser.birthday}";
	      
	      $("input#birthyyyy").val(birthday.substring(0, 4));
	      $("select#birthmm").val(birthday.substring(4, 6));
	      $("select#birthdd").val(birthday.substring(6));
	      
	       
	    
         /////////////////////////////////////////////////////////////////
		
		
   		 // "우편번호찾기" 을 클릭했을때 이벤트 처리하기
         $("span#zipcodeSearch").click(function(){	
        	 b_flag_zipcodeSearch_click = true;
         });
         
         // 우편번호 입력란에 키보드로 입력할 경우 이벤트 처리하기
         $("input:text[id='postcode']").keyup(function(e){	
			alert("우편번호는 입력은 \"우편번호찾기\"를 클릭으로만 됩니다. ");
			$(e.target).val("");
		 });
         
	 
		// 이메일값이 변경되면 가입하기 버튼을 클릭시 "이메일중복확인"을 클릭헀는지 여부를 초기화 한다.
 		$("input#email").change(function(){
 			b_flag_email_change = true;
 			b_flag_emailDuplicate_click = false; 			
 		});
	
		
		$("input#postcode").change(function(){
			b_flag_postcode_change = true;
		});
        
		
		
	}); // end of $(document).ready(function(){})-------------------------------------------------------------
	
	
	// "이메일중복확인"을 클릭했을 때 
	function isExistEmailCheck() {
		
		b_flag_emailDuplicate_click = true;
		
    	//"이메일중복확인"을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
    	//입력하고자 하는 아이디가 데이터베이스 테이블에 존재하는지, 존재하지 않는지 알아와야 한다.
    	
		 //jQuery를 사용한 Ajax
        $.ajax({
        	
        	url:"<%= ctxPath %>/member/emailDuplicateCheck.run",  
        	data:{"email":$("input#email").val()},  // data는 /MyMVC/member/emailDuplicateCheck.up"로 전송
        	type:"post",     
        	dataType:"json",
        	//async:true,      
        	success:function(json){ 
        		
        		if(json.isExists) {
        			
        			//입력한 email이 이미 사용중이라면 
        			$("span#emailCheckResult").html($("input#email").val()+"은 중복된 EMAIL이므로 사용불가 합니다.").css("color","red");
        			$("input#email").val("");
        		
        		}
        		else if(!json.isExists && $("input#email").val().trim() != "" ) {
        			
        			//입력한 email가 존재하지 않는 경우라면
        			$("span#emailCheckResult").html($("input#email").val()+"은 사용가능 합니다.").css("color","navy");
        		
        		}
        		
        	}, 
        		
        	error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
              }
        	
        });
        
	}
	
	// "수정" 버튼 클릭시 호출되는 함수
	function goEdit(){
		
		// ** 필수입력사항에 모두 입력이 되었는지 검사한다. **//
		let b_Flag_requiredInfo = false;
		
		$("input.requiredInfo").each(function(index, elmt){
			if($(elmt).val().trim() == "") {
				alert("*표시된 필수입력사항은 모두 입력하셔야 합니다.");
				b_Flag_requiredInfo = true;
				return false; // break;라는 뜻이다.
			}
		});
		
		if(b_Flag_requiredInfo){
			return; // 함수종료
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		
		
		// "이메일중복확인"을 클릭했는지 여부 알아오기 
		if(b_flag_email_change && !b_flag_emailDuplicate_click){
			// "이메일중복확인"을 클릭 하지 않았을 경우
			alert("이메일중복확인을 클릭하셔야 됩니다.");
			return; // 함수종료
		}
		
		// "우편번호찾기"을 클릭했는지 여부 알아오기
		if(b_flag_postcode_change && !b_flag_zipcodeSearch_click) {
			//"우편번호찾기"을 클릭하지 안 했을 경우
			alert("우편번호찾기를 클릭하셔서 우편번호를 입력하셔야 합니다.");
			return; // 함수종료
		}
		else{
			//"우편번호찾기"을 클릭 했을 경우
			const regExp = /^\d{5}$/g;
			//숫자 5자리만 들어오도록 검사해주는 정규표현식 객체 생성
			
			const bool = regExp.test($("input:text[id='postcode']").val());
			
			if(!bool) {
				alert("우편번호 형식에 맞지 않습니다.");
				$("input:text[id='postcode']").val("");
				b_flag_zipcodeSearch_click = false();
				return; // 함수종료
			}
			else{
	            // 주소 유효성검사
	            if($("input#address").val() == ""){
	               alert("주소를 입력하세요")
	               return;
	            }
	            
	            // 상세주소 유효성검사
	            if($("input#detail_address").val() == ""){
	               alert("상세주소를 입력하세요")
	               return;
	            }   
	               
	         }
		}
		
		let gogo = true;
		
		$.ajax({
	   		 url:"<%= ctxPath%>/member/duplicatePwdCheck.run", 
	   		 data:{"new_pwd":$("input#pwd").val(), "userid":"${sessionScope.loginuser.userid}"},
			 type:"post",
			 dataType:"json",
			 async: false,
	          success:function(json){ // 파라미터 json 에 {"isExists":true} 또는 {"isExists":false} 이 들어오게 된다.
					if(json.n == 1){
						$("span#duplicate_pwd").html("현재 사용중인 암호로 암호변경은 불가합니다.");
						gogo = false;
					}          
	          },
	          
	           error: function(request, status, error){ // 페이지없으면 404 에러
	             alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	           }
	      
	   		});
		//////////////////////////////////////////////////////////////////////
		
		
	    if(gogo){
		const frm = document.editFrm;
		frm.action = "<%=ctxPath%>/member/memberEditEnd.run";
		frm.method = "POST";
		frm.submit();
	    }
	} // end of function goRegister() ------------------------------------------------------------------------

</script>

  <div class="col-md-12" align="center" >
   <form name="editFrm" style="font-family:SpeedeeK; font-weight:600;">
   
   	<div>
	  <p class="bg1">나의 정보 수정&nbsp;&nbsp;&nbsp;<span class="star">*</span><span class="essential">표시는 필수입력사항</span></p>
	</div>
   
   	<table id="tblMemberRegister">
      <tbody>
	      <tr>
	      	 <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">성명&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;">
	             <input type="hidden" name="userid" value="${sessionScope.loginuser.userid}" readonly />
	             <input type="text" name="member_name" id="member_name" value="${sessionScope.loginuser.member_name}" class="requiredInfo" /> 
	            <span class="error">성명은 필수입력 사항입니다.</span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">비밀번호&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="password" name="pwd" id="pwd" class="requiredInfo" />
	            <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
	            <span id="duplicate_pwd" style="color:red;"></span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%;">비밀번호확인&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="password" id="pwdcheck" class="requiredInfo" /> 
	            <span class="error">암호가 일치하지 않습니다.</span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">이메일&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="text" name="email" id="email" value="${sessionScope.loginuser.email}" class="requiredInfo" placeholder="abc@def.com" /> 
	             <span class="error">이메일 형식에 맞지 않습니다.</span>
	             
	             <%-- 이메일 중복체크 --%>
	             <span style="display: inline-block; font-size: 7pt; cursor: pointer; margin-left: 5px;" class="btn btn-dark"  onclick="isExistEmailCheck();">이메일 중복 확인</span> 
	             <span id="emailCheckResult"></span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">연락처</td>
	         <td style="width: 80%; text-align: left;">
	             <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp;
	             <input type="text" id="hp2" name="hp2" size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.member_tel, 3, 7) }" />&nbsp;-&nbsp;
	             <input type="text" id="hp3" name="hp3" size="6" maxlength="4" value="${ fn:substring(sessionScope.loginuser.member_tel, 7, 11) }"/>
	             <span class="error">휴대폰 형식이 아닙니다.</span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">우편번호</td>
	         <td style="width: 80%; text-align: left;">
	            <input type="text" id="postcode" name="postcode" size="6" maxlength="5"  value="${sessionScope.loginuser.postcode}"/>&nbsp;&nbsp;
	            <span class="error">우편번호 형식이 아닙니다.</span>
	            
	            <%-- 우편번호 찾기 --%>
	            <span id="zipcodeSearch" style="display: inline-block; font-size: 7pt; cursor: pointer;" class="btn btn-dark">우편번호 찾기</span> 
	            
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">주소</td>
	         <td style="width: 80%; text-align: left;">
	            <input type="text" id="address" name="address" size="40" placeholder="주소" value="${sessionScope.loginuser.address}"/><br/>
	            <input type="text" id="detail_address" name="detail_address" size="40" value="${sessionScope.loginuser.detail_address}" placeholder="상세주소" />&nbsp;<input type="text" id="ref_address" name="ref_address" size="40" value="${sessionScope.loginuser.ref_address}" placeholder="참고항목" /> 
	            <span class="error">주소를 입력하세요</span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">생년월일</td>
	         <td style="width: 80%; text-align: left;">
	            <input type="number" id="birthyyyy" name="birthyyyy" min="1950" max="2050" step="1" value="1995" style="width: 80px;" required />
	            
	            <select id="birthmm" name="birthmm" style="margin-left: 2%; width: 60px; padding: 8px;">
	            </select> 
	            
	            <select id="birthdd" name="birthdd" style="margin-left: 2%; width: 60px; padding: 8px;">
	            </select> 
	         </td>
	      </tr>
	      
	      <tr>
	         <td colspan="3" style="text-align: center; vertical-align: middle;">
	            <iframe src="<%= ctxPath %>/iframeAgree/agree.html" width="85%" height="150px" class="box" ></iframe>
	         </td>
	      </tr>
	      
	      <tr>
	         <td colspan="3" style="line-height: 90px;" class="text-center">
	            <%-- 
	            <button type="button" id="btnRegister" style="background-image:url('<%= ctxPath%>/images/join.png'); border:none; width: 135px; height: 34px; margin-left: 30%;" onClick="goRegister();"></button> 
	            --%>
	            <input type="button" id="btnRegister" class="btn btn-dark btn-lg" style="font-weight: bold;" onclick="goEdit()" value="수정하기"></input>
				<input type="button" class="btn btn-dark btn-lg" style="font-weight: bold; margin-left: 10px;" onClick="self.close()" value="취소" style="font-size: 15pt;" /> 	         
	         </td>
	      </tr>
	      
       </tbody>
     </table> 
   </form>
  </div>

<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>