<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
marquee{
color:orange;
}
marquee:hover{
color:blue;
max-height: 50px;
max-width: 50[x;]
}
body{
border-color: black;
}
.footor{
background-color: red;
color:white;
background-repeat: repeat-x;
}
#image1 {
            height: 525px;
            width: 1500px;
        }
        
 .image-container {
            display: flex;
            justify-content: space-around; /* Optional: Controls the spacing between images */
        }
        .image-container img {
            height: 250px;
            width: 750px;
            margin: 5px; /* Optional: Adds space around the images */
        }
   .text{
   color:green;
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
<title>Home Page</title>
</head>
<body>
<%@include file="homenavbar.jsp" %>
<marquee><h2>Welcome to MSR Products & Services</h2></marquee>

<div class="text">
<h4>Agriculture is not crop production as popular belief holds - it's the production of food and fiber from the world's land and waters. Without agriculture it is not possible to have a city, stock market, banks, university, church or army. Agriculture is the foundation of civilization and any stable economy.
Read more at </h4>
</div>

<div class="video-container">
  <video width="80%" height="10%" autoplay controls >
    <source src="/videos/stock-footage-growing.webm" type="video1/mp4">
  </video>
</div>
<div class="image1">
<img id="image1" src="/images/plants.png" alt="Plants Image">
</div>
<div class="image-container">
<img src="/images/photo2.jpg" alt="growing plant">
<img src="/images/agriculture.jpg" alt="Spraing photo">

</div>

 <div class="marquee-container">
        <div class="marquee-content">
             <img src="/images/1.png" alt="Image 1">
             <img src="/images/2.png" alt="Image 2">
             <img src="/images/3.png" alt="Image 3">
             <img src="/images/4.png" alt="Image 4">
             <img src="/images/5.png" alt="Image 5">
             <img src="/images/6.png" alt="Image 6">
             <img src="/images/1.png" alt="Image 1">
             <img src="/images/2.png" alt="Image 2">
             <img src="/images/3.png" alt="Image 3">
             <img src="/images/4.png" alt="Image 4">
             <img src="/images/5.png" alt="Image 5">
             <img src="/images/6.png" alt="Image 6">
        </div>
    </div>


</body>

<footer>
<div class="footor">
<h6>@2019 MSR Products and Services.</h6>
</div>
</footer>

</html>