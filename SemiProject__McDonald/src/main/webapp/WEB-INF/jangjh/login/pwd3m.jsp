<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 변경</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/login/pwd3m.css" type="text/css"/>
     
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>
	
<script type="text/javascript">
	
	$(document).ready(function(){
	
			$("button.Pwd3mClose").click(function(){
			
			const iframe_Pwd3m = document.getElementById("iframe_Pwd3mChange");
			
			const iframe_window_Pwd3m = iframe_Pwd3m.contentWindow; 
			
			iframe_window_Pwd3m.func_form_reset_Pwd3m(); 
			
		    }); // end of $("button.btn_is_dormantClose").click(function(){} ----------------- 
			
		    		
	});//end of $(document).ready(function() ----------------------------------------------

 			
</script> 

</head>
<body>

<div id="container">
   <form name="Pwd3mFrm" style="font-family:SpeedeeK; font-weight:600;">
	  <table id="Pwd3mTbl" style="margin-top: 22px;">
        <thead>
           <tr>  
              <th colspan="2" id="th">3개월 동안 비밀번호가 바뀌지 않았습니다. <br> 비밀번호를 변경해주세요! (선택)</th>
           </tr>
        </thead>
        <tbody>
           <%-- === 휴먼계정 풀기 === --%> 
           <tr>  
              <td colspan="2" style="padding-top: 30px;">
                 <button id="madal" type="button" class="btn btn-dark" style="cursor: pointer; font-weight:500; margin: 10px 0 130px 550px; " data-toggle="modal" data-target="#Pwd3m" data-dismiss="modal" data-backdrop="static">비밀번호 변경</button>
              </td>
           </tr>
           
           <%-- === 현재 비밀번호 유지 === --%> 
           <tr>  
              <td colspan="2" style="padding-top: 30px;">
                 <button  type="button" class="btn btn-dark" onclick="location.href='<%= request.getContextPath()%>/'" style="cursor: pointer; font-weight:500; margin: -140px 0 90px 533px; ">현재 비밀번호 유지</button>
              </td>
           </tr>
           
        </tbody>
      </table>
   </form>
	   
  <%-- ****** 비밀번호 변경 Modal ****** --%>
  <div class="modal fade" id="Pwd3m"> 
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal header --> 
        <div class="modal-header">
        
          <h4 class="modal-title" style="font-family:SpeedeeK; font-weight:600;">비밀번호 변경</h4>
          <button type="button" class="close Pwd3mClose" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div id="idFind">
             <iframe id="iframe_Pwd3mChange" style="border: none; width: 90%; height: 230px;" src="<%= request.getContextPath()%>/login/pwd3mChange.run">
             </iframe>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-dark Pwd3mClose" data-dismiss="modal" style="font-family:SpeedeeK; font-weight: 500;">Close</button>
        </div>
      </div>
    </div>
  </div>
  
   
  
</div>	
	   
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>