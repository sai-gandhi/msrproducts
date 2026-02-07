<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
</head>
<body>
<%@include file="homenavbar.jsp" %>
<h2>Contact Us</h2>

<div>
<h5>We' re here to help you with all your agricultural needs! Reach out to us through the form below or use the contact details to connect directly.Let'S work together to grow and succeed</h5>
<h2>Quick Contact Information</h2>
<h4>📞 Call Us: +91-8179386423</h4>
<h4>✉️ Email: saichows63@gmail.com</h4>
<h4>MSR Products, TL peta Enkoor, Khammam, 507168 </h4>
<h4>⏰ Business Hours: Monday to Saturday, 6:00 AM - 10:00 PM</h4>
</div>

<h2>Contact Form</h2>

<form action="savecontactinformation" method="post" enctype="multipart/form-data">
<div>
<label>User Name: </label>
<input type="text" placeholder="Enter User Name.."  required="required"  name="uname"/><br><br>
<label>Contact Number: </label>
<input type="text" placeholder="Enter Contact Number.."  required="required"  name="ucontact"/><br><br>
<label>Location: </label>
<input type="text" placeholder="Enter Location.."  required="required"  name="ulocation"/><br><br>
<label>Date:</label>
<input type="date" placeholder="Enter the date..." required="required" name="date"/><br><br>
<label>Message: </label>
<input type="text"   placeholder="Enter Message.."  required="required"  name="umessage"/><br><br>
<label>Product Image:</label>
<input type="file"  required="required" name="uimage"><br><br>
<input type="submit" value="Submit"/>&nbsp;&nbsp;
<input type="reset" value="clear"/>&nbsp;&nbsp;
</div>
</form>


<div>
<h3>Why Contact Us?</h3>
<p>Get expert advice on our agricultural products.</p>
<p>Discuss bulk orders and pricing.</p>
<p>Ask about our farmer-friendly initiatives.</p>
<h4>Don’t hesitate to reach out! We’re excited to connect and assist you.</h4>
</div>

</body>
</html>