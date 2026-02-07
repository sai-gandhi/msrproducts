<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
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

  /* ===== LOGIN CONTAINER ===== */
  .login-container {
    background: #ffffff;
    width: 380px;
    margin: 40px auto;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    text-align: center;
    border-top: 4px solid #dc3545;
  }

  /* ===== HEADING ===== */
  .login-heading {
    color: #dc3545;
    margin-bottom: 25px;
    font-size: 24px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
  }

  /* ===== FORM ELEMENTS ===== */
  .form-group {
    margin-bottom: 20px;
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
  input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    font-size: 14px;
    transition: all 0.3s;
    box-sizing: border-box;
  }

  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color: #dc3545;
    outline: none;
    box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.15);
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

  .btn-login {
    background-color: lightblue;
    color: white;
  }

  .btn-login:hover {
    background-color: lightgreen;
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

  /* ===== ADMIN NOTE ===== */
  .admin-note {
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

  /* ===== RESPONSIVE DESIGN ===== */
  @media (max-width: 480px) {
    .login-container {
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
  
  <form method="post" action="checkadminlogin">
    <div class="login-container">
      <h2 class="login-heading">Admin Login</h2>
      
      <div class="form-group">
        <label for="name">Username</label>
        <input type="text" id="name" placeholder="Enter admin username" name="name" required>
      </div>
      
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" placeholder="Enter admin password" name="password" required>
      </div>
      
      <div class="button-group">
        <input type="submit" class="btn btn-login" value="Login">
        <input type="reset" class="btn btn-clear" value="Clear">
      </div>
      
      <div class="admin-note">
        <p>Note: Restricted access - Admin credentials required</p>
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