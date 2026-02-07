<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | View Products</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
:root {
    --accent: #6366f1;
    --bg-main: #020617;
    --bg-card: rgba(255,255,255,0.08);
    --border-soft: rgba(255,255,255,0.15);
    --text-main: #e5e7eb;
    --text-muted: #94a3b8;
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
    background: linear-gradient(135deg, var(--accent), #4f46e5);
    transition: all 0.3s ease;
}

.back-link:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(99,102,241,0.5);
}

/* Container */
.container {
    max-width: 1200px;
    margin: auto;
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.12),
        rgba(255,255,255,0.03)
    );
    border: 1px solid var(--border-soft);
    border-radius: 22px;
    padding: 26px;
}

/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.header h2 {
    font-size: 1.6rem;
    font-weight: 600;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 14px;
    overflow: hidden;
}

th {
    background: rgba(99,102,241,0.25);
    padding: 14px;
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    text-align: center;
}

td {
    padding: 14px;
    border-bottom: 1px solid rgba(255,255,255,0.1);
    text-align: center;
    font-size: 0.95rem;
}

tr:hover {
    background: rgba(255,255,255,0.05);
}

tr:last-child td {
    border-bottom: none;
}

/* Image */
.product-img {
    width: 90px;
    height: 90px;
    object-fit: cover;
    border-radius: 12px;
    border: 1px solid rgba(255,255,255,0.2);
}

/* Description */
.description {
    max-width: 320px;
    text-align: left;
}

.desc-text {
    display: block;
    max-height: 3em;
    line-height: 1.5em;
    overflow: hidden;
    color: var(--text-muted);
}

.desc-text.expanded {
    max-height: none;
}

/* Toggle Button */
.toggle-btn {
    background: none;
    border: none;
    color: #a5b4fc;
    cursor: pointer;
    font-size: 0.85rem;
    padding: 0;
    margin-top: 6px;
}

.toggle-btn:hover {
    text-decoration: underline;
}

/* Action */
.action-link {
    color: #c7d2fe;
    text-decoration: none;
    font-weight: 500;
}

.action-link:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 768px) {
    .header {
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
    }

    table {
        display: block;
        overflow-x: auto;
    }
}
</style>

</head>
<body>

<a href="adminhome.jsp" class="back-link"> Back to Home</a>

<div class="container">

    <div class="header">
        <h2>List of All Products</h2>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Cost</th>
                <th>Stock</th>
                <th>Image</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td> Rs. ${product.cost}</td>
                    <td>${product.productcount}</td>

                    <td>
                        <c:choose>
                            <c:when test="${product.image != null}">
                                <img class="product-img"
                                     src="displayproductimage?id=${product.id}" />
                            </c:when>
                            <c:otherwise>
                                <img class="product-img"
                                     src="default-image.jpg" />
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td class="description">
                        <span class="desc-text">${product.description}</span>
                        <button class="toggle-btn" onclick="toggleDesc(this)">
                            Show More
                        </button>
                    </td>

                    <td>
                        <a class="action-link"
                           href="updateproduct?id=${product.id}">
                            <i class="fa fa-edit"></i> Edit
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

<script>
function toggleDesc(btn) {
    const desc = btn.previousElementSibling;
    desc.classList.toggle('expanded');
    btn.textContent = desc.classList.contains('expanded')
        ? "Show Less"
        : "Show More";
}
</script>

</body>
</html>
