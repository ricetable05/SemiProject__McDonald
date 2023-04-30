<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
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




</script>




	
	
	          <div class="topimage">
				      <div class="toptext">
				         <h1 class="titDep1">맥도날드 품질 이야기</h1>
				         <p style="margin-top: 15px;"> 우리가 엄격해질수록 버거는 더 맛있어지니까! </p>
				         <p>모두의 노력으로 엄격하고 꼼꼼하게 키워진 신선한 식재료가 모여, 마침내 맛있는 맥도날드 버거가 됩니다.</p>
				      </div>
				      <div class="toptext2">
				         <ul>
				            <li class="listfirst"><a href="<%= request.getContextPath()%>/main.run">Home</a></li>
				            <li class="listsecond"><a href="<%= request.getContextPath()%>/quality/qualityView.run">맥도날드 품질 이야기</a></li>
				         </ul>
				      </div>
			   </div>	
		
		
		<div id="container">
				
			<div class="content">		   
				
				
				<div class = "contArea" data-background="food01">	<!-- 버튼 누르면 해당하는 빵 음식 과일로 바뀌는 부분. 전체 백그라운드 -->   
					   
								 <div class="inner">  
								   
								   
								   			<ul class="tabType01">
								   			
								   				<li>
								   			
								   					<a href="<%= request.getContextPath()%>/quality/qualityView.run" role="button" data-tab="농장에서 레스토랑까지" class="on">농장에서 레스토랑까지</a>
								   			
								   			
								   				</li>
								   			
								   			</ul>
										   
							
										
											<!-- 유튜브 동영상 넣기 시작 -->
											 <div class="embed-responsive embed-responsive-21by9">
										
													<iframe width="560" height="315" src="https://www.youtube.com/embed/u2hLpzjQgvc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
								
										     </div>
											 <!-- 유튜브 동영상 넣기 끝 -->	
											 
												 
											
											
											<div class="topArea">
					
												<ul class="farmTab tabMn totaltabMn">
												
													<li class="totaltabMn">
													
														<a href="#tab01" role="button" class="originBT">
															원재료 준비와 가공	
														</a>
												
													</li>
												
												</ul>
					
					
											</div>
											
											<div class="bottomArea">
											
											
												<div id="tab01" class="tabCont" style="display:block">
											
													<p class="bottom_area_txtinfo">
														원재료 공급사에서는 좋은 재료를 준비하기 위해 엄격한 기준으로
														<br>
														원재료 수급 및 가공 과정을 관리하고 있습니다.
													</p>
													
													<ul class="foodTab subtabMn">
														
														<li class="food01">
															
															<a href="#subTab01" role="button">
																
																쇠고기 패티
															
															</a>
															
														</li>
														
														<li class="food02">
															
															<a href="#subTab02" role="button">
																
																																
																치킨패티
															
															</a>
															
														</li>
														
														<li class="food03">
															
															<a href="#subTab03" role="button">
																
																빵
															
															</a>
															
														</li>
														
														<li class="food04">
															
															<a href="#subTab04" role="button">
																
																양상추
															
															</a>
															
														</li>
														
														<li class="food05">
															
															<a href="#subTab05" role="button">
																
																토마토
															
															</a>
															
														</li>
														
														<li class="food06">
															
															<a href="#subTab06" role="button">
																
																달걀
															
															</a>
															
														</li>
														
														<li class="food07">
															
															<a href="#subTab07" role="button">
																
																치즈
															
															</a>
															
														</li>
														
														<li class="food08">
															
															<a href="#subTab08" role="button">
																
																양파
															
															</a>
															
														</li>
													
													
													</ul>
											
											
												</div>
											
											</div>
											
											
					
								</div>
		
		
		           </div>
		       
		       </div>
		
		</div>
		       
		       
		       

<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>

