<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify OTP | MK Products</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #3a7bd5, #00d2ff);
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .otp-container {
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }
        h2 {
            color: #333333;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1.5px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 20px;
            outline: none;
            transition: 0.3s;
        }
        input[type="text"]:focus {
            border-color: #3a7bd5;
            box-shadow: 0 0 5px rgba(58, 123, 213, 0.5);
        }
        input[type="submit"] {
            background-color: #3a7bd5;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #005bbb;
        }
        .error {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="otp-container">
        <h2>Verify Your Email</h2>
        <p>${message}</p>

        <form action="verifyotp" method="post">
            <input type="hidden" name="email" value="${email}">
            <input type="text" name="otp" placeholder="Enter OTP" maxlength="6" required>
            <input type="submit" value="Verify">
        </form>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    </div>

    <!-- JavaScript Redirect after 30 seconds if error exists -->
    <c:if test="${redirect}">
        <script>
            setTimeout(() => {
                window.location.href = 'customerregister';
            }, 10000); // 30000ms = 30 seconds
        </script>
    </c:if>
</body>
</html>
