<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crop Details</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #2c3e50;
            text-align: center;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #27ae60;
            color: white;
        }
        .crop-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            display: block;
            margin: auto;
        }
    </style>
</head>
<body>

<div>
	<a href="customerhome">Back</a>
</div>
<div class="container">
	<h2>Top High-Value Crops for Farmers to Grow in 2025 to Maximize Profits</h2>
    <h2>Crop Details</h2>
    <table>
        <tr>
            <th class="crop-container">Crop</th>
            <th>Image</th>
            <th>Uses</th>
            <th>Best Land Type</th>
            <th>Best Season</th>
            <th>Recommended Seeds</th>
            <th>Expected Cost</th>
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
            <td> 2,000 - 1,700</td>
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
