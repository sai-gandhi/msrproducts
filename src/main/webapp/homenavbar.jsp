<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MSR Products</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --primary: #2e7d32;
            --primary-light: #4caf50;
            --primary-dark: #1b5e20;
            --secondary: #e74c3c;
            --secondary-light: #ff6b5b;
            --secondary-dark: #c0392b;
            --text-light: #ffffff;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
        }

        /* Navbar Container */
        .navbar-container {
            position: sticky;
            top: 0;
            z-index: 1000;
            width: 100%;
        }

        /* Navbar Styles */
        .navbar {
            background: linear-gradient(135deg, var(--secondary), var(--secondary-dark));
            color: var(--text-light);
            padding: 0.8rem 2rem;
            box-shadow: var(--shadow);
            position: relative;
        }

        .navbar::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--primary-light));
        }

        .navbar-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .navbar h2 {
            text-align: center;
            margin-bottom: 0.8rem;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 0.5px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* Navigation Menu */
        .homenavbar {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 0.8rem;
            padding: 0.6rem 1.2rem;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .homenavbar:hover {
            background: rgba(255, 255, 255, 0.15);
        }

        .homenavbar a {
            color: var(--text-light);
            text-decoration: none;
            text-transform: capitalize;
            padding: 0.5rem 1.2rem;
            border-radius: 50px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            font-weight: 500;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            position: relative;
            overflow: hidden;
        }

        .homenavbar a::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--primary-light);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease;
        }

        .homenavbar a:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
            text-shadow: 0 2px 8px rgba(255, 255, 255, 0.3);
        }

        .homenavbar a:hover::before {
            transform: scaleX(1);
            transform-origin: left;
        }

        .homenavbar a:active {
            background: var(--primary);
            transform: translateY(0);
        }

        .homenavbar a i {
            font-size: 0.9rem;
        }

        /* Mobile Menu Toggle */
        .mobile-menu-toggle {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            padding: 0.5rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .homenavbar {
                gap: 0.6rem;
                padding: 0.6rem 1rem;
            }
            
            .homenavbar a {
                padding: 0.5rem 1rem;
                font-size: 0.9rem;
            }
        }

        @media (max-width: 768px) {
            .navbar {
                padding: 0.8rem 1rem;
            }
            
            .navbar-content {
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
            }
            
            .navbar h2 {
                margin-bottom: 0;
                font-size: 1.5rem;
            }
            
            .homenavbar {
                position: fixed;
                top: 70px;
                left: 0;
                width: 100%;
                flex-direction: column;
                align-items: center;
                padding: 1rem;
                border-radius: 0;
                background: linear-gradient(135deg, var(--secondary-dark), var(--secondary));
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.3s ease;
                gap: 0;
            }
            
            .homenavbar.active {
                max-height: 500px;
                padding: 1rem;
                gap: 1rem;
            }
            
            .homenavbar a {
                width: 100%;
                justify-content: center;
                padding: 0.8rem;
                border-radius: 8px;
            }
            
            .mobile-menu-toggle {
                display: block;
            }
        }

        @media (max-width: 480px) {
            .navbar h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
<div class="navbar-container">
    <div class="navbar">
        <div class="navbar-content">
            <h2>MSR Products</h2>
            <button class="mobile-menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </button>
            <div class="homenavbar" id="mainMenu">
                <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="aboutus"><i class="fas fa-info-circle"></i> About Us</a>
                <a href="contactus"><i class="fas fa-envelope"></i> Contact Us</a>
                <a href="marketrates"><i class="fas fa-chart-line"></i> Market Rates</a>
                <a href="customerlogin"><i class="fas fa-user"></i> Customer Login</a>
                <a href="customerregister"><i class="fas fa-user-plus"></i> Customer Register</a>
            </div>
        </div>
    </div>
</div>

<script>
    // Mobile menu toggle functionality
    document.getElementById('menuToggle').addEventListener('click', function() {
        const menu = document.getElementById('mainMenu');
        menu.classList.toggle('active');
        this.innerHTML = menu.classList.contains('active') ? 
            '<i class="fas fa-times"></i>' : '<i class="fas fa-bars"></i>';
    });

    // Close menu when clicking on a link (for mobile)
    document.querySelectorAll('.homenavbar a').forEach(link => {
        link.addEventListener('click', function() {
            if(window.innerWidth <= 768) {
                document.getElementById('mainMenu').classList.remove('active');
                document.getElementById('menuToggle').innerHTML = '<i class="fas fa-bars"></i>';
            }
        });
    });
</script>
</body>
</html>