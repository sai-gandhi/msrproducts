<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Feedback Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        width: 400px;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
    }
    input[type="text"], input[type="file"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"], input[type="reset"] {
        width: 48%;
        padding: 10px;
        margin-top: 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"] {
        background-color: #28a745;
        color: white;
    }
    input[type="reset"] {
        background-color: #dc3545;
        color: white;
    }
    input[type="submit"]:hover {
        background-color: #218838;
    }
    input[type="reset"]:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Customer Feedback Form</h2>
        <form action="savefeedbackform" method="post" enctype="multipart/form-data">
            <label>Customer Name</label>
            <input type="text" placeholder="Enter Customer name.." required name="customer-name"/>
            
            <label>Contact Number</label>
            <input type="text" placeholder="Enter contact.." required name="contact"/>
            
            <label>Products Used</label>
            <input type="text" placeholder="Enter products names.." required name="product-name"/>
            
            <label>Crop</label>
            <input type="text" placeholder="Enter crop name.." required name="crop-name"/>
            
            <label>What Happens</label>
            <input type="text" placeholder="Enter user story.." required name="user-story"/>
            
            <label for="image">Upload Image:</label>
            <input type="file" id="image" required name="image"><br>
            
            <input type="submit" value="Submit"/>
            <input type="reset" value="Clear"/>
        </form>
    </div>
</body>
</html>