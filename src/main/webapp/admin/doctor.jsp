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
<title>Add Doctor</title>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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
	left:30%;
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
 <div class="containeradmin">
     
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
       
                <div class="card" style=" position:relative;">
                    <div class="card-body">
                        <p class="fs-3 text-center">Add Doctor</p>
                     
                        <form action="../AddDoctor" method="post">
                            <div class="form-group">
                                <label class="form-label" for="fullname">Full Name</label>
                                <input type="text" required name="fullname" id="fullname" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="dob">DOB</label>
                                <input type="date" required name="dob" id="dob" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="qualification">Qualification</label>
                                <input type="text" required name="qualification" id="qualification" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="spec">Specialist</label>
                                <select name="spec" required id="spec" class="form-control">
                                    <option>--select--</option>
                                    
                                    <%
									SpecialistInsert dao = new SpecialistInsert();
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
                                    
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="email">Email</label>
                                <input type="text" required name="email" id="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="mobno">Mob No</label>
                                <input type="text" required name="mobno" id="mobno" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="password">Password</label>
                                <input type="password" required name="password" id="password" class="form-control">
                            </div>
                            <button type="submit" class="btn-primary">ADD</button>
                        </form>
                    </div>
                    
                    <div class="card-body-1">
                      <p class="heading"> Doctor Details</p>
                      <table class="table">
                         <thead>
                         <tr>
                           <th class="col">Id</th>
                           <th class="col">Full Name</th>
                           <th class="col">DOB</th>
                           <th class="col">Qualification</th>
                           <th class="col">Specialist</th>
                           <th class="col">Email</th>
                           <th class="col">Mob No</th>
                           <th class="col">Password</th>
                           <th class="col">Action</th>
                         </tr>
                         </thead>
                         <tbody>
        
        <% DoctorInsert DI = new DoctorInsert();
           List<Doctor> list2 = DI.getAllDoctor();
           for(Doctor d :list2)
           {
        %>
        
              <tr>
                <td><%=d.getId() %></td>
                <td><%=d.getFullName() %></td>
                <td><%=d.getDob() %></td>
                <td><%=d.getQualification() %></td>
                <td><%=d.getSpecialist() %></td>
                <td><%=d.getEmail() %></td>
                <td><%=d.getMobNo() %></td>
                <td><%=d.getPassword() %></td>
                <td>
                
              
               <a href="edit_doctor.jsp?id=<%=d.getId() %>">
               <button type="button" class="edit-btn" id="specific-edit-btn" style="background-color:blue;padding:8px;color:white;">Edit</button>
               </a>           
                   
               <form action="../DeleteDoctor" method="post" > 
                <input type="hidden" name="id" value="<%=d.getId() %>">
                <button type="submit" class="delete-btn" style="background-color:red;padding:8px;color:white">Delete</button>
              </form>
                    
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
               
       <%@include file="/footer.jsp"%>        
</body>
</html>