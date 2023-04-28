<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.ivo.item_name}</title>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail/detailView.css" type="text/css"/>

<style type="text/css">

.user-warp{
background:url(<%= request.getContextPath() %>/images/top_image/맥모닝상단이미지.jpg) 50% 50% no-repeat;
}


	button.prev {
	
		border: none;
		cursor: pointer;
		
		width: 100px; 
		height: 100px; 
		
		background-color: orange;
		border-radius: 50%;
		
	}
	
		
	button.next {
	
	
		border: none;
		cursor: pointer;
		
		width: 100px; 
		height: 100px; 
		
		background-color: orange;
		border-radius: 50%;
		
	
	}
	
	p.prev {
	
		
		
		opacity: 0;
		
	}
	
	p.next {
	
		
		
		opacity: 0;
		
	}
	
	button.prev > img.prev {
	
		max-width: 100%; 
		height: auto; 

		margin-top: 30px;
		
	}
	
	button.next > img.next {
	
		max-width: 100%; 
		height: auto; 

		margin-top: 30px;
		
	}
	
	button.prev > img.prev_hover {
	
		max-width: 100%; 
		height: auto; 

		display: none;
		
		

	}
	
	button.next > img.next_hover {
	
		max-width: 100%; 
		height: auto; 

		display: none;

	}
	
		
	button.prev:hover  img.prev {
		
		max-width: 100%; 
		height: auto; 

		display: none;

		
	}
	
	
	button.next:hover  img.next {
		
		max-width: 100%; 
		height: auto; 

		 
		display: none;		
	
	}
	
	button.prev:hover  img.prev_hover {
		
		max-width: 100%; 
		height: auto; 

		display: block;
		
		margin: 5px auto;
		
	}
	
	
	button.next:hover  img.next_hover {
		
		max-width: 100%; 
		height: auto; 
		 
		display: block;
		
		margin: 5px auto;
		
	}
	
	
	button.prev:hover  p.prev {
		
		opacity: 1;
		
		font-weight:bold;
		
	}
	
	button.next:hover  p.next {
	
		opacity: 1;
		
		font-weight:bold;
		
	}
	
	


</style>



 <script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>



<script type="text/javascript">

		
$(document).ready(function() { 
	

	
	
	var accordion_tab = $('.accordion1 p'), accordion_content = $('.accordion1 div');
		//accordion p tag click
		accordion_tab.on('click', function(e){
			//tab link 비활성화
			e.preventDefault();
			//활성화 된 class 제거
			accordion_tab.removeClass('active');
			//accordion div 내용 숨기기
			accordion_content.slideUp('normal');
			//tab이 숨겨져 있으면 활성화 시키고 div 내용 펼치기
			if($(this).next().is(':hidden') == true) {
				$(this).addClass('active');
				$(this).next().slideDown('normal');
			 } 			  
	 });
	});
	
	

	

</script>




</head>
<body class="pt-5">

		
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>
	
	
<div name="total" >
				

			<div id="container"  >
					
					
				
					
					<div class="user-warp">
						<div class="user-image"></div>
						<div class="user-text">
							<h1 class="titDep1">맥모닝</h1>
							<p style="margin-top: 15px;">새벽 4시부터 오전 10시 30분까지 </p>
							<p>  갓 구워내 신선한 맥모닝으로 따뜻한 아침 식사를 챙겨 드세요!</p>
						</div>
						<div class="user-text2">
							<ul>
								<li class="listfirst"><a href="<%= request.getContextPath()%>/main.run">Home</a></li>
								<li class="listsecond"><a href="<%= request.getContextPath()%>/menu/burgerMain.run">Menu</a></li>
							</ul>
						</div>
					</div>
							
				
					
					<div id="contents"  >		
					
						<ul style="list-style-type: none;">
							 <li>${requestScope.ivo.item_name}<br></li> 
						</ul>
					</div>	
					
					
					
					
					
					
					
					
					<div id="visual" >	
					
							
								
						 <c:if test="${requestScope.ivo.item_no eq ((requestScope.ivo.fk_category_no*100) + requestScope.ivo_GetCategoryLength.ctLength-1)}">
						
									<script>
									
										$(document).ready(function(){
											
											$(".prev").prop("disabled",true);
											$(".prev").css("opacity", 0);
											$(".prev").css("cursor", "auto");
										});
									
									</script>
						
							</c:if>
								
							    <button class="prev" type="button" onclick="location.href='/SemiProject__McDonald/detail/mcMorningView.run?item_no=${requestScope.ivo_prev.item_no}'">
									   <img class="prev" src="<%=request.getContextPath()%>/images/joonyoung_img/prevIcon.png">
								   	   <img class="prev_hover" src="<%=request.getContextPath()%>/images/mc_moring/mc_morning_small/${requestScope.ivo_prev.item_image}">
								   		  <p class="prev" >${requestScope.ivo_prev.item_name}</p>
								   	  
								</button> 
							
						    
	
	
						    
							
							
					
						 
						<img id="burger" src="<%=request.getContextPath()%>/images/mc_moring/mc_morning_nbg/${requestScope.ivo.item_image}">
						
						
						
						
						
						    <c:if test="${requestScope.ivo.item_no eq (requestScope.ivo.fk_category_no*100)}">
						
								<script>
								
									$(document).ready(function(){
										
										$(".next").prop("disabled",true);
										$(".next").css("opacity", 0);
										$(".next").css("cursor", "auto");
									});
								
								</script>
						
							</c:if>
						
						
						
					
						
							<button class="next" type="button" onclick="location.href='/SemiProject__McDonald/detail/mcMorningView.run?item_no=${requestScope.ivo_next.item_no}'">
											
									 		
														
								     <img class="next" src="<%=request.getContextPath()%>/images/joonyoung_img/nextIcon.png">
								     <img class="next_hover" src="<%=request.getContextPath()%>/images/mc_moring/mc_morning_small/${requestScope.ivo_next.item_image}">
								     <p class="next">${requestScope.ivo_next.item_name}</p>
								     
								
							</button> 
						            
						            
						            
						          
						 
					</div>
					
					
					
					<div id="contents_2" >
						 
						
						            <p>${requestScope.ivo.item_info}</p>
					
					
					
					</div>
					
					
					
					<div class="accordion_wrap" >
						<div class="accordion1">                        	
							<section id="nutrients">
								<p id="nutrients"><a href="#nutrients">영양정보</a></p>
								<div>

										<table class="nutrients" >
											<th>영양소</th>
											<th>중량(g)</th>
											<th>중량(ml)</th>
											<th>열량</th>
											<th>당</th>
											<th>단백질</th>
											<th>포화지방</th>
											<th>나트륨</th>
											<th>카페인</th>
											
											
											<tr><!-- 첫번째 줄 시작 -->
											    <td>함량</td>
											    <td>${requestScope.ivo_detail.weight_g}</td>
											    <td>${requestScope.ivo_detail.weight_ml}</td>
											    <td>${requestScope.ivo_detail.calories}</td>
											    <td>${requestScope.ivo_detail.carbo}</td>
											    <td>${requestScope.ivo_detail.protein}</td>
											    <td>${requestScope.ivo_detail.fat}</td>
											    <td>${requestScope.ivo_detail.sodium}</td>
											    <td>${requestScope.ivo_detail.caffeine}</td>
											</tr><!-- 첫번째 줄 끝 -->
									    </table>


								</div>
							</section>			
							<section id="allergy">
								<p id="allergy"><a href="#allergy">알레르기 정보</a></p>
								<div>
									<p>알레르기 유발 가능 식재료</p> <h3>${requestScope.ivo_detail.allergens}</h3><br>
									<p>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</p>
								</div>
							</section>
					
							<section id="origin">
								<p id="origin"><a href="#origin">원산지 정보</a></p>
								<div>
									<p>${requestScope.ivo_detail.coa}</p>
								</div>
							</section>                          
						</div>
					</div>
					
			
	
		
	
			
		</div>
					

		
	</div>
	
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>
    

</body>
</html>