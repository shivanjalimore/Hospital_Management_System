<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title> Admin Login</title>
    <link rel="stylesheet" href="doctor_login.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>

<%@include file="/navbar.jsp"%>


<div class="container p-5">
        <div class="row">
          <div class="col-md-4 offset-md-4">
            <div class="card paint-card">
              <div class="card-body">
                  <p class="fs-4 text-center">Admin Login</p>
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
               
               
                <form action="AdminLogin" method="post">
                  <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <input required name="email" type="email" class="form-control">
                  </div>
                  <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input required name="password" type="password" class="form-control">
                  </div>
                  <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    <%@include file="/footer.jsp"%>  
</body>
</html>