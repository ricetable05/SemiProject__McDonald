<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
	//      /MyMVC
%> 

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<style type="text/css">
   div#mvoInfo {
      width: 60%; 
      text-align: left;
      border: solid 0px red;
      margin-top: 30px; 
      font-size: 13pt;
      line-height: 200%;
   }
   
   span.myli {
      display: inline-block;
      width: 90px;
      border: solid 0px blue;
   }
   
/* ============================================= */
   div#sms {
      margin: 0 auto; 
      /* border: solid 1px red; */ 
      overflow: hidden; 
      width: 50%;
      padding: 10px 0 10px 80px;
   }
   
   span#smsTitle {
      display: block;
      font-size: 13pt;
      font-weight: bold;
      margin-bottom: 10px;
   }
   
   textarea#smsContent {
      float: left;
      height: 100px;
   }
   
   button#btnSend {
      float: left;
      border: none;
      width: 50px;
      height: 100px;
      background-color: navy;
      color: white;
   }
   
   div#smsResult {
      clear: both;
      color: red;
      padding: 20px;
   }   
   
   body {
   	margin-top: 137px;
  	font-family:SpeedeeK; 
	font-weight:600;
   }
   
   p {
	  border: 1em violet;
	  padding: 55px;
	  font-size: 35pt; 
	  color: white;
	  
	}
	.bg1 {
	  background-image: url(<%= ctxPath%>/images/top_image/품질이야기상단이미지.jpg);  
	  background-clip: border-box;
	} 
   
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		$("div#smsResult").hide();
		
		$("button#btnSend").click( () =>{
			
			//console.log($("input#reservedate").val() + " " + $("input#reservetime").val());
			let reservedate = $("input#reservedate").val();
			reservedate = reservedate.split("-").join("");
			
			let reservetime = $("input#reservetime").val();
			reservetime = reservetime.split(":").join("");
			
			const datetime = reservedate + reservetime;
			
			// console.log(datetime);
			// 202304040035
			
			let dataObj;
			
			if(reservedate == "" || reservetime == ""){
				// 문자를 바로 보내기인 경우
				dataObj = {"member_tel":"${requestScope.mvo.member_tel}",
						   "smsContent":$("textarea#smsContent").val()};	
			}
			else{
				// 예약문자를 보내기인 경우
				dataObj = {"member_tel":"${requestScope.mvo.member_tel}",
						   "smsContent":$("textarea#smsContent").val(),
						   "datetime":datetime};
			}
			
			$.ajax({
				url:"<%= request.getContextPath() %>/member/smsSend.run",
				type:"POST",
				data:dataObj,
				dataType:"json",
				success:function(json){
					
					if(json.success_count == 1){ // 문자 전송이 성공됨을 의미 
						$("div#smsResult").html("문자전송이 성공되었습니다.");
					}
					else if(json.error_count != 0){ // 문자 전송이 오류가 떳음을 의미함 
						$("div#smsResult").html("문자전송이 실패되었습니다.");
					}
					
					$("div#smsResult").show();
					$("textarea#smsContent").val("");
					
				},
				error:function(request, status, error){ // 페이지없으면 404 에러
	                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
				
				
			});
			
			
		}); // end of  $("button#btnSend").click() -----------------------------------
		
	});// end of $(document).ready(function(){}) --------------------------------------
	
</script>

<c:if test="${empty requestScope.mvo}">
   존재하지 않는 회원입니다.<br>
</c:if>
	<c:if test="${not empty requestScope.mvo}">
	   <c:set var="member_tel" value="${requestScope.mvo.member_tel}" />
	   <c:set var="birthday" value="${requestScope.mvo.birthday}" />
	   
	    <div>
		  <p class="bg1" style="text-align: center; font-weight:600;">"${requestScope.mvo.member_name}"<a style="font-size: 20pt;">님의 회원 상세정보</a></p>
		</div>
	   
	   <div id="mvoInfo" style="margin-top: 30px; margin-left: 500px;">
	    <ol>   
	       <li><span class="myli">아이디 : </span>${requestScope.mvo.userid}</li>
	       <li><span class="myli">회원명 : </span>${requestScope.mvo.member_name}</li>
	       <li><span class="myli">이메일 : </span>${requestScope.mvo.email}</li>
	       <li><span class="myli">휴대폰 : </span>${fn:substring(member_tel, 0, 3)}-${fn:substring(member_tel, 3, 7)}-${fn:substring(member_tel, 7, 11)}</li>
	       <li><span class="myli">우편번호 : </span>${requestScope.mvo.postcode}</li>
	       <li><span class="myli">주소 : </span>${requestScope.mvo.address}&nbsp;${requestScope.mvo.detail_address}&nbsp;${requestScope.mvo.ref_address}</li>
	       <li><span class="myli">생년월일 : </span>${fn:substring(birthday, 0, 4)}.${fn:substring(birthday, 4, 6)}.${fn:substring(birthday, 6, 8)}</li> 
	       <li><span class="myli">가입일자 : </span>${requestScope.mvo.registerday}</li>
	     </ol>
	   </div>
	   
	   <%-- ==== 휴대폰 SMS(문자) 보내기 ==== --%>
	   <div id="sms" align="left" style="margin-top: 30px; margin-left: 440px;">
	        <span id="smsTitle">= 휴대폰 SMS(문자) 보내기 내용 입력란 =</span>
	        <div style="margin: 10px 0 20px 0">
	           발송예약일&nbsp;<input type="date" id="reservedate" />&nbsp;<input type="time" id="reservetime" />
	        </div>
	        <textarea rows="4" cols="40" id="smsContent"></textarea>
	        <button id="btnSend" style="font-weight: bold;">전송</button>
	        <div id="smsResult"></div>
	   </div>
	</c:if>
	


<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>