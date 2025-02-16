<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
</head>
<body>
<label>Product Id:</label>
<input type="text" readonly="readonly" name="productid" value="${product.id }"><br><br>

<label>Product name:</label>
<input type="text"  name="productname" value="${product.name }"><br><br>

<label>Product Cost:</label>
<input type="text" placeholder="Enter the cost " name="cost" value="${product.cost }"/><br><br>
<label>Available Product:</label>
<input type="text" placeholder="Enter count of product available" name="productcount" value="${product.productcount }"/><br><br>
<label>Product Description</label>
<input type="text" placeholder="Enter the product description" name="description" value="${product.description }"/><br><br>
<button type="button"></button>
</body>
</html>