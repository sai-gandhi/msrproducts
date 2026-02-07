<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
<style>
  /* ===== BASE STYLES ===== */
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    color: #343a40;
    line-height: 1.6;
  }

  /* ===== REGISTRATION CONTAINER ===== */
  .register-container {
    background: #ffffff;
    width: 450px;
    margin: 30px auto;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    text-align: center;
    border-top: 4px solid #28a745;
  }

   /* ===== HEADING ===== */
  .register-heading {
    color: #28a745;
    margin-bottom: 25px;
    font-size: 24px;
    font-weight: 600;
    letter-spacing: 1px;
    position: relative;
  }

  .register-heading::after {
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

  /* ===== FORM ELEMENTS ===== */
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
    border-color: #28a745;
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

  .btn-register {
    background-color: #28a745;
    color: white;
  }

  .btn-register:hover {
    background-color: #218838;
    transform: translateY(-2px);
  }

  .btn-clear {
    background-color: #6c757d;
    color: white;
  }

  .btn-clear:hover {
    background-color: #5a6268;
    transform: translateY(-2px);
  }

  /* ===== FOOTER NOTE ===== */
  .register-footer {
    color: #28a745;
    margin-top: 25px;
    font-size: 14px;
    padding: 12px;
    background-color: #f0fff4;
    border-radius: 4px;
    border-left:4px solid #28a745;
  }

  .login-link {
    color: #28a745;
    font-weight: 600;
    text-decoration: none;
    transition: color 0.3s;
  }

  .login-link:hover {
    color: #218838;
    text-decoration: underline;
  }

  /* ===== INPUT VALIDATION ===== */
  input:invalid {
    border-color: #dc3545;
  }

  input:valid {
    border-color: #28a745;
  }

  /* ===== RESPONSIVE DESIGN ===== */
  @media (max-width: 500px) {
    .register-container {
      width: 90%;
      padding: 20px;
    }
    
    .btn {
      width: 100%;
      margin: 5px 0;
    }
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
        
	.footor{
	background-color: red;
	color:white;
	background-repeat: repeat-x;
	}
</style>
</head>
<body>
  <%@include file="homenavbar.jsp" %>
  
  <form action="customerregistration" method="post">
    <div class="register-container">
      <h2 class="register-heading">Customer Registration</h2>
      
       <c:if test="${not empty message}">
    <div style="color: ${message.startsWith('Error') ? 'red' : 'green'}; margin-bottom: 15px; font-weight: bold;">
      ${message}
    </div>
  </c:if>
  
  <form action="customerregistration" method="post">
    <div class="form-group">
      <label for="uname">Username</label>
      <input type="text" id="uname" placeholder="Enter username" name="uname" required>
    </div>
    
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" id="email" placeholder="Enter email" name="email" required>
    </div>
    
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" placeholder="Enter password" name="password" required>
    </div>
    
    <div class="form-group">
      <label for="location">Location</label>
      <input type="text" id="location" placeholder="Enter location" name="location" required>
    </div>
    
    <div class="form-group">
      <label for="contact">Contact</label>
      <input type="tel" id="contact" placeholder="Enter 10-digit number" 
             name="contact" pattern="\d{10}" title="Please enter 10 digits" required>
    </div>
      
      <div class="button-group">
        <button type="submit" class="btn btn-register">Register</button>
        <button type="reset" class="btn btn-clear">Clear</button>
      </div>
      
      <div class="register-footer">
        <p>Already have an account? <a href="customerlogin.jsp" class="login-link">Login here</a></p>
      </div>
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
    
	<footer>
		<div class="footor">
			<h6>© Copyright 2019 by MSR Products. All Rights Reserved.</h6>
		</div>
	</footer>
  </form>
</body>
</html>