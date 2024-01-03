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
<title>Show Appointment</title>
</head>
<body>

<%@include file="navbar.jsp"%>

  <style>

       
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.nav-links {
  list-style: none;
}

.nav-links li {
  display: inline;
  margin-right: 20px;
}

.nav-links li a {
  color: #fff;
  text-decoration: none;
}

/* General container styles */
.container {
  margin: 20px auto;
  max-width: 1200px;
}



/* Table styles */
.table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
  
}

.table th,
.table td {
  border: 1px solid black;
  padding: 8px;
  text-align: left;
}

.table th {
    background-color: rgb(169, 226, 169);
}

.headline
{
    align-items: center;
    font-size: 25px;
    font-weight: bolder;
    justify-content: center;
}
/* Adjustments for small screens */
@media screen and (max-width: 768px) {
  .col-md-9 {
    width: 100%;
  }
  .col-md-3 {
    width: 100%;
    text-align: center;
    margin-top: 20px;
  }
  /* Base button styles */
.btn {
  display: inline-block;
  font-weight: 400;
  text-align: center;
  vertical-align: middle;
  user-select: none;
  border: 1px solid transparent;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  text-decoration: none;
  color: #212529;
  background-color: #ffc107; /* Default button color */
}

/* Small button styles */
.btn-sm {
  padding: 0.25rem 0.5rem;
  font-size: 0.875rem;
}

/* Button color variants */
.btn-warning {
  color: #fff;
  background-color: #ff9800; /* Warning color */
  border-color: #ff9800; /* Border color */
}

/* Hover styles (optional) */
.btn:hover {
  opacity: 0.9;
  /* Adjust as needed */
}
  
}

    </style>


  <div class="container">
        <div class="paint-card">
            <p class="headline">Appointment List</p>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Full Name</th>
                  <th scope="col">Gender</th>
                  <th scope="col">Age</th>
                  <th scope="col">Appoint Date</th>
                  <th scope="col">Diseases</th>
                  <th scope="col">Doctor Name</th>
                  <th scope="col">Status</th>
                </tr>
              </thead>
              <tbody>
               
               <%
                  User user = (User) session.getAttribute("userObj");
                 AppointmentDAO dao = new AppointmentDAO();
                 // To get doctor name by id we create object of doctor DAO and get the name by id 
                 DoctorInsert dao2 = new DoctorInsert();
                 List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                 for(Appointment ap : list)
                 {
                	 Doctor d = dao2.selectDoctor(ap.getDoctorId());
                 %>
                	
               <tr>
                  <td scope="col"><%=ap.getFullName()%></td>
                  <td scope="col"><%=ap.getGender() %></td>
                  <td scope="col"><%=ap.getAge() %></td>
                  <td scope="col"><%=ap.getAppoinDate() %></td>
                  <td scope="col"><%=ap.getDiseases() %></td>
                  <td scope="col"><%=d.getFullName() %></td>
                  <td scope="col">
                      
                      <%
                          if ("pending".equals(ap.getStatus())) {
                      %>
                         <a href="#" class="btn btn-sm btn-warning" style="background-color:yellow;text-decoration:none;color: inherit;pointer-events: none;cursor: default;">Pending</a>
                      <%
                          } else {
                      %>
                      <%= ap.getStatus() %>
                      <%
                          }
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
</body>
</html>