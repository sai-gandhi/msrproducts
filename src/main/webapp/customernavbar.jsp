<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>
<style>
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #f4f4f4;
    text-align: center;
}

/* Navbar Styling */
.customernavbar {
    background-color: green;
    color: white;
    padding: 5px;
    font-size: 24px;
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    align-items: center;
    
}

.customernavbar a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    background-color: #333;
    padding: 8px 12px;
    border-radius: 5px;
    transition: background 0.3s;
}

.customernavbar a:hover {
    background-color: #555;
}

/* Navigation Links */
body a {
    display: inline-block;
    color: black;
    text-decoration: none;
    text-transform: capitalize;
    font-size: 18px;
    padding: 10px 15px;
    margin: 10px;
    background-color: #ddd;
    border-radius: 5px;
    transition: all 0.3s ease-in-out;
}

body a:hover {
    background-color: #bbb;
}
</style>
</head>
<body>
<div class="customernavbar">
    <h2 align="left">MSR Products</h2>
    <a align="right" href="customerlogin">Logout</a>
</div>

<a href="customerhome">Home</a>&nbsp;&nbsp;
<a href="customerviewallproducts">View Products</a>&nbsp;&nbsp;
<a href="feedback">Feedback</a>&nbsp;&nbsp;
<a href="viewfeedback">View Feedbacks</a>&nbsp;&nbsp;
<a href="crop_details">Crop Details</a>&nbsp;&nbsp;
</body>
</html>