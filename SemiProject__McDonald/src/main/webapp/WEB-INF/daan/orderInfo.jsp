<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../header_footer/header.jsp"/>

<title>McDonald's. - 주문</title>

<style type="text/css">
	
	div#div_flex1,
    div#div_flex2,
    div#div_flex3 {
    	display: none;
    }

   body {
		background-color: #f3f3f3;
	}  
   /* Bootstrap Override */	
	@media (min-width: 576px) {
	  .container, .container-sm {
	    max-width: 540px;
	  }
	}
	/* Bootstrap Override */	
	@media (min-width: 768px) {
	  .container, .container-sm, .container-md {
	   max-width: 90vw;
	  }
	}

    div.container.wrap {
   		position: relative;
		top: 140px;
		margin-top: 1vh;    
    }
    footer {
    position: relative;
    top: 140px;
    margin-top: 40px;
    }
   .flex-content-container-item2>div {
   		border-radius: 1rem;
		height: 372px;
		@media (min-width: 1276px) {
		    flex: 0 0 33.333333%;
		    max-width: 33.333333%;
		}
		@media (min-width: 1502px) {
		    flex: 0 0 25%;
		    max-width: 25%;
		}
	   	@media (min-width: 1920px) {
		   	min-width: 233.11px;
		   	flex: 0 0 20%;
		}
	   	@media (min-width: 2112px) {
		   	min-width: 16.66666%;
		   	flex: 0 0 16.66666%;
		   	height: 380px;
	   	}
   }
	
	.content-container {
		display: flex;
        align-items: flex-start;
        margin: 0 auto;
    }

    #menu>ul.nav {
         display: flex;
         flex-wrap: nowrap;
         word-break: keep-all;
    }

    div.tab-content {
         border: none;
    }

     /* 왼쪽 탭 하위 요소 */
    div.tab-pane {
         padding: 0;
	}

	li.nav-item-daan.custom >a.nav-link.custom {
		width: auto;
        background-color: transparent;
        border: none;
        font-weight: bolder;
        color: #a6a6a6;
        box-shadow: 0px -1px 3px #cecece;
        padding-bottom: 0;
        padding: .5rem 0.7rem;
    }

	li.nav-item-daan.custom >a.nav-link.custom.active {
         background-color: #ffc423;
         border: none;
         box-shadow: 0 -1px 2px #a6a6a6;
         color: white;
    }

    .list-group-item {
         background-color: #ffc423;
         font-size: 0.9rem;
         color: white;
         padding: .5rem 0.5rem;
         cursor: pointer;
    }

    li.list-group-item:first-child {
         border-radius: 0;
    }

    .flex-content-container-item2 {
		margin: 0 1vw;
		align-content:;
	}

    div.flex-content-container-item2 > div {
         box-shadow: 0 5px 3px #a6a6a6;
         padding: 5px;
         margin: 0.5vh 0;
         background-color: white;
    }
	
	.card-body {
         padding: 0.3rem;
         height: 26vh;
    }
    p {
    	padding-top: 1%;
    }
    
	.card-text {
         margin-bottom: 0.5rem;
    }
	.card-bottom-daan {
		position: absolute;
		bottom: 2px;
		width: 95%;
		flex-wrap: nowrap;
		justify-content: space-evenly;
	}
	.card-bottom-daan > *:has(label.option-label) {
		flex: 1;
		max-width: 35%;
	}
    p {
         font-size: 0.8rem;
         color: gray;
    }
    

     button.addToCart-button,
     div#placeOrder button {
         background-color: #ff0000;
         color: white;
         font-size: 10pt;
         font-weight: bold;
     }

     button.edit {
         float: right;
     }

     #order_wrap {
         word-break: keep-all;
         border-radius: .25rem;
     }
	
	div.btn-group {
	width: 100%;}

	
	#placeOrder {
		padding: 3vh 0;
	}
	#placeOrder button {
		width: 70%;
		height: 6vh;
	}
	
	div.btn-group>label.btn.active {
		background-color: #ff0000;
		color: white;
	}

     div.mt-2>div {
         padding: 1vh 1vh;
     }

     #my_order_info,
     div.mt-2 {
     	background-color: white;
     	border-radius: 3%;
     	box-shadow: 2px 3px 3px 2px #a6a6a6;
     	padding: 1vh;
     }
     
     #my_order_info>*{
     	margin: 2vh 0;
     }
     #my_order_info > div:nth-child(3) > span,
     #my_order_info > div:nth-child(4) > span,
     #my_order_info > div:nth-child(5) > span {
     	float: right;
     }
     
     #order_wrap > div.mt-2 {
     	background-color: white;
     	padding-top: 2vh;
     }
     strong {
     	padding: 0 0.35rem;
     }
     
     /* 배달주소 입력되는 항목들 */
     div.data>input {
		width: 100%;
		border: none;
	}
	div.data>input:first-child {
		width: auto;
		border: none;
	}
	
	#myProgress {
		text-align: left;
		width: 100%;
	}
	
	#myBar {
		width: 100%;
		height: 15px;
		background-color: #a6a8ab;
	  	line-height: 30px;
		color: white;
		border-radius: 0.3rem;
	}
	
	/* 단품 | 세트 input 태그 */
	input.btn {
		position: absolute;
		opacity: 0;
		cursor: pointer;
		height: 0;
		width: 0;
	}

	label.option-label {
		display: inline-block;
		width: 100%;
    	background-color: #f3f3f3;
    	border-radius: 0.4rem;
		border: solid 2px #f3f3f3;
    	color: #a6a6a6;
    	font-weight: 500;
	}
	
	label.option-label:has(> input.btn:checked) {
		background-color: #ffbc0d;
		border: solid 2px #ffbc0d;
		color: white;
		border-radius: 0.4rem;
	}
	
	.list-group-item-select>span {
		color: white;
	}
	
	div#placeOrder button:disabled {
    	background-color: gray;
	}
	
 </style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript">

	
	$(document).on('change', 'input.input-number', function(e){
	
		if($(e.target).val() > 99 | $(e.target).val() < 1) {
			$(e.target).val(1);
		}
		
		let quantity_arr = JSON.parse(sessionStorage.getItem('quantity_arr'));
		let index = $('input.input-number').index($(e.target));
		
		quantity_arr[index] = Number($(e.target).val());
		sessionStorage.setItem('quantity_arr', JSON.stringify(quantity_arr));
	
		const cart_arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		const singleOrder = cart_arr[index];
		let price = 0;
		$.each(singleOrder, function(i, elt) {
			
			price += elt.item_price;
			if(singleOrder.length > 1) {
				price -= 1000;
			}
		});
		
		const preSubtotal_arr = document.getElementsByClassName('preSubtotal');
		preSubtotal_arr[index].innerText = '￦ '+(price*quantity_arr[index]);
		updateMyOrderSection();
	});
	
	$(document).on('click', 'button.btn-number', function(e){
		
		// 주문상세 갯수 input from https://www.codeply.com/p/GiARflvHDW
		    e.preventDefault();
		    
		    fieldName = $(this).attr('data-field');
		    type      = $(this).attr('data-type');
		    var input = $(this).closest('.input-group').find("input[name='"+fieldName+"']");
		    var currentVal = parseInt(input.val());
		    if (!isNaN(currentVal)) {
		        if(type == 'minus') {
		            
		            if(currentVal > input.attr('min')) {
		                input.val(currentVal - 1).change();
		            }
<%--		            
		            if(parseInt(input.val()) == input.attr('min')) {
		                $(this).attr('disabled', true);
		            }
--%>
		        } else if(type == 'plus') {

		            if(currentVal < input.attr('max')) {
		                input.val(currentVal + 1).change();
		            }
<%--
		            if(parseInt(input.val()) == input.attr('max')) {
		                $(this).attr('disabled', true);
		            }
--%>
		        }
		    } else {
		        input.val(0);
		    }
	});
	
	$(document).ready(function(){
		
		let arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		if(arr == null) {
			sessionStorage.setItem('cart_arr', JSON.stringify([]));
		}
		
		arr = JSON.parse(sessionStorage.getItem('quantity_arr'));
		if(arr == null) {
			sessionStorage.setItem('quantity_arr', JSON.stringify([]));
		}
		
		$('div.mt-2').css('display', '');

		if(arr.length == 0) {
			$('div.mt-2').css('display', 'none');
		}

		const user_postcode = '${requestScope.user_postcode}';
		if(user_postcode.length != 0) {
			const user_address = '${requestScope.user_address}';
			const user_detail_address = '${requestScope.user_detail_address}';
			const user_ref_address = '${requestScope.user_ref_address}';
			$('input#postcode').val(user_postcode);
			$('input#address').val(user_address);
			$('input#detailAddress').val(user_detail_address);
			$('input#extraAddress').val(user_ref_address);
		}
		
		// 각 제품 카드는 배경화면이 제거된 이미지 사진을 사용합니다.
		// 그러나 DB 상 입력된 값은 14_빅맥.png으로, 이 값의 사진은 배경화면이 있는 사진입니다.
		// 따라서 14_빅맥_nbg.png 을 만드는 작업을 아래와 같이 진행합니다.
		let customCardsImgsArr = document.querySelectorAll('div.customCardsArr > img');
		customCardsImgsArr = Array.from(customCardsImgsArr);
		
		let img_src;
		
		customCardsImgsArr.forEach((elt) => {
			img_src = elt.getAttribute('data-temp');
			img_src = '/images/'+img_src.substr(0,(img_src.length-4))+'_nbg.png';
			img_src = '<%=request.getContextPath()%>'+img_src;
			elt.setAttribute('src', img_src);
		});
		
		// ------------------------------------------------------
		
		// 시간에 따라 메뉴 다르게 보여주기
		const today = new Date();
		const hours = today.getHours();
		const menuBar_arr = Array.from($('a.nav-link.custom'));
		if(4 < hours && hours <10 ) {
			$(menuBar_arr).removeClass('active');
			$(menuBar_arr[0]).addClass('active');
			$('div.tab-pane.container').removeClass('active');
			$('div.tab-pane.container#morning').addClass('active');
		} else {
			$(menuBar_arr).removeClass('active');
			$(menuBar_arr[1]).addClass('active');
			$('div.tab-pane.container').removeClass('active');
			$('div.tab-pane.container#after').addClass('active');
		}
		
		let addToCartButton_arr = document.querySelectorAll('button.addToCart-button');
		addToCartButton_arr = Array.from(addToCartButton_arr);
		
		if(4 < hours && hours <10 ) {
			addToCartButton_arr.forEach(function(elt, i) {
				if($(elt).attr('data-category_no') == 1) {
					$(elt).prop('disabled', true);
					$(elt).css('background-color', 'gray');
				}
			});
			
		} else {
			addToCartButton_arr.forEach(function(elt, i) {
				if($(elt).attr('data-category_no') == 2) {
					$(elt).prop('disabled', true);
					$(elt).css('background-color', 'gray');
				}
			});
			
		}
		// ------------------------------------------------------
		
		toCart();
		updateMyOrderSection();
		
		
		const list_select = Array.from(document.getElementsByClassName('list-group-item-select'));
		list_select.forEach((event)=> {
			event.addEventListener('click', function(e) {
				
				const frm = document.tabSelectForm;
				frm.fk_category_no.value = e.target.parentNode.parentNode.value;
				frm.action = '<%=request.getContextPath()%>/daan/orderInfo.run';
				frm.submit();
				
			});
		})
		
		
		
		
	}) // end of $(document).ready(function(){}) ------------------------------

	function progressStatus() {
		
		const subtotal = Number($('span#subtotal').text());
		
		let i = 0;
		
		if (i == 0) {
			i = 1;
			let elem = document.getElementById("myBar");
			let width = 0;
			let stop_bar = (subtotal/15000*100);
			let id = setInterval(frame, 10);
			function frame() {
				if (stop_bar == 0) {
					document.getElementById('myBar').innerHTML = '15,000원 이상 주문 시 무료 배달';
					document.getElementById('myBar').style.textAlign = 'center';
					document.getElementById('myBar').style.width = "100%";
					document.getElementById('myBar').style.backgroundColor = '';
					clearInterval(id);
					i = 0;
				} else if (stop_bar != 0 && width >= 100) {
					clearInterval(id);
					i = 0;
				} else {
					while (width <= stop_bar && width < 100) {
							width++;
				        	elem.style.backgroundColor = '#ffc423';
							elem.style.width = width + "%";
							elem.innerHTML = width + "%";
							elem.style.textAlign = 'center';
					}
				}
			}
		}
	}
	
	// 주문상세 내 개별 주문 선택 삭제
	function removeFromCart(deleteObj) {

		// 눌린 '삭제' <a> 태그의 index를 가져온다.
		const index = $('a.removeFromCart-button').index(deleteObj);

		let cart_arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		cart_arr.splice(index,1);
		sessionStorage.setItem('cart_arr', JSON.stringify(cart_arr));

		let quantity_arr = JSON.parse(sessionStorage.getItem('quantity_arr'));
		quantity_arr.splice(index,1);
		sessionStorage.setItem('quantity_arr', JSON.stringify(quantity_arr));
		
		toCart();
		updateMyOrderSection();
		// progressStatus();

	}
	
	
	
	
	function checkDuplicate(item_no, is_set) {
		let isSingleOrderDuplicated = -1;
		const cart_arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		
		if(cart_arr.length != 0) {
			if(item_no < 300) {
			
				$.each(cart_arr, function(i, singleOrder){
					
					if(singleOrder.length > 1 && is_set == 1) {
							
							if(item_no < 200) {
								if(singleOrder[0].item_no == item_no && singleOrder[1].item_no == 303 && singleOrder[2].item_no == 504) {
									console.log('1 ➡️ 버거 세트 구성 중복인데?');
									isSingleOrderDuplicated = i;
									return isSingleOrderDuplicated;
								} else {
									console.log('2 ➡️ 버거 세트 구성 중복 아닙니다.');
								}
								
							} else {
								if(singleOrder[0].item_no == item_no && singleOrder[1].item_no == 300 && singleOrder[2].item_no == 519) {
									console.log('3 ➡️ 맥모닝 세트 구성 중복인데?');
									isSingleOrderDuplicated = i;
									return isSingleOrderDuplicated;
								} else {
									console.log('4 ➡️ 맥모닝 세트 구성 아닙니다.');
								}
							}
					} else if(singleOrder.length == 1 && is_set == 0) {
						if (singleOrder[0].item_no == item_no) {
							console.log('5 ➡️ 버거 단품 중복인데?');
							isSingleOrderDuplicated = i;
							return isSingleOrderDuplicated;
						} else {
							console.log('6 ➡️ 서로 다른 버거 입니다.');
						}
					} else {
						console.log('7 ➡️ ');
					}
					
				});
			
			} else {
				$.each(cart_arr, function(i, singleOrder){
					if (singleOrder[0].item_no == item_no) {
						console.log(singleOrder[0].item_no + '중복인데?');
						isSingleOrderDuplicated = i;
						return isSingleOrderDuplicated;
					} else {
						console.log(singleOrder[0].item_no + '중복 아닙니다.');
					}
				});
			}
		}
		return isSingleOrderDuplicated;
	}
	
	
	// 담긴 주문 정보를 바탕으로 '내 주문정보' 내용 변경
	function updateMyOrderSection() {
		
		const cart_arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		const quantity_arr = JSON.parse(sessionStorage.getItem('quantity_arr'));
		
		let subtotal = 0;
		if(cart_arr.length > 0) {
			$("button.btn-placeOrder").attr('disabled', false);
			let delivery_fee = 3000;
			$.each(cart_arr, function(i, singleOrder){
				let quantity = quantity_arr[i];
				singleOrder.forEach(function(elt, index) {
					subtotal += Number(elt.item_price)*Number(quantity);
				});
				if(singleOrder.length > 1) {
					subtotal -= (1000*Number(quantity));
				}
			});
			if(subtotal >= 15000) {
				delivery_fee = 0;
			}
			$('span#subtotal').text('￦ '+subtotal);
			$('span#delivery_fee').text('￦ '+delivery_fee);
			$('span#total').text('￦ '+(subtotal+delivery_fee));
			$('span#total').css({'color':'#04aa6d', 'font-weight':'bold', 'font-size':'1.25rem'});
			// progressStatus();
			$('form[name="placeOrderForm"] > fieldset > input').val(subtotal+delivery_fee);
		} else {
			$("button.btn-placeOrder").attr('disabled', true);
			$('span#subtotal').text('￦ '+subtotal);
			$('span#delivery_fee').text('￦ '+0);
			$('span#total').text('￦ '+(subtotal));
			$('span#total').css({'color':'', 'font-weight':'bold', 'font-size':'1.25rem'});
		}
	}
	
	// 제품구성변경 모달 페이지 내 완료 누를 시 데이터 변경
	function completeEditOption() {
		
		const side_checked = $('input:radio[name="side"]:checked');
		const side_name = side_checked.parent().parent().find('div.editOption_side_name').text();
		const side_price = Number(side_checked.parent().parent().find('div.editOption_side_price').text());
		const side_item_no = Number(side_checked.val());
		
		const side_arr = {"item_price":side_price,"item_name":side_name,"item_no":side_item_no};
		
		const drink_checked = $('input:radio[name="drink"]:checked');
		const drink_name = drink_checked.parent().parent().find('div.editOption_drink_name').text();
		const drink_price = Number(drink_checked.parent().parent().find('div.editOption_drink_price').text());
		const drink_item_no = Number(drink_checked.val());
		
		const drink_arr = {"item_price":drink_price,"item_name":drink_name,"item_no":drink_item_no};
		
		const index = $('div#modal_option > h4').attr('data-session_index');
		
		// sessionStorage cart 배열 불러온다.
		let cart_arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		const mainMenu_item_no = Number(cart_arr[index][0].item_no);
		const is_set = 1;
		let is_duplicated = false;
		// 여기에 duplicateset 체크한다.
		$.each(cart_arr, function(index,singleOrder) {
			if(singleOrder.length > 1) {
				let cnt_duplicated = 0;
				singleOrder.forEach(function(item, i) {
					if(Number(item.item_no) == mainMenu_item_no || Number(item.item_no) == side_item_no || Number(item.item_no) == drink_item_no) {
						cnt_duplicated++;
					}
					
					if(cnt_duplicated == 3) {
						is_duplicated = true;
						return false;
					}	
				});
			}
		})
		
		if(is_duplicated) {
			alert('주문상세에 이미 존재하는 구성입니다.');
			return false;
		} else {
			let cart_arr_edit = cart_arr;
			// 수정하려는 index의 singleOrder 배열을 불러온다.
			arr_singleorder = cart_arr_edit[index];
			// console.log(JSON.stringify(arr_singleorder[1]));
			arr_singleorder[1] = side_arr;
			arr_singleorder[2] = drink_arr;
			cart_arr = cart_arr_edit;
			sessionStorage.setItem('cart_arr', JSON.stringify(cart_arr));
			toCart();
			updateMyOrderSection();
			// progressStatus();
		}
		
	}
	
	function editMenu() {
		
		const index = $(event.target).parent().attr('data-session_index');
		let cart_arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		let singleOrder = cart_arr[index];
		$.ajax({
			url: '<%= request.getContextPath()%>/daan/modal_editOption.run',
			//data:{"session_index", index},
			type: 'POST',
			dataType: 'JSON',
			//async:true,
			success: function(json){
				
				$.each(json, function(i, elt) {
					let html = ``;
					if(i==0) { 	// 사이드
						
						html = `<ul>`;
						elt.forEach(function(item) {
							
							html += `<li class="editOption_li sides">
									 <img src="" data-temp="\${item.image}" class="card-img-top" alt="burger" style="height: 13vh" />
									 <div class="editOption_side_name">\${item.name}</div>
									 <div class="editOption_side_price">\${item.price}</div>
									 <div class="editOption_side_item_no"><input type="radio" class="editOption_input" name="side" value="\${item.item_no}"/></div>
									 </li>`;
						});
						html += `</ul>`;
						$('div.modal_sides').html(html);
					} else {	// 음료
						
						html = `<ul>`;
						elt.forEach(function(item) {
							
							html += `<li class="editOption_li drinks">
									 <img src="" data-temp="\${item.image}" class="card-img-top" alt="burger" style="height: 13vh" />
									 <div class="editOption_drink_name">\${item.name}</div>
									 <div class="editOption_drink_price">\${item.price}</div>
									 <div class="editOption_drink_item_no"><input type="radio" class="editOption_input" name="drink" value="\${item.item_no}"/></div>
									 </li>`;
						});
						html += `</ul>`;
						$('div.modal_drinks').html(html);
					}
					
					
					let modalOptionLisArr = document.querySelectorAll('li.editOption_li > img');
					modalOptionLisArr = Array.from(modalOptionLisArr);
					
					let img_src;
					
					modalOptionLisArr.forEach((elt) => {
						img_src = elt.getAttribute('data-temp');
						img_src = '/images/'+img_src.substr(0,(img_src.length-4))+'_nbg.png';
						img_src = '<%=request.getContextPath()%>'+img_src;
						elt.setAttribute('src', img_src);
					});
					
				});
				const sidesArr = Array.from($('.editOption_side_item_no'));
				sidesArr.forEach(function(elt, i) {
					if(singleOrder[1].item_no == Number($(elt).find('input').val())) {
						$(elt).find('input').prop('checked', true);
						elt.parentNode.style.backgroundColor = '#ffbc0d';
						elt.parentNode.style.color = 'white';
						return false;
					}
				});
				const drinksArr = Array.from($('.editOption_drink_item_no'));
				drinksArr.forEach(function(elt, i) {
					if(singleOrder[2].item_no == Number($(elt).find('input').val())) {
						$(elt).find('input').prop('checked', true);
						elt.parentNode.style.backgroundColor = '#ffbc0d';
						elt.parentNode.style.color = 'white';
						return false;
					}
				});
				
				let arr = JSON.parse(sessionStorage.getItem('cart_arr'));
				
				let html = `<h4 data-session_index = "\${index}" >\${arr[index][0].item_name}</h4>`;
				
				$('div#modal_option').html(html);
			},
			error: function(request, status, error){
	               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
		}); // end of $.ajax
	}
	
	function toCart() {
		
		$('div#orderDetail').empty();
		let arr = JSON.parse(sessionStorage.getItem('cart_arr'));
		let quantity_arr = JSON.parse(sessionStorage.getItem('quantity_arr'));
		
		$.each(arr, function(session_index, singleOrder) {

			let html =``;
			let price = 0;
			let quantity = quantity_arr[session_index];
			$.each(singleOrder, function(i, elt) {
				if(i == 0) {
					html += `<div align="left" data-session_index="\${session_index}">
	                		 <span data-item_no="\${elt.item_no}">\${elt.item_name}</span>`;
	                
	                if(singleOrder.length > 1) {
	                	html += `<span> - 세트</span>`;
	                } else {
	                	html += `<span> - 단품</span>`;
	                }
	                
	                // 단품일 경우 변경 버튼은 없어야 한다.
	                if(singleOrder.length > 1) {
	                	html += `<button type="button" class="edit" data-toggle="modal" data-target="#editOption" onClick="editMenu()" style="border-radius: 0.25rem;border: none;background-color: transparent;color: blue;">변경</button><form name="editMenuForm"><input type="hidden" name="session_index" value="\${session_index}"/></form>`;
	                }
				}else if(i == 1) {
					html += `<div style="font-size:0.9rem; padding-top: 5%;">
							 &ensp;<span data-item_no="\${elt.item_no}">- \${elt.item_name}</span>`;
				} else {
					html += `<br>
							 &ensp;<span data-item_no="\${elt.item_no}">- \${elt.item_name}</span>`;
	            }
				price += elt.item_price;
				
				if(singleOrder.length > 1 && i == 1) {
					price -= 1000;
				}
			});
	
			html += `<div class="py-3 input-group" style="text-align: right; border-radius: 0.25rem; justify-content: flex-end;">
					 <span class="input-group-prepend">
						 <button type="button" class="btn btn-outline-secondary btn-number" style="padding: 0 0.4rem;display: flex;justify-content: space-between;align-content: center;flex-wrap: wrap;border-radius: .7rem;border-top-right-radius: 0;border-bottom-right-radius: 0;border-color: #cccccc; opacity: 1;" data-type="minus" data-field="quant[1]">
						 	<span class="fa fa-minus" style="font-size: 0.7rem;"></span>
						 </button>
					 </span>
					 <input type="text" name="quant[1]" class="form-control input-number" style="flex:none; width:12%; padding: .375rem 0; height:1.5rem; text-align: center; font-size: 0.8rem; border: solid 1px #cccccc;border-right: none; border-left:none; z-index: 3;"value="\${quantity}" min="1" max="99">
					 <span class="input-group-append">
						 <button type="button" class="btn btn-outline-secondary btn-number" style="padding: 0 0.4rem;display: flex;justify-content: space-between;align-content: center;flex-wrap: wrap;border-radius: .7rem;border-top-left-radius: 0;border-bottom-left-radius: 0;border-color: #cccccc;" data-type="plus" data-field="quant[1]">
						 	<span class="fa fa-plus" style="font-size: 0.7rem;"></span>
						 </button>
					 </span>
				 </div>
	             <a class="removeFromCart-button" style="color:red; font-size:0.9rem" onClick="removeFromCart(this)">삭제</a><span class="preSubtotal" style="float:right;">￦ \${price*quantity}</span>
	             <hr>
				 </div>`;
			
			$('div#orderDetail').append(html);
			
		});
	}
	
	
	function addToCart(item_no){
		// 단품을 선택했는지, 세트를 선택했는지 값을 가져옵니다.
		const is_set = $('input:radio[name="'+item_no+'_is_set"]:checked').val();
		if(is_set == null) {
			alert('종류를 선택하세요');
			return false;
		} else {
			
			$.ajax({
				url: "<%=request.getContextPath()%>/daan/addtoCart.run",
				data:{"item_no":item_no,
					  "is_set":is_set},
				type: "POST",
				dataType: "json",
				async:true,
				success: function(json){
					
					$('div.mt-2').css('display', '');
					
					let cart_arr = JSON.parse(sessionStorage.getItem('cart_arr'));
					<%--
						if(cart_arr == null) {
							sessionStorage.setItem('cart_arr', []);
						}
					--%>
					let quantity_arr = JSON.parse(sessionStorage.getItem('quantity_arr'));
					
					let isSingleOrderDuplicated = checkDuplicate(Number(item_no), Number(is_set));
					// console.log(isSingleOrderDuplicated);
					
					if(isSingleOrderDuplicated != -1) {
						const session_index = isSingleOrderDuplicated;
						quantity_arr[session_index] += 1;
					} else {
						cart_arr.push(json);
						sessionStorage.setItem('cart_arr', JSON.stringify(cart_arr));

						quantity_arr.push(1);
					}

					sessionStorage.setItem('quantity_arr', JSON.stringify(quantity_arr));
					
					toCart();
					updateMyOrderSection();
					// progressStatus();
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
			});
		}
		
		$('input:radio[name="'+item_no+'_is_set"]:checked').prop('checked', false);
		
	} // end of function addToCart(item_no) -------------------------------------------------------
	
	
	// 주소 찾기 - 카카오 API
	function openDaumPOST() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ''; // 주소 변수
                let extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();

	} // end of function openDaumPOST() -----------------------------------

	function placeOrder(){
		
		// <form> 내 <input type="hidden">의 value 값 불러온다.
		const total = $('form[name="placeOrderForm"] > fieldset > input').val();
		const delivery_loc = '('+$('input#postcode').val()+') '+$('input#address').val()+' '+$('input#detailAddress').val()+' '+$('input#extraAddress').val();
		
		// sessionStorage 상 저장된 장바구니 객체를 가져온다.
		let str_cart_arr = sessionStorage.getItem('cart_arr');
		let cart_arr = JSON.parse(str_cart_arr);
		
		if(cart_arr.length < 1) {
			alert('장바구니가 비었습니다.');
			return false;
		}
		
		let str_quantity_arr = sessionStorage.getItem('quantity_arr');
		
		
		$.ajax({
			url:'<%=request.getContextPath()%>/daan/orderVerification.run',
			data:{"str_cart_arr":str_cart_arr,
				  "str_quantity_arr":str_quantity_arr,
				  "total":total},
			type:'POST',
			dataType: "JSON",
			async:false,
			success: function(json){
					
					const result = json.message;
					if('fail' == result) {
						alert('DB상 금액과 View 단에서의 금액이 맞지 않음');
						console.log(Number($('span#total').text().substr(2)));
						console.log(Number($('span#delivery_fee').text().substr(2)));
						return false;
						
					} else {
						alert('결제 진행');
						
						const frm = document.placeOrderForm;
						frm.action = '<%=request.getContextPath()%>/daan/placeOrder.run';
						frm.method = 'POST';
						frm.totalFinal.value = Number($('span#total').text().substr(2));
						frm.deliveryFee.value = Number($('span#delivery_fee').text().substr(2));
						frm.delivery_loc.value = delivery_loc;
						frm.submit();
					}
					
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		        }
		});
	}
	
</script>
<%-- ----------------------------- Start of BODY ----------------------------- --%>

    <div class="container wrap" align="center">
        <!-- 메뉴 카테고리 section -->
        <div class="content-container">
            <aside class="flex-content-container-item1">
                <div id="menu" class="rounded">
                    <ul class="nav nav-tabs">
                        <li class=" nav-item-daan custom">
                            <a class="nav-link custom" data-toggle="tab" href="#morning">아침메뉴</a>
                        </li>
                        <li class="nav-item-daan custom">
                            <a class="nav-link custom" data-toggle="tab" href="#after">일반메뉴</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane container" id="morning">
                            <ul class="list-group custom">
                          <%-- <li class="list-group-item"><a class="list-group-item-select"><span>추천 메뉴</span></a></li> --%>
                                <li class="list-group-item" value="2"><a class="list-group-item-select"><span>맥모닝 & 세트</span></a></li>
                                <li class="list-group-item" value="3"><a class="list-group-item-select"><span>스낵 & 사이드</span></a></li>
                                <li class="list-group-item" value="5"><a class="list-group-item-select"><span>음료</span></a></li>
                                <li class="list-group-item" value="4"><a class="list-group-item-select"><span>디저트</span></a></li>
                          <%--  <li class="list-group-item"><a class="list-group-item-select"><span>해피밀®</span></a></li> --%>
                            </ul>
                        </div>
                        <div class="tab-pane container" id="after">
                            <ul class="list-group custom">
                                <li class="list-group-item" value="1"><a class="list-group-item-select"><span>버거 & 세트</span></a></li>
                                <li class="list-group-item" value="3"><a class="list-group-item-select"><span>스낵 & 사이드</span></a></li>
                                <li class="list-group-item" value="5"><a class="list-group-item-select"><span>음료</span></a></li>
                                <li class="list-group-item" value="4"><a class="list-group-item-select"><span>디저트</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <form name="tabSelectForm">
                    	<fieldset>
                    		<input type="hidden" name="fk_category_no"/>
                    	</fieldset>
                    </form>
                </div>
            </aside>
            <!-- 메뉴 section ---------------------------------------------------------------------------------------------------------------------------->
            <div class="row flex-content-container-item2" style="background-color: #f3f3f3;">
            <c:if test="${not empty requestScope.item_list}">
	            <c:forEach items="${requestScope.item_list}" var="item">
	            	<div class="customCardsArr col-sm-12">
	            		<img src="" data-temp="${item.item_image}" class="card-img-top" alt="burger" style="width: 90%" />
                    <div class="card-body mb-1">
                        <span class="card-title">${item.item_name}</span>
                        <p class="card-text">${item.item_info}
                        </p>
                    </div>
                    <div class="card-bottom-daan" style="display: flex;">
                    <div style="min-width:30%; width:auto;"><label class="option-label"><input type="radio" class="btn" name="${item.item_no}_is_set" value="0">&ensp;단품<br><span>￦ ${item.item_price}</span></label></div>
                    
                    <c:choose>
	            		<c:when test="${item.fk_category_no eq 1}">
	            			<div style="min-width:30%;"><label class="option-label"><input type="radio" class="btn" name="${item.item_no}_is_set" value="1"/>&ensp;세트<br><span>￦ ${item.item_price+2800+2400-1000}</span></label></div>
	            		</c:when>
	            		<c:when test="${item.fk_category_no eq 2}">
	            			<div><label class="option-label"><input type="radio" class="btn" name="${item.item_no}_is_set" value="1"/>&ensp;세트<br><span>￦ ${item.item_price+1100+3300-1000}</span></label></div>
	            		</c:when>
                    </c:choose>
                    
                    <div><button type="button" class="btn addToCart-button" style="padding: 1.1em;margin-bottom: .5rem;" data-category_no="${item.fk_category_no}" onclick="addToCart('${item.item_no}')">추가</button></div>
                    </div>
                </div>
	            </c:forEach>
            </c:if>
            <c:if test="${empty requestScope.item_list}">
            제품이 없습니다.
            </c:if>
            
                
            </div>
            <!-- 주문정보 section ------------------------------------------------------------------------------------------------------------>
            <div id="order_wrap" class="flex-content-container-item3"">
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="min-width:300px; box-shadow: 0 5px 3px #a6a6a6;">
					<label class="btn active">
						<input type="radio" name="options" id="option1" autocomplete="off" checked>
						배달
					</label>
					<label class="btn">
						<input type="radio" name="options" id="option2" autocomplete="off">
						픽업/포장
					</label>
				</div>
                <div id="my_order_info"  class="mt-4" align="left" style="">
                	<h5 style="width: 100%; text-align:center;">내 주문정보</h5>
                	<div>
	                	<strong>배달 주소</strong>&nbsp;&nbsp;<button class="edit btn-primary" type="button" style="cursor: pointer; border: solid 1px #ff0000; border-radius: 0.25rem; background-color: #ff0000;" onclick="openDaumPOST();">검색</button>
	                	<div class="data pt-2">
	                		(<input type="text" id="postcode" size="5" placeholder="우편번호" />)
	                		<input type="text" id="address" size="65" placeholder="주소" /><br/>
            				<input type="text" id="detailAddress" size="50" placeholder="상세주소" />
            				<input type="text" id="extraAddress" size="50" placeholder="참고항목" />
         				</div>
	                	<hr>
                	</div>
                	<div>
                		<strong>주문금액</strong>
                        <span id="subtotal">￦{Values}</span>
                        <hr>
                    </div>
                    <div>
                		<strong>배달비</strong>
                        <span id="delivery_fee">￦{Values}</span>
                        <hr>
                	</div>
                	<div>
                	    <strong>총 금액</strong>
                        <span id="total">￦{Values}</span>
                        <hr>
                	</div>
				</div>
<!-- 				
                <div id="myProgress" class="py-3">
                	<div id="myBar"></div>
                </div>
 -->                
                <div id="placeOrder">
                    <form name="placeOrderForm">
                        <fieldset>
                            <button type="button" class="btn btn-placeOrder" onClick="placeOrder()" style="font-size: 1.5rem; box-shadow: 0px 0px 0px 2px;">주문하기</button>
                            <input type="hidden" name="totalFinal"/>
                            <input type="hidden" name="deliveryFee"/>
                            <input type="hidden" name="delivery_loc"/>
                        </fieldset>
                    </form>
                </div>


                <div class="mt-2">
                	<h5 style="width: 100%; text-align:center;">주문상세</h5>
                	<div id="orderDetail"></div>
                </div>
                
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/daan/modal_editOption.jsp"/>

<jsp:include page="../header_footer/footer.jsp"/>