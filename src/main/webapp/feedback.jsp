<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Feedback Form</title>
</head>
<body>
	<form action="savefeedbackform" method="post" enctype="multipart/form-data">
	<div>
	
	 	<label>Customer Name </label>
		<input type="text" placeholder="Enter Customer name.." required="required" name="customer-name"/>
		<label>Contact Number</label>
		<input type="text" placeholder="Enter contact.." required="required" name="contact"/>
		<label>Products Used </label>
		<input type="text" placeholder="Enter products names.." required="required" name="product-name"/>
		<label>Crop</label>
		<input type="text" placeholder="Enter crop name.." required="required" name="crop-name"/>
		<label>What Happens</label>
		<input type="text" placeholder="Enter user story.." required="required" name="user-story"/>
		<input type="submit" value="Submit"/>&nbsp;&nbsp;
        <input type="reset" value="clear"/>&nbsp;&nbsp;
	</div>

</body>
</html>