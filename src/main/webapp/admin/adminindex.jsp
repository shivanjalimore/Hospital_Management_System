<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
   
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>

<%@include file="admin_navbar.jsp"%>

<style>
.row {
    margin-top: 20px; /* Adjust the margin-top value as needed */
}

h1
{
	color:#006400;
	 text-align: center;
	}


/* Grid layout for columns */
.row::after {
    content: "";
    clear: both;
    display: table;
}

[class^="col-"] {
    float: left;
    padding: 0 15px;
    box-sizing: border-box;
}

.col-md-4 {
    width: calc(33.333333% - 30px);
    max-width: calc(33.333333% - 30px);
    margin-top: 40px;
}

/* Card styles */
.card {
    background-color: #f8f9fa;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.paint-card {
    border: 2px solid #28a745;
}

.card-body {
    padding: 20px;
}

.text-success {
    color: #28a745;
}

.fs-4 {
    font-size: 1.5rem;
}

/* Icon styles */
.card-body i {
    margin-bottom: 10px;
}

.popup {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.popup-content {
    background-color: #fff;
    padding: 35px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.popup-content h2 {
    margin-top: 0;
}

.popup-content input[type="text"],
.popup-content button {
    margin-bottom: 10px;
    padding:15px;
}

.popup-buttons {
    display: flex;
    justify-content: flex-end;
   
}

.popup-buttons button
{
	 color:white;
    font-size:15px;
}
</style>

<div class="row">
    <h1>Admin Dashboard</h1>
        <div class="col-md-4">
         <a href="doctor.jsp">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-3x"></i><br>
                    <p class="fs-4 text-center">Doctor <span id="doctorCount">0</span></p>
                </div>
            </div>
            </a>
        </div>
    
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-circle fa-3x"></i><br>
                    <p class="fs-4 text-center">User <span id="userCount">0</span></p>
                </div>
            </div>
        </div>
    
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">Total Appointment <span id="appointmentCount">0</span></p>
                </div>
            </div>
        </div>
    
        <div class="col-md-4 mt-2">
            <div class="card paint-card" id="specialistCard">
                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">Specialist <span id="specialistCount">0</span></p>
                </div>
            </div>
        </div>
    </div>
    
    
    <div id="specialistPopup" class="popup">
     <%
    String errorMsg = (String) session.getAttribute("errorMsg");
    // Ensure errorMsg is not null before displaying it
    if (errorMsg != null && !errorMsg.isEmpty()) {
%>
   
    <span id="errormsg" name="errormsg" style="color:red;"><%= errorMsg %></span>
    
<%
    // Clear the error message from session after displaying it once
    session.removeAttribute("errorMsg");
    }
%>
    
    <div class="popup-content">
      <form action="../SpecialistInsertController" method="post">
        <h2 style="margin-bottom: 8px;font-size: 30px;">Add a Specialist:</h2>
        <input type="text" name="Sname" id="specialistInput"  placeholder="Specialist Name" style=" width: 300px ;">
        <button type="submit" id="addSpecialistBtn" style="background-color:blue;margin-bottom: 8px;color:white;font-size:15px;">Add</button>
     
        <div class="popup-buttons" style="margin-bottom: 8px;">
            <button id="saveChangesBtn" style="background-color:green;">Save Changes</button>
            <button id="closeBtn" style="background-color:red;margin-left:5px;">Close</button>
            
        </div>
          </form>
    </div>
   
</div>
   

<script src="Specialistscript.js"></script>

</body>
</html>