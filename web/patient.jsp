<%-- 
    Document   : patient
    Created on : Jun 22, 2022, 9:36:20 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- Icons -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <!-- Css -->
    <link href="<c:url value="/css/patient.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/css/employee.css"/>" rel="stylesheet" type="text/css" />
    <!-- Font  -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- BootStrap  -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Js  -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <div class="side-menu">
      <div class="brand-name">
          <h1>Employee</h1>
      </div>
      <ul>
          <li><i class="fa fa-tachometer me-4" aria-hidden="true"></i><span>Dashboard</span> </li>
          <li><i class="fa fa-calendar me-4" aria-hidden="true"></i><span> Appoinments</span> </li>
          <li><i class="fa fa-commenting me-4" aria-hidden="true"></i></i><span>Reviews</span> </li>
          <li><i class="fa fa-calendar-o me-4" aria-hidden="true"></i><span>Blogs</span> </li>
          <li><i class="fa fa-bed me-4" aria-hidden="true"></i><span>Patients</span> </li>
          <li><i class="fa fa-question-circle me-4" aria-hidden="true"></i><span>Help</span></li>
          <li><i class="fa fa-cogs me-4" aria-hidden="true"></i><span>Settings</span> </li>
      </ul>
  </div>
  <div class="container">
    <h2>Borderless Table</h2>
    <p>The .table-borderless class removes borders from the table:</p>            
    <table class="table table-borderless">
      <thead>
        <tr>
          <th>Firstname</th>
          <th>Lastname</th>
          <th>Email</th>
          <th>Email</th>
          <th>Email</th>
          <th>Email</th>
          <th>Email</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>John</td>
          <td>Doe</td>
          <td>john@example.com</td>
          <td>Mary</td>
          <td>Moe</td>
          <td>mary@example.com</td>
        </tr>
        <tr>
          <td>Mary</td>
          <td>Moe</td>
          <td>mary@example.com</td>
        </tr>
        <tr>
          <td>July</td>
          <td>Dooley</td>
          <td>july@example.com</td>
        </tr>
        <tr>
          <td>John</td>
          <td>Doe</td>
          <td>john@example.com</td>
        </tr>
        <tr>
          <td>John</td>
          <td>Doe</td>
          <td>john@example.com</td>
        </tr>
        <tr>
          <td>John</td>
          <td>Doe</td>
          <td>john@example.com</td>
        </tr>
        <tr>
          <td>John</td>
          <td>Doe</td>
          <td>john@example.com</td>
        </tr>
      </tbody>
    </table>
  </div>
  </body>
</html>

