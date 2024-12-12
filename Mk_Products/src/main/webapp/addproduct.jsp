<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>
<h2>Add Product</h2>
<form method="post" action="insertproduct" enctype="multipart/form-data">
<div>
<label>Product Name:</label>
<input type="text" placeholder="Enter Product Name." required="required" name="name"><br><br>
<label>Product Cost:</label>
<input type="text" placeholder="Enter Product Cost." required="required" name="cost"><br><br>
<label>Product Description:</label>
<input type="text" placeholder="Enter Product Description." required="required" name="description"><br><br>
<label>Product Image:</label>
<input type="file"  required="required" name="image"><br><br>
<input type="submit" value="Add Product"/>&nbsp;&nbsp;
<input type="reset" value="clear"/>&nbsp;&nbsp;
</div>
</form>

</body>
</html>