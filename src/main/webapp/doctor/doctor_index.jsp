<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="doctor_navbar.jsp"%>


<style>

    /* Basic Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
  
  /* Center Text */
.text-center {
    margin-top: 30px;
    text-align: center;
    font-weight: 900;
}
.container
{
    width: 80%;
    margin: auto;
}
/* Font Sizes */
.fs-3 {
    font-size: 24px;
}
.row
{
    display: flex;
   
}
.col-1
{
    flex:1;
    padding:30px;
}
.fs-4 {
    font-size: 20px;
}

/* Card Styles */
.paint-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    background-color: #f9f9f9;
}

/* Icon Styles */
i {
    margin-bottom: 10px;
    color: #28a745; /* Change color as needed */
}
   
</style>

<c:if test="${empty doctObj}">
  <c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<p class="text-center fs-3">Doctor Dashboard</p>

<div class="container">
    <div class="row">
        <div class="col-1">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Doctor <br>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-1">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Total Appointment <br>
                        
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/footer.jsp"%>  
</body>
</html>