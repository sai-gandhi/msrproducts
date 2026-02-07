<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	 body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: lightgray;
    margin: 0;
    padding: 0;
    color: #343a40;
    line-height: 1.6;
  }
  
  .addrate-container{
    background: #ffffff;
    width: 450px;
    margin: 30px auto;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    text-align: center;
    border-top: 4px solid #28a745;
  }
  
  .addrate-heading{
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
  input[type="email"],
  input[type="password"],
  input[type="tel"] {
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
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 500;
    transition: all 0.3s;
    font-size: 14px;
    margin: 5px;
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
  
</style>
<meta charset="UTF-8">
<title>Market Rates</title>
</head>
	<body align="center">
	<h3 class="addrate-heading">Add price of the Product</h3>
		<form action="saveprices" method="post">
			<div class="addrate-container">
				<div class="form-group">
					<label>Product Name:</label>
			        <input type="text" placeholder="Enter Product Name..." required="required" name="pname">
				</div>
				<div class="form-group">
					<label>Date:</label>
					<input type="date" placeholder="Enter Product Name..." required="required" name="pdate">
				</div>
				<div class="form-group">
					<label>Maximum Price:</label>
					<input type="text" placeholder="Enter Maximum Price..." required="required" name="maxprice">
				</div>
				<div class="form-group">
					<label>Average Price:</label>
					<input type="text" placeholder="Enter Average Price..." required="required" name="avgprice">
				</div>
				
				<div class="form-group">
					<label>Minimum Price:</label>
			        <input type="text" placeholder="Enter Minimum Price..." required="required" name="minprice">
				</div>
				
				<div class="button-group">
					<input type="submit" class="btn btn-save" value="Add Rate"/>&nbsp;&nbsp;
					<input type="reset" class="btn btn-clear" value="clear"/>&nbsp;&nbsp;
				</div>
			</div>
		</form>
	<%@include file="footer.jsp" %>
	</body>
</html>