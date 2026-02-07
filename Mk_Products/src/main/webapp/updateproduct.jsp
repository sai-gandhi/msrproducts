<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[readonly] {
            background-color: #eee;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #2196F3;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Update Product</h2>
    <form action="updateproduct" method="post" enctype="multipart/form-data">
        <label>Product ID:</label>
        <input type="text" readonly name="id" value="${product.id}"/>

        <label>Product Name:</label>
        <input type="text" name="name" value="${product.name}" required/>

        <label>Product Cost:</label>
        <input type="text" name="cost" value="${product.cost}" required/>

        <label>Available Products:</label>
        <input type="text" name="productcount" value="${product.productcount}" required/>

        <label>Product Description:</label>
        <input type="text" name="description" value="${product.description}" required/>

        <label>Update Image (optional):</label>
        <input type="file" name="image"/>

        <input type="submit" value="Update Product"/>
    </form>
</div>

</body>
</html>
