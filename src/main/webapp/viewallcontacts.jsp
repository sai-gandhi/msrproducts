<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
.MSR_title{
color:green;
text-align:center;

}
.heading{
color:black;
}
th{
background-color: yellow;
height:40px;
width: 1000px;
text-decoration: blink;
color: blue;
font-size: 1em;
}
a{
color:red;
}
td{
color:green;
text-align: center;
}
.dataplace:hover {
    text-color: red;
    text-align: center;
}

body{
background-color: lightgray;
}
.customerid{
color:red;
}

img:hover{
border-radius:25px;
background-color: red;



}
table{
background-color:white;
}

</style>
<head>
    <title>View All Contact</title>
</head>
<body>


     <h2 class="MSR_title">MSR Service</h2>
      <a href="adminhome.jsp">Back to home</a><br><br>
    <h2 class="heading">View All Contact Information</h2>
   
    
    <table border="2">
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Contact Number</th>
                <th>Location</th>
                <th>Date</th>
                <th>Message</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody >
            <c:forEach var="contactus" items="${contacts}">
                <tr class="dataplace">
                    <td class="customerid">${contactus.id}</td>
                    <td>${contactus.name}</td>
                    <td>${contactus.contact}</td>
                    <td>${contactus.location}</td>
                    <td>${contactus.date}</td>
                    <td>${contactus.message}</td>

                    <td>
                        <c:choose>
                            <c:when test="${contactus.image != null}">
                                <img src="displaycontactimage?id=${contactus.id}" alt="Contact Image" width="100" height="100"/>
                            </c:when>
                            <c:otherwise>
                                <img  src="default-image.jpg" alt="Default Image" class="image" width="100" height="100"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                    <a href="<c:url value='/delete?id=${contactus.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
