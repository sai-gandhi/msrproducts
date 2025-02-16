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
    <form method="post" action="insertproduct" enctype="multipart/form-data">
        <div class="body1">
            <label for="name">Product Name:</label> 
            <input type="text" id="name" placeholder="Enter Product Name." required name="name"><br>
            <br>
            <label for="cost">Product Cost:</label> 
            <input type="number" id="cost" placeholder="Enter Product Cost." required name="cost"><br>
            <br>
            <label for="productcount">Product Count:</label>
            <input type="number" id="productcount" required placeholder="Enter Product count" name="productcount"/><br>
            <br>
            <label for="description">Product Description:</label>
            <textarea id="description" rows="4" cols="50" placeholder="Enter Product Description." required name="description"></textarea><br>
            <br>
            <label for="image">Product Image:</label>
            <input type="file" id="image" required name="image"><br>
            <br>
            <input class="button2" type="submit" value="Add Product" />&nbsp;&nbsp;
            <input class="button2" type="reset" value="Clear" />&nbsp;&nbsp;
        </div>
    </form>
</body>

</html>