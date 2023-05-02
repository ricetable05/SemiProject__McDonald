<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
%>
<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<style type="text/css">
	.topimage {
		position: relative;
		border: solid 0px green;
		width:100%;
		height: 226px;
		margin-top: 136px;
		margin-bottom: 30px;
	}
	
	.topimage:before {
		content:"";
		width:100%;
		height:100%;
		position:absolute;
	}
	
	
	.toptext{
		border: solid 0px red;
	    width: 1146px;
	    height: 150px;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    font-size:14pt;
	    color: #fff;
		font-family:SpeedeeK;
	  	font-style:normal;
	  	font-weight:600;
  		text-align: center;
	}
	
	
	
	.titDep1{display:block;
		 font-size: 50pt; 
		 line-height:1;
		 font-family:SpeedeeK;
		 font-weight: 600;
  		 font-style:normal;
	}
	
	.topimage{
		background:url(<%= request.getContextPath() %>/images/품질이야기상단이미지.jpg) 50% 50% no-repeat;
	}
	
	#dvoInfo{
		border: solid 3px black;
		position: relative;
		width:100%;
		height: 100%;
		font-family:SpeedeeK; 
		font-weight:500;
		font-size: 15pt;
		
	}
	
	table{
		margin-top : 20px;
		margin-bottom: 20px;
		border: solid 0px orange;
	}
	
	
	#orderTable{
		border: solid 0px red;
	}
	
	th{
		border: solid 0px red;
		font-weight: 600;
	}
	
	td{
		border: solid 0px skyblue;
	}
	
	div.alltable{
		border: solid 0px yellow;
		margin: 0 20% 0 30%;
		
	}
	#tbone > thead > tr > th{
		text-align: center;
	}
	
	#tbone > tbody > tr > td{
		text-align: center;	
	}
	
	#tbone{
		
		width: 500px;
	}
	#tbone > thead > tr > td {
		text-align: center;
	}
	
	ol {
		dispaly:none;
	}
	
	#tbfour > thead > tr > th {
		width: 800px;
	}
	
	#orderTable > div:nth-child(2){
		border: solid 0px yellow;
		margin: 0 35% 0 35%;
		text-align: center;
	}
	

</style>

<script type="text/javascript">



	$(document).ready(function(){
		
		
		
		sum_price();
		sale_price();
	});
	
function sum_price(){
	
	let total_price = 0;
	
	let arr = document.getElementsByClassName('price');
	
	arr = Array.from(arr);
	arr.forEach( (elt) => {
		total_price += Number(elt.innerText);
	})
	
	$('td#total').text(total_price);
	
}	

function sale_price(){
	
	let total_price = 0;
	
	let arr = document.getElementsByClassName('set');
	
	arr = Array.from(arr);
	arr.forEach( (elt) => {
		let count = 0;
		if(elt.innerText == 'O'){
			count ++;
		}
		total_price += Number(count*1000);
	})
	
	$('td#sale').text(total_price);
	
}	
	

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


<c:if test="${empty requestScope.orderDetail}">
   존재하지 않는 회원입니다.<br>
</c:if>

<c:if test="${not empty requestScope.orderDetail}">
	<div class="MCcontent">
		<div class="topimage">
			<div class="toptext" style="padding-top: 40px;">
				<h1 class="titDep1">주문번호 ${requestScope.oneOrder.odr_no}의 상세내역</h1>
			</div>
		</div>
	</div>
	<div id="dvoInfo">
		<div id="orderTable">
			<div class="alltable">
				<table id="tbone">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문자</th>
							<th>주문시간</th>
						</tr>
					<tbody>
						<tr>
							<td>${requestScope.oneOrder.odr_no}</td>
							<td>${requestScope.oneOrder.fk_userid}</td>
							<td>${requestScope.oneOrder.odr_date}</td>
						</tr>	
					</tbody>
			    </table>
			</div>
			<div class="alltable">
						<div id="mvoInfo" style="margin-top: 30px;">
							<c:forEach var="orderDetail" items="${requestScope.orderDetail}">
								 <ol>
									<li><span class="myli">주문내역일련번호 : </span>${orderDetail.odr_product_no}</li>
									<li><span class="myli">제품코드 : </span>${orderDetail.fk_item_no}</li>
									<li><span class="myli">제품명 : </span>${orderDetail.item_name}</li>
									<li><span class="myli">제품가격 : </span><span class="price">${orderDetail.item_price}</span></li>
									<li><span class="myli">주문수량 : </span>${orderDetail.quantity}</li>
									<li style="border-bottom : solid 4px gray;"><span class="myli">세트유무 : </span><span class="set">${orderDetail.is_set == 1 ? 'O' : 'X'}</span></li>
								</ol>
							</c:forEach>
						 </div>
				
			</div>
			<div class="alltable">
				<table id="tbthree">
					<thead>
						<tr>
							<th>제품 총가격</th>
							<th>할인된 금액</th>
							<th>배달비</th>
							<th>결제할 가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="total"></td>
							<td id="sale"></td>
							<td>${requestScope.oneOrder.is_delivery_price == 1 ? '3000' : '0'}</td>
							<td>${requestScope.oneOrder.total}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="alltable">
				<table id="tbfour">
					<thead>
						<tr>
							<th>배달상태</th>
							<th>배달완료시간</th>
							<th>배달주소</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${requestScope.oneOrder.is_delivery == 1 ? '배송완료' : '배송전'}</td>
							<td>${requestScope.oneOrder.delivery_time}</td>
							<td>${requestScope.oneOrder.delivery_loc}</td>
						</tr>
					</tbody>
				</table>
		    </div>
		    <c:if test="${requestScope.oneOrder.is_delivery == 0}">
		    	<button type="button" class="btn btn-primary" onclick="deliveryClear()"> 배송완료 </button>
		    </c:if>
		    <c:if test="${requestScope.oneOrder.is_delivery == 1}">
		    	<button type="button" class="btn btn-primary" disabled onclick="deliveryClear()"> 배송완료 </button>
		    </c:if>
	    </div>
  </div>
	
	
	
</c:if>


<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>

