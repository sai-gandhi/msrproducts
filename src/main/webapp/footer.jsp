<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


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