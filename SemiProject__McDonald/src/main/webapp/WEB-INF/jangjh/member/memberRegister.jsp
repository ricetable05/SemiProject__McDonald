<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String ctxPath = request.getContextPath();
	//		/MyMVC
%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    
<style type="text/css">

	div#divRegisterFrm {
		margin-top: 137px;
	}

	table#tblMemberRegister {
	
		width: 80%;
		margin: 10px;
		
	}
	
	table#tblMemberRegister #th{
	
		padding: 30px;
		text-align: center;
		font-size: 25pt;
		
	}
	
	table#tblMemberRegister td{
	
		line-height: 30px;
		padding: 8px 0; 
		
	}
	
	span.star { 
		color: red;
		font-weight: bold; 
		font-size: 13pt;
	} 
	
	span.essential { 
		color: white;
		font-weight: bold; 
		font-size: 13pt;
	} 
	
	
	#tblMemberRegister > tbody > tr > td.gap {
		padding-left: 100px;
	}
	
	p {
	  border: 1em violet;
	  padding: 55px;
	  font-size: 45pt; 
	  color: white;
	  
	}
	.bg1 {
	  background-image: url(<%= ctxPath%>/images/top_image/브랜드소개상단이미지.jpg);  
	  background-clip: border-box;
	}
		
	
</style>
    
</head>
<body>
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>



<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	let b_flag_idDuplicate_click = false;
	//"아이디중복확인"을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
	
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
		
		$("input:text[id='userid']").blur( function(e) {

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

		});// 아이디가 userid인 것은 포커스를 잃어버렸을 경우 이벤트(blur)를 처리해주는 것이다.
		
		
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
        
        $("input#birthyyyy").keyup(function(e){ // 키보드로 입력할 수 없게 처리
        	
        	alert('생년월일은 키보드로 입력하지 마시고 마우스로 선택하세요');
        	$(e.target).val("1950");
        	
        });
            
		let mm_html = ``;
		
		for(let i=1;i<=12;i++){
			
			if(i < 10){
				mm_html += `<option>0\${i}</option>`;
			}
			else{
				mm_html += `<option>\${i}</option>`;
			}
		
		}
		
		$("select#birthmm").html(mm_html);
		
		
		let dd_html = ``;
		
		for(let i=1;i<=31;i++){
			
			if(i < 10){
				dd_html += `<option>0\${i}</option>`;
			}
			else{
				dd_html += `<option>\${i}</option>`;
			}
		
		}
		
		$("select#birthdd").html(dd_html);
		 
        // "우편번호찾기"을 클릭했을 때 이벤트 처리하기
        $("span[id='zipcodeSearch']").click(function(){
        	b_flag_zipcodeSearch_click = true;
        	//"우편번호찾기"을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
        });
        
        $("input:text[id='postcode']").keyup(function(){
        	alert(`우편번호 입력은 "우편번호찾기"를 클릭으로만 가능합니다.`)
        	$(this).val("");
        });
        
        
    	// 아이디 값이 변경되면 가입하기 버튼을 클릭시 "아이디중복확인"을 클릭했는지 클릭안했는지 알아보기 위한 용도를 초기화 시키기
    	$("input#userid").bind("change",function(){
    		b_flag_idDuplicate_click = false;
    	});
        
    	// 이메일 값이 변경되면 가입하기 버튼을 클릭시 "아이디중복확인"을 클릭했는지 클릭안했는지 알아보기 위한 용도를 초기화 시키기
    	$("input#email").bind("change",function(){
    		b_flag_emailDuplicate_click = false;
    	});
        
	}); // end of $(document).ready(function(){})-------------------------------------------------------------
	
	// "아이디중복확인"을 클릭했을 때 이벤트 처리하기
    function isExistIdCheck(){
    	b_flag_idDuplicate_click = true;
    	//"아이디중복확인"을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
    	
        //jQuery를 사용한 Ajax
        $.ajax({
        	
        	url:"<%= ctxPath %>/member/idDuplicateCheck.run",  
        	data:{"userid":$("input#userid").val()},  // data는 /MyMVC/member/idDuplicateCheck.up"로 전송
        	type:"post",                              
        	dataType:"json",                       
        	async:true,    
        	success:function(json){ 
        		
        		if(json.isExists) {
        			
        			//입력한 userid가 이미 사용중이라면 
        			$("span#idcheckResult").html($("input#userid").val()+"은 중복된 ID이므로 사용불가 합니다.").css("color","red");
        			$("input#userid").val("");
        		
        		}
        		else if(!json.isExists && $("input#userid").val().trim() != "" ) {
        			
        			//입력한 userid가 존재하지 않는 경우라면
        			$("span#idcheckResult").html($("input#userid").val()+"은 사용가능 합니다.").css("color","navy");
        		
        		}
        		
        	}, 
        		
        	error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
              }
        	 
        });
    	
    };//end of function isExistIdCheck() --------------------------
	
	
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
        	async:true,      
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
	
	// "가입하기" 버튼 클릭시 호출되는 함수
	function goRegister(){
		
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
		
		// 이용약관 동의 체크박스를 선택했는지 검사하기
		const checkbox_checked_len = $("input:checkbox[id='agree']:checked").length;
		
		if(checkbox_checked_len == 0){
			alert('이용약관에 동의하셔야 합니다.');
			return; // 함수종료
		}
		
		////////////////////////////////////////////////////////////////////////////////////////
		
		// "아이디중복확인"을 클릭했는지 여부 알아오기 
		if(!b_flag_idDuplicate_click){
			// "아이디중복확인"을 클릭 하지 않았을 경우
			alert("아이디중복확인을 클릭하셔야 됩니다.");
			return; // 함수종료
		}
		
		// "이메일중복확인"을 클릭했는지 여부 알아오기 
		if(!b_flag_emailDuplicate_click){
			// "이메일중복확인"을 클릭 하지 않았을 경우
			alert("이메일중복확인을 클릭하셔야 됩니다.");
			return; // 함수종료
		}
		
		// "우편번호찾기"을 클릭했는지 여부 알아오기
		if(!b_flag_zipcodeSearch_click) {
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
		//////////////////////////////////////////////////////////////////////
		
		const frm = document.registerFrm;
		frm.action = "memberRegister.run";
		frm.method = "POST";
		frm.submit();
		
	} // end of function goRegister() ------------------------------------------------------------------------

	
	
</script>

<div class="row" id="divRegisterFrm" style="font-family:SpeedeeK; font-weight:600;">
  <div class="col-md-12" align="center">
   <form name="registerFrm">
   
   	<div>
	  <p class="bg1">회원가입&nbsp;&nbsp;&nbsp;<span class="star">*</span><span class="essential">표시는 필수입력사항</span></p>
	</div>
   
   	<table id="tblMemberRegister">
      <thead>
	      <tr>
	      </tr>
      </thead>
      <tbody>
	      <tr>
	      	 <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">성명&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;">
	             <input type="text" name="member_name" id="member_name" class="requiredInfo" /> 
	            <span class="error">성명은 필수입력 사항입니다.</span>
	         </td>
	      </tr>
	      
	      <tr> 
	      	 <td class="gap"></td> 
	         <td style="width: 20%; font-weight: bold;">아이디&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="text" name="userid" id="userid" class="requiredInfo" />&nbsp;&nbsp;
	             <span class="error">아이디는 필수입력 사항입니다.</span>
	             
	             <%-- 아이디 중복체크 --%>
	             <span style="display: inline-block; font-size: 7pt; cursor: pointer;" class="btn btn-dark" onclick="isExistIdCheck();">아이디 중복 확인</span> 
	             <span id="idcheckResult"></span>
	             
	         </td> 
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">비밀번호&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="password" name="pwd" id="pwd" class="requiredInfo" />
	            <span class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">비밀번호확인&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="password" id="pwdcheck" class="requiredInfo" /> 
	            <span class="error">암호가 일치하지 않습니다.</span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">이메일&nbsp;<span class="star">*</span></td>
	         <td style="width: 80%; text-align: left;"><input type="text" name="email" id="email" class="requiredInfo" placeholder="abc@def.com" /> 
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
	             <input type="text" id="hp2" name="hp2" size="6" maxlength="4" />&nbsp;-&nbsp;
	             <input type="text" id="hp3" name="hp3" size="6" maxlength="4" />
	             <span class="error">휴대폰 형식이 아닙니다.</span>
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">우편번호</td>
	         <td style="width: 80%; text-align: left;">
	            <input type="text" id="postcode" name="postcode" size="6" maxlength="5" />&nbsp;&nbsp;
	            <span class="error">우편번호 형식이 아닙니다.</span>
	            
	            <%-- 우편번호 찾기 --%>
	            <span id="zipcodeSearch" style="display: inline-block; font-size: 7pt; cursor: pointer;" class="btn btn-dark">우편번호 찾기</span> 
	            
	         </td>
	      </tr>
	      
	      <tr>
	         <td class="gap"></td>
	         <td style="width: 20%; font-weight: bold;">주소</td>
	         <td style="width: 80%; text-align: left;">
	            <input type="text" id="address" name="address" size="40" placeholder="주소" /><br/>
	            <input type="text" id="detail_address" name="detail_address" size="40" placeholder="상세주소" />&nbsp;<input type="text" id="ref_address" name="ref_address" size="40" placeholder="참고항목" /> 
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
	         <td class="gap"></td>
	         <td colspan="2">
	            <label for="agree">이용약관에 동의합니다</label>&nbsp;&nbsp;<input type="checkbox" id="agree" />
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
	            <input type="button" id="btnRegister" class="btn btn-dark btn-lg" style="font-weight: bold;" onclick="goRegister()" value="가입하기"></input>
	         </td>
	      </tr>
	      
       </tbody>
     </table> 
   </form>
  </div>
</div>

<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>