<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
 /* Contact Information Section */
    .contact1 {
        background-color: #fff;
        max-width: 800px;
        margin: 20px auto;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .contact1 h5 {
        font-size: 16px;
        color: #555;
        text-align: center;
        font-style: italic;
        margin-bottom: 25px;
    }
    
    .contact1 h4 {
        margin: 15px 0;
        padding: 10px;
        background-color: lightgreen;
        border-left: 4px solid #27ae60;
        color: red;
    }
    
    .contact1 h4:hover{
      transform: translateY(-5px);
    }
.contact-form{
	background: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    width: 50%;
    margin: 20px auto;
}
.why-contact-as{
	background: lightgreen;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    width: 50%;
    margin: 20px auto;
}

input[type="text"],
input[type="date"],
input[type="file"] {
    padding: 10px;
    width: 95%;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"], input[type="reset"] {
    background-color: #4caf50;
    color: white;
    padding: 10px 15px;
    border: none;
    cursor: pointer;
    margin-top: 10px;
    border-radius: 5px;
}

input[type="reset"]{
  	background-color: red;
}

input[type="submit"], input[type="reset"]:hover{
	transform: translateY(-5px);
}


body{
background-color: lightblue;
}

 .marquee-container {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            padding: 10px;
        }
        
        .marquee-content {
            display: inline-block;
            animation: marquee 10s linear infinite;
        }

        @keyframes marquee {
            from {
                transform: translateX(50%);
            }
            to {
                transform: translateX(-50%);
            }
        }

        img {
            width: 200px;
            height: auto;
            margin: 0 10px;
        }

</style>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
</head>
<body>
<%@include file="homenavbar.jsp" %>
<h2>Contact Us</h2>

<div class="contact1">
<h5>We' re here to help you with all your agricultural needs! Reach out to us through the form below or use the contact details to connect directly.Let'S work together to grow and succeed</h5>
<h2>Quick Contact Information</h2>
<h4>📞 Call Us: +91-8179386423</h4>
<h4>✉️ Email: saichows63@gmail.com</h4>
<h4>MSR Products, TL peta Enkoor, Khammam, 507168 </h4>
<h4>⏰ Business Hours: Monday to Saturday, 6:00 AM - 10:00 PM</h4>
</div>

<h2>Contact Form</h2>

<form action="savecontactinformation" method="post" enctype="multipart/form-data">
<div class="contact-form">
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


<div  class="why-contact-as" style="text-align:center;">
    <h3>Why Contact Us?</h3>
    <p>✔ Get expert advice on our agricultural products.</p>
    <p>✔ Discuss bulk orders and pricing.</p>
    <p>✔ Ask about our farmer-friendly initiatives.</p>
    <h4>Don’t hesitate to reach out! We’re excited to connect and assist you.</h4>
</div>

<div class="marquee-container">
        <div class="marquee-content">
            <img src="/images/1.png" alt="Image 1">
            <img src="/images/2.png" alt="Image 2">
            <img src="/images/3.png" alt="Image 3">
            <img src="/images/4.png" alt="Image 4">
             <img src="/images/5.png" alt="Image 5">
              <img src="/images/6.png" alt="Image 6">
        </div>
    </div>

</body>
</html>