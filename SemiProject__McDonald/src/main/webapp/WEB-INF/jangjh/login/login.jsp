<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>
    
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/login/login.css" type="text/css"/>
    
<script type="text/javascript">

	$(document).ready(function(){
		
		// 로그인을 하지 않는 상태일 때 
		if(${empty sessionScope.loginuser}){
			
			const loginUserid = localStorage.getItem("saveid"); 
			
			if(loginUserid != null){
				$("input#loginUserid").val(loginUserid);
				$("input:checkbox[id='saveid']").prop("checked",true);
			}
			
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		$("button#btnSubmit").click(function(){
			goLogin(); //로그인 시도한다.
		});
		
		$("input#loginPwd").bind("keydown",function(e){
			if(e.keyCode == 13) { //암호입력란에 엔터를 했을 경우
				goLogin(); // 로그인 시도한다.
			}
		});
		
		$("button.idFindClose").click(function(){
			
			const iframe_idFind = document.getElementById("iframe_idFind");
			// 대상 아이프레임을 선택한다.
			
			const iframe_window = iframe_idFind.contentWindow; 	
															   		
			iframe_window.func_form_reset_empty(); 
			
		}); // end of $("button.idFindClose").click(function(){} ----------------- 
				
		$("button.passwdFindClose").click(function(){
			
			const iframe_pwdFind = document.getElementById("iframe_pwdFind");
			
			const iframe_window_pwd = iframe_pwdFind.contentWindow; 
			iframe_window_pwd.func_form_reset_empty_pwd(); 
			
		}); // end of $("button.passwdFindClose").click(function(){} ----------------- 
		
		
	});//end of $(document).ready(function() --------------------------------------
			
			
	// Function Declaration
	// -- 로그인 처리 함수 --
	function goLogin() {
		
		
		const loginUserid = $("input#loginUserid").val().trim();
		const loginPwd = $("input#loginPwd").val().trim();
		
		if(loginUserid == "") {
			alert("아이디를 입력하세요!");
			$("input#loginUserid").val("");
			$("input#loginUserid").focus();
			return; // goLogin(); 함수 종료
		}
		
		if(loginPwd == "") {
			alert("암호를 입력하세요!");
			$("input#loginPwd").val(""); 
			$("input#loginPwd").focus();
			return; // goLogin(); 함수 종료
		}
		
		
		if($("input:checkbox[id='saveid']").prop("checked")) {
			//alert("아이디저장 체크박스에 체크를 하셨네요.")
			localStorage.setItem("saveid",$("input#loginUserid").val());
		}
		else {
			localStorage.removeItem("saveid");
		}   
		
		
		
		const frm = document.loginFrm;
		frm.action = "<%= request.getContextPath()%>/login/login.run"; 
		frm.method = "POST";
		frm.submit(); 
		
	}//end of function goLogin()----------------------------------------------------		
			
	
</script>

</head>
<body>
	
<div id="container">
	<%-- === 사이드 시작 === --%>
	<div id="side" class="customDisplay" style="font-family:SpeedeeK; font-weight:600;">
		<form name="loginFrm">
	       <table id="loginTbl" style="margin-top: 22px;">
	         <thead>
	            <tr>
	               <th colspan="2" id="th">LOGIN</th>
	            </tr>
	         </thead>
	         
	         <tbody>
	            <tr>
	               <td style="width: 20%; border-bottom: hidden; border-right: hidden; padding: 10px; font-weight: bold;">ID</td>
	               <td style="width: 80%; border-bottom: hidden; border-left: hidden; padding: 10px;"><input type="text" id="loginUserid" name="userid" size="20" class="box" autocomplete="off" /></td>
	            </tr>   
	            <tr>
	               <td style="width: 20%; border-top: hidden; border-bottom: hidden; border-right: hidden; padding: 10px; font-weight: bold;">PASSWORD</td>
	               <td style="width: 80%; border-top: hidden; border-bottom: hidden; border-left: hidden; padding: 10px;"><input type="password" id="loginPwd" name="pwd" size="20" class="box" /></td>
	            </tr>
	            
	            <tr>
	               <td colspan="2" align="center" style=" padding: 10px;">
	                  <input type="checkbox" id="saveid" name="saveid" style="margin-right: 15px;"><label for="saveid" style="font-weight: bold;">아이디 저장</label>
	                  
	               </td>
	            </tr>
	            
	            <tr>
	               <td colspan="2">
	                  <button type="button" id="btnSubmit" class="btn btn-outline-warning btn" style="font-weight: bold; margin-left: 120px;">로그인</button>
	                  
	                  <button type="button" id="btnSignUp" class="btn btn-outline-warning btn ml-2" style="font-weight: bold;" onclick="window.open('<%=ctxPath%>/member/memberRegister.run');">회원가입</button>
	               </td>
	            </tr>
	            
	            <%-- === 아이디 찾기, 비밀번호 찾기 === --%>
	            <tr> 
	               <td colspan="2" style="padding-top: 30px;">
	                  <a style="cursor: pointer; margin-left: 35px;" data-toggle="modal" data-target="#userIdfind" data-dismiss="modal">아이디찾기</a>
	                  &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;  
	                  <a style="cursor: pointer;" data-toggle="modal" data-target="#passwdFind" data-dismiss="modal" data-backdrop="static">비밀번호찾기</a>
	               </td>
	            </tr>
	            
	         </tbody>
	       </table>
	   </form>
	   
	   <%-- ****** 아이디 찾기 Modal ****** --%>
	  <div class="modal fade" id="userIdfind"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal header -->
	        <div class="modal-header">
	          <h4 class="modal-title" style="font-family:SpeedeeK; font-weight: 600;">아이디 찾기</h4>
	          <button type="button" class="close idFindClose" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <div id="idFind">
	             <iframe id="iframe_idFind" style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath()%>/login/idFind.run">
	             </iframe>
	          </div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-dark idFindClose" data-dismiss="modal" style="font-family:SpeedeeK; font-weight: 500;">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
	   
	  <%-- ****** 비밀번호 찾기 Modal ****** --%>
	  <div class="modal fade" id="passwdFind"> <%-- 만약에 모달이 안보이거나 뒤로 가버릴 경우에는 모달의 class 에서 fade 를 뺀 class="modal" 로 하고서 해당 모달의 css 에서 zindex 값을 1050; 으로 주면 된다. --%> 
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal header -->
	        <div class="modal-header">
	          <h4 class="modal-title">비밀번호 찾기</h4>
	          <button type="button" class="close passwdFindClose" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <div id="idFind">
	             <iframe id="iframe_pwdFind" style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath()%>/login/pwdFind.run">
	             </iframe>
	          </div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-dark passwdFindClose" data-dismiss="modal" style="font-family:SpeedeeK; font-weight: 500;">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>  
	<%-- === 사이드 끝 === --%>
	
	<%-- === 내용 시작 === --%>
	<div id="contents" style="font-family:SpeedeeK; font-weight:600;">
		<div style="font-size: 40pt; font-weight: bold; text-align: center;">Welcome to McDonald's!</div>
		<div class="embed-responsive embed-responsive-21by9">
		   <iframe width="560" src="https://www.youtube.com/embed/g7EzMPH8Ir0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		</div>
	</div>
	<%-- === 내용 끝 === --%>
</div>	
	   
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>