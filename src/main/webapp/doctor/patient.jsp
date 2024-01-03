<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.Beans.*" %>
<%@page import="com.DAO.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Information</title>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

<%@include file="doctor_navbar.jsp"%>
<style>

/* Sample CSS for basic styling, adjust as needed */

.paint-card {
    border: 1px solid #ccc;
    border-radius: 5px;
    margin: 50px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-body {
    padding: 20px;
}

a {
  text-decoration: none; /* Remove the underline */
  color: inherit; /* Change the color to match its parent or specify a color */
  
}

.fs-3 {
    font-size: 1.75rem;
    margin-bottom: 20px;
    font-weight: bold;
    color: #333;
}

.table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.table th,
.table td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
    text-align: left;
   
}

.table th {
    background-color:#bdd5f6;
    font-weight: bold;
}

/* Alternate row background color */
.table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

/* Hover effect */
.table tbody tr:hover {
    background-color: #f0f0f0;
}

</style>
<div class="col-md-12">

     <% 
        // Check for errorMsg and display if not empty
        if (session.getAttribute("errorMsg") != null && !session.getAttribute("errorMsg").toString().isEmpty()) {
    %>
            <p class="error-message" style="color:red;font-size:18px; text-align: center;">
                <%= session.getAttribute("errorMsg") %>
            </p>
            <% session.removeAttribute("errorMsg"); %>
    <% 
        }
    %>

    <% 
        // Check for succMsg and display if not empty
        if (session.getAttribute("succMsg") != null && !session.getAttribute("succMsg").toString().isEmpty()) {
    %>
            <p class="success-message" style="color:green;font-size:18px; text-align: center;">
                <%= session.getAttribute("succMsg") %>
            </p>
            <% session.removeAttribute("succMsg"); %>
    <% 
        }
    %>

    <div class="card paint-card">
        <div class="card-body">
            <p class="fs-3 text-center">Patient Details</p>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Full Name</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Age</th>
                        <th scope="col">Appointment Date</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mob No</th>
                        <th scope="col">Diseases</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                
           <%
    Doctor d = (Doctor) session.getAttribute("doctObj");
    AppointmentDAO dao = new AppointmentDAO();
    List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());

    for (Appointment ap : list) {
%>
    <tr>
        <td><%= ap.getFullName() %></td>
        <td><%= ap.getGender() %></td>
        <td><%= ap.getAge() %></td>
        <td><%= ap.getAppoinDate() %></td>
        <td><%= ap.getEmail() %></td>
        <td><%= ap.getPhNo() %></td>
        <td><%= ap.getDiseases() %></td>
        <td style="color:red;"><%= ap.getStatus() %></td>
        <td >
        
        <%
          if("pending".equals(ap.getStatus()))
          { %>
        	  <a href="comment.jsp?id=<%=ap.getId() %>" class="comment" style="background-color:#6ef56e;padding:4px;"><i class="fa-regular fa-comment"></i> Comment</a>
        <%   }
          else
          { %>
              <a href="#" class="comment" style="background-color:#bdf6bd;padding:4px; pointer-events: none; opacity: 0.5; text-decoration: none;">
              <i class="fa-regular fa-comment"></i> Comment
              </a>
      <%     }
        %>
        
         

        </td>
    </tr>
<%
    }
%>
           
                
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>