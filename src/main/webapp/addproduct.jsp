<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

body{
	font-family:'segoe UI',Tahoma, Geneva, Verdana,sans-serif;
	background-color: lightgray;
	margin:0;
	padding:0;
	color:#343a40;
	line-height:1.6;
}

.addproduct-container{
	background: #ffffff;
	width: 450px;
	margin: 30px auto;
	padding:30px;
	border-radius: 8px;
	box-shadow:  0 4px 12px rgba(0, 0, 0, 0.08);
	text-align: center;
	border-top: 4px solid #28a745;
}

.addproduct-heading{
    color: red;
    margin-bottom: 25px;
    font-size: 24px;
    font-weight: 600;
    letter-spacing: 1px;
    position: relative;
  }
  
  .addrate-heading::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 3px;
    background: #28a745;
    border-radius: 3px;
  }
	.form-group {
    margin-bottom: 18px;
    text-align: left;
  }
  
   label {
    display: block;
    margin-bottom: 8px;
    color: #495057;
    font-weight: 500;
    font-size: 14px;
  }
  
  input[type="text"],
  input[type="number"],
  input[type="file"]
   {
  
    width: 100%;
    padding: 12px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    font-size: 14px;
    transition: all 0.3s;
    box-sizing: border-box;
  }

 input:focus {
    border-color: green;
    outline: none;
    box-shadow: 0 0 0 3px rgba(40, 167, 69, 0.15);
  }
  

/* ===== BUTTONS ===== */
  .btn {
    padding: 12px 08px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 500;
    transition: all 0.3s;
    font-size: 14px;
    margin: 5px;
    text-align: center;
  }

  .btn-save {
    background-color: lightblue;
    color: white;
  }

  .btn-save:hover {
    background-color:#28a745 ;
    transform: translateY(-2px);
  }

  .btn-clear {
    background-color: #6c757d;
    color: white;
  }

  .btn-clear:hover {
    background-color: red;
    transform: translateY(-2px);
  }
  
   .note-part {
    color: #dc3545;
    margin-top: 25px;
    font-size: 13px;
    font-weight: 500;
    padding: 10px;
    background-color: lightgreen;
    border-radius: 40px;
    border-left: 3px solid #dc3545;
    border-right:3px solid #dc3545;
  }



</style>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body align="center">
    
    <form method="post" action="insertproduct" enctype="multipart/form-data">
        <div class="addproduct-container">
        <h2 class="addproduct-heading">Add Product</h2>
        <p class="note-part">Note: Add Product Details only the admin can add products, including name, description, price, category, and stock info.</p>
            
            <div class="form-group">
            	<label for="name">Product Name:</label> 
            	<input type="text" id="name" placeholder="Enter Product Name." required name="name">
            </div>
            <div class="form-group">
            	<label for="cost">Product Cost:</label> 
            	<input type="number" id="cost" placeholder="Enter Product Cost." required name="cost">
            </div>
            <div class="form-group">
            	<label for="productcount">Product Count:</label>
            	<input type="number" id="productcount" required placeholder="Enter Product count" name="productcount"/>
            </div>
            <div class="form-group">
            	 <label for="description">Product Description:</label>
           		 <input type="text" id="description"  placeholder="Enter Product Description." required name="description"></input>
            </div>
            <div class="form-group">
            	 <label for="image">Product Image:</label>
            	 <input type="file" id="image" required name="image">
            </div>
            <div class="button-group">
            	<input class="btn btn-save type="submit" value="Add Product" />
            	<input class="btn btn-clear type="reset" value="Clear" />
            </div>
        </div>
    </form>
    <%@include file="footer.jsp" %>
</body>

</html>