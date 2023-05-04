<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${requestScope.ivo.item_name}</title>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail/detailView.css" type="text/css"/>






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
		
		
		let prev_item_no = "";
		
	     $.ajax({ // lag 용 ajax 
            url:"<%= request.getContextPath()%>/detail/get_lag_item_no.run",
            type:"post",
            data:{"item_no":"${requestScope.ivo.item_no}",
           	   "fk_category_no":"${requestScope.ivo.fk_category_no}"},
            dataType:"json",
            success:function(json){
           	 
               
           //    console.log(JSON.stringify(json));
             
               const prev_name = json.lag_item_name;
               
               var prev_item_image = json.lag_item_image;
               
                prev_item_no = json.lag_item_no;
               
               $("p.prev_item_name").text(prev_name);
               
               
               if(prev_item_no != null){
               	
               	 var prev_it_image =  prev_item_image.replace(".png","_small.png");
	                
	                prev_src =  "<%=request.getContextPath()%>/images/" + prev_it_image;  

	                
	                $("img.prev_image").attr("src",  prev_src);
               	
               	
               }
               
				else  {
               	
               	
               	$("button.prev").prop("disabled",true);
               	$("button.prev").css("opacity", 0);
               	$("button.prev").css("cursor", "auto");
               	
               }

               
            //   console.log("prev_item_no : " +prev_item_no);
               

               
            },
            error: function(request, status, error){
                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                }
         }); // ajax lag 용
	     
	     
		
	
        $("button.prev").click(function(){
       	 
       	 location.href='<%= request.getContextPath()%>/detail/dessertView.run?item_no='+ prev_item_no;
       	 
        });
         
         
         
         
         
         
        
         
         
        let next_item_no = "";
		
	     $.ajax({ // lead 용 ajax
            url:"<%= request.getContextPath()%>/detail/get_lead_item_no.run",
            type:"post",
            data:{"item_no":"${requestScope.ivo.item_no}",
           	   "fk_category_no":"${requestScope.ivo.fk_category_no}"},
            dataType:"json",
            success:function(json){
           	 
               
           //    console.log(JSON.stringify(json));
             
               const next_name = json.lead_item_name;
               
               var next_item_image = json.lead_item_image;
               
               next_item_no = json.lead_item_no;
               
               $("p.next_item_name").text(next_name);
               
        //       console.log("next_item_no : " + next_item_no); 
               
               if(next_item_no != null){
               	
               	 var next_it_image =  next_item_image.replace(".png","_small.png");
	                
               	 next_src =  "<%=request.getContextPath()%>/images/" + next_it_image;  

	                
	                $("img.next_image").attr("src",  next_src);
	
               }
               
               
               else  {
               	
               	
               	$("button.next").prop("disabled",true);
               	$("button.next").css("opacity", 0);
               	$("button.next").css("cursor", "auto");
               	
               }

               

               
            },
            error: function(request, status, error){
                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                }
         }); // ajax lead 용
         

         
			$("button.next").click(function(){
       	 
       	 location.href='<%= request.getContextPath()%>/detail/dessertView.run?item_no='+ next_item_no;
       	 
        });
		
		
		
		
		
	});
	
	

	

</script>


<style type="text/css">


.topimage{
background:url(/SemiProject__McDonald/images/디저트상단이미지.png) 50% 50% no-repeat;
}


</style>



</head>
<body class="pt-5">

		
<jsp:include page="/WEB-INF/header_footer/header.jsp"></jsp:include>
	
	
<div name="total" >
				

<div id="container">
					
					
				
					
	<div class="topimage">
		<div class="toptext">
			<h1 class="titDep1">디저트</h1>
			<p style="margin-top: 15px;">버거를 푸짐하게 즐기고 난 후!</p>
			<p>가볍게 즐기는 디저트메뉴!</p>
		</div>
		<div class="toptext2">
			<ul>
				<li class="listfirst"><a href="<%= request.getContextPath()%>/main.run">Home</a></li>
								<li class="listsecond"><a href="<%= request.getContextPath()%>/menu/dessertMain.run">Menu</a></li>
			</ul>
		</div>
	</div>
							
				
					
	<div id="contents"  >		
	
		<ul style="list-style-type: none;">
			 <li>${requestScope.ivo.item_name}<br></li> 
		</ul>
	</div>	
					
			
					
	<div id="visual" >	
		
		  <button class="prev" type="button">

			 	  <img class="prev" src="<%=request.getContextPath()%>/images/prevIcon.png">
				  
				  <img class="prev_image" src="">
				    
			   	  <p class="prev_item_name"></p>
			   	  
		  </button> 

		<img id="burger" src="<%=request.getContextPath()%>/images/${fn:replace(requestScope.ivo.item_image,'.png','_nbg.png')}">
			<button class="next" type="button">
									
												
						     <img class="next" src="<%=request.getContextPath()%>/images/nextIcon.png">
						     
						     <img class="next_image" src="">
						     
						     <p class="next_item_name"></p>
					
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