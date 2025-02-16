<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

navbar{
background-color: red;
}
.homenavbar{
align-content:center;
background-color: red;
height: 35px;
border-top-left-radius: 4em;
border-top-right-radius: 4em;
border-bottom-left-radius: 4em;
border-bottom-right-radius: 4em;


}

a{
color: white;
text-decoration: none;
text-transform: capitalize;
speak: spell-out;
}
.homebutton:active{
color:green;
}
.button:hover {
	color:blue;
}

</style>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>

<body align="center" >
<div class="navbar">
<h2>MSR Products</h2>
<div class="homenavbar" align="center">
<a href="home" class="button">Home</a>&nbsp;&nbsp;
<a href="aboutus" class="button">About Us</a>&nbsp;&nbsp;
<a href="contactus" class="button">Contact Us</a>&nbsp;&nbsp;
<a href="marketrates" class="button">Market Rate's</a>&nbsp;&nbsp;
<a href="customerlogin" class="button">Customer Login</a>&nbsp;&nbsp;
<a href="customerregister" class="button">Customer Register</a>&nbsp;&nbsp;
<a href="adminlogin" class="button">Admin Login</a>&nbsp;&nbsp;
</div>
</div>

</body>

</html>