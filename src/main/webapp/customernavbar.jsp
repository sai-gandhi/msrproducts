<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --accent-green: #22c55e;
    --accent-dark: #16a34a;
    --bg-dark: #020617;
    --bg-glass: rgba(255,255,255,0.08);
    --border-soft: rgba(255,255,255,0.15);
    --text-main: #e5e7eb;
    --text-muted: #94a3b8;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', 'Segoe UI', sans-serif;
}

/* NAVBAR */
.customernavbar {
    position: sticky;
    top: 0;
    z-index: 1000;
    background: linear-gradient(
        90deg,
        rgba(2,6,23,0.95),
        rgba(15,23,42,0.95)
    );
    backdrop-filter: blur(14px);
    border-bottom: 1px solid var(--border-soft);
    padding: 14px 40px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* LOGO */
.brand {
    font-size: 1.6rem;
    font-weight: 600;
    background: linear-gradient(90deg, var(--accent-green), #86efac);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* NAV LINKS */
.nav-links {
    display: flex;
    align-items: center;
    gap: 20px;
}

.nav-links a {
    color: var(--text-main);
    text-decoration: none;
    font-size: 0.9rem;
    font-weight: 500;
    padding: 8px 14px;
    border-radius: 999px;
    transition: all 0.3s ease;
}

.nav-links a:hover {
    background: rgba(255,255,255,0.08);
}

/* ACTIVE LINK (optional) */
.nav-links a.active {
    background: rgba(34,197,94,0.2);
    color: #86efac;
}

/* LOGOUT */
.logout-btn {
    background: linear-gradient(135deg, var(--accent-green), var(--accent-dark));
    color: white;
    padding: 8px 18px;
    border-radius: 999px;
    text-decoration: none;
    font-size: 0.85rem;
    font-weight: 500;
    transition: all 0.3s ease;
}

.logout-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(34,197,94,0.5);
}

/* RESPONSIVE */
@media (max-width: 900px) {
    .customernavbar {
        flex-direction: column;
        gap: 10px;
        padding: 14px 20px;
    }

    .nav-links {
        flex-wrap: wrap;
        justify-content: center;
    }
}
</style>
</head>

<body>

<div class="customernavbar">

    <div class="brand">MSR Products</div>

    <div class="nav-links">
        <a href="customerhome">Home</a>
        <a href="customerviewallproducts">Products</a>
        <a href="placeorder">Place Order</a>
        <a href="myorders">My Orders</a>
        <a href="crop_details">Crop Details</a>
        <a href="feedback">Feedback</a>
        <a href="viewfeedback">View Feedback</a>
    </div>

    <a href="customerlogin" class="logout-btn">Logout</a>

</div>

</body>
</html>
