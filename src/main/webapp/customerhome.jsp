<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
<meta charset="UTF-8">
<title>Customer Home</title>
</head>

<script>
setTimeout(function() {
    alert("Your session has expired. You will be logged out.");
    window.location.href = "/logout"; // Redirect to logout
}, 2 * 60 * 1000); // 5 minutes timeout
</script>


<body>
<%@include file="customernavbar.jsp" %>
<img align="middle" src="images/customerhome1.png" alt="Customer Home" style="width:75%; height:auto;">

<div>

</div>

<!-- <div class="video-container">
<video width="100%"   controls >
    <source src="/videos/people-hands-shake.webm" type="video2/mp4">
  </video>

</div> -->

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

</body>
</html>