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
<title>Book Appointment</title>
</head>
<body>

<style>

     /* Resetting default styles */
     body, h1, h2, h3, h4, h5, h6, p, ul, ol, li, form, fieldset, input, textarea, select {
            margin: 0;
            padding: 0;
            border: 0;
            font-family: Arial, sans-serif;
        }

        body {
            line-height: 1.6;
            background-color: #f0f0f0;
        }
        
        .main-container
        {
            height:90vh;
            
            width:100%;
            display: flex;
            background-color: #c3f8c3;
        }
        .img-container
        {
            flex:1;
            margin: auto;
            
        }
        .img-container img
        {
            margin-left:20%;
        }
        .container {
            flex:1;
            margin: auto auto;
            padding: 40px;
            max-width: 800px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        button {
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #218838;
        }

        /* Two-column form layout */
        .form-section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .form-section .form-col {
            width: 48%;
            margin-bottom: 20px;
        }

        .form-section::after {
            content: "";
            display: table;
            clear: both;
        }
        
        #editContent
{
	position:absolute;
	top:10%;

}
 .error-message {
            font-size: 18px;
            text-align: center;
            color: red;
        }

        .success-message {
            font-size: 18px;
            text-align: center;
            color: green;
        }

        @media (max-width: 768px) {
            .form-section .form-col {
                width: 100%;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>
<%@include file="/navbar.jsp"%>
    <div class="main-container">
    <div class="img-container">
       <img src="../img/doctor-10.png">
    </div>
    <div class="container">
                        <% 
        // Check for errorMsg and display if not empty
        if (session.getAttribute("errorMsg") != null && !session.getAttribute("errorMsg").toString().isEmpty()) {
    %>
            <p class="error-message">
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
            <p class="success-message">
                <%= session.getAttribute("succMsg") %>
            </p>
            <% session.removeAttribute("succMsg"); %>
    <% 
        }
    %>
        <form action="../AppointmentServlet" method="post">
            <div class="form-section">
            
      
                <!-- First column -->
                <div class="form-col">
                
                <input type="hidden" name="userid" value="${userObj.id}">
                    <label for="fullName">Full Name</label>
                    <input required type="text" name="fullname" id="fullName">

                    <label for="age">Age</label>
                    <input required type="number" name="age" id="age">

                    <label for="gender">Gender</label>
                    <select required name="gender" id="gender">
                        <option value="">Select Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                    
                    <label for="appointmentDate">Appointment Date</label>
                    <input required type="date" name="appointment_date" id="appointmentDate">
                </div>

                <!-- Second column -->
                <div class="form-col">
                    <label for="email">Email</label>
                    <input required type="email" name="email" id="email">

                    <label for="phone">Phone Number</label>
                    <input required type="number" name="phone" id="phone">

                    <label for="diseases">Diseases</label>
                    <input required type="text" name="diseases" id="diseases">
                    
                    <label for="doctor">Doctor</label>
                    <select required name="doctor" id="doctor">
                        <option value="">Select Doctor</option>
                        
                        <%
                         DoctorInsert dao = new DoctorInsert();
                    	 List<Doctor> list = dao.getAllDoctor();
                    		for(Doctor d : list)
                    		{  %>
                    			<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist() %>)</option>
                    	 <% }
                        %>
                        
                    </select>
                    
                </div>
                
            <label for="address">Full Address</label>
            <textarea required name="address" id="address" rows="3" cols="">
            </textarea>
            </div>
            
            <c:if test="${empty userObj }">
              <a href="../user_login.jsp">
            <button type="button">Submit</button></a>
            </c:if>
            
            <c:if test="${not empty userObj}">
                <button type="submit">Submit</button>
            </c:if>
        </form>
    </div>
</div>
   <%@include file="/footer.jsp"%>  
</body>
</html>