<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - MSR Products & Services</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --primary: #2e7d32;
            --primary-light: #4caf50;
            --primary-dark: #1b5e20;
            --secondary: #0288d1;
            --accent: #ff9800;
            --text: #333333;
            --text-light: #666666;
            --bg: #f5f7fa;
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
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
            color: var(--primary-dark);
        }

        /* Header Section */
        .welcome-header {
            text-align: center;
            padding: 2rem 1rem;
            background: linear-gradient(135deg, rgba(46, 125, 50, 0.1), rgba(2, 136, 209, 0.1));
            margin-bottom: 2rem;
            border-radius: 0 0 12px 12px;
            position: relative;
            overflow: hidden;
        }

        .welcome-header::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .welcome-header h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Text Section */
        .text-section {
            max-width: 900px;
            margin: 0 auto 3rem;
            padding: 0 1rem;
            text-align: center;
        }

        .text-section h4 {
            color: var(--primary);
            font-size: 1.2rem;
            line-height: 1.8;
            position: relative;
            padding-bottom: 1.5rem;
        }

        .text-section h4::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--accent);
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 0 2rem;
            margin: 0 auto 3rem;
            max-width: 1200px;
        }

        .product-card {
            background: var(--card-bg);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: all 0.3s ease;
        }

        .product-card:hover img {
            transform: scale(1.05);
        }

        .product-info {
            padding: 1.5rem;
            text-align: center;
        }

        .product-info h5 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: var(--primary-dark);
        }

        .product-info p {
            color: var(--text-light);
            font-weight: 500;
        }

        /* Banner Image */
        .banner-image {
            width: 100%;
            max-height: 500px;
            object-fit: cover;
            margin: 2rem 0;
            border-radius: 8px;
            box-shadow: var(--shadow);
        }

        /* Image Gallery */
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 1.5rem;
            padding: 0 2rem;
            margin: 0 auto 3rem;
            max-width: 1200px;
        }

        .gallery-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: var(--shadow);
        }

        .gallery-image:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        /* Logo Marquee */
        .logo-marquee {
            background: linear-gradient(135deg, rgba(248, 249, 250, 0.9), rgba(241, 245, 249, 0.9));
            padding: 2rem 1rem;
            margin: 3rem 0;
            overflow: hidden;
            position: relative;
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
            filter: grayscale(100%);
            opacity: 0.7;
            transition: all 0.3s ease;
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

        /* Footer */
        footer {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            text-align: center;
            padding: 1.5rem;
            margin-top: 3rem;
        }

        footer h6 {
            font-weight: 400;
            font-size: 0.9rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .welcome-header h2 {
                font-size: 2rem;
            }
            
            .products-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            }
            
            .image-gallery {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .welcome-header h2 {
                font-size: 1.8rem;
            }
            
            .text-section h4 {
                font-size: 1rem;
            }
            
            .products-grid {
                grid-template-columns: 1fr;
                padding: 0 1rem;
            }
            
            .logo-item {
                margin: 0 1rem;
            }
        }
    </style>
</head>
<body>
<%@include file="homenavbar.jsp" %>

<div class="welcome-header">
    <h2>Welcome to MSR Products & Services</h2>
</div>

<div class="text-section">
    <h4>Agriculture is not crop production as popular belief holds - it's the production of food and fiber from the world's land and waters. Without agriculture it is not possible to have a city, stock market, banks, university, church or army. Agriculture is the foundation of civilization and any stable economy.</h4>
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

<footer>
    <h6>@2019 MSR Products and Services.</h6>
</footer>

</body>
</html>