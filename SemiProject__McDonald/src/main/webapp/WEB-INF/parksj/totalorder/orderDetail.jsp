<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
%>

<style type="text/css">
	.topimage {
		position: relative;
		border: solid 0px green;
		width:100%;
		height: 226px;
		margin-top: 136px;
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
		 font-size: 55pt; 
		 line-height:1;
		 font-family:SpeedeeK;
  		 font-style:normal;
	}
	
	.topimage{
		background:url(<%= request.getContextPath() %>/images/품질이야기상단이미지.jpg) 50% 50% no-repeat;
	}
	
	#dvoInfo{
		border: solid 3px black;
		position: relative;
		width:100%;
	}
	
	#orderTable{
		border: solid 0px red;
		position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
		
	}

</style>

<script type="text/javascript">

</script>

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<c:if test="${empty requestScope.oderDetail}">
   존재하지 않는 회원입니다.<br>
</c:if>

<c:if test="${not empty requestScope.oderDetail}">
	<div class="MCcontent">
		<div class="topimage">
			<div class="toptext" style="padding-top: 40px;">
				<h1 class="titDep1">주문번호 ${requestScope.oderDetail[0].odr_no}의 상세내역</h1>
			</div>
		</div>
	</div>
	<div id="dvoInfo">
		<table id="orderTable">
			<thead>
				<tr>
					<th>주문내역일련번호</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>주문수량</th>
					<th>세트여부</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${requestScope.oderDetail}">
					<tr>
						<td>${item.odr_product_no}</td>
						<td>${item.fk_item_no}</td>
						<td>${item.item_name}</td>
						<td>${item.quantity}</td>
						<td>
							<c:if test="${item.is_set eq 0}">X</c:if>
							<c:if test="${item.is_set eq 1}">O</c:if>
						</td>
						<td>${item.item_price}</td>
					</tr>
				</c:forEach>
				<tr>
		            <td colspan="6">
		                <ul>
		                    <li><span class="myli">배달상태 : </span>
		                        <c:choose>
		                            <c:when test="${requestScope.oderDetail[0].is_delivery eq 0}"> 배송전 </c:when>
		                            <c:when test="${requestScope.oderDetail[0].is_delivery eq 1}"> 배송완료 </c:when>
		                        </c:choose>
		                    </li>
		                    <li><span class="myli">주문일자 : </span>${requestScope.oderDetail[0].odr_date}</li>
		                    <li><span class="myli">제품 총가격 : </span>${requestScope.oderDetailTotalPrice}</li>
		                </ul>
		            </td>
		        </tr>
			</tbody>
		</table>
	</div>
	
	
</c:if>


<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>

