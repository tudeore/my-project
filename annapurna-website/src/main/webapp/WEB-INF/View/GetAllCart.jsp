<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <style type="text/css">
table, th, td {
	padding: 5px;
	height: 80px;
	width: 1100px;
	font-size: 20px;
	text-align: center;
	font-family: inherit;
}
th, td {
	padding: 1px;
	background-color: lightgray;
}
</style> -->
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
</head>
<body>
	<h1>**********CART*********</h1>
	<form action="placeOrder">
		<%-- 	<table  id ="cart">
		<tr>
			<th>CART ID</th>
			<th>PRODUCTS</th>
			<th>RESTAURANT NAME</th>
			<th>TOTAL AMOUNT</th>
			<th>ADDRESS</th>
		</tr>
		<jstl:forEach var="carts" items="${carts}">
			<tr>
				<td>${carts.cartId}</td>
				<td>
				<jstl:forEach var="products" items="${carts.products}">
				Food Name:&nbsp;
				${products.foodName}<br>
				Food Price:&nbsp;
				${products.price}<br>
				Quantity:&nbsp;
				${products.quantity}<br>
				</jstl:forEach>
				</td>
				<td>${carts.restaurantName}</td>
				<td>${carts.totalAmount}</td>
				<td>${carts.address}</td>
			</tr>
		</jstl:forEach>
			<tr>
				<td>${cart.cartId}</td>
				<td>${cart.products}</td>
				<td>${cart.restaurantName}</td>
				<td>${cart.totalAmount}</td>
				<td>${cart.address}</td>
			</tr>
	</table> --%>
		<table id="cart">
			<tr>
				<th>FOOD ITEMS</th>
				<th>RESTAURANT NAME</th>
				<th>ADDRESS</th>
				<th>QUANTITY</th>
				<th>PRICE</th>
				<!-- <th>TOTAL PRICE</th> -->
			</tr>
			
			
	
		
			<jstl:forEach var="products" items="${cart.products}">
				<tr>
				<td>${products.foodName}</td>
				<td>${cart.restaurantName}</td>
				<td>${cart.address.area}</td>
				<td>${products.quantity}</td>
				<td>${products.price}</td>
				<%-- <td rowspan="2">${cart.totalAmount}</td> --%>
					</tr>
				</jstl:forEach>
						</table>

<div><h3>Total Amount: <input type="number" value="${cart.totalAmount}" readonly="readonly"></h3></div>
		
			
			
				
				
				
<input type='number'  min='1' name='qty' id='qty' />
			<input type='button' name='add' onclick='javascript: document.getElementById("qty").value++;' value='+'/>
			<input type='button' name='subtract' onclick='javascript: document.getElementById("qty").value--;' value='-'/>


<%-- 
			<td>${cartItem.productName}</td>
			 <td>${cartItem.price}</td>
			<td>${cartItem.quantity}</td>
			<td>${cartItem.price*cartItem.quantity}</td> --%>








		<input type="submit" value="Place Order">
	</form>
</body>
</html>