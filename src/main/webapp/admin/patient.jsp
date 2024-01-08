<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.Beans.*" %>
<%@page import="com.DAO.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>


<%@include file="admin_navbar.jsp"%>


<body>

       <style>

        /* Basic CSS styling for table and card */
.container {
    width: 100%;
    margin: 0 auto;
    padding: 20px;
}

.card-body {
    padding: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #ccc;
}

th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
}
th
{
    background-color: rgb(196, 247, 216);
}
.title
{
    font-size: 22px;
    font-weight: bolder;
}


    </style>
    <div class="container">
        <div class="card paint-card">
            <div class="card-body">
                <p class="title">Patient Details</p>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Appointment</th>
                            <th>Email</th>
                            <th>Mob No</th>
                            <th>Diseases</th>
                            <th>Doctor Name</th>
                            <th>Address</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                     
                     <%
                       AppointmentDAO dao = new AppointmentDAO();
                     
                       DoctorInsert dao2 = new DoctorInsert();
                       List<Appointment> list = dao.getAllAppointment();
                       for(Appointment ap : list)
                       {
                    	  Doctor d =  dao2.selectDoctor(ap.getDoctorId());
                     %>
                     
                        <tr>
                            <td><%=ap.getFullName() %></td>
                            <td><%=ap.getGender() %></td>
                            <td><%=ap.getAge() %></td>
                            <td><%=ap.getAppoinDate() %></td>
                            <td><%=ap.getEmail() %></td>
                            <td><%=ap.getPhNo() %></td>
                            <td><%=ap.getDiseases() %></td>
                            <td><%=d.getFullName() %></td>
                            <td><%=ap.getAddress() %></td>
                            <td><%=ap.getStatus() %></td>
                            
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