<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View All Contact</title>

    <!-- Link to Font Awesome for the Trash Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .MSR_title {
            color: green;
            text-align: center;
        }
        
        .heading {
            color: black;
        }

        th {
            background-color: yellow;
            height: 40px;
            width: 1000px;
            color: blue;
            font-size: 1em;
        }

        a {
            color: red;
        }

        td {
            color: green;
            text-align: center;
        }

        .dataplace:hover {
            color: red; /* Fix the hover text color */
            text-align: center;
        }

        body {
            background-color: lightgray;
        }

        .customerid {
            color: red;
        }

        img:hover {
            border-radius: 25px;
            background-color: red;
        }

        table {
            background-color: white;
        }

        /* Optional: Style the delete link to look like a button */
        .delete-link {
            color: red;
            text-decoration: none;
            font-size: 18px;
            padding: 5px 10px;
            border: 1px solid red;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .delete-link:hover {
            background-color: red;
            color: white;
        }
    </style>
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
        <tbody>
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
                                <img src="default-image.jpg" alt="Default Image" class="image" width="100" height="100"/>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <!-- Added a class for styling the delete link -->
                        <a href="<c:url value='/delete?id=${contactus.id}' />" class="delete-link" onclick="return confirm('Are you sure you want to delete this contact?');">
                            <i class="fa fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <%@ include file="footer.jsp" %>

</body>
</html>
