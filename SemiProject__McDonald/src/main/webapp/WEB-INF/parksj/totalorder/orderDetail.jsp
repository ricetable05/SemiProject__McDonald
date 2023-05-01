<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		height: 100%
	}
	
	#orderTable{
		border: solid 0px red;
		position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
		
	}
	
	th{
		border: solid 2px red;
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
		
    <table>
      <thead>
        <tr>
          <th>주문번호</th>
          <th>주문자</th>
          <th>주문시간</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>${requestScope.oderDetail[0].odr_no}</td>
          <td>${requestScope.oderDetail[0].fk_userid}</td>
          <td>${requestScope.oderDetail[0].odr_date}</td>
        </tr>
      </tbody>
    </table>

    <table>
      <thead>
        <tr>
          <th>주문내역일련번호</th>
          <th>제품코드</th>
          <th>제품명</th>
          <th>제품가격</th>
          <th>주문수량</th>
          <th>세트유무</th>
        </tr>
      </thead>
     <%--  <tbody>
                <c:forEach var="orderDetail" items="${requestScope.oderDetail}">
                    <tr>
                        <td>${orderDetail.odr_product_no}</td>
                        <td>${orderDetail.fk_item_no}</td>
                        <td>${orderDetail.item_name}</td>
                        <td>${orderDetail.item_price}</td>
                        <td>${orderDetail.quantity}</td>
                        <td>${orderDetail.is_set == 1 ? 'O' : 'X'}</td>
                    </tr>
                </c:forEach>
            </tbody>
    </table> --%>

    <table>
      <thead>
        <tr>
          <th>제품 총가격</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>${requestScope.oderDetail[0].total}</td>
        </tr>
      </tbody>
    </table>

    <table>
      <thead>
        <tr>
          <th>배달상태</th>
          <th>배달비</th>
          <th>배달완료시간</th>
          <th>배달주소</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>${requestScope.oderDetail[0].is_delivery == 1 ? '배송완료' : '배송전'}</td>
          <td>${requestScope.oderDetail[0].is_delivery_price == 1 ? '3000' : '0'}</td>
          <td>${requestScope.oderDetail[0].delivery_time}</td>
          <td>${requestScope.oderDetail[0].delivery_loc}</td>
        </tr>
      </tbody>
    </table>
  </div>
	
	
</c:if>


<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>

