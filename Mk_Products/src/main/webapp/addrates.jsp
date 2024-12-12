<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Market Rates</title>
</head>
<body align="center">
<h3>Add the price of Product</h3>
<form action="saveprices" method="post">
<div>
<label>Product Name:</label>
<input type="text" placeholder="Enter Product Name..." required="required" name="pname"><br><br>
<label>Date:</label>
<input type="date" placeholder="Enter Product Name..." required="required" name="pdate"><br><br>
<label>Maximum Price:</label>
<input type="text" placeholder="Enter Maximum Price..." required="required" name="maxprice"><br><br>
<label>Average Price:</label>
<input type="text" placeholder="Enter Average Price..." required="required" name="avgprice"><br><br>
<label>Minimum Price:</label>
<input type="text" placeholder="Enter Minimum Price..." required="required" name="minprice"><br><br>
<input type="submit" value="Add Rate"/>&nbsp;&nbsp;
<input type="reset" value="clear"/>&nbsp;&nbsp;
</div>
</form>

</body>
</html>