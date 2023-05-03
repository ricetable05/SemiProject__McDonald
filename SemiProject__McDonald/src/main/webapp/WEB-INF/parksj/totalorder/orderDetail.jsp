<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/totalorder/orderDetail.css" type="text/css"/>

<style type="text/css">
	
	.topimage{
		background:url(<%= request.getContextPath() %>/images/품질이야기상단이미지.jpg) 50% 50% no-repeat;
	}

</style>

<script type="text/javascript">



	$(document).ready(function(){
		
		
		
		sum_price();
		sale_price();
	});
	
	
		
	
	function deliveryClear(){
			
			$.ajax({
				url:"<%= request.getContextPath()%>/daan/deliveryCompleteCheck.run",
				type:"post",
				data:{"odr_no":${requestScope.odr_no}},
				dataType:"json",
				success:function(json){
					location.href="<%= request.getContextPath()%>/totalorder/totalOrderMain.run";
				},
				error: function(request, status, error){
	                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
			});
	}
</script>


<c:if test="${empty requestScope.orderDetail_List}">
   존재하지 않는 회원입니다.<br>
</c:if>

<c:if test="${not empty requestScope.orderDetail_List}">
	<div class="MCcontent">
		<div class="topimage">
			<div class="toptext" style="padding-top: 40px;">
				<h1 class="titDep1">주문번호 ${requestScope.oneOrder.odr_no}의 상세내역</h1>
			</div>
		</div>
	</div>
	<div id="dvoInfo">
		<!-- 
		<div id="orderTable">
			<div>
				<span style=" font-weight: 600;">주문번호</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.odr_no}</span>
			</div>
			<div>
				<span style=" font-weight: 600;">주문자</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.fk_userid}</span>
			</div>
				<div>
				<span style=" font-weight: 600;">주문시간</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.odr_date}</span>
			</div>
		</div>
		
		<div id="deliveryTable">
			<div>
				<span style=" font-weight: 600;">제품 총가격</span><br>
				<span id="total" style=" font-weight: 500;">${requestScope.orderDetail_List[0].pre_total}</span>
			</div>
			<div>
				<span style=" font-weight: 600;">할인된 금액</span><br>
				<span id="sale" style=" font-weight: 500;">${requestScope.orderDetail_List[0].sales}</span>
			</div>
			<div>
				<span style=" font-weight: 600;">배달비</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.is_delivery_price == 1 ? '3000' : '0'}</span>
			</div>
			<div>
				<span style=" font-weight: 600;">결제할 가격</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.total}</span>
			</div>
		</div>
		<div id="deliveryclear">
			<div>
				<span style=" font-weight: 600;">배달상태</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.is_delivery == 1 ? '배송완료' : '배송전'}</span>
			</div>
			<div>
				<span style=" font-weight: 600;">배달완료시간</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.delivery_time}</span>
			</div>
			<div>
				<span style=" font-weight: 600;">배달주소</span><br>
				<span style=" font-weight: 500;">${requestScope.oneOrder.delivery_loc}</span>
			</div>
		</div>
		-->
		<div id="orderTable" style="">
			<ol>   
		       <li><span class="listt">주문번호 : </span><span class="listo">${requestScope.oneOrder.odr_no}</span></li>
		       <li><span class="listt">주문자 : </span><span class="listo">${requestScope.oneOrder.fk_userid}</span></li>
		       <li><span class="listt">주문시간 : </span><span class="listo">${requestScope.oneOrder.odr_date}</span></li>
		       <li><span class="listt">총가격 : </span><span class="listo">${requestScope.orderDetail_List[0].pre_total}</span></li>
		       <li><span class="listt">할인금액 : </span><span class="listo">${requestScope.orderDetail_List[0].sales}</span></li>
		       <li><span class="listt">배달비 : </span><span class="listo">${requestScope.oneOrder.is_delivery_price == 1 ? '3000' : '0'}</span></li>
		       <li><span class="listt">결제금액 : </span><span class="listo">${requestScope.oneOrder.total}</span></li>
		       <li><span class="listt">배달상태 : </span><span class="listo">${requestScope.oneOrder.is_delivery == 1 ? '배송완료' : '배송전'}</span></li>
		       <li><span class="listt">배달주소 : </span><span class="listo">${requestScope.oneOrder.delivery_loc}</span></li>
		       <li><span class="listt">배달도착 : </span><span class="listo">${requestScope.oneOrder.delivery_time}</span></li>
		     </ol>
	     </div>
		<c:if test="${requestScope.sessionUserid == 'kingkingadmin'}">
			<div id="buttonTable">
				<c:if test="${requestScope.oneOrder.is_delivery == 0}">
			    	<button type="button" class="btn btn-dark"onclick="deliveryClear()"> 배송완료 </button>
			    </c:if>
			    <c:if test="${requestScope.oneOrder.is_delivery == 1}">
			    	<button type="button" class="btn btn-dark" disabled onclick="deliveryClear()"> 배송완료 </button>
			    </c:if>
		    </div>
	    </c:if>
		<div class="Detailcontent" style="">
			<c:forEach var="OrderDetailVO" items="${requestScope.orderDetail_List}">
				 <ol style="border-bottom : dotted 4px gray; padding-bottom: 15px; ">
					<li><span class="listt">제품코드 : </span>${OrderDetailVO.fk_item_no}</li>
					<li><span class="listt">제품명 : </span>${OrderDetailVO.item_name}</li>
					<li><span class="listt">제품가격 : </span><span class="price">${OrderDetailVO.item_price}</span></li>
					<li><span class="listt">주문수량 : </span><span class="quantity">${OrderDetailVO.quantity}</span></li>
					<li><span class="listt">세트유무 : </span><span class="set">${OrderDetailVO.is_set == 1 ? 'O' : 'X'}</span></li>
				</ol>
			</c:forEach>
		</div>
		
		
  </div>
	
	
	
</c:if>


<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>

