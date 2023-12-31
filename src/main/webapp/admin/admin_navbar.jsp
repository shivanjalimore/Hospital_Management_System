<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Navbar</title>
   
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
    float: inline-end;
    margin-right: 20px;
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




/* ---------------------------------------------------------------------------------- */
/* Dropdown styles */
.dropdown {
    position: relative;
    display: inline-block;
    margin-right: 50px;
}

.dropdown-toggle{
    padding: 5px;
}

.dropdown ul {
    display: none;
    position: absolute;
    background-color: #a9f59e;
    padding: 5px 0;
    z-index: 1;
    min-width: 100px;
    list-style: none;
   
}

.dropdown ul li {
    padding: 5px 15px;
    margin-left: 5px;
}
.dropdown ul li a{
    text-decoration: none;
    color: black;
}

.dropdown:hover ul {
    display: block;
}
</style>
      <nav class="navbar">
        <div class="container-nav" >
            <div class="navbar-collapse">
                <a class="navbar-brand" href="../index.jsp">
                    <i class="fas fa-clinic-medical"></i> MEDI HOME</a>
                    <ul class="navbar-nav" >
                        <li class="nav-item"><a class="nav-link active" href="adminindex.jsp">HOME</a></li>
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