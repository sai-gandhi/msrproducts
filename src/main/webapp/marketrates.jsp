<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <style>
        marquee {
            font-size: 15px;
            color: #333;
            font-family: Arial, sans-serif;
            font-weight: normal;
            animation: move-left-to-right 200s linear infinite;
            color: red;
        }
        h4{
        color:green;
        }
        h3{
        color: blue;
        }
        h2{
        color: blue;
        }
        a{
        color:red;
        }
        
        th{
        color:red;
        }
        td{
        color:green;
        }
    </style>
    <title>Market Prices</title>
</head>
<body>
    <h2>View All Market Prices</h2>
    <a href="home.jsp">Back to home</a>
    <br><br>
    <marquee>Note: Changes in prices come from shifts in market supply, market demand, or both.         Note: Changes in prices come from shifts in market supply, market demand, or both.</marquee>
    <h3>Markets of</h3>
    <h4>Khammam, Enkoor</h4>
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
</body>
</html>
