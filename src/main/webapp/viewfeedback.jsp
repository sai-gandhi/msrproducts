<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Feedbacks</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            width: 100px;
            height: auto;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 25px;
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--primary-dark);
            transform: translateX(-3px);
        }

        .back-link i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <h2>Customer Feedbacks</h2>
     <a href="customerhome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Products</th>
            <th>Crop</th>
            <th>User Story</th>
            <th>Image</th>
        </tr>
        <c:forEach var="feedback" items="${feedbacks}">
            <tr>
                <td>${feedback.id}</td>
                <td>${feedback.name}</td>
                <td>${feedback.contact}</td>
                <td>${feedback.products}</td>
                <td>${feedback.crop}</td>
                <td>${feedback.userstory}</td>
                <td>
                    <img src="displayfeedbackimage?id=${feedback.id}" alt="Feedback Image">
                </td>
            </tr>
        </c:forEach>
    </table>
    <%@include file="footer.jsp" %>
</body>
</html>
