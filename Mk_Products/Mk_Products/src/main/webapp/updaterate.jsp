<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
   <title>Update Market Rates</title>
</head>
<body>
<h3><u>Update Market Prices of Product's</u></h3>
<a href="adminhome.jsp">Back</a>
   

    <form action="<c:url value='/updaterate' />" method="post">
        <input type="hidden" name="id"  value="${marketRate.id}" />

        <label for="name">Name:</label>
        <input type="text" name="pname" readonly="readonly" value="${marketRate.productname}" required /><br><br>
        <label>Date:</label>
        <input type="date" required="required" value="${marketRate.date}" name="pdate"><br><br>
        <label>Maximum Price:</label>
        <input type="text"  required="required" value="${marketRate.maxrate}"  name="maxprice"><br><br>
        <label>Average Price:</label>
        <input type="text"  required="required" value="${marketRate.avgrate}"  name="avgprice"><br><br>
        <label>Minimum Price:</label>
        <input type="text"  required="required" value="${marketRate.minrate}"  name="minprice"><br><br>
        
        <button type="submit">Update Rates</button>
    </form>
</body>
</html>
