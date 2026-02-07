<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Feedbacks</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f1f3f6;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin: 30px 0 20px;
            font-weight: 600;
        }

        .back-link {
            display: inline-block;
            margin: 20px 30px;
            color: #2874f0;
            font-size: 16px;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link i {
            margin-right: 8px;
        }

        .feedback-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
            padding: 20px 40px 60px;
            justify-items: center;
        }

        .feedback-card {
            background-color: #fff;
            width: 100%;
            max-width: 360px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12);
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }

        .feedback-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        .feedback-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            background-color: #f0f0f0;
        }

        .feedback-content {
            padding: 15px 18px 20px;
        }

        .feedback-content h3 {
            font-size: 18px;
            color: #222;
            margin: 5px 0 8px;
            font-weight: 600;
        }

        .feedback-meta {
            color: #555;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .feedback-meta i {
            color: #2874f0;
            margin-right: 6px;
        }

        .product-badge,
        .crop-badge {
            display: inline-block;
            background-color: #eaf3ff;
            color: #2874f0;
            font-size: 13px;
            font-weight: 500;
            padding: 4px 10px;
            border-radius: 20px;
            margin-right: 8px;
        }

        .feedback-story {
            font-size: 14px;
            color: #444;
            line-height: 1.6;
            margin-top: 10px;
            position: relative;
        }

        .feedback-story i {
            color: #2874f0;
            margin-right: 5px;
        }

        /* Responsive tweaks */
        @media (max-width: 600px) {
            .feedback-container {
                padding: 15px;
            }

            .feedback-card {
                max-width: 100%;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

    <a href="customerhome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
    <h2>Customer Feedbacks</h2>

    <div class="feedback-container">
        <c:forEach var="feedback" items="${feedbacks}">
            <div class="feedback-card">
                <img src="displayfeedbackimage?id=${feedback.id}" alt="Feedback Image" class="feedback-image">
                <div class="feedback-content">
                    <h3>${feedback.name}</h3>
                    <div class="feedback-meta">
                        <i class="fas fa-phone"></i> ${feedback.contact}
                    </div>
                    <div>
                        <span class="product-badge">${feedback.products}</span>
                        <span class="crop-badge">${feedback.crop}</span>
                    </div>
                    <p class="feedback-story">
                        <i class="fas fa-quote-left"></i> ${feedback.userstory}
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>

    <%@include file="footer.jsp" %>

</body>
</html>
