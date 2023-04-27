<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/header_footer/header.jsp"/>

<style type="text/css">

	table#tblProdInput {border: solid gray 1px; 
                       border-collapse: collapse; }
                       
    table#tblProdInput td {border: solid gray 1px; 
                          padding-left: 10px;
                          height: 50px; }
                          
    .prodInputName {background-color: #e6fff2; 
                    font-weight: bold; }                                                 
   
   .error {color: red; font-weight: bold; font-size: 9pt;}
   
   table#tbl_item_info > tbody > tr > td {
   	 text-align: center;
   	 border: none;
   	 padding:0;
   }
   
   table#tbl_item_info > thead > tr > th{
   	 text-align: center;
   	 width: 80px;
   }
   
   .item_nut {
   	 width: 60px;
   }
    
   

</style>

<script type="text/javascript">

	$(document).ready(function(){
		

		
		$("span.error").hide(); // error 메시지 hide
		
		const allergens_obj = {"난류":"egg", "우유":"milk", "대두":"bean"
							  , "밀":"wheat", "토마토":"tomato", "복숭아":"peach", "쇠고기":"beef", "돼지고기":"pork"
							  , "닭고기":"chicken", "새우":"shrimp", "굴":"oyster", "조개":"shellfish"};
		
		
		const arr_allergens_key = Object.keys(allergens_obj); // 객체들의 키값만을 가져온다. 
		//console.log(Object.keys(allergens_obj));
		
		$.each(arr_allergens_key ,function(i, element) {
			
			//console.log(allergens_obj[element]);
			$("tr#allergens_th").append('<th width="8%"><label for="'+allergens_obj[element]+'">'+element+'</label></th>');
			
		});
		
		$.each(arr_allergens_key ,function(i, element) {
		
			$("tr#allergens_td").append('<td width="8%"><input id="'+allergens_obj[element]+'" value="'+element+'" type="checkbox" class="item_aller" /></td>');
			
		});
		
///////////////////////////////////////// 	초기값 세팅   ///////////////////////////////////////////////////////////////		

		
		for(let i=0; i<$("input.item_nut").length;i++){  // 만약에 영양정보의 값이 0 이라면 공백으로 설정되도록 
			
			if($("input.item_nut").eq(i).val() == '0'){
				$("input.item_nut").eq(i).val('');
			} 
			
		} 
		
		
		
		$("select[name='fk_category_no']").val('${requestScope.ivo.fk_category_no}'); // 카테고리 초기설정	
		$("input:text[name='item_name']").val('${requestScope.ivo.item_name}'); // 제품명 초기설정
		
		// 이미지는 보안상 value 값을 지정할 수 없다고 한다.
		
		$("input:text[name='item_price']").val('${requestScope.ivo.item_price}'); // 제품판매가 초기설정
		$("select[name='morning_availability']").val('${requestScope.ivo.morning_availability}'); // 판매시간대 초기설정
		$("input:radio[name='is_burger']:input[value='${requestScope.ivo.is_burger}']").prop("checked", true); // 버거여부 초기치 설정
		$("input:text[name='item_price']").val('${requestScope.ivo.item_price}'); // 제품판매가 초기설정
		$("textarea[name='item_info']").val('${requestScope.ivo.item_info}'); // 제품판매가 초기설정
		
		
		
		
		const allerList = '${requestScope.ivo.itemDetailVO.allergens}'.split(','); // 알레르기 정보 초기설정
		document.querySelectorAll("input.item_aller").forEach(function(item) {
			
			allerList.forEach(function(elt) {
				
				if(item.value == elt){
					item.checked = true; // javaScript check
				}
				return false; // break
				
			});
		});


		
	   
        $(document).on("change", "input.img_file", function(e){ // 이미지 추가할 때 이미지 미리보기 기능
        
        	const input_file = $(e.target).get(0);
	        const fileReader = new FileReader();
	         
	         fileReader.readAsDataURL(input_file.files[0]); // FileReader.readAsDataURL() --> 파일을 읽고, result속성에 파일을 나타내는 URL을 저장 시켜준다.
	      
	          fileReader.onload = function() { // FileReader.onload --> 파일 읽기 완료 성공시에만 작동하도록 하는 것임. 
	             document.getElementById("previewImg").src = fileReader.result;
	             $("img#previewImg").show();
	         };
        }); // end of $(document).on("change", "input.img_file", function(e){}) ---------------------------
       
       // == 제품이미지 또는 추가이미지 파일을 선택하면 화면에 이미지를 미리 보여주기 끝  == //
       
       
       
       $(".infoData").change(function(e){ // infoData 에 change 이벤트가 실행되면 에러 메시지 사라지도록
    	   $(e.target).parent().find("span.error").hide();
       });
       
       
       // 제품등록하기
       $("input#btnRegister").click(function(){
    	  
    	   let flag = false;
    	   
    	   $(".infoData").each(function(i, elmt){
    			const val = $(elmt).val().trim();
    			if(val == ""){
    				$(elmt).parent().find("span.error").show();  // 필수입력사항중에 값이 비어있는 것이 있다면 에러메시지를 보여주고
    				flag = true; // flag 가 true 가 되면 submit 이 되지 않는다.
    				return false; // break와 같은 기능
    			}
       	   });// end of $(".infoData").each(function(i, elmt){}) ------------------ 
    	   
    	   if(!flag && regExpCheck()){ // regExpCheck() 정규표현식 check
				
    		   
    		   
    		   const frm = document.prodInputFrm;
    		    
				let arr_allergens = [];
				document.querySelectorAll("input.item_aller").forEach(function(item) {
					
					if(item.checked){
						arr_allergens.push(item.value);
					}
				
				});
				// alert(arr_allergens.join(','));
				$("input[name='allergens']").val(arr_allergens.join(',')); // 알러지 정보 실어서 보냄
				frm.submit();  
    	   }
    	   else{
    		   return;
    	   }
    	   
    	   
       });
       
       // 취소하기
       $("input[type='reset']").click(function(){
    	  	$("span.error").hide();
    	  	$("img#previewImg").hide();
       });
       
		
	}); // end of $(document).ready(function(){})===============================
		
		
	function regExpCheck(){
		
		let bool = true;
		// val() 이 비어있지 않는 것만 검사
		// 검사할 elt 들은 따로 클래스를 둘 것
		// 하나라도 정규표현식을 통과하지 못하면 alert() 를 띄우고 bool 을 false 로 바꿀 것
		
		// 		/^(\d{1,3})([.]\d{0,1}?)?$/g; 소수점 정규표현식
		
		let regExp = /^\d{4,5}$/g;
		
		if(!regExp.test($("input:text[name='item_price']").val())){ // 제품가격의 val() 이 공백이 비어있지 않고 정규표현식에 만족하면
			alert('제품가격이 정규표현식에 맞지 않습니다.');
			bool = false;
		}
		
		
		regExp = /^(\d{1,3})([.]\d{0,1}?)?$/g;
		
		if($("input.ft").val().trim() != '' && !regExp.test($("input.ft").val())){ // 포화지방의 val() 이 공백이 비어있지 않고 정규표현식에 만족하면
			alert('포화지방이 정규표현식에 맞지 않습니다.');
			bool = false;
		}
		
		regExp = /^[0-9]+$/; // 최소 1자리의 정수만 허용하겠다.

		$("input.dec").each(function(i, elt) {
				
			if(elt.value != '' && !regExp.test(Number(elt.value))){
				alert(elt.name + '이 정규표현식에 맞지 않습니다.');
				bool = false;
			}	
			
		});
		
		
		
		
		
		
		return bool;
	}
		
</script>		
	
<div align="center" style="margin-bottom: 20px; margin-top:200px;">

<div style="border: solid green 2px; width: 250px; margin-top: 20px; padding-top: 10px; padding-bottom: 10px; border-left: hidden; border-right: hidden;">       
   <span style="font-size: 15pt; font-weight: bold;">제품등록&nbsp;[관리자전용]</span>   
</div>
<br/>

<%-- !!!!! ==== 중요 ==== !!!!! --%>
<%-- 폼에서 파일을 업로드 하려면 반드시 method 는 POST 이어야 하고 
     enctype="multipart/form-data" 으로 지정해주어야 한다.!! --%>
<form name="prodInputFrm"
      action="<%= request.getContextPath()%>/main.run"
      method="POST"                         
      enctype="multipart/form-data"> 
      
<table id="tblProdInput" style="width: 80%;">
<tbody>
   <tr>
      <td width="25%" class="prodInputName" style="padding-top: 10px;">카테고리</td>
      <td width="75%" align="left" style="padding-top: 10px;" >
         <select name="fk_category_no" class="infoData">
            <option value="">:::선택하세요:::</option>
            
           	<c:forEach var="map" items="${requestScope.categoryList}">
           		<option value="${map.category_id}">${map.category_name}</option>
           	</c:forEach>
           	
         </select>
         <span class="error">필수입력</span>
      </td>   
   </tr>
   <tr>
      <td width="25%" class="prodInputName">제품명</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;" >
         <input type="text" style="width: 300px;" name="item_name" class="box infoData" />
         <span class="error">필수입력</span>
      </td>
   </tr>
   <tr>
      <td width="25%" class="prodInputName">제품이미지</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
         <input type="file" name="item_image" class="infoData img_file" accept='image/*' /><span class="error">필수입력</span> <%-- accept 속성은 서버로 업로드할 수 있는 파일의 타입을 명시합니다. --%>
      </td>
   </tr>
   <tr>
      <td width="25%" class="prodInputName">제품판매가</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
         <input type="text" style="width: 100px;" name="item_price" class="box infoData" /> 원
         <span class="error">필수입력</span>
      </td>
   </tr>
   <tr>
      <td width="25%" class="prodInputName">시간별판매여부</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
         <select name="morning_availability" class="infoData">
            <option value="">:::선택하세요:::</option>
            
           	<option value="0">저녁</option>
           	<option value="1">아침</option>
           	<option value="2">상시판매</option>
           
         </select> 
         <span class="error">필수입력</span>
      </td>
   </tr>
   <tr>
      <td width="25%" class="prodInputName">버거여부</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
         <label class="mx-2" for="burger">O</label><input id="burger" class="infoData mr-2" type="radio" name="is_burger" value="1" >
         <label class="mx-2" for="non-burger">X</label><input id="non-burger" class="infoData" type="radio" name="is_burger" value="0">
	     <span class="error">필수입력</span>
      </td>
   </tr>  
   
   <tr>
      <td width="25%" class="prodInputName">제품설명</td><%-- null 허용 --%>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;">
         <textarea name="item_info" rows="5" cols="60"></textarea>
      </td>
   </tr>    
    <%-- ==== 이미지파일 미리보여주기 ==== --%>
    <tr>
          <td width="25%" class="prodInputName" style="padding-bottom: 10px;">이미지파일 미리보기</td>
          <td>
             <img id="previewImg" width="300" />
          </td>
    </tr>
    <tr>
      <td width="25%" class="prodInputName">영양정보</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;" >
		 
		 <table id="tbl_item_info" style="table-layout: fixed">
		 		<thead>	
		 		<tr>
					<th width="10%"><label for="weight_g">중량(g)</label></th>
			 		<th width="10%"><label for="weight_ml">중량(ml)</label></th>
			 		<th width="10%"><label for="calories">열량(kcal)</label></th>
					<th width="10%"><label for="carbo">당(g)</label></th>
					<th width="10%"><label for="protein">단백질(g)</label></th>
					<th width="10%"><label for="fat">포화지방(g)</label></th>
					<th width="10%"><label for="sodium">나트륨(g)</label></th>
					<th width="10%"><label for="caffeine">카페인(mg)</label></th>
		 		</tr>
		 		</thead>
		 		<tbody>
				<tr>
					<td width="10%"><input type="text" id="weight_g" class="item_nut dec" name="weight_g" maxlength="6" value="${requestScope.ivo.itemDetailVO.weight_g}"/></td>
			 		<td width="10%"><input type="text" id="weight_ml" class="item_nut dec" name="weight_ml" maxlength="6" value="${requestScope.ivo.itemDetailVO.weight_ml}"/></td>
			 		<td width="10%"><input type="text" id="calories" class="item_nut dec" name="calories" maxlength="6" value="${requestScope.ivo.itemDetailVO.calories}"/></td>
			 		<td width="10%"><input type="text" id="carbo" class="item_nut dec" name="carbo" maxlength="6" value="${requestScope.ivo.itemDetailVO.carbo}"/></td>
			 		<td width="10%"><input type="text" id="protein" class="item_nut dec" name="protein" maxlength="6" value="${requestScope.ivo.itemDetailVO.protein}"/></td>
			 		<td width="10%"><input type="text" id="fat" class="item_nut ft" name="fat" maxlength="6" value="${requestScope.ivo.itemDetailVO.fat}"/></td>
			 		<td width="10%"><input type="text" id="sodium" class="item_nut dec" name="sodium" maxlength="6" value="${requestScope.ivo.itemDetailVO.sodium}"/></td>
			 		<td width="10%"><input type="text" id="caffeine" class="item_nut dec" name="caffeine" maxlength="6" value="${requestScope.ivo.itemDetailVO.caffeine}"/></td>
			 		
			 	
		 		</tr>
		 		</tbody>
		 </table>
      </td>
      
   </tr>
   <tr>
      <td width="25%" class="prodInputName">알레르기 정보</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;" >
		 
		 <table id="tbl_item_info" style="table-layout: fixed">
		 		<thead>	
		 		<tr id="allergens_th">
		 		
		 			<%-- jquery 로 값을 넣음 --%>
		 							
		 		</tr>
		 		</thead>
		 		<tbody>
				<tr id="allergens_td">
				
					<%-- jquery 로 값을 넣음 --%>
								 					 		
		 		</tr>
		 		</tbody>
		 </table>
		 <input type="hidden" name="allergens" value=""/>
      </td>
      
   </tr>
   <tr>
      <td width="25%" class="prodInputName">원산지 정보</td>
      <td width="75%" align="left" style="border-top: hidden; border-bottom: hidden;" >
         <input type="text" style="width: 300px;" name="coa" class="box" />
      </td>
   </tr>
   
    
   
   <tr style="height: 70px;">
      <td colspan="2" align="center" style="border-left: hidden; border-bottom: hidden; border-right: hidden;">
          <input type="button" value="제품등록" id="btnRegister" style="width: 80px;" /> 
          &nbsp;
          <input type="reset" value="취소"  style="width: 80px;" />   
      </td>
   </tr>
   
   
</tbody>
</table>
</form>
</div>
	
	

<jsp:include page="/WEB-INF/header_footer/footer.jsp"/>