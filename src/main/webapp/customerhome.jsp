<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --accent-1: #22c55e;
    --accent-2: #16a34a;
    --accent-3: #6366f1;

    --bg-main: #020617;
    --bg-card: rgba(255,255,255,0.08);
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

body {
    background: radial-gradient(circle at top left, #1e293b, #020617);
    color: var(--text-main);
    min-height: 100vh;
}

/* HERO */
.hero {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 40px;
    padding: 60px 8%;
}

.hero-text {
    max-width: 550px;
}

.hero-text h1 {
    font-size: 2.8rem;
    font-weight: 600;
    margin-bottom: 18px;
    background: linear-gradient(90deg, var(--accent-1), #86efac);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.hero-text p {
    color: var(--text-muted);
    font-size: 1.05rem;
    line-height: 1.7;
    margin-bottom: 26px;
}

.hero-actions a {
    display: inline-block;
    margin-right: 16px;
    padding: 12px 26px;
    border-radius: 999px;
    text-decoration: none;
    font-weight: 500;
    font-size: 0.95rem;
    transition: all 0.3s ease;
}

.btn-primary {
    background: linear-gradient(135deg, var(--accent-1), var(--accent-2));
    color: white;
}

.btn-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px rgba(34,197,94,0.5);
}

.btn-secondary {
    border: 1px solid var(--border-soft);
    color: var(--text-main);
}

.btn-secondary:hover {
    background: rgba(255,255,255,0.08);
}

/* HERO IMAGE */
.hero-img img {
    width: 420px;
    max-width: 100%;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.5);
}

/* FEATURES */
.features {
    padding: 40px 8% 20px;
}

.features h2 {
    text-align: center;
    font-size: 2rem;
    margin-bottom: 36px;
}

.feature-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
    gap: 26px;
}

.feature-card {
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.12),
        rgba(255,255,255,0.03)
    );
    border: 1px solid var(--border-soft);
    border-radius: 20px;
    padding: 24px;
    transition: all 0.35s ease;
}

.feature-card:hover {
    transform: translateY(-6px);
    border-color: rgba(34,197,94,0.6);
}

.feature-card h3 {
    margin-bottom: 10px;
    font-size: 1.1rem;
}

.feature-card p {
    color: var(--text-muted);
    font-size: 0.9rem;
    line-height: 1.6;
}

/* MARQUEE */
.marquee {
    margin: 50px 0;
    overflow: hidden;
    white-space: nowrap;
}

.marquee-track {
    display: inline-flex;
    animation: scroll 18s linear infinite;
}

.marquee img {
    width: 160px;
    margin: 0 18px;
    opacity: 0.9;
}

@keyframes scroll {
    from { transform: translateX(0); }
    to { transform: translateX(-50%); }
}

/* FOOTER */
footer {
    margin-top: 60px;
    padding: 20px;
    text-align: center;
    background: rgba(255,255,255,0.05);
    color: var(--text-muted);
    font-size: 0.85rem;
}

/* RESPONSIVE */
@media (max-width: 900px) {
    .hero {
        flex-direction: column;
        text-align: center;
    }

    .hero-actions a {
        margin-bottom: 12px;
    }
}
</style>
</head>

<!-- SESSION TIMEOUT -->
<script>
setTimeout(function() {
    alert("Your session has expired. You will be logged out.");
    window.location.href = "/logout";
}, 2 * 60 * 1000);
</script>

<body>

<%@include file="customernavbar.jsp" %>

<!-- HERO -->
<section class="hero">
    <div class="hero-text">
        <h1>Smart Farming. Smarter Profits.</h1>
        <p>
            Discover high-quality agricultural products, smart crop insights,
            and transparent pricing — all designed to empower farmers and buyers
            in one premium digital marketplace.
        </p>
        <div class="hero-actions">
            <a href="ustomerviewallproducts" class="btn-primary">Explore Products</a>
            <a href="myorders" class="btn-primary">My Orders</a>
        </div>
    </div>

    <div class="hero-img">
        <img src="images/customerhome1.png" alt="Customer Home">
    </div>
</section>

<!-- FEATURES -->
<section class="features">
    <h2>Why Choose MSR Products?</h2>

    <div class="feature-grid">
        <div class="feature-card">
            <h3>🌱 Quality Crops</h3>
            <p>Carefully sourced agricultural products with assured quality and freshness.</p>
        </div>

        <div class="feature-card">
            <h3>📊 Smart Insights</h3>
            <p>Crop guidance, pricing trends, and recommendations powered by data.</p>
        </div>

        <div class="feature-card">
            <h3>🚚 Fast Delivery</h3>
            <p>Reliable and quick order fulfillment across regions.</p>
        </div>

        <div class="feature-card">
            <h3>🔐 Secure Platform</h3>
            <p>Your data and transactions are protected with industry standards.</p>
        </div>
    </div>
</section>

<!-- MARQUEE -->
<div class="marquee">
    <div class="marquee-track">
        <img src="/images/1.png">
        <img src="/images/2.png">
        <img src="/images/3.png">
        <img src="/images/4.png">
        <img src="/images/5.png">
        <img src="/images/6.png">
        <img src="/images/1.png">
        <img src="/images/2.png">
    </div>
</div>

<!-- FOOTER -->
<footer>
    © 2019–2026 MSR Products. All Rights Reserved.
</footer>

</body>
</html>
