<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> user Registration</title>
    <link rel="stylesheet" href="signup.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>
<%@include file="/navbar.jsp"%>
 <div class="container p-5">
        <div class="row">
            <div class="col-custom">
                <div class="card paint-card">
                    <div class="card-body">

                        
                            <span id="success" style="color: green; font-size:18px;"></span>
                      

                        <p class="fs-4 text-center">User Register</p>
    
                        <form action="UserInsertController" method="post">
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full Name</label>
                                <input required name="fullname" id="fullname" type="text" class="form-control">
                                <span id="fullname-error"  style="color: red;"> </span>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email address</label>
                                <input required name="email" id="email" type="email" class="form-control">
                                <span id="emailID-error"  style="color: red;"> </span>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input required name="password" id="password" type="password" class="form-control">
                                <span id="password-error"  style="color: red;"> </span>
                            </div>
                            <button type="submit" onclick="submitform()" class="btn bg-success">Register</button>
                        </form>

                        <div id="login" style="height: 15px;display: none;text-align: center;">
                        <a href="user_login.jsp" 
                        style="text-decoration: none; "> Log In </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Uservalidations.js"></script>

</body>
</html>