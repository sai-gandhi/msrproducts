<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
	margin: 0px;
	}
	.production-heading{
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 }
	 a{
	 text-decoration: none;
	 position: relative;
	 padding:10px;
	 font-size: 18px;
	 text-align: center;
	 }
	 
	 .A,.B,.C{
	  height: 15px;
	  width: 35px;
	  background: gray;
	  border-radius: 10px;
	 }
	 
	 .A:hover,
	.B:hover,
	.C:hover {
    background: lightblue;
}
	 
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="production-heading">Productions</h1>
<a class="A" href="commercial_crop">COMMERCIAL CROPS</a>
<a class="B" href="food_grains">FOOD GRAINS</a>
<a class="C" href="oil_seeds">OIL SEEDS</a>
</body>
</html>