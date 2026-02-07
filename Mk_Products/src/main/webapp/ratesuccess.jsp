<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Rate Status</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }

  .container {
    max-width: 600px;
    margin: 100px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    text-align: center;
  }

  h3 {
    background-color: #4CAF50;
    color: white;
    padding: 15px;
    border-radius: 5px;
  }

  a {
    display: inline-block;
    margin: 20px 10px 0 10px;
    padding: 10px 20px;
    background-color: #2196F3;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }

  a:hover {
    background-color: #0b7dda;
  }
</style>
</head>
<body>
  <div class="container">
    <h3>Product Rate added successfully</h3>
    <a href="viewadminmarketrate">See the Market Rates</a>
    <a href="addrates.jsp">Add Product Rate</a>
  </div>
</body>
</html>
