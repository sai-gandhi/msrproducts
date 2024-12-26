<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
h2{
color:green;
}


/*css for button 2 clear*/
.button2{
 width: 15%;
    padding: 12px;
    background-color: red;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

label{
color:orange;
width:25%;
background-color: gray;
color: white;
border:none;
border-radius: 4px;
font-size:16px;
cursor:pointer;


}





</style>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body align="center">
	<h2>Add Product</h2>
	<form method="post" action="insertproduct"
		enctype="multipart/form-data">
		<div class="body1">
			<label>Product Name:</label> <input type="text"
				placeholder="Enter Product Name." required="required" name="name"><br>
			<br> <label>Product Cost:</label> <input type="text"
				placeholder="Enter Product Cost." required="required" name="cost"><br>
			<br> <label>Product Description:</label> <input type="text"
				placeholder="Enter Product Description." required="required"
				name="description"><br>
			<br> <label>Product Image:</label> <input type="file"
				required="required" name="image"><br>
			<br> <input class="button2" type="submit" value="Add Product" />&nbsp;&nbsp;
			 <input class="button2" type="reset" value="clear" />&nbsp;&nbsp;
		</div>
	</form>

</body>
</html>