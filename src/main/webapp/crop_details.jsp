<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crop Details</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --green-main: #22c55e;
    --green-dark: #16a34a;
    --green-soft: rgba(34, 197, 94, 0.15);

    --bg-main: #020617;
    --bg-card: rgba(255,255,255,0.08);
    --border-soft: rgba(255,255,255,0.15);

    --text-main: #e5e7eb;
    --text-muted: #94a3b8;

    --glass-blur: blur(14px);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', 'Segoe UI', sans-serif;
}

body {
    min-height: 100vh;
    background: radial-gradient(circle at top left, #1e293b, #020617);
    color: var(--text-main);
    padding: 24px;
}

/* Back Button */
.back-link {
    display: inline-block;
    margin-bottom: 20px;
    padding: 10px 18px;
    border-radius: 999px;
    text-decoration: none;
    font-size: 0.9rem;
    font-weight: 500;
    color: white;
    background: linear-gradient(135deg, var(--green-main), var(--green-dark));
    transition: all 0.3s ease;
}

.back-link:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(34, 197, 94, 0.5);
}

/* Main Container */
.container {
    max-width: 1200px;
    margin: auto;
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.12),
        rgba(255,255,255,0.03)
    );
    backdrop-filter: var(--glass-blur);
    border: 1px solid var(--border-soft);
    border-radius: 22px;
    padding: 28px;
}

/* Headings */
h2 {
    text-align: center;
    font-size: 2rem;
    margin-bottom: 18px;
    font-weight: 600;
    background: linear-gradient(90deg, var(--green-main), #86efac);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

h3 {
    text-align: center;
    font-size: 1.1rem;
    margin-bottom: 24px;
    color: #fca5a5;
    letter-spacing: 0.3px;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    overflow: hidden;
    border-radius: 16px;
}

th {
    background: rgba(34, 197, 94, 0.25);
    color: #dcfce7;
    padding: 14px;
    text-align: left;
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

td {
    padding: 14px;
    border-bottom: 1px solid rgba(255,255,255,0.1);
    vertical-align: middle;
    font-size: 0.95rem;
}

tr:hover {
    background: rgba(34, 197, 94, 0.08);
}

tr:last-child td {
    border-bottom: none;
}

/* Crop Name */
td b {
    color: #86efac;
    font-weight: 600;
}

/* Crop Image */
.crop-img {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    object-fit: cover;
    display: block;
    margin: auto;
    border: 2px solid rgba(255,255,255,0.3);
    transition: transform 0.3s ease;
}

.crop-img:hover {
    transform: scale(1.15);
}

/* Responsive */
@media (max-width: 768px) {
    h2 {
        font-size: 1.6rem;
    }

    table {
        display: block;
        overflow-x: auto;
    }

    th, td {
        font-size: 0.85rem;
        padding: 10px;
    }

    .crop-img {
        width: 55px;
        height: 55px;
    }
}
</style>

</head>
<body>

<a href="customerhome" class="back-link">← Back to Home</a>

<div class="container">

    <h2>Top High-Value Crops for Farmers to Grow in 2025</h2>
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
            <td><img src="images/chilli.jpg" class="crop-img" /></td>
            <td>Cooking, medicine, chilli powder</td>
            <td>Well-drained sandy loam soil</td>
            <td>Kharif & Rabi</td>
            <td>Guntur, Teja</td>
            <td>20,000 – 25,000</td>
        </tr>

        <tr>
            <td><b>Cotton</b></td>
            <td><img src="images/cotton.jpg" class="crop-img" /></td>
            <td>Textiles, cottonseed oil</td>
            <td>Black soil</td>
            <td>Summer & Kharif</td>
            <td>BT Cotton, H-4</td>
            <td>6,000 – 8,000</td>
        </tr>

        <tr>
            <td><b>Rice</b></td>
            <td><img src="images/rice.jpg" class="crop-img" /></td>
            <td>Staple food</td>
            <td>Clayey loam</td>
            <td>Kharif & Rabi</td>
            <td>Basmati, IR-64</td>
            <td>1,800 – 2,000</td>
        </tr>

        <tr>
            <td><b>Wheat</b></td>
            <td><img src="images/wheat.jpg" class="crop-img" /></td>
            <td>Flour, bread</td>
            <td>Loamy soil</td>
            <td>Rabi</td>
            <td>HD-2967, Lok-1</td>
            <td>1,700 – 2,000</td>
        </tr>

        <tr>
            <td><b>Jonna (Sorghum)</b></td>
            <td><img src="images/jonnalu.webp" class="crop-img" /></td>
            <td>Food, fodder, biofuel</td>
            <td>Sandy loam / black soil</td>
            <td>Kharif & Rabi</td>
            <td>CSH-16, CSV-15</td>
            <td>2,500 – 3,000</td>
        </tr>
    </table>

</div>

</body>
</html>
