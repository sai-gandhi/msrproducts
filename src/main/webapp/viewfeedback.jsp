<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Feedbacks</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
    --accent: #6366f1;
    --accent-soft: rgba(99,102,241,0.2);

    --bg-main: #020617;
    --bg-card: rgba(255,255,255,0.10);
    --border-soft: rgba(255,255,255,0.18);

    --text-main: #e5e7eb;
    --text-muted: #94a3b8;
}

/* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', 'Segoe UI', sans-serif;
}

body {
    min-height: 100vh;
    background: radial-gradient(circle at top left, #1e293b, #020617);
    color: var(--text-main);
}

/* Back link */
.back-link {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    margin: 24px 40px;
    color: #c7d2fe;
    font-size: 0.9rem;
    text-decoration: none;
    font-weight: 500;
}

.back-link:hover {
    text-decoration: underline;
}

/* Heading */
h2 {
    text-align: center;
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 40px;
    background: linear-gradient(90deg, var(--accent), #a5b4fc);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Grid */
.feedback-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 28px;
    padding: 0 40px 60px;
}

/* Card */
.feedback-card {
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.14),
        rgba(255,255,255,0.04)
    );
    backdrop-filter: blur(14px);
    border: 1px solid var(--border-soft);
    border-radius: 22px;
    overflow: hidden;
    transition: all 0.35s ease;
}

.feedback-card:hover {
    transform: translateY(-6px);
    border-color: rgba(99,102,241,0.6);
    box-shadow: 0 25px 60px rgba(0,0,0,0.45);
}

/* Image */
.feedback-image {
    width: 100%;
    height: 220px;
    object-fit: cover;
    background: rgba(255,255,255,0.1);
}

/* Content */
.feedback-content {
    padding: 18px 20px 22px;
}

.feedback-content h3 {
    font-size: 1.1rem;
    font-weight: 600;
    margin-bottom: 8px;
}

/* Meta */
.feedback-meta {
    font-size: 0.85rem;
    color: var(--text-muted);
    margin-bottom: 12px;
}

.feedback-meta i {
    color: #a5b4fc;
    margin-right: 6px;
}

/* Badges */
.badges {
    margin-bottom: 12px;
}

.badge {
    display: inline-block;
    padding: 5px 12px;
    font-size: 0.7rem;
    font-weight: 600;
    border-radius: 999px;
    margin-right: 6px;
}

.product-badge {
    background: rgba(99,102,241,0.2);
    color: #c7d2fe;
}

.crop-badge {
    background: rgba(34,197,94,0.2);
    color: #86efac;
}

/* Story */
.feedback-story {
    font-size: 0.9rem;
    color: var(--text-main);
    line-height: 1.6;
}

.feedback-story i {
    color: #a5b4fc;
    margin-right: 6px;
}

/* Responsive */
@media (max-width: 600px) {
    .feedback-container {
        padding: 0 20px 40px;
    }

    h2 {
        font-size: 1.6rem;
    }
}
</style>
</head>

<body>

<a href="customerhome.jsp" class="back-link">
    <i class="fas fa-arrow-left"></i> Back to Home
</a>

<h2>Customer Feedbacks</h2>

<div class="feedback-container">

    <c:forEach var="feedback" items="${feedbacks}">
        <div class="feedback-card">

            <img src="displayfeedbackimage?id=${feedback.id}"
                 class="feedback-image" alt="Feedback Image">

            <div class="feedback-content">

                <h3>${feedback.name}</h3>

                <div class="feedback-meta">
                    <i class="fas fa-phone"></i> ${feedback.contact}
                </div>

                <div class="badges">
                    <span class="badge product-badge">${feedback.products}</span>
                    <span class="badge crop-badge">${feedback.crop}</span>
                </div>

                <p class="feedback-story">
                    <i class="fas fa-quote-left"></i>
                    ${feedback.userstory}
                </p>

            </div>
        </div>
    </c:forEach>

</div>

<%@include file="footer.jsp" %>

</body>
</html>
