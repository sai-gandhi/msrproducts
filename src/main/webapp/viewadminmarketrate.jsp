<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Market Prices</title>
    <style>
        /* General page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: lightgray;
        }
        
        h2 {
            color: green;
            font-size: 25px;
            /*margin-bottom: 20px;*/
        }

        h3 {
            color: #333;
            font-size: 1.5em;
        }

        h4 {
            color: #555;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        /* Table Header */
        th {
            background-color: #ffcc00;
            color: #fff;
            padding: 12px;
            text-align: left;
            font-size: 1.1em;
            font-weight: bold;
        }

        /* Table Data */
        td {
            color: #333;
            padding: 12px;
            text-align: left;
            border-top: 1px solid #ddd;
        }

        .rateid {
            color: maroon;
        }

        .ratename {
            color: blue;
        }

        /* Hover effect for table rows */
        tr:hover {
            background-color: #f1f1f1;
        }

        /* Link Styling */
        a {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Back link styling */
        a.back-link {
            color: #0056b3;
            text-decoration: none;
        }

        a.back-link:hover {
            text-decoration: underline;
        }

        /* Message (Success/Error) box */
        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #e7f3e7;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
        }

        /* Table Caption */
        caption {
            font-size: 1.3em;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Empty message for no data */
        p.no-data {
            color: #ff0000;
            font-weight: bold;
            font-size: 1.1em;
        }
        .rate{
        color:red;
        }
    </style>
</head>
<body>
    <h2>MSR Service</h2>
    <a href="adminhome.jsp" class="back-link">Back to home</a><br><br>

    <!-- Feedback message -->
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

    <!-- Empty data message -->
    <c:if test="${empty marketrates}">
        <p class="no-data">No market rates available.</p>
    </c:if>

    <table border="2">
        <caption>Market Prices List</caption>
        <thead>
            <tr>
                <th class="rate">Product ID</th>
                <th class="rate">Product Name</th>
                <th class="rate">Date</th>
                <th class="rate">Maximum Price</th>
                <th class="rate">Average Price</th>
                <th class="rate">Minimum Price</th>
                <th class="rate">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="marketrate" items="${marketrates}">
                <tr>
                    <td class="rateid">${marketrate.id}</td>
                    <td class="ratename">${marketrate.productname}</td>
                    <td>${marketrate.date}</td>
                    <td>${marketrate.maxrate}</td>
                    <td>${marketrate.avgrate}</td>
                    <td>${marketrate.minrate}</td>
                    <td><a href="<c:url value='/deletemarketrate?id=${marketrate.id}' />" onclick="return confirm('Are you sure you want to delete this market rate?');">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <%@include file="footer.jsp" %>
</body>
</html>

