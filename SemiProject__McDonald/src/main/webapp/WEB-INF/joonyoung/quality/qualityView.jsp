<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%	String ctxPath = request.getContextPath(); %>   
    
<title>Story > 맥도날드 품질 이야기</title>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/quality/qualityView.css" type="text/css"/>

<style type="text/css">

.topimage{
background:url(<%= request.getContextPath() %>/images/품질이야기상단이미지.jpg) 50% 50% no-repeat;
}


</style>

 <script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>


<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>



<script type="text/javascript">

// 누른 사진만 원래 색상으로 되고 나머지를 흑백으로 바꾸는 jQuery

$(document).ready(function() {
  // 첫 번째 버튼에 대한 click 이벤트 핸들러 호출
  
  myFunction(); // 클릭하게 된다면 발생하는 함수호출.
  $('.subChange:first-child').trigger('click'); // 로드되자마자 트리거로 첫번쨰 버튼을 클릭하게끔 한다.

  
});




function myFunction(){
	
	$('.subChange').click(function() {
 		$(this).removeClass('subactive'); // 현재 클릭한 버튼에 active 클래스를 추가 혹은 제거
 	    $('.subChange').not(this).addClass('subactive'); // 현재 클릭한 버튼이 아닌 다른 버튼의 active 클래스를 제거
 		
 	    
	
	});
	
}




// $(document).ready(function() {  
	
// 	  $('.subChange').click(function() {
// 		$(this).removeClass('subactive'); // 현재 클릭한 버튼에 active 클래스를 추가 혹은 제거
// 	    $('.subChange').not(this).addClass('subactive'); // 현재 클릭한 버튼이 아닌 다른 버튼의 active 클래스를 제거
// 	  });
// 	});







</script>




	
	
	          <div class="topimage">
				      <div class="toptext">
				         <h1 class="titDep1">맥도날드 품질 이야기</h1>
				         <p style="margin-top: 15px;"> 우리가 엄격해질수록 버거는 더 맛있어지니까! </p>
				         <p>모두의 노력으로 엄격하고 꼼꼼하게 키워진 신선한 식재료가 모여, 마침내 맛있는 맥도날드 버거가 됩니다.</p>
				      </div>
				      <div class="toptext2">
				         <ul>
				            <li class="listfirst"><a href="<%= ctxPath%>/main.run">Home</a></li>
				            <li class="listsecond"><a href="<%= ctxPath%>/quality/qualityView.run">맥도날드 품질 이야기</a></li>
				         </ul>
				      </div>
			   </div>	
		
		
		<div id="container">
				
			<div class="content">		   
				
				
				<div class = "BigArea" data-background="food_1">	<!-- 버튼 누르면 해당하는 빵 음식 과일로 바뀌는 부분. 전체 백그라운드 -->   
					   
								 <div class="inner">  
								   
								   
								   			<div class="TopTab">
								   						
								   											   			
								   					<a href="<%= ctxPath%>/quality/qualityView.run" role="button" class="on">농장에서 레스토랑까지</a>
								   			
								   											   			
								   			</div>
										   
							
										
											<!-- 유튜브 동영상 넣기 시작 -->
											 <div class="embed-responsive embed-responsive-21by9">
										
													<iframe width="560" height="315" src="https://www.youtube.com/embed/u2hLpzjQgvc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
								
										     </div>
											 <!-- 유튜브 동영상 넣기 끝 -->	
											 
												 
											
											
											<div class="topArea">
																									
														<a href="#tab01" class="originBT">
															원재료준비와 가공	
														</a>
						
											</div>
											
											<div class="bottomArea">
											
											
															<div id="tab01" class="tabCont">
														
																<p class="bottom_area_txt">
																	원재료 공급사에서는 좋은 재료를 준비하기 위해 엄격한 기준으로
																	<br>
																	원재료 수급 및 가공 과정을 관리하고 있습니다.
																</p>
																
															</div>
													
													
													
															<div class="subtabArea">
																
																	
																	<button type="button" class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_패티온.png" alt="쇠고기 패티">
																	
																	</button>
																	
																
																	
																	<button type="button"  class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_치킨온.png"  alt="치킨패티">
																	
																	</button>
																	
																
																	
																	<button type="button"  class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_빵온.png"  alt="빵">
																	
																	</button>
																	
																
																	
																	<button type="button"  class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_양상추온.png"  alt="양상추">
																	
																	</button>
																	
																
																	
																	<button type="button"  class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_토마토온.png"  alt="토마토">
																	
																	</button>
																	
																
																	
																	<button type="button"  class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_달걀온.png"  alt="달걀">
																	
																	</button>
																	
																
																	
																	<button type="button"  class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_치즈온.png"  alt="치즈">
																	
																	</button>
																	
																
																	
																	<button type="button" class="subChange">
																		
  																		<img src="<%= ctxPath%>/images/품질이야기_양파온.png" 	 alt="양파">
																	
																	</button>
																	
															
															
															</div>
													
													
												
													
													
											
											
											
											</div>
											
											
					
								</div>
		
		
		           </div>
		       
		       </div>
		
		</div>
		       
		       
		       

<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>

