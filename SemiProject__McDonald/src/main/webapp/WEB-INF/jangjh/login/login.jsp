<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    
    
    <style type="text/css">
    
    div#container{
    	display: flex;
		border: solid 0px purple;
		width: 80%;
		margin: 20px auto; /* 상 하는 20px 우 좌는 남은 20%에서 좌우로 균등하게 주겠다. 즉, 화면의 가운데로 위치하겠다는 말이다.*/
		margin-top: 150px;
	}

	div#side{
		border: solid 0px blue;
		width: 29%;
	}	
	
	div#contents{
		border: solid 0px yellow;
		width: 69.22%;
		background-color: #eee;
	}	
	
    #th{
    	font-size: 25pt;  text-align: center; padding-left:50px;
    }
    
    
    
    </style>
    
  </head>
</head>
<body>
	
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>
	
<div id="container">
	<%-- === 사이드 시작 === --%>
	<div id="side" class="customDisplay">
		<form name="loginFrm">
	       <table id="loginTbl">
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
	          <h4 class="modal-title">아이디 찾기</h4>
	          <button type="button" class="close idFindClose" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <div id="idFind">
	             <iframe id="iframe_idFind" style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath()%>/login/idFind.up">
	             </iframe>
	          </div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger idFindClose" data-dismiss="modal">Close</button>
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
	             <iframe id="iframe_idFind" style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath()%>/login/pwdFind.up">
	             </iframe>
	          </div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger passwdFindClose" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	</div>  
	<%-- === 사이드 끝 === --%>
	
	<%-- === 내용 시작 === --%>
	<div id="contents">
		<div style="font-size: 40pt; font-weight: bold; text-align: center;">Welcome to McDonald's!</div>
		<div class="embed-responsive embed-responsive-21by9">
		   <iframe width="560" src="https://www.youtube.com/embed/g7EzMPH8Ir0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		</div>
	</div>
	<%-- === 내용 끝 === --%>

</div>	
	
	
	
	   
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>