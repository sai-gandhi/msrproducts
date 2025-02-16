<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

body{
background-color: lightblue;
}
p{
font-family: verdana;
font-size:15px;
}
.specimage-container{
display: flex;
justify-content: space-around;
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
<title>About Us</title>
</head>
<body>
<%@include file="homenavbar.jsp" %>
<h2><u>About Us</u></h2>
<div class="founder-image">
<h4> Uppalapati MadhuSudhan Rao</h4>
<img src="/images/founder2.png" alt="founder">
</div>
<h3>Welcome to MSR Products</h3><p>a trusted name in the agricultural products industry for over six years.</p>
<p>Founded and managed by Uppalapati MadhuSudhan Rao and Uppalapati Krishnaveni, Established in 2019, our mission is to support farmers and customers alike by providing high-quality agricultural products and facilitating fair trade.</p>
<p>Our mission is to bridge the gap between producers and buyers by creating a platform that's supports fair trade and quality assurance in agricultural products.</p>
<div>

<h5><u>We Specialize in:</u></h5>
<p>@ Selling premium agricultural products tailored to meet the diverse needs of farmers and agricultural enthusiasts.</p>
<p>@ Purchasing cotton directly from farmers, ensuring they receive fair prices for their hard work.</p>
<p>@ Sourcing and buying the finest chilies from the farmers to maintain quality and freshness.</p>
<div class="specimage-container">
<img src="/images/cotton.jpg" alt="cotton">
<img src="/images/chilli.jpg" alt="cotton">
<img src="/images/planta.jpg" alt="cotton">
</div>

</div>
<h4><u>Our Vision</u></h4>
<p>To become a trusted leader in the agricultural sector by promoting sustainability, fostering growth for farmers, and delivering value to customers.</p>
<h4><u>Our Values</u></h4>
<p><h5>$ Integrity: </h5>Transparent and fair dealing in every transaction.</p>
<p><h5>$ Quality:</h5>Ensuring only the best agricultural products reach our customers.</p>
<p><h5>$ Community:</h5>Strengthening bonds with farmers and creating a positive impact on the agricultural ecosystem.</p>
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