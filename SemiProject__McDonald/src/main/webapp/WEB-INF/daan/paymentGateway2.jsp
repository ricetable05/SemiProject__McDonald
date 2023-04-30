<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">

$(document).ready(function() {

	let str_cart_arr = sessionStorage.getItem('cart_arr');
	let str_quantity_arr = sessionStorage.getItem('quantity_arr');
	
	const frm = document.recordDBForm;
	frm.action = '<%=request.getContextPath()%>/daan/orderSuccess.run';
	frm.method = 'POST';
	frm.cartFinal.value = str_cart_arr;
	frm.quantityFinal.value = str_quantity_arr;

	sessionStorage.setItem('cart_arr', JSON.stringify([]));
	sessionStorage.setItem('quantity_arr', JSON.stringify([]));
	
	frm.submit();

}); // end of $(document).ready()-----------------------------

</script>
</head>	
<body>
<form name="recordDBForm">
	<fieldset>
        <input type="hidden" name="totalFinal" value="${requestScope.totalFinal}"/>
        <input type="hidden" name="deliveryFee" value="${requestScope.deliveryFee}"/>
		<input type="hidden" name="cartFinal"/>
        <input type="hidden" name="quantityFinal"/>
    </fieldset>
</form>
</body>
</html>
