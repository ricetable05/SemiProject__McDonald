<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>휴먼</title>
    
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>
    
<style type="text/css">
    
    div#container{
    	display: flex;
		border: solid 0px purple;
		width: 80%;
		margin: 20px auto; 
		margin-top: 150px;
	}

    #th{ 
    	font-size: 25pt;  text-align: center; padding-left:320px;
    }

</style>
	
<script type="text/javascript">
	
	$(document).ready(function(){
	
    	$("button.btn_is_dormantClose").click(function(){
			
			const iframe_is_dormantFind = document.getElementById("iframe_is_dormantFind");
			
			const iframe_window_is_dormant = iframe_is_dormantFind.contentWindow; 
			
			iframe_window_is_dormant.func_form_reset_is_dormant(); 
			
		}); // end of $("button.btn_is_dormantClose").click(function(){} ----------------- 
		
	});//end of $(document).ready(function() ----------------------------------------------

 			
</script>

</head>
<body>
	
<div id="container">
   <form name="is_dormantFindFrm" style="font-family:SpeedeeK; font-weight:600;">
      <table id="is_dormantTbl" style="margin-top: 22px;">
        <thead>
           <tr>  
              <th colspan="2" id="th">휴먼계정을 일반계정으로 전환하시겠습니까?</th>
           </tr>
        </thead>
        <tbody>
           <%-- === 휴먼계정 풀기 === --%> 
           <tr>  
              <td colspan="2" style="padding-top: 30px;">
                 <button type="button" class="btn btn-dark" style="cursor: pointer; font-weight:500; margin: 10px 0 130px 570px; " data-toggle="modal" data-target="#is_dormantFind" data-dismiss="modal" data-backdrop="static">휴면 계정 풀기</button>
              </td>
           </tr>
        </tbody>
      </table>
   </form>
	   
  <%-- ****** 휴먼계정 풀기 Modal ****** --%>
  <div class="modal fade" id="is_dormantFind"> 
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal header -->
        <div class="modal-header">
          <h4 class="modal-title" style="font-family:SpeedeeK; font-weight:600;">휴면 계정 풀기</h4>
          <button type="button" class="close btn_is_dormantClose" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div id="idFind">
             <iframe id="iframe_is_dormantFind" style="border: none; width: 100%; height: 280px;" src="<%= request.getContextPath()%>/login/is_dormantFind.run">
             </iframe>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-dark btn_is_dormantClose" data-dismiss="modal" style="font-family:SpeedeeK; font-weight: 500;">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>	
	   
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>