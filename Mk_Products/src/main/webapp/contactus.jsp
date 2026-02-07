<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - MSR Products</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    
    <style>
        /* ===== Base Styles ===== */
        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

        /* ===== Container ===== */
        .main-container {
            max-width: 1080px;
            margin: 3rem auto;
            padding: 0 1rem;
        }

        /* ===== Page Header ===== */
        .page-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .page-header h2 {
            font-size: 2.5rem;
            color: #1e3a8a;
            font-weight: 700;
            position: relative;
        }

        .page-header h2::after {
            content: '';
            width: 60px;
            height: 4px;
            background: #2563eb;
            display: block;
            margin: 10px auto 0;
            border-radius: 2px;
        }

        /* ===== Contact Info ===== */
        .contact-info {
            background: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .contact-info h5 {
            color: #64748b;
            text-align: center;
            margin-bottom: 1.2rem;
            font-style: italic;
        }

        .contact-info h2 {
            color: #111827;
            text-align: center;
            margin-bottom: 2rem;
        }

        .info-item {
            display: flex;
            align-items: center;
            background: #f9fafb;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            gap: 1rem;
            transition: 0.3s ease;
            border-left: 4px solid #2563eb;
        }

        .info-item:hover {
            background: #e0f2fe;
            transform: scale(1.02);
        }

        .info-icon {
            font-size: 1.5rem;
            color: #2563eb;
        }

        .info-text h4 {
            margin: 0;
            font-weight: 500;
        }

        /* ===== Form Section ===== */
        .form-container {
            background: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }

        .form-header h2 {
            text-align: center;
            color: #1e40af;
            margin-bottom: 1.5rem;
        }

        /* Input Groups */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            display: block;
            color: #374151;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            background-color: #f9fafb;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #3b82f6;
            background: #fff;
            outline: none;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        /* ===== File Input ===== */
        .file-input-container {
            width: 100%;
        }

        .file-input-label {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0.75rem 1rem;
            border: 2px dashed #d1d5db;
            background-color: #f9fafb;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .file-input-label:hover {
            background-color: #eef2ff;
            border-color: #6366f1;
        }

        .file-input {
            display: none;
        }

        .file-input-text {
            color: #6b7280;
            font-size: 0.95rem;
        }

        /* ===== Buttons ===== */
        .form-actions {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .btn {
            flex: 1;
            min-width: 120px;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);
            transform: translateY(-2px);
        }

        .btn-reset {
            background: #f3f4f6;
            color: #dc2626;
        }

        .btn-reset:hover {
            background: #e5e7eb;
            transform: translateY(-2px);
        }

        /* ===== Why Contact Us ===== */
        .why-contact {
            background: #ecfdf5;
            padding: 2rem;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            margin-bottom: 2rem;
        }

        .why-contact h3 {
            color: #047857;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .why-contact p {
            color: #374151;
            position: relative;
            margin-bottom: 0.8rem;
            padding-left: 1.5rem;
        }

        .why-contact p::before {
            content: "✔";
            color: #10b981;
            position: absolute;
            left: 0;
        }

        /* ===== Marquee Section ===== */
        .logo-marquee {
            background: #f1f5f9;
            overflow: hidden;
            padding: 1rem;
            margin: 2rem 0;
            border-radius: 8px;
        }

        .logo-container {
            display: flex;
            animation: scroll 15s linear infinite;
        }

        @keyframes scroll {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }

        .logo-item {
            margin: 0 2rem;
            display: flex;
            align-items: center;
        }

        .logo-item img {
            height: 60px;
            max-width: 120px;
            object-fit: contain;
        }

        /* ===== Responsive ===== */
        @media (max-width: 768px) {
            .main-container {
                margin: 1.5rem auto;
            }
            
            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }

            .info-item {
                flex-direction: column;
                text-align: center;
                padding: 1rem;
            }

            .info-icon {
                margin-bottom: 0.9rem;
            }
            
            .page-header h2 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="homenavbar.jsp" %>
    
    <div class="main-container">
        <div class="page-header">
            <h2>Contact Us</h2>
        </div>

        <!-- Contact Info Section -->
        <div class="contact-info">
            <h5>We're here to help you with all your agricultural needs!</h5>
            <h2>Quick Contact Information</h2>
            <div class="info-item">
                <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                <div class="info-text"><h4>MSR Products, TL peta Enkoor, Khammam, 507168</h4></div>
            </div>
            <div class="info-item">
                <div class="info-icon"><i class="fas fa-phone"></i></div>
                <div class="info-text"><h4>+91-8179386423</h4></div>
            </div>
            <div class="info-item">
                <div class="info-icon"><i class="fas fa-envelope"></i></div>
                <div class="info-text"><h4>saichows63@gmail.com</h4></div>
            </div>
            <div class="info-item">
                <div class="info-icon"><i class="fas fa-clock"></i></div>
                <div class="info-text"><h4>Business Hours: Monday to Saturday, 6:00 AM - 10:00 PM</h4></div>
            </div>
        </div>

        <!-- Contact Form Section -->
        <div class="form-container">
            <div class="form-header">
                <h2>Send Us a Message</h2>
            </div>
            <form action="savecontactinformation" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="uname">Name</label>
                    <input class="form-control" type="text" id="uname" name="uname" required placeholder="Enter your name">
                </div>
                <div class="form-group">
                    <label for="ucontact">Contact Number</label>
                    <input class="form-control" type="text" id="ucontact" name="ucontact" required placeholder="Enter your contact number">
                </div>
                <div class="form-group">
                    <label for="ulocation">Location</label>
                    <input class="form-control" type="text" id="ulocation" name="ulocation" required placeholder="Enter your location">
                </div>
                <div class="form-group">
                    <label for="date">Date</label>
                    <input class="form-control" type="date" id="date" name="date" required>
                </div>
                <div class="form-group">
                    <label for="umessage">Message</label>
                    <textarea class="form-control" id="umessage" name="umessage" required placeholder="Enter your message"></textarea>
                </div>
                <div class="form-group">
                    <label>Product Image</label>
                    <div class="file-input-container">
                        <label class="file-input-label">
                            <span class="file-input-text">Choose a file (optional)</span>
                            <i class="fas fa-cloud-upload-alt"></i>
                            <input type="file" class="file-input" name="uimage">
                        </label>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-primary" type="submit">Submit</button>
                    <button class="btn btn-reset" type="reset">Clear</button>
                </div>
            </form>
        </div>

        <!-- Why Contact Section -->
        <div class="why-contact">
            <h3>Why Contact Us?</h3>
            <p>Get expert advice on our agricultural products</p>
            <p>Discuss bulk orders and pricing</p>
            <p>Ask about our farmer-friendly initiatives</p>
        </div>

        <!-- Logo Marquee Section -->
       
    </div>
    
     <div class="logo-marquee">
            <div class="logo-container">
                <div class="logo-item"><img src="/images/1.png" alt="Partner 1"></div>
                <div class="logo-item"><img src="/images/2.png" alt="Partner 2"></div>
                <div class="logo-item"><img src="/images/3.png" alt="Partner 3"></div>
                <div class="logo-item"><img src="/images/4.png" alt="Partner 4"></div>
                <div class="logo-item"><img src="/images/5.png" alt="Partner 5"></div>
                <div class="logo-item"><img src="/images/6.png" alt="Partner 6"></div>
            </div>
        </div>

    <!-- File input preview JS -->
    <script>
        document.querySelector('.file-input').addEventListener('change', function() {
            const fileName = this.files[0]?.name || 'Choose a file (optional)';
            document.querySelector('.file-input-text').textContent = fileName;
        });
    </script>
</body>
</html>