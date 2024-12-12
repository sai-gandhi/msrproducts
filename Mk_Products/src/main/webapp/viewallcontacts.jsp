<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View All Contact</title>
</head>
<body>
    <h2>View All Contact Information</h2>
    <a href="adminhome.jsp">Back to home</a>
    
    <table border="1">
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
        <tbody>
            <c:forEach var="contactus" items="${contacts}">
                <tr>
                    <td>${contactus.id}</td>
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
                                <img src="default-image.jpg" alt="Default Image" width="100" height="100"/>
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
