<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            margin: 30px;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .invoice-header {
            margin-bottom: 20px;
        }

        .invoice-header p {
            margin: 4px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th {
            background-color: #2c3e50;
            color: white;
            padding: 10px;
            text-align: left;
        }

        td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .text-right {
            text-align: right;
        }

        .total-row td {
            font-weight: bold;
            border-top: 2px solid #2c3e50;
        }

        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 11px;
            color: #777;
        }
    </style>
</head>
<body>

<h1>ORDER INVOICE</h1>

<div class="invoice-header">
    <p><strong>Order Code:</strong> {{orderCode}}</p>
    <p><strong>Order Date:</strong> {{orderDate}}</p>
    <p><strong>Customer:</strong> {{customerName}}</p>
    <p><strong>Email:</strong> {{customerEmail}}</p>
    <p><strong>Status:</strong> {{status}}</p>
</div>

<table>
    <thead>
        <tr>
            <th>Product</th>
            <th class="text-right">Quantity</th>
            <th class="text-right">Unit Price</th>
            <th class="text-right">Total</th>
        </tr>
    </thead>
    <tbody>
        {{items}}
        <tr class="total-row">
            <td colspan="3" class="text-right">Grand Total</td>
            <td class="text-right">₹{{totalAmount}}</td>
        </tr>
    </tbody>
</table>

<div class="footer">
    Thank you for shopping with us.
</div>

</body>
</html>
