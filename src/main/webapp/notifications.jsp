<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
    <style>
        .notification {
            border-left: 4px solid #4CAF50;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }
        .unread {
            background-color: #e8f5e9;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Notifications</h1>
    
    <c:forEach items="${notifications}" var="notification">
        <div class="notification ${notification.is_read ? '' : 'unread'}">
            <p>${notification.message}</p>
            <small>${notification.created_at}</small>
            <c:if test="${!notification.is_read}">
                <form action="markasread" method="post" style="display: inline;">
                    <input type="hidden" name="notificationId" value="${notification.notification_id}">
                    <button type="submit">Mark as Read</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</body>
</html>