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
<title>Comment</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>
<%@include file="doctor_navbar.jsp"%>

<style>
  
.text-center {
    text-align: center;
}

.text-white {
    color: #fff;
}

.container {
    max-width: 100%;
    margin-top:40px;
    margin-right: auto;
    margin-left: 25%;
    padding-right: 15px;
    padding-left: 15px;
   
}

.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

.col-md-6 {
    flex: 0 0 50%;
    max-width: 50%;
    padding-right: 15px;
    padding-left: 15px;
}
.col-md-12
{
 width:96%;
 margin:auto;
}

.card {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 1.0);
    margin-bottom: 20px;
    width:125%;
}

.card-body {
    padding: 20px;
}

.fs-4 {
    font-size: 1.5rem;
    margin-bottom: 20px;
    font-weight: bold;
    color: #333;
}

.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    user-select: none;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
        border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
  

</style>

<c:if test="${empty doctObj}">
  <c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>


<div class="container p-3">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="text-center fs-4">Patient Comment</p>

                   <%
                     int id = Integer.parseInt(request.getParameter("id"));
                     AppointmentDAO dao = new AppointmentDAO();
                     Appointment ap = dao.getAllAppointmentById(id);
                   %>
                   
                   
                    <form class="row" action="../UpdateStatus" method="post">
                        <div class="col-md-6">
                            <label>Patient Name</label>
                            <input type="text" readonly 
                            value="<%=ap.getFullName() %>"
                             class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label>Age</label>
                            <input type="text"  readonly
                             value="<%=ap.getAge() %>"
                             class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label>Mob No</label>
                            <input type="text" readonly  
                            value="<%=ap.getPhNo() %>"
                            class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label>Diseases</label>
                            <input type="text" readonly 
                            value="<%=ap.getDiseases() %>"
                             class="form-control">
                        </div>
                        <div class="col-md-12">
                            <label>Comment</label>
                            <textarea required name="comm" class="form-control" rows="3" cols=""></textarea>
                        </div>
                        <input type="hidden" name="id" value="<%=ap.getId() %>" >
                        <input type="hidden" name="did" value="<%=ap.getDoctorId()%>">
                        <button type="submit" class="mt-3 btn btn-primary col-md-6 offset-md-3" style="margin-top:20px;
    margin-left:21%;background-color:green;">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>