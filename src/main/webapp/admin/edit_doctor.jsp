<%@page import="com.Beans.*" %>
<%@page import="com.DAO.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Doctor</title>


</head>
<body>


<%@include file="admin_navbar.jsp"%>
 
 <style>
 /* Resetting default margin and padding */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Global styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
}

.containeradmin {
   height:100vh;
    width:100%;
    
}

.card {
    width:100%;
    display:flex;
    background-color: #ffffff;
    border-radius: 5px;
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    
}

.card-body {
    padding: 20px;
    flex:1;
}
.card-body-1
{
	flex:3;
	padding:40px;
}

.fs-3 {
    font-size: 1.75rem;
}

.text-center {
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-label {
    font-weight: bold;
    margin-bottom: 5px;
    display: block;
}

.form-control {
    width: 100%;
    padding: 8px;
    font-size: 16px;
    border-radius: 4px;
    border: 1px solid #ccc;
}

.btn-primary {
    background-color: #007bff;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
}

.btn-primary:hover {
    background-color: #0056b3;
}



.heading {
    font-size: 1.5rem;
    margin-bottom: 10px;
}

.table {
    width: 100%;
    border-collapse: collapse;
}

.table th, .table td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ccc;
}

.table th {
    background-color: #f5f5f5;
    font-weight: bold;
}

.col {
    width: 14%; /* Adjust column width as needed */
}

/* Optional: Hover effect for table rows */
.table tr:hover {
    background-color: #f9f9f9;
}

#editContent
{
	position:absolute;
	top:10%;

}
 .error-message {
            font-size: 24px;
            text-align: center;
            color: red;
        }

        .success-message {
            font-size: 24px;
            text-align: center;
            color: green;
        }
 
 </style>
 
   
   <%
      int id = Integer.parseInt(request.getParameter("id"));
      DoctorInsert dao2 = new DoctorInsert();
      Doctor existingDoctor = dao2.selectDoctor(id);
   %>
            
        <div id="editContent" style="border:2px solid black;width:600px;margin-left:30%;padding:20px;">
        <div class="container">
            <h1> Edit Doctor Information</h1>
            <form id="registrationForm" action="../UpdateDoctor" method="post">
               
               <input type="hidden" id="id" class="form-control" name="id" value="<%= existingDoctor != null ? existingDoctor.getId() : "" %>">
       <div class="form-group">
        <label for="name" class="form-label">Full Name:</label>
        <input type="text" id="name" class="form-control" name="name" value="<%= existingDoctor != null ? existingDoctor.getFullName() : "" %>">
      </div>
      <div class="form-group">
        <label for="dob" class="form-label">DOB:</label>
        <input type="date" id="dob" name="dob" class="form-control" value="<%= existingDoctor != null ? existingDoctor.getDob() : "" %>">
      </div>
      <div class="form-group">
        <label for="name" class="form-label">Qualification:</label>
        <input type="text" id="qualification" class="form-control" name="qualification" value="<%= existingDoctor != null ? existingDoctor.getQualification() : "" %>">
      </div>
      
      <div class="form-group">
                                <label class="form-label" for="spec">Specialist</label>
                                <select name="spec" id="spec" class="form-control" value="<%= existingDoctor != null ? existingDoctor.getSpecialist() : "" %>">
                                    <option><%= existingDoctor != null ? existingDoctor.getSpecialist() : "" %></option>
                                    
                                    <%
									SpecialistInsert dao1 = new SpecialistInsert();
									List<Specialist> list1 = dao1.getAllSpecialist();
									for (Specialist s : list1) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
                                </select>
                            </div>
                            
      <div class="form-group">
        <label for="email" class="form-label">Email ID:</label>
        <input type="email" id="email" name="email" class="form-control" value="<%= existingDoctor != null ? existingDoctor.getEmail() : "" %>">
      </div>
      <div class="form-group">
      <label class="form-label" for="mobno" class="form-label">Mob No</label>
      <input type="text"  name="mobno" id="mobno" class="form-control" value="<%= existingDoctor != null ? existingDoctor.getMobNo(): "" %>">
      </div>
                            
      <div class="form-group">
        <label for="password" class="form-label">Password:</label>
        <input type="text" id="password" name="password" class="form-control" value="<%= existingDoctor != null ? existingDoctor.getPassword() : "" %>">
      </div>
      <button type="submit" style="background-color:blue;padding:8px;color:white;">Edit</button>
      <button type="button" id="closeBtn" style="background-color:red;padding:8px;color:white">Close</button>
            </form>
        </div>
    </div>
    
    <%@include file="/footer.jsp"%>  
</body>
</html>