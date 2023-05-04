<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header_footer/header.jsp"/>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<style>
	div.container.wrap {
		margin-top: 138px;
		min-height: 710px;
    }
    div.result_message {
    	font-size: 1.5rem;
    }
    
    i.fa-2xl {
    	color: #1c8217;
    	font-weight: bold;
    	font-size: 13rem;
    	line-height: inherit;
    }
    div.result_button {
		text-align: center;
		
	}
	div.result_button > *{
		display: inline-block;
		margin-left: 200px;
    }
	button.btn {
		height: 70px;
		border-color: none;
		font-weight: bold;
		color: white;
	}
	#response_message {
		text-align: center;
	}
	
	.spinner-container {
  position: relative;
}
.spinner-border {
	animation-duration: 2s;
}
	.spinner-container > div {
		height: 80px;
		width: 80px;
	}

.spinner-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1;
  font-size: 2rem;
  
}
 	.spinner-blue {
	  color: #ff0000;
	  border-width: 0.4em;
	}
	
	#response_message {
		display: flex;
    	justify-content: center;
	}
	
</style>
<script type="text/javascript">


	$(document).ready(function(){
		
		const countSpan = document.getElementById('count');

		// Set the initial count to 1
		let count = 10;

		// Use setInterval to update the count every second
		const intervalId = setInterval(() => {
		  // Update the count span element with the current count
		  countSpan.textContent = count;

		  // Increment the count
		  count--;

		  // If the count reaches 11, clear the interval to stop counting
		  if (count === -1) {
		    clearInterval(intervalId);
		    goHome();
		  }
		}, 1000);
		
		$('button.btn').click(function() {
		    clearInterval(intervalId);
		});
		
	});
	
	function goHome() {

		location.href = '<%=request.getContextPath()%>/';
	}
	function goOrderInfo() {
		
		location.href = '<%=request.getContextPath()%>/daan/orderInfo.run';
	}
	
	function goOrder() {
		
		$('button.btn').hide();
		$('div#response_message').hide();
		
		swal({
			  title: "정말로 주문을 취소하시겠습니까?",
			  text: "카드승인이 취소 후 환불되며 취소 완료일 기준 1영업일 소요됩니다. 단, 카드사의 사정에 따라 승인취소 후 환불이 지연될 수 있습니다.",
			  type: "warning",
			  showCancelButton: true,
			  cancelButtonText : "주문 진행",
			  cancelButtonColor: "#569ca3",
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "주문 취소",
			  closeOnConfirm: false,
			  html: false,
			  onCancel: function () {
				  goHome();
				  }
			}, function(){
			  
				$.ajax({
					url: "<%=request.getContextPath()%>/daan/orderCancel.run",
					data:{"test":'jackson'},
					type: "POST",
					dataType: "json",
					async:true,
					success: function(json){
						
						const message = json.message;
						swal("요청 완료",
							 " "+message+"",
							 "success");
						
						setTimeout(function() {
							goOrderInfo();	
						}, 3000);
						
					},
					error: function(request, status, error){
			               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			        }
				});			
			});
		
	}

</script>
<div class="container wrap">

	<div class="result_icon" style="text-align: center; padding-top: 9vh;">
		<i class="fa-regular fa-circle-check fa-2xl" style=""></i>
	</div>
    
    <br>
    
    <div class="result_message" style="text-align: center;">${requestScope.message}</div>
    
	<div id="response_message">
		<div class="text-center" style="display: inline-block;">
			<div class="spinner-container">
			  	<div class="spinner-border spinner-blue spinner-border-3 spinner-border-lg" role="status"></div>
			  	<span id="count" class="spinner-text">10</span>
			</div>
		</div>
		<span style="font-size: 1.5rem;padding: 24px 0;font-weight: 500;">&ensp;초 후 메인페이지로 이동합니다.</span>
	</div>
	
	<div class="result_button py-5">
		<button type="button" class="btn" style="background-color: #ffbc0f;" onClick="goOrder()"> 주문취소 </button>
		<form name="cancelForm"></form>
	</div>
	
	
	<div style="text-align: center; font-weight: 500; color: red;">
		※ 주문 취소는 현재 페이지 또는 고객센터(1600-5252)(평일: 09:00 - 21:00) 를 통해서만 가능합니다.
	</div>
	
</div>
<jsp:include page="../header_footer/footer.jsp"/>