<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Submitted</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --accent-green: #22c55e;
    --accent-dark: #16a34a;
    --bg-main: #020617;
    --bg-card: rgba(255,255,255,0.12);
    --border-soft: rgba(255,255,255,0.2);
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
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

/* Card */
.success-card {
    max-width: 420px;
    width: 100%;
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.18),
        rgba(255,255,255,0.05)
    );
    backdrop-filter: blur(16px);
    border: 1px solid var(--border-soft);
    border-radius: 22px;
    padding: 36px 28px;
    text-align: center;
    box-shadow: 0 25px 60px rgba(0,0,0,0.5);
    animation: fadeIn 0.6s ease;
}

/* Icon */
.success-icon {
    width: 72px;
    height: 72px;
    border-radius: 50%;
    margin: 0 auto 18px;
    background: rgba(34,197,94,0.2);
    display: flex;
    align-items: center;
    justify-content: center;
}

.success-icon span {
    font-size: 36px;
    color: var(--accent-green);
}

/* Title */
h2 {
    font-size: 1.6rem;
    font-weight: 600;
    margin-bottom: 12px;
    background: linear-gradient(90deg, var(--accent-green), #86efac);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Text */
p {
    font-size: 0.95rem;
    color: var(--text-muted);
    margin-bottom: 26px;
    line-height: 1.6;
}

/* Button */
a {
    display: inline-block;
    padding: 12px 28px;
    border-radius: 999px;
    text-decoration: none;
    font-size: 0.9rem;
    font-weight: 500;
    color: white;
    background: linear-gradient(135deg, var(--accent-green), var(--accent-dark));
    transition: all 0.3s ease;
}

a:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px rgba(34,197,94,0.5);
}

/* Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(12px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
</head>

<body>

<div class="success-card">
    <div class="success-icon">
        <span>✔</span>
    </div>

    <h2>Feedback Submitted</h2>
    <p>
        Thank you for sharing your experience.  
        Your feedback helps us improve and serve you better.
    </p>

    <a href="customerhome">Return to Home</a>
</div>

</body>
</html>
