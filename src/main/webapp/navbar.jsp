<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title> Navigation bar</title>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>
<style>
/* Reset default margin and padding */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Basic styles for the navbar */
.navbar {
    background-color: #28a745;
    color: #fff;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height:70px;
}

.container-nav
{
    width: 100%;
    height:100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.navbar-brand {
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    font-size: 20px;
    margin-right: auto; /* Pushes the "MEDI HOME" to the left */
}

.navbar-collapse {
    margin-left: auto;
    flex: 1;
}

.navbar-toggler {
    display: none;
}

.navbar-nav {
    display: flex;
    list-style: none;
    float: right;
}

.nav-item {
    margin: 0 10px;
}

.nav-link {
    text-decoration: none;
    color: #fff;
    font-weight: bold;
}



/* Media query for toggler button */
@media screen and (max-width: 768px) {
    .navbar-toggler {
        display: block;
        cursor: pointer;
    }

    .navbar-collapse {
        display: none;
        width: 100%;
        position: absolute;
        top: 60px;
        left: 0;
        background-color: #28a745;
        padding: 10px;
    }

    .navbar-nav {
        flex-direction: column; /* Change flex direction for smaller screens */
    }

    .navbar-brand {
        margin-right: 0; /* Reset margin for smaller screens */
    }

    .navbar-collapse.active {
        display: block;
    }

    .nav-item {
        margin: 10px 0; /* Adjust margin for smaller screens */
    }
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
.custom-button{
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
        <div class="container-nav" >
            <div class="navbar-collapse">
                <a class="navbar-brand" href="index.jsp">
                    <i class="fas fa-clinic-medical"></i> MEDI HOME</a>
            </div>
            <!-- <button class="navbar-toggler" id="navbarToggler">
                <span class="navbar-toggler-icon"></span>
            </button> -->
            
           
            
            <div class="navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav" >
              <c:if test="${empty userObj }">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fas fa-sign-in-alt"></i> ADMIN</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="doctor_login.jsp">DOCTOR</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="appointment.jsp">APPOINTMENT</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="user_login.jsp">USER</a></li>
                  
              </c:if>
                
              
              <c:if test="${not empty userObj }">
              
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="appointment.jsp"> APPOINTMENT</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="show_appointment.jsp">VIEW APPOINTMENT</a></li>
                    
                    
                    <li class="nav-item">
                         <div class="dropdown">
                             <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" aria-expanded="false">
                                 <i class="fas fa-user-circle"></i>${userObj.fullName}
                             </button>
                         <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="edit_profile.jsp" style="text-decoration:none;">Change Password</a></li>
                            <li>
                                <form action="UserLogout" method="post">
                                  <button type="submit" class="dropdown-item custom-button">Logout</button>
                               </form>
                           </li>
                        </ul>
                     </div>
                  </li>
                    
                   
                    </c:if>
              </ul>  
                
            </div>
        </div>
    </nav>
</body>
</html>