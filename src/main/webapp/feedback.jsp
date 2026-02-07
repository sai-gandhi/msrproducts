<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Feedback</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --accent-green: #22c55e;
    --accent-dark: #16a34a;
    --danger: #ef4444;

    --bg-card: rgba(255,255,255,0.12);
    --border-soft: rgba(255,255,255,0.25);

    --text-main: #e5e7eb;
    --text-muted: #cbd5f5;
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
    background:
        linear-gradient(rgba(2,6,23,0.7), rgba(2,6,23,0.7)),
        url('/images/feedback.png') no-repeat center center fixed;
    background-size: cover;

    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

/* Card */
.container {
    width: 420px;
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.18),
        rgba(255,255,255,0.05)
    );
    backdrop-filter: blur(16px);
    border: 1px solid var(--border-soft);
    border-radius: 22px;
    padding: 28px;
    box-shadow: 0 25px 60px rgba(0,0,0,0.45);
}

/* Title */
h2 {
    text-align: center;
    margin-bottom: 22px;
    font-size: 1.6rem;
    font-weight: 600;
    background: linear-gradient(90deg, var(--accent-green), #86efac);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Labels */
label {
    display: block;
    margin-top: 14px;
    font-size: 0.85rem;
    font-weight: 500;
    color: var(--text-muted);
}

/* Inputs */
input[type="text"],
input[type="file"] {
    width: 100%;
    margin-top: 6px;
    padding: 10px 12px;
    border-radius: 10px;
    border: 1px solid var(--border-soft);
    background: rgba(255,255,255,0.15);
    color: var(--text-main);
    font-size: 0.9rem;
}

input::placeholder {
    color: #e5e7eb;
    opacity: 0.8;
}

input:focus {
    outline: none;
    border-color: var(--accent-green);
}

/* Buttons */
.actions {
    display: flex;
    justify-content: space-between;
    margin-top: 24px;
}

input[type="submit"],
input[type="reset"] {
    width: 48%;
    padding: 12px 0;
    border: none;
    border-radius: 999px;
    font-size: 0.9rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
}

/* Submit */
input[type="submit"] {
    background: linear-gradient(135deg, var(--accent-green), var(--accent-dark));
    color: white;
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(34,197,94,0.5);
}

/* Reset */
input[type="reset"] {
    background: rgba(239,68,68,0.2);
    color: #fecaca;
    border: 1px solid rgba(239,68,68,0.4);
}

input[type="reset"]:hover {
    background: rgba(239,68,68,0.35);
}

/* Responsive */
@media (max-width: 480px) {
    .container {
        width: 100%;
        padding: 22px;
    }
}
</style>
</head>

<body>

<div class="container">
    <h2>Customer Feedback</h2>

    <form action="savefeedbackform" method="post" enctype="multipart/form-data">

        <label>Customer Name</label>
        <input type="text" name="customer-name"
               placeholder="Enter your name" required>

        <label>Contact Number</label>
        <input type="text" name="contact"
               placeholder="Enter contact number" required>

        <label>Products Used</label>
        <input type="text" name="product-name"
               placeholder="Enter product names" required>

        <label>Crop</label>
        <input type="text" name="crop-name"
               placeholder="Enter crop name" required>

        <label>What Happened</label>
        <input type="text" name="user-story"
               placeholder="Share your experience" required>

        <label>Upload Image</label>
        <input type="file" name="image" required>

        <div class="actions">
            <input type="submit" value="Submit">
            <input type="reset" value="Clear">
        </div>

    </form>
</div>

</body>
</html>
