<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
#cart {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#cart td, #cart th {
	border: 1px solid #ddd;
	padding: 8px;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

#cart tr:nth-child(even) {
	background-color: #f2f2f2;
}

#cart tr:hover {
	background-color: #ddd;
}

#cart th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
<script>
$(document).ready(function(){
  $("#remove${status.index}").click(function(){
    $("#tush").remove();
  });
});
</script>

</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<h1>**********CART*********</h1>
	<form action="placeOrder">

		<div ng-app="">
			<table id="cart">

				<tr>
					<th>FOOD ITEMS</th>
					<th>RESTAURANT NAME</th>
					<th>ADDRESS</th>
					<th>QUANTITY</th>
					<th>PRICE FOR EACH</th>
					<th>QUANTITY*PRICE</th>
				</tr>

				<jstl:forEach var="products" items="${cart.products}"
					varStatus="status">
					<tr id="tush">
						<td>${products.foodName}</td>
						<td>${cart.restaurantName}</td>
						<td>${cart.address.area}</td>

						<td><input type="number" id="quantity${status.index}"
							onclick="compute()" name="quantity" min="1"
							ng-model="quantity${status.index}"
							ng-init="quantity${status.index}=${products.quantity}" /></td>
						<td><input type="number" id="price${status.index}"
							name="price" value="${products.price}" readonly="readonly"
							ng-model="price${status.index}"
							ng-init="price${status.index}=${products.price}" /></td>

						<td><input type="number" id="updatedPrice${status.index}"
							name="updatedPrice"
							value="{{ quantity${status.index} * price${status.index}}}"
							ng-model="updatedPrice${status.index}"
							ng-init="updatedPrice${status.index}={{ quantity${status.index} * price${status.index}}}"
							readonly="readonly" /></td>
						<td><a
							href="/cart/removeFoodProduct?id=${status.index}&cartId=${cart.cartId}&foodName=${products.foodName}">Remove</a></td>
					</tr>
				</jstl:forEach>
			</table>

			<div>
				<h3>
					Total Amount: <input type="text" name="amount" id="amount"
						readonly="readonly" value="${cart.totalAmount}">
				</h3>

				<script type="text/javascript">
function compute(){
	var x=0; var y = 0; var z = 0;
	for (i = 0; i < ${fn:length(cart.products)}; i++) {
		y=document.getElementById("quantity"+i).value;
		z=document.getElementById("price"+i).value;
		x = parseInt(x)+parseInt(y*z);
		document.getElementById("amount").value=x;
	}
}
</script>
			</div>
			<input type="submit" class="button" value="Place Order">
	</form>
</body>
</html>