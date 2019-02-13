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
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
	<div ng-app="">
		<table id="cart">
		
			<tr>
				<th>FOOD ITEMS</th>
				<th>RESTAURANT NAME</th>
				<th>ADDRESS</th>
				<th>QUANTITY</th>
				<th>PRICE</th>
				<th>TOTAL PRICE</th>
				<!-- <th>TOTAL PRICE</th> -->
			</tr>
			
					
			<jstl:forEach var="products" items="${cart.products}" varStatus="status" >
				<tr>
				<td>${products.foodName}</td>
				<td>${cart.restaurantName}</td>
				<td>${cart.address.area}</td>
				<%-- <td>${products.quantity}</td> --%>
				<td >
				<input type="number" id="quantity${status.index}" name = "quantity"<%--  value = "${products.quantity}" --%> min = "1"  ng-model="quantity${status.index}" ng-init="quantity${status.index}=${products.quantity}" /></td>
				<%-- <td><input type ="number"  name = "price" value ="${products.price}" ng-model="num1" 
									ng-init = "num1=${products.price}" readonly="readonly"/></td> --%>
				<!-- <td><input type="number" name="totalprice" ng-model="" </td> -->
				
				<td><input type="number" name="price" value="${products.price}" readonly="readonly" ng-model="price${status.index}" ng-init = "price${status.index}=${products.price}"/></td>
				<td>
				<input type="number"  id="updatedPrice${status.index}" onchange="compute()" name="updatedPrice" value="{{ quantity${status.index} * price${status.index}}}"
				ng-model="updatedPrice${status.index}" ng-init = "updatedPrice${status.index}={{ quantity${status.index} * price${status.index}}}" readonly="readonly"/>
				
				</td>
					</tr>
				</jstl:forEach>
						</table>








<div><h3>Total Amount: 

<input type="number" id="totalPrice${status.index}" name="totalPrice" readonly="readonly"
value="{{ quantity${status.index} * price${status.index}}}" id="totalPrice${status.index}" 
ng-model="totalPrice${status.index}" 
ng-init = "totalPrice${status.index}={{ quantity${status.index} * price${status.index}}}" />


</div>
<script type="text/javascript">
function compute(){
	var updatedPrice = document.getElementById("updatedPrice${status.index}").value;
	 document.getElementById("totalPrice${status.index}" ).value=updatedPrice;
}


</script>

		<input type="submit" class ="button" value="Place Order">
	</form>
</body>
</html>