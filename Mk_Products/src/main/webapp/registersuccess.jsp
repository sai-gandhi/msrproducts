<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Register Success</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f7fa;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }
  
  .success-container {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    text-align: center;
    max-width: 500px;
    width: 90%;
    border-top: 5px solid #28a745;
  }
  
  h3 {
    color: #28a745;
    font-size: 24px;
    margin-bottom: 20px;
  }
  
  p {
    color: lightred;
    font-size: 16px;
    margin-bottom: 30px;
    line-height: 1.6;
  }
  
  .login-link {
    display: inline-block;
    background-color: lightblue;
    color: white;
    padding: 12px 24px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: 500;
    transition: all 0.3s ease;
  }
  
  .login-link:hover {
    background-color: lightgreen;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  .icon {
    font-size: 48px;
    color: #28a745;
    margin-bottom: 20px;
  }
</style>
</head>
<body>
<div class="success-container">
  <div class="icon">✓</div>
  <h3>Registration Successful!</h3>
  <p>Your registration is complete. To start your journey with us, please login.</p>
  <a href="customerlogin.jsp" class="login-link">Login Here</a>
</div>
</body>
</html>