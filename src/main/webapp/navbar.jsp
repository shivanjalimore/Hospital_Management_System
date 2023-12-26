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
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="admin_login.jsp"><i class="fas fa-sign-in-alt"></i> ADMIN</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="doctor_login.jsp">DOCTOR</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="user_appointment.html">APPOINTMENT</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="user_login.jsp">USER</a></li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>