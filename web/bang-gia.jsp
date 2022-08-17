<%-- 
    Document   : bang-gia
    Created on : Jun 16, 2022, 1:07:14 AM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.price.PriceDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Price Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container mt-3">
            <h2>Bảng giá các dịch vụ của BD Dentist</h2>
            <p>Tất cả các giá của dịch vụ</p>            

            <form action="MainController" method="POST">
                <input type="submit" name="action" value="Display">
            </form>
            <table class="table table-dark table-hover">
                <c:if test="${sessionScope.LIST_PRICE != null}">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                </c:if>
                <tbody>
                    <c:forEach var="list" items="${sessionScope.LIST_PRICE}" varStatus="counter">
                        <tr>
                            <td>${list.getId()}</td>
                            <td>${list.getName()}</td>
                            <td>${list.getPrice()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>