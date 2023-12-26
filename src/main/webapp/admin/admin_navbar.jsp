<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Navbar</title>
    <link rel="stylesheet" href="admin_navbar.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>
      <nav class="navbar">
        <div class="container-nav" >
            <div class="navbar-collapse">
                <a class="navbar-brand" href="../index.jsp">
                    <i class="fas fa-clinic-medical"></i> MEDI HOME</a>
                    <ul class="navbar-nav" >
                        <li class="nav-item"><a class="nav-link active" href="index.jsp">HOME</a></li>
                        <li class="nav-item"><a class="nav-link active" href="doctor.jsp">DOCTOR</a></li>
                        <!-- <li class="nav-item"><a class="nav-link active" href="view_doctor.jsp">VIEW DOCTOR</a></li> -->
                        <li class="nav-item"><a class="nav-link active" href="patient.jsp">PATIENT</a></li>
                    </ul>
            </div>
         
            <!-- <div class="navbar-collapse" id="navbarSupportedContent"> -->
                
                <label for="dropdown-checkbox" class="dropdown">
                    <button class="dropdown-toggle">Admin <i class="fa-solid fa-caret-down"></i></button>
                    
                    <ul class="dropdown-menu">
                         <form action="../AdminLogout" method="post">
                            <li>
                               <button type="submit">Logout</button>
                           </li>
                          </form>
</ul>
                    
                </label>
                
            <!-- </div> -->
        </div>
    </nav>
</body>
</html>