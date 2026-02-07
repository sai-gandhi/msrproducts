<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crop Details</title>
    <style>
        :root {
            --primary-green: #27ae60;
            --dark-green: #219653;
            --light-green: #d5f5e3;
            --dark-text: #2c3e50;
            --light-text: #7f8c8d;
            --background: #f9f9f9;
            --white: #ffffff;
            --border-radius: 8px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--background);
            color: var(--dark-text);
            line-height: 1.6;
        }

        .back-link {
            display: inline-block;
            margin: 20px;
            padding: 8px 16px;
            background-color: var(--primary-green);
            color: var(--white);
            text-decoration: none;
            border-radius: var(--border-radius);
            font-weight: 500;
            transition: var(--transition);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .back-link:hover {
            background-color: var(--dark-green);
            transform: translateY(-2px);
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            background: var(--white);
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        h2 {
            color: var(--primary-green);
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            position: relative;
            padding-bottom: 15px;
        }
        h3{
         color:red;
        }

        h3:after,h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background-color: var(--primary-green);
        }
        
        
        
        

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 30px;
            overflow: hidden;
            border-radius: var(--border-radius);
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.05);
        }

        th {
            background-color: var(--primary-green);
            color: var(--white);
            padding: 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85em;
            letter-spacing: 0.5px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            vertical-align: middle;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:nth-child(even) {
            background-color: var(--light-green);
        }

        tr:hover {
            background-color: rgba(39, 174, 96, 0.1);
        }

        .crop-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            display: block;
            margin: 0 auto;
            border: 3px solid var(--white);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: var(--transition);
        }

        .crop-img:hover {
            transform: scale(1.1);
        }

        b {
            color: var(--dark-green);
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }
            
            th, td {
                padding: 10px;
                font-size: 0.9em;
            }
            
            .crop-img {
                width: 60px;
                height: 60px;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div>
    <a href="customerhome" class="back-link">← Back to Home</a>
</div>
<div class="container">
    <h2>Top High-Value Crops for Farmers to Grow in 2025 to Maximize Profits</h2>
    <h3>Crop Details</h3>
    <table>
        <tr>
            <th>Crop</th>
            <th>Image</th>
            <th>Uses</th>
            <th>Best Land Type</th>
            <th>Best Season</th>
            <th>Recommended Seeds</th>
            <th>Expected Cost (₹)</th>
        </tr>
        <tr>
            <td><b>Chilli</b></td>
            <td><img src="images/chilli.jpg" alt="Chilli" class="crop-img"></td>
            <td>Used in cooking, medicine, and making chili powder.</td>
            <td>Well-drained sandy loam soil, rich in organic matter.</td>
            <td>June to September (Kharif) & January to March (Rabi).</td>
            <td>Hybrid varieties like Guntur Chilli, Teja Chilli.</td>
            <td>20,000 - 25,000</td>
        </tr>
        <tr>
            <td><b>Cotton</b></td>
            <td><img src="images/cotton.jpg" alt="Cotton" class="crop-img"></td>
            <td>Used for making textiles, cottonseed oil, and livestock feed.</td>
            <td>Black soil with good drainage and moisture retention.</td>
            <td>April to May (Summer) & June to July (Kharif).</td>
            <td>BT Cotton, H-4, J-34.</td>
            <td>8,000 - 6,000</td>
        </tr>
        <tr>
            <td><b>Rice</b></td>
            <td><img src="images/rice.jpg" alt="Rice" class="crop-img"></td>
            <td>Staple food for many countries, used in multiple cuisines.</td>
            <td>Clayey loam soil with high water retention.</td>
            <td>June to July (Kharif) & November to December (Rabi).</td>
            <td>Basmati, IR-64, MTU-1010.</td>
            <td>2,000 - 1,800</td>
        </tr>
        <tr>
            <td><b>Wheat</b></td>
            <td><img src="images/wheat.jpg" alt="Wheat" class="crop-img"></td>
            <td>Used for making flour, bread, and cereals.</td>
            <td>Well-drained loamy soil with moderate fertility.</td>
            <td>October to December (Rabi).</td>
            <td>PBW-343, HD-2967, Lok-1.</td>
            <td>2,000 - 1,700</td>
        </tr>
        <tr>
            <td><b>Jonna (Sorghum)</b></td>
            <td><img src="images/jonnalu.webp" alt="Jonna" class="crop-img"></td>
            <td>Used as food, fodder, and for making biofuel.</td>
            <td>Light sandy loam or black soil.</td>
            <td>June to July (Kharif) & January to February (Rabi).</td>
            <td>CSH-16, CSV-15, PVK-801.</td>
            <td>3,000 - 2,500</td>
        </tr>
    </table>
</div>

</body>
</html>