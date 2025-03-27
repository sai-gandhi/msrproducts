<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <style>
marquee {
	text-shadow: 2px 2px 4px orange;
	font-size:20px;
	color:red;
}

table{
width: 100%;
 border-collapse: collapse;
}

h4 {
	color: red;
}

h3 {
	color: blue;
}

h2 {
	color: blue;
}

a {
	color: red;
}

th {
	color: red;
	background-color: lightpink;
	padding:10px;
	text-align:center;
	border:1px solid black;
}


td {
    color: green;
    background-color: lightgray;
    padding: 10px;
    text-align: center;
    border: 1px solid black;
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
    <title>Market Prices</title>
</head>
<body>
    <h2>View All Market Prices</h2>
    <a href="home.jsp">Back to home</a>
    <br><br>
    <marquee>Note: Changes in prices come from shifts in market supply, market demand, or both.</marquee>
    <h3>Markets of</h3>
    <h4> Khammam, Enkoor</h4>
    <table border="1">
        <thead>
            <tr>
                
                <th>Product Name</th>
                <th>Date</th>
                <th>Maximum Price</th>
                <th>Average Price</th>
                <th>Minimum Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="marketrate" items="${marketrates}">
                <tr>
                    
                    <td>${marketrate.productname}</td>
                    <td>${marketrate.date}</td>
                    <td>${marketrate.maxrate}</td>
                    <td>${marketrate.avgrate}</td>
                    <td>${marketrate.minrate}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
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
