<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Navbar</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
<style>
    /* Basic Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Navbar styles */
.navbar {
    background-color: #007bff; /* Change color as needed */
    padding: 10px 20px;
    width:100%;
}

.navbar-brand {
    color: #fff; /* Change color as needed */
    text-decoration: none;
    font-size: 20.5px;
    font-weight: bold;
}

.container-fluid {
    display: flex;
}

.navbar-links {
    display: flex;
    align-items: center;
    gap: 20px; /* Adjust the space between elements */
}

.navbar-collapse {
    display: flex;
    align-items:center;
    margin-left: 70%;
}

.navbar-nav {
    list-style: none;
    display: flex;
}

.nav-item {
    margin-right: 20px;
}

.nav-link {
    color: #fff; /* Change color as needed */
    text-decoration: none;
    font-size: 18px;
}

.dropdown {
    position: relative;
}

.dropdown-toggle {
    background-color: #fff; /* Change color as needed */
    color: #007bff; /* Change color as needed */
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
}

.dropdown-menu {
    display: none;
    position: absolute;
    background-color: #fff; /* Change color as needed */
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    min-width: 120px;
    list-style: none;
    padding: 8px 0;
}

.dropdown-menu li {
    color: #333; /* Change color as needed */
    text-decoration: none;
    display: block;
    padding: 8px 16px;
}

a
{
text-decoration:none;
}
.dropdown:hover .dropdown-menu {
    display: block;
}

/* Define a custom class for the button to target */
.custom-button {
  /* Reset default button styles */
  background: none;
  border: none;
  padding: 0;
  /* Customize other styles as needed */
  /* For example: */
  color: #333; /* Text color */
  cursor: pointer; /* Change cursor on hover */
  /* Add additional styling if necessary */
}

</style>
<nav class="navbar">
    <div class="container-fluid" >
        <a class="navbar-brand" href="../index.jsp"><i class="fas fa-clinic-medical" style="color:white;"></i> Medi Home</a>
        
        <div class="navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="../index.jsp">HOME</a></li>
                <li class="nav-item"><a class="nav-link" href="patient.jsp">PATIENT</a></li>
            </ul>

            <!-- <form class="d-flex"> -->
                <div class="dropdown">
                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" aria-expanded="false">
                        <i class="fas fa-user-circle"></i>${doctObj.fullName}
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
                      <form action="../DoctorLogout" method="post">
                            <li><button type="submit" class="dropdown-item custom-button">Logout</button></li>
                       </form>
                    </ul>
                </div>
            <!-- </form> -->
        </div>
    </div>
</nav>
</body>
</html>