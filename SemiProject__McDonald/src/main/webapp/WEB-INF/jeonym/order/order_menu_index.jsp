<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>

<style type="text/css">
	div.card-footer{
		background:none;
	}
	
	hr {
		padding:0;
	}
</style>
<section style="background-color:#eee; width:80%; margin:0 auto;">
	<div class="container-fluid px-0 m-0" style="padding-top:8%;">
		   <div id="carouselBanners" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselBanners" data-slide-to="0" class="bg-dark active"></li>
			    <li data-target="#carouselBanners" data-slide-to="1" class="bg-dark"></li>
			    <li data-target="#carouselBanners" data-slide-to="2" class="bg-dark"></li>
			  </ol>
			  
			  
			   <div class="carousel-inner mycarousel">
			    
				    <div class="carousel-item active">
				      <img src="<%= request.getContextPath() %>/images/banner_1.jpg" class="d-block w-100" alt="..."> 
				      <div class="carousel-caption d-none d-md-block">  
				      </div>
				    </div>
				    <div class="carousel-item">
				      <img src="<%= request.getContextPath() %>/images/banner_2.jpg" class="d-block w-100" alt="...">
				      <div class="carousel-caption d-none d-md-block">
					  </div>		      
				    </div>
				    <div class="carousel-item">
				      <img src="<%= request.getContextPath() %>/images/banner_3.jpg" class="d-block w-100" alt="...">
				      <div class="carousel-caption d-none d-md-block">
					  </div>		      
				    </div>
		    
			  </div> 

			        
			</div>
		
			
			<div class="m-0 pt-1">
				<h4 class="ml-2"><span>세트 주문하기</span>
					<a class="ml-5 text-dark" href="#" style="text-decoration:none">
						<i class="fa-solid fa-caret-right fa-2xs" style="position:relative; top:2px; color: #d21920;"></i><span class="h6"> 세트 메뉴 모두 보기</span>
					</a>
				</h4>
			</div>
			
			
		  <div class="card-deck mb-4">
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/빅맥.png" class="card-img-top" alt="...">
			     	<h5 class="font-weight-light"><small>빅맥®</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>702kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order ">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/더블불고기버거.png" class="card-img-top" alt="...">
			     	<h5 class="font-weight-light"><small>더블 불고기 버거</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>635kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/더블쿼터파운더.png" class="card-img-top" alt="...">
			     	<h5 class="font-weight-light"><small>더블 쿼터파운더® 치즈</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>770kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/맥스파이시상하이버거.png" class="card-img-top" alt="...">
			    	<h5 class="font-weight-light"><small>맥스파이시® 상하이 버거</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>501kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/맥크리스피디럭스버거.png" class="card-img-top" alt="...">
			      	<h5 class="font-weight-light"><small>맥크리스피™ 디럭스 버거</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>600kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
		</div>
		
		<div class="card-deck">
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/맥크리스피클래식버거.png" class="card-img-top" alt="...">
			     	<h5 class="font-weight-light"><small>맥크리스피™ 클래식 버거</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>588kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order ">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/슈니언버거.png" class="card-img-top" alt="...">
			     	<h5 class="font-weight-light"><small>슈니언 버거</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>552kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/쿼터파운더치즈버거.png" class="card-img-top" alt="...">
			     	<h5 class="font-weight-light"><small>쿼터파운더® 치즈</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>536kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/트리플치즈버거.png" class="card-img-top" alt="...">
			    	<h5 class="font-weight-light"><small>트리플 치즈버거</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>620kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-body text-center">
			    	<img src="<%= request.getContextPath() %>/images/1955트리플어니언버거.png" class="card-img-top" alt="...">
			      	<h5 class="font-weight-light"><small>1955 트리플 어니언 버거</small></h5>
			    </div>
			    <hr/>
			    <div class="card-footer border-0 row">
			    	<div class="col-6 p-2 pl-4">
			    		<i class="fa-solid fa-circle-info fa-2xs pr-2" style="color: #04ecdd;"></i>702kcal
			    	</div>
			    	<div class="col-6 px-0">
			    		<a class="btn h6 btn-fast-order">빠른주문</a>
			    	</div>
			    </div>
			  </div>
		</div>
			
	</div>		
</section>

<section style="background-color:#eee; width:80%; margin:0 auto;" class="pt-5">
	<div class="container-fluid px-0">
		
		<h4 class="ml-2">맥딜리버리 이용 방법!</h4>
		<a href="#">
			<img src="<%= request.getContextPath() %>/images/how_mcdelivery_works_ko.png" alt="이미지가 없습니다." width="100%"/>
		</a>
		
	</div>
</section>
<jsp:include page="/WEB-INF/header_footer/footer.jsp"></jsp:include>