<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<style type="text/css">
	
	ul#category_list {
		width: 202px;
		list-style-type: none;
		padding: 0;
		margin: 0;
	}
	
	ul#category_list > li{
		width: 200px;
		margin: 0px auto 10px auto;
	}
	
	ul#category_list > li:last-child{
		margin: 0px auto;
	}
	
	
	ul#category_list > li:hover{
		background-color: #ccc;
	}
	
	
	ul#category_list li > a{
		text-decoration: none;
		color: black;
		font-weight: bold;
		margin-left:50px;
	}
	
</style>

<script type="text/javascript">
	
	
	
</script>


<div class="container-fluid border border-danger" style="margin-top:100px; background-color:#f2f2f2;">

	<div class="row">
	
		<div class="container col-md-2 col-lg-3 my-5 p-4">
			<ul id="category_list" class="border border-primary" style="background-color:white">
			<li class="mb-3 mt-0"><a href="<%=request.getContextPath()%>/item/itemRegister.run">전체 카테고리</a></li>
			<c:forEach var="ctmap" items="${requestScope.categoryList}">
				<li><a href="<%=request.getContextPath()%>/item/itemRegister.run?category_id=${ctmap.category_id}">${ctmap.category_name}</a></li>
			</c:forEach>
			</ul>
					
		</div>
		
		<div class="container col-md-10 col-lg-9 mt-5 border border-danger">
				제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.
				제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.
				제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.
				제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.
				제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.
				제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.
				제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.제품목록입니다.
		</div>
	
	</div>

</div>

<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>