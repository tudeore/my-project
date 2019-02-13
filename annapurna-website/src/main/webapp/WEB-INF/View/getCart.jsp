<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
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
<table>
		<tr>
				<th>FOOD ITEMS</th>
				<th>RESTAURANT NAME</th>
				<th>ADDRESS</th>
				
				<th>PRICE FOR EACH</th>
				<th>SELECT QUANTITY</th>
				<!-- <th>TOTAL PRODUCT PRICE</th> -->
				<!-- <th>TOTAL PRICE</th> -->
				<!-- <th>TOTAL PRICE</th> -->
			</tr>
			<tr>
			<jstl:forEach var="products" items="${cart.products}">
				<tr>
				<td>${products.foodName}</td>
				<td>${cart.restaurantName}</td>
				<td>${cart.address.area}</td>
				<%-- <td>
				<input type="button" onclick="myFunctionSub()" value="-">
				<input type="number" id="quantity" min="1"  value="${products.quantity}" oninput = "calculate()"  readonly="readonly">
				<input type="button" onclick="main()" value="+">
			</td> --%>
				<!-- <td><input type="number" name="price" value  > -->
				<td> <input type="number" id="price" value="${products.price}" oninput = "calculate()" readonly="readonly"></td>
				<%-- <td><input type = "number" value="${products.price}" id= "result" readonly="readonly"> --%>
			<td>
				<select id="quantity" onchange="calculate()">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				
				</select>
					
				</td>
				</jstl:forEach>
				
				
				</tr>	
				


<div><h3>Total Amount: <input type="number" <%-- value="${cart.totalAmount}" --%>value="document.getElementById("quantity").value*document.getElementById("price").value" readonly="readonly"></h3></div>
</div>

<script type="text/javascript">
function calculate(){
	 var myBox1 = document.getElementById('price').value; 
	    var myBox2 = document.getElementById('quantity').value;
	    var result = myBox1*myBox2;
	    document.getElementById('result').value = result;
}



</script>
	<!-- <script>
		function main() {
			var x = document.getElementById("quantity").value;
			x++;
			document.getElementById("quantity").value = x;
			 
		}
		function myFunctionSub() {
			var x = document.getElementById("quantity").value;
			if(x>0){
				x--;
				document.getElementById("quantity").value = x;
			}
		function calculate(){
			 var myBox1 = document.getElementById('price').value; 
			    var myBox2 = document.getElementById('quantity').value;
			    var result = document.getElementById('result'); 
			    var myResult = quantity * price;
			    document.getElementById('result').value = myResult;
		}
		}
	</script> -->
</body>
</html>