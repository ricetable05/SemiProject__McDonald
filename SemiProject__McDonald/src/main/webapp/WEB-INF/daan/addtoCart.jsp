<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
${requestScope.json}
<%-- 
<c:if test="${empty sessionScope.cart}">
<tr>
<td>
<span>비었음</span>
</td>
</tr>
</c:if>

<c:if test="${not empty sessionScope.cart}">
<c:forEach items="${sessionScope.cart}" var="singleOrder">
<tr style="border: solid 1px gray">
			<td>
				<span>${singleOrder.item_name}</span><a class="edit" href="#">변경</a>
				<!-- <div style="font-size:0.9rem">-세트<br>- 해쉬브라운<br>- 제로콜라</div> -->
				<span style="color:red; font-size:0.9rem">삭제</span><span style="float:right;">￦${singleOrder.item_price}</span>
			</td>
		</tr>
</c:forEach>
</c:if>

 --%>





<%-- 아래와 같이 json으로 하면 오류; 어차피 장바구니에 담는거 session을 이용해본다. --%>
<%-- 

<c:if test="${empty requestScope.json}">
<tr style="border: solid 1px gray">
		<tr>	
			<td>
				<span>텅비었음</span>
			</td>
		</tr>
</c:if>
<c:if test="${not empty requestScope.json}">
${requestScope.json}
</c:if>

 --%>
<%--
<c:if test="${not empty requestScope.json}">
<c:forEach items="${requestScope.json}" var="item">
		<tr style="border: solid 1px gray">
			<td>
				<span>${item.item_no}</span><a class="edit" href="#">변경</a>
				<div style="font-size:0.9rem">-세트<br>- 해쉬브라운<br>- 제로콜라</div>
				<span style="color:red; font-size:0.9rem">삭제</span><span style="float:right;">￦7,300</span>
			</td>
		</tr>
</c:forEach>
</c:if>
 --%>
<%-- 
<table style="width: 100%">
	<thead>
		<tr>
			<th style="text-align:center;">주문상세</th>
		</tr>
	</thead>
	<tbody>
		<tr style="border: solid 1px gray">
			<td>
				<span>1955® 트리플 어니언</span><a class="edit" href="#">변경</a>
				<div style="font-size:0.9rem">-세트<br>- 해쉬브라운<br>- 제로콜라</div>
				<span style="color:red; font-size:0.9rem">삭제</span><span style="float:right;">￦7,300</span>
			</td>
		</tr>
<tr style="border: solid 1px gray">
<td><span>1955® 트리플 어니언</span><a class="edit" href="#">변경</a>
	<div style="font-size:0.9rem">-세트<br>- 해쉬브라운<br>- 제로콜라</div>
	<span style="color:red; font-size:0.9rem">삭제</span><span style="float:right;">￦7,300</span>
        	</td>
    	</tr>
	</tbody>
</table> --%>