<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
h2{
color:green;
text-align: center;
text-decoration: underline;
}
th{
background-color: yellow;
font-size: 15px
width:55px;
height: 10px;
}
td{
background-color: white;
}
body{
background-color: lightgray;
}
a{
color:red;
}
.backbutton{
color:blue;
text-decoration: none;
}
.productname{
color:red;
}
.productname:hover{
text-decoration: underline;
text-shadow: black;
color: green;
font-size: 20px;
}

.productcost{
color:red;

}
.productcost:hover {
	text-decoration: underline;
text-shadow: black;
color: green;
font-size: 20px;
}
.productcount{
color:red;
}
.productcount:hover {
	text-decoration: underline;
text-shadow: black;
color: green;
font-size: 20px;
}

img{
background-color: green;
border-radius: 20px
}
img:hover{
font-size: 25px;
}

</style>
<head>
    <title>View All Products</title>
</head>
<body>
    <h2>List of all Products</h2>
    <a href="adminhome.jsp" class="backbutton">Back to Home</a><br><br>
    
    <table border="1">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Cost</th>
                <th>Available products</th>
                <th>Image</th>
                 <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td class="productname">${product.name}</td>
                    <td class="productcost">${product.cost}</td>
                    <td class="productcount">${product.productcount}</td>
                   

                    <td>
                        <c:choose>
                            <c:when test="${product.image != null}">
                                <img src="displayproductimage?id=${product.id}" alt="Product Image" width="100" height="100"/>
                            </c:when>
                            <c:otherwise>
                                <img src="default-image.jpg" alt="Default Image" width="100" height="100"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                     <td class="description">${product.description}</td>
                    <td>
                     <a href="<c:url  value='/productdelete?id=${product.id}'  />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
