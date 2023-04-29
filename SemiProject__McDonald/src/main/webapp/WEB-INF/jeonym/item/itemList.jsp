<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<style type="text/css">
	
	body {
		font-family:SpeedeeK;
  		font-weight:600;
	}
	
	table#itemTbl{
	    color: #738776;
	    font-weight: bold;
	    border:none;
	}

	table#itemTbl th, table#itemTbl td{
		vertical-align: middle;
		text-align: center;
	}
	
	table#itemTbl th{
		color: #000;
		font-size: 13pt;
		font-weight: bold;
	}
	
	
	
	ul#category_list {
		width: 202px;
		list-style-type: none;
		padding: 0;
		margin: 0 auto;
		border: solid 0px grey;
		<%--background-color: #ffff66; --%>

	}
	
	ul#category_list > li{
		width: 200px;
		margin: 0px auto;
		padding: 25px 0 25px 0;
		border-bottom: 1px solid black;
		text-align: center;
		<%--border:1px solid #ffbc0d; --%>
	}
	
	ul#category_list > li:last-child{
		margin: 0px auto;
		border:none;
	}
	
	
	
	ul#category_list li > a{
		text-decoration: none;
		font-weight: bold;
		width:200px;
		display:inline-block;
		color:#000;
	}
	
	
	tr.itemInfo:hover {
		background-color: #000;
		cursor: pointer;
	}
	
	.itemListPage > li > a
	{
	    background-color: #fff;
	    color: #333;
	}
	
	.itemListPage > li > a:focus,
	.itemListPage > li > a:hover,
	.itemListPage > li > span:focus,
	.itemListPage > li > span:hover
	{
	    color: #5a5a5a; 
	    background-color: #eee;
	    border-color: #ddd;
	}
	
   p {
     border: 1em violet;
     padding: 55px;
     font-size: 45pt; 
     color: white;
     
   }
   .bg1 {
     background-image: url(<%=request.getContextPath()%>/images/top_image/품질이야기상단이미지.jpg);  
     background-clip: border-box;
     font-size:35pt;
   }

		
	
</style>

<script type="text/javascript">
	
	$("document").ready(function(){
		
		
		$("tr.itemInfo").hover(
		
		function(e){
			$(e.target).parent().find("td").css({"background-color":"#fff","color":"#db0007"});
		},
		
		function(e){
			$(e.target).parent().find("td").css({"background-color":"", "color":""});
		}) // 제품목록 리스트 hover 효과
		

		
		$("ul#category_list > li").hover(function(e){
			
			$(e.target).css("color","#db0007");
			
		},
		function(e){
			$(e.target).css("color","");
		});
		
		
		$("ul#category_list > li > a").hover(function(e){
			
			$(e.target).parent().find("a").css("color","#db0007");
			
		},
		function(e){
			$(e.target).parent().find("a").css("color","");
		});
		
		
		
		$("tr.itemInfo > td").click(function(e){	
			// alert($(e.target).parent().find("td.item_no").text()); // 101
			const item_no = $(e.target).parent().find("td.item_no").text();
			
			goItemDetail(item_no);
			
		}) // td를 누르면 td의 부모인 제품목록 행 (tr)로 가서 item_no 값을 가져온다.
		
		
	}); 
	
	function goItemDetail(item_no){
		
		// 제품 상세정보창 띄우기
		const url = "<%=request.getContextPath()%>/item/itemDetail.run?item_no="+item_no;
		
		// 너비 600, 높이 900 인 팝업창을 화면 가운데 위치시키기
		const pop_width  = 600;
		const pop_height = 900;
		const pop_left = Math.ceil((window.screen.width - pop_width) / 2); <%-- 정수로 만듦 ceil 올림 floor 내림 --%>
		const pop_top = Math.ceil((window.screen.height - pop_height) / 2) - 100;					
								
		window.open(url,"ItemDetail",
					"left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height); 
		// px 을 붙이면 안된다.

		
	}
	
	
	function goItemUpdate(pk_fk_item_no){
		
		if(pk_fk_item_no == ''){
			location.href='<%= request.getContextPath() %>/item/itemRegister.run';
		}
		else{
			location.href='<%= request.getContextPath() %>/item/itemUpdate.run?pk_fk_item_no='+ pk_fk_item_no;			
		}
		
	}
	
	
</script>

<div style="margin-top:140px; text-align:center;">
     <p class="bg1">제품목록</p>
</div>

<div class="container-fluid" style="background-color:#fafafa;">

	<div class="row">
	
		<div class="container col-md-2 col-lg-3 my-5 p-4">
			<ul id="category_list" class="">
			<li class="pb-3 mt-0 h5"><a href="<%=request.getContextPath()%>/item/itemList.run">전체 카테고리</a></li>
			<c:forEach var="ctmap" items="${requestScope.categoryList}">
				<li class=""><a href="<%=request.getContextPath()%>/item/itemList.run?category_id=${ctmap.category_id}">${ctmap.category_name}</a></li>
			</c:forEach>
			</ul>
					
		</div>
		
		<div class="container-fluid col-md-10 col-lg-9 mt-5 ">
			<table id="itemTbl" class="table table-bordered" style="width: 90%; margin-top: 20px; border:none;">
		        <thead>
		           <tr>
		              <th>제품코드</th>
		              <th>카테고리명</th>
		              <th>제품명</th>
		              <th>제품가격</th>
		              <th>판매시간대</th>
		              <th>제품설명</th>
		           </tr>
		        </thead>
		        
		        <tbody>
		
		    		<c:if test="${not empty requestScope.ItemList}">
		    				<c:forEach var="ivo" items="${requestScope.ItemList}" > <%-- items 에는 배열이나 list 가 온다. --%>
		   					  <tr class="itemInfo">
					              <td class="item_no">${ivo.item_no}</td>
					              <td>${ivo.categoryName}</td>
					              <td>${ivo.item_name}</td>
					              <td>￦<fmt:formatNumber value="${ivo.item_price}" pattern="#,###"/></td>
					              
					              <c:choose>
					              	<c:when test="${ivo.morning_availability eq 0}">
					              	  <td>10:30AM~04:00AM</td>
					              	</c:when>
					              	<c:when test="${ivo.morning_availability eq 1}">
					              	  <td>4:00AM~10:30AM</td>
					              	</c:when>
									<c:otherwise>
									  <td>All time</td>
									</c:otherwise>					              			            
					              </c:choose>
					              
					              <td>					              
						              <c:if test="${fn:length(ivo.item_info) > 10}"> <%-- 10글자 이상인 경우 --%>
							              	<c:set var="item_info" value="${fn:substring(ivo.item_info, 0, 10)}"/>
							              	${item_info}...
						              </c:if>
						              
						              <c:if test="${!(fn:length(ivo.item_info) > 10)}"> <%-- 10글자 이상이 아닌 경우 --%>
							              	${ivo.item_info}
						              </c:if>
					              </td>
		          			  </tr>
		    				</c:forEach>
		    		</c:if>
		        
		        	<c:if test="${empty requestScope.ItemList}">
			    			<tr>
		 	    			  <td colspan="4">등록된 제품이 없습니다.</td>
			    			</tr>    	
		    		</c:if>
		
		        </tbody>
		    </table>	
		    
			<nav class="my-5">
		        <div style='display:flex; width:80%;'>
		          <ul class="itemListPage pagination" style='margin:auto;'>
		          	${requestScope.pageBar}
		          </ul>
		       </div>
		    </nav>
		    
		    <button class="btn btn-success" type="button" onclick="goItemUpdate('')">제품등록하기</button>
		    
		</div>
	
	</div>

</div>

<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>