<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%	String ctxPath = request.getContextPath(); %>   
    
<title>Story > 맥도날드 품질 이야기</title>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/quality/qualityView.css" type="text/css"/>


 <script src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>


<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>

<script type="text/javascript">

// 누른 사진만 원래 색상으로 되고 나머지를 흑백으로 바꾸는 jQuery

$(document).ready(function() {
  // 첫 번째 버튼에 대한 click 이벤트 핸들러 호출

    myFunction();
    myFunction2();
    myFunction3();
    myFunction4();
  $('.subChange:first-child').trigger('click'); // 로드되자마자 트리거로 첫번쨰 버튼을 클릭하게끔 한다.
  
});

function myFunction(){
	
	$('.subChange').click(function() {
		$(this).removeClass('subactive'); // 현재 클릭한 버튼에 subactive 클래스를  제거
 	    $('.subChange').not(this).addClass('subactive'); // 현재 클릭한 버튼이 아닌 다른 버튼의 subactive 클래스를 추가
 	   // 변경할 문자열

	});
	
}

function myFunction2(){
	
	$('.subChange').click(function(){
		
		
		var img_src = $(this).attr("src");
		img_src = img_src.replace("온.png", "배경.jpg");
	    $("#container").css("background-image", "url('" + img_src + "')");
	});

}

function myFunction3(){
	
	$('.subChange').click(function(){
		
		
		var box_img_src = $(this).attr("src").replace("온.png", "상세.png");
	    $("img.box_img").attr("src", box_img_src);
	    
	});

}

function myFunction4(){
	
	$('.subChange').click(function() {
		
		  var clickedId = $(this).attr('id');
	  
		  $('.box_text p.'+ clickedId ).css('display','block');
		  
		  
		  
		  $('.box_text p').not('.' + clickedId).each(function() {
			  
			 var nonclickedId = $(this).attr('class');
			 $('.box_text p.'+nonclickedId).css('display','none');

		  });

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

		<div class = "BigArea" >	
			   
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
																							
												<a  class="originBT" disabled>
													원재료 준비와 가공	
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
																		<img id="A1" class="subChange" src="<%= ctxPath%>/images/품질이야기_패티온.png" alt="쇠고기 패티">
															
															
														
															
																
																		<img id="A2" class="subChange" src="<%= ctxPath%>/images/품질이야기_치킨온.png"  alt="치킨패티">
															
															
														
															
																
																		<img id="A3" class="subChange" src="<%= ctxPath%>/images/품질이야기_빵온.png"  alt="빵">
															
															
														
															
																
																		<img id="A4" class="subChange" src="<%= ctxPath%>/images/품질이야기_양상추온.png"  alt="양상추">
															
															
														
															
																
																		<img id="A5" class="subChange" src="<%= ctxPath%>/images/품질이야기_토마토온.png"  alt="토마토">
															
															
														
															
																
																		<img id="A6" class="subChange" src="<%= ctxPath%>/images/품질이야기_달걀온.png"  alt="달걀">
															
															
														
															
																
																		<img id="A7" class="subChange" src="<%= ctxPath%>/images/품질이야기_치즈온.png"  alt="치즈">
															
															
														
															
																
																		<img id="A8" class="subChange" src="<%= ctxPath%>/images/품질이야기_양파온.png" 	 alt="양파">
													
													</div>
																						
													<div class="box_change">
													
													
															<div class="box_img">
														
 																		<img class="box_img" src="" alt="상세" >
																												
															</div>
																										
															<div class="box_text">
																
																<p class="A1" id="A_1"> 호주 청정 지역에서 키운 무방부제 &nbsp; 무첨가제 <br> 100% 순 쇠고기 패티   </p>
																
																<p class="A1"> 맥도날드 쇠고기 패티는 청정한 호주 대자연에서 깨끗함을 먹고 자란 100% 순 <br> 쇠고기로만 제조되며, 어떠한 첨가물이나 방부제도 사용되지 않았습니다.   </p>	
																												
																<p class="A1"> '쇠고기 이력번호’를 통해 생산부터 유통과정까지 철저하게 확인하고 있으며,<br> 식품 안전 기준에 맞는 쇠고기만을 사용하기 위하여 만전을 기하고 있습니다.   </p>
																
																<p class="A1" id="A_bt">* 쇠고기 이력번호 : 수입쇠고기유통이력관리시스템 사이트에서 조회 시 쇠고기의 세부 정보 <br> (수출국 도축장, 가공장, 수출업체 및 도축, 수입일자 등)를 확인할 수 있는 번호   </p>	
														
																<p class="A2" id="A_2"> 신선하고 안전한 재료로<br> 엄선하여 만든 치킨 패티 </p> 
																
																<p class="A2"> 맥도날드 치킨 패티는 세계보건기구(WHO)에서 공표한 ‘주요항생제리스트<br>(HPCIA)’ 에 포함된 항생제 및 방부제를 사용하지 않으며, 식약처 등 정부<br>에서 인증한 안전한 재료를 사용합니다.</p>
																
																<p class="A2">또한, 맥도날드의 동물 복지 기준 (McDonald’s Animal Health &nbsp; Welfare)을<br> 준수하는 도축장, HACCP &nbsp; FSSC22000 인증 시설에서 생산됩니다.</p>
																
																<p class="A2">맥스파이시 상하이 버거에는 국내산 통 닭가슴살을 사용합니다.</p>
																
																<p class="A2" id="A_bt">* HPCIA(High Priority Critically Important Antimicrobials) : 사람에게 처방되는 항생제로<br> 동물에게 사용될 경우, 이를 취식하는 사람에게도 영향을 줄 수 있는 항생제</p>
																
																<p class="A3" id="A_3">매일 구워 배송 받는 햄버거 빵</p>
																
																<p class="A3">맥도날드에서 사용하는 햄버거 빵은 국제식품안전협회(GFSI*)의<br> 식품안전시스템 규격 인증을 받은 공장에서, 60년 이상의 햄버거 빵 제조 기술<br>을 바탕으로 생산된 우수한 품질의 제품입니다.</p>
																
																<p class="A3">신선한 햄버거 빵을 고객들께 제공하게 위해, 하루 수요량에 맞춰 국내에서 직접<br> 구운 햄버거 빵을 사용합니다. 레스토랑으로 배송을 받을 때는 외부 오염<br>을 차단한 전용 탑차를 이용하여 신선도를 유지합니다.</p>
																
																<p class="A3" id="A_bt">* GFSI (Global Food Safety Initiative) : 소비자에게 안전한 식품의 공급을 보장하기 위해, 식품 안전 관리<br> 시스템의 지속적인 개선을 목표로 설립된 국제식품안전협회</p>
																
																<p class="A3" id="A_bt_red">* 맥도날드에서 사용하는 햄버거 빵은 GFSI가 공인하는  식품안전경영시스템 (FSSC-22000)을<br> 인증 받은 공장에서 생산되고 있습니다.</p>
																
																<p class="A4" id="A_4">국제적인 우수 농산물 품질 관리 인증 제조사에서 공급하는<br> 신선한 양상추</p>
																
																<p class="A4">농지의 물은 깨끗한지, 토양의 영양분은 풍부한지 농지 주위에 오염 요소는<br> 없는지, 양상추가 자라는 농장부터 꼼꼼히 확인합니다.</p>
																
																<p class="A4">수확된 양상추는 3번 이상 꼼꼼하게 세척하며, 신선함을 유지하기 위해<br> 진공으로 포장하여, 가공한 지 2일 이내 배송센터로 배송됩니다.</p>
																
																<p class="A4" id="A_bt">* 국제적인 우수 농산물 품질 관리 시스템 인증 : 농산물의 생산단계부터 수확 후 포장단계까지<br> 물과 토양관리에서부터 농약,비료,중금속,미생물 등 신선농산물의 위해요소를 일정 허용수준<br> 이하로 관리하는 제도이며, 농산물의 안전성 확보를 위한 기준</p>
																
																<p class="A4" id="A_bt_red">* 자연 재해 등 불가피한 경우가 발생될 경우, 수급 업체가 변동될 수 있습니다.</p>
																
																<p class="A5" id="A_5">우리 땅에서 건강하게 키운 100% 국내산 토마토</p>
																
																<p class="A5">맥도날드에서는 우리 땅, 좋은 흙에서 정성껏 재배하여 수확한 100% 국내산<br> 토마토만을 사용합니다.</p>
																
																<p class="A5">모든 토마토는 수확 후 식품 안전을 위해 2회 이상을 거쳐 꼼꼼하게 세척되며,<br> 이후 살균 공정 과정까지 거쳐 신선하게 공급됩니다.</p>
																
																<p class="A6" id="A_6">우수한 품질의 국내산 1+ 등급 계란</p>
																
																<p class="A6">표면 세척과 UV 살균 등 꼼꼼한 위생 처리를 거친 뒤, 레스토랑에서 조리될<br> 때까지 7°C 이하로 냉장 보관되어 최상의 신선함을 자랑합니다.</p>
																
																<p class="A6" id="A_bt_red">* 자연 재해 등 불가피한 경우가 발생될 경우, 수급 업체가 변동될 수 있습니다.</p>
																
																<p class="A7" id="A_7">치즈 본연의 풍미가 가득한 뉴질랜드 방목 치즈</p>
																
																<p class="A7">청정 뉴질랜드의 목초지에서 자연 방목으로 풀을 먹인 젖소의 원류로 제조하여<br> 치즈 본연의 풍미가 가득하며,고소하고 풍부한 맛을 자랑합니다.</p>
																
																<p class="A8" id="A_8">HACCP 인증 완료한 시설에서 공급하는 신선한 양파</p>
																
																<p class="A8">맥도날드에서 사용되는 모든 양파는 최고의 위생 시설과 관리 하에 꼼꼼한<br> 살균과 세척 과정을 거친 후, 진공포장을 통해 더욱 더 안전하고 신선하게<br> 공급됩니다.</p>
																												
															</div>
													</div>
												</div>												
										</div>			
			 				 </div>			  
			           </div>			       
			     </div>
<div class="ft">		       
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>
		       
</div>		       


