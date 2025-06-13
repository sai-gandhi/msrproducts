<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - MSR Products</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
    /* ===== Base Styles ===== */
    :root {
        --primary: #2e7d32;
        --primary-light: #4caf50;
        --primary-dark: #1b5e20;
        --secondary: #0288d1;
        --accent: #ff9800;
        --text: #333333;
        --text-light: #666666;
        --bg: #f8f9fa;
        --card-bg: #ffffff;
        --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    }
    
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        background-color: var(--bg);
        color: var(--text);
        line-height: 1.7;
        overflow-x: hidden;
    }
    
    h1, h2, h3, h4 {
        font-family: 'Playfair Display', serif;
        font-weight: 600;
        color: var(--primary-dark);
    }
    
    /* ===== Content Container ===== */
    .content-container {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 2rem;
        background: var(--card-bg);
        border-radius: 16px;
        box-shadow: var(--shadow);
        position: relative;
        overflow: hidden;
    }
    
    .content-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 8px;
        background: linear-gradient(90deg, var(--primary), var(--secondary));
    }
    
    /* ===== Section Header ===== */
    .section-header {
        text-align: center;
        margin-bottom: 3rem;
        position: relative;
        padding-bottom: 1.5rem;
    }
    
    .section-header h2 {
        font-size: 2.5rem;
        margin-bottom: 1rem;
        position: relative;
        display: inline-block;
    }
    
    .section-header h2::after {
        content: '';
        position: absolute;
        bottom: -15px;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 4px;
        background: linear-gradient(90deg, var(--primary), var(--accent));
        border-radius: 2px;
    }
    
    /* ===== Founder Section ===== */
    .founder-section {
        display: flex;
        align-items: center;
        gap: 3rem;
        margin-bottom: 3rem;
        flex-wrap: wrap;
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(10px);
        padding: 2rem;
        border-radius: 12px;
        border: 1px solid rgba(0, 0, 0, 0.05);
        transition: all 0.4s ease;
    }
    
    .founder-section:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    
    .founder-image {
        flex: 1;
        min-width: 300px;
        text-align: center;
        position: relative;
    }
    
    .founder-image::before {
        content: '';
        position: absolute;
        top: -10px;
        left: -10px;
        right: -10px;
        bottom: -10px;
        background: linear-gradient(45deg, var(--primary-light), var(--secondary));
        z-index: -1;
        border-radius: 12px;
        opacity: 0.7;
        transition: all 0.4s ease;
    }
    
    .founder-image:hover::before {
        opacity: 0.9;
        transform: rotate(2deg);
    }
    
    .founder-image img {
        width: 100%;
        max-width: 300px;
        border-radius: 8px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        transition: all 0.4s ease;
        filter: grayscale(10%);
    }
    
    .founder-image:hover img {
        filter: grayscale(0%);
        transform: scale(1.02);
    }
    
    .founder-image h4 {
        margin-top: 1.5rem;
        font-size: 1.5rem;
        color: var(--primary-dark);
        position: relative;
    }
    
    .founder-image h4::after {
        content: '';
        position: absolute;
        bottom: -8px;
        left: 50%;
        transform: translateX(-50%);
        width: 40px;
        height: 2px;
        background: var(--accent);
    }
    
    .founder-info {
        flex: 2;
        min-width: 300px;
    }
    
    .founder-info h3 {
        font-size: 2rem;
        margin-bottom: 1.5rem;
        color: var(--primary);
        position: relative;
    }
    
    .founder-info h3::after {
        content: '';
        position: absolute;
        bottom: -8px;
        left: 0;
        width: 60px;
        height: 3px;
        background: var(--accent);
    }
    
    .founder-info p {
        margin-bottom: 1.2rem;
        color: var(--text-light);
    }
    
    /* ===== Specialization Section ===== */
    .specialization {
        margin: 3rem 0;
        padding: 2rem;
        background: linear-gradient(135deg, rgba(233, 245, 233, 0.8), rgba(227, 242, 253, 0.8));
        border-radius: 12px;
        position: relative;
        overflow: hidden;
    }
    
    .specialization::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 5px;
        height: 100%;
        background: linear-gradient(to bottom, var(--primary), var(--secondary));
    }
    
    .specialization h5 {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        color: var(--primary-dark);
        position: relative;
        padding-left: 1.5rem;
    }
    
    .specialization h5::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        width: 8px;
        height: 8px;
        background: var(--accent);
        border-radius: 50%;
    }
    
    .specialization p {
        margin-bottom: 1.2rem;
        padding-left: 2rem;
        position: relative;
        color: var(--text-light);
        transition: all 0.3s ease;
    }
    
    .specialization p:hover {
        color: var(--text);
        transform: translateX(5px);
    }
    
    .specialization p::before {
        content: '➤';
        position: absolute;
        left: 0;
        color: var(--primary-light);
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }
    
    .specialization p:hover::before {
        color: var(--accent);
        transform: translateX(5px);
    }
    
    .product-images {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1.5rem;
        margin: 2rem 0;
    }
    
    .product-card {
        position: relative;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        transition: all 0.4s ease;
    }
    
    .product-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
    }
    
    .product-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        transition: all 0.4s ease;
    }
    
    .product-card:hover img {
        transform: scale(1.05);
    }
    
    .product-card::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 40%;
        background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
    }
    
    .product-card h6 {
        position: absolute;
        bottom: 15px;
        left: 15px;
        color: white;
        font-size: 1.1rem;
        z-index: 2;
    }
    
    /* ===== Vision & Values ===== */
    .vision-values {
        margin: 3rem 0;
    }
    
    .vision-values h4 {
        font-size: 1.8rem;
        margin-bottom: 1.5rem;
        position: relative;
        display: inline-block;
    }
    
    .vision-values h4::after {
        content: '';
        position: absolute;
        bottom: -8px;
        left: 0;
        width: 50px;
        height: 3px;
        background: var(--secondary);
    }
    
    .vision-values p {
        margin-bottom: 1.5rem;
        color: var(--text-light);
        padding-left: 1rem;
        border-left: 2px solid var(--primary-light);
    }
    
    .values-list {
        margin-left: 1.5rem;
    }
    
    .values-list h5 {
        font-size: 1.3rem;
        margin: 1.5rem 0 0.8rem;
        color: var(--primary);
        position: relative;
        padding-left: 2rem;
    }
    
    .values-list h5::before {
        content: '★';
        position: absolute;
        left: 0;
        color: var(--accent);
    }
    
    .values-list p {
        padding-left: 2rem;
        margin-bottom: 1.2rem;
        color: var(--text-light);
    }
    
    /* ===== Logo Marquee ===== */
    .logo-marquee {
        background: linear-gradient(135deg, rgba(248, 249, 250, 0.9), rgba(241, 245, 249, 0.9));
        padding: 2rem 1rem;
        margin: 3rem 0;
        overflow: hidden;
        position: relative;
        border-radius: 12px;
        border: 1px solid rgba(0, 0, 0, 0.05);
    }
    
    .logo-marquee::before,
    .logo-marquee::after {
        content: '';
        position: absolute;
        top: 0;
        width: 100px;
        height: 100%;
        z-index: 2;
    }
    
    .logo-marquee::before {
        left: 0;
        background: linear-gradient(to right, var(--bg), transparent);
    }
    
    .logo-marquee::after {
        right: 0;
        background: linear-gradient(to left, var(--bg), transparent);
    }
    
    .logo-container {
        display: flex;
        animation: scroll 30s linear infinite;
        width: calc(200px * 12);
    }
    
    @keyframes scroll {
        0% { transform: translateX(0); }
        100% { transform: translateX(calc(-100px * 6)); }
    }
    
    .logo-item {
        margin: 0 2rem;
        padding: 1rem;
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 0.7;
        transition: all 0.5s ease;
    }
    
    .logo-item:hover {
        filter: grayscale(0%);
        opacity: 1;
        transform: scale(1.1);
    }
    
    .logo-item img {
        height: 60px;
        max-width: 120px;
        object-fit: contain;
    }
    
    /* ===== Responsive Adjustments ===== */
    @media (max-width: 992px) {
        .content-container {
            padding: 1.5rem;
            margin: 1.5rem;
        }
        
        .section-header h2 {
            font-size: 2rem;
        }
        
        .founder-section {
            padding: 1.5rem;
        }
        
        .specialization {
            padding: 1.5rem;
        }
    }
    
    @media (max-width: 768px) {
        .content-container {
            margin: 1rem;
            padding: 1rem;
            border-radius: 8px;
        }
        
        .section-header h2 {
            font-size: 1.8rem;
        }
        
        .founder-section {
            flex-direction: column;
            padding: 1rem;
        }
        
        .founder-image, .founder-info {
            min-width: 100%;
        }
        
        .product-images {
            grid-template-columns: 1fr;
        }
        
        .logo-item {
            margin: 0 1rem;
        }
    }
    
    /* ===== Animations ===== */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .content-container > * {
        animation: fadeIn 0.6s ease-out forwards;
    }
    
    .content-container > *:nth-child(1) { animation-delay: 0.1s; }
    .content-container > *:nth-child(2) { animation-delay: 0.2s; }
    .content-container > *:nth-child(3) { animation-delay: 0.3s; }
    .content-container > *:nth-child(4) { animation-delay: 0.4s; }
    .content-container > *:nth-child(5) { animation-delay: 0.5s; }
</style>
</head>
<body>
<%@include file="homenavbar.jsp" %>

<div class="content-container">
    <div class="section-header">
        <h2>About Us</h2>
    </div>
    
    <div class="founder-section">
        <div class="founder-image">
            <h4>Uppalapati MadhuSudhan Rao</h4>
            <img src="/images/founder.png" alt="Founder">
        </div>
        <div class="founder-info">
            <h3>Welcome to MSR Products</h3>
            <p>A trusted name in the agricultural products industry for over six years.</p>
            <p>Founded and managed by Uppalapati MadhuSudhan Rao and Uppalapati Krishnaveni, Established in 2019, our mission is to support farmers and customers alike by providing high-quality agricultural products and facilitating fair trade.</p>
            <p>Our mission is to bridge the gap between producers and buyers by creating a platform that supports fair trade and quality assurance in agricultural products.</p>
        </div>
    </div>
    
    <div class="specialization">
        <h5>We Specialize In</h5>
        <p>Selling premium agricultural products tailored to meet the diverse needs of farmers and agricultural enthusiasts.</p>
        <p>Purchasing cotton directly from farmers, ensuring they receive fair prices for their hard work.</p>
        <p>Sourcing and buying the finest chilies from the farmers to maintain quality and freshness.</p>
        
        <div class="product-images">
            <div class="product-card">
                <img src="/images/cotton.jpg" alt="Cotton">
                <h6>Cotton Products</h6>
            </div>
            <div class="product-card">
                <img src="/images/chilli.jpg" alt="Chilli">
                <h6>Chilli Products</h6>
            </div>
            <div class="product-card">
                <img src="/images/planta.jpg" alt="Plants">
                <h6>Plant Products</h6>
            </div>
        </div>
    </div>
    
    <div class="vision-values">
        <h4>Our Vision</h4>
        <p>To become a trusted leader in the agricultural sector by promoting sustainability, fostering growth for farmers, and delivering value to customers.</p>
        
        <h4>Our Values</h4>
        <div class="values-list">
            <h5>Integrity</h5>
            <p>Transparent and fair dealing in every transaction.</p>
            
            <h5>Quality</h5>
            <p>Ensuring only the best agricultural products reach our customers.</p>
            
            <h5>Community</h5>
            <p>Strengthening bonds with farmers and creating a positive impact on the agricultural ecosystem.</p>
        </div>
    </div>
</div>

<div class="logo-marquee">
    <div class="logo-container">
        <div class="logo-item"><img src="/images/1.png" alt="Brand 1"></div>
        <div class="logo-item"><img src="/images/2.png" alt="Brand 2"></div>
        <div class="logo-item"><img src="/images/3.png" alt="Brand 3"></div>
        <div class="logo-item"><img src="/images/4.png" alt="Brand 4"></div>
        <div class="logo-item"><img src="/images/5.png" alt="Brand 5"></div>
        <div class="logo-item"><img src="/images/6.png" alt="Brand 6"></div>
        <!-- Duplicate for seamless looping -->
        <div class="logo-item"><img src="/images/1.png" alt="Brand 1"></div>
        <div class="logo-item"><img src="/images/2.png" alt="Brand 2"></div>
        <div class="logo-item"><img src="/images/3.png" alt="Brand 3"></div>
        <div class="logo-item"><img src="/images/4.png" alt="Brand 4"></div>
        <div class="logo-item"><img src="/images/5.png" alt="Brand 5"></div>
        <div class="logo-item"><img src="/images/6.png" alt="Brand 6"></div>
    </div>
</div>

</body>
</html>