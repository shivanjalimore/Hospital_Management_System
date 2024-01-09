<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@include file="/navbar.jsp"%>

      <style>
    .container {
    margin: auto;
    width: 30%;
    margin-top: 20px;
}

.paint-card {
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

.paint-card p {
    margin-bottom: 10px;
}

.paint-card .card-body {
    padding: 20px;
}

.paint-card label {
    font-weight: bold;
}

.paint-card input {
    width: 100%;
    padding: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.paint-card button {
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #28a745;
    color: #fff;
    font-weight: bold;
}

.paint-card button:hover {
    background-color: #218838;
}

.title
{
    font-size:24px;
    font-weight: bolder;
    align-items: center;
}
    </style>

    <div class="container p-4">
        <div class="row">
           
                <div class="card paint-card">
                    <p class="title">Change Password</p>
                      <% 
        // Check for errorMsg and display if not empty
        if (session.getAttribute("errorMsg") != null && !session.getAttribute("errorMsg").toString().isEmpty()) {
    %>
            <p class="error-message" style="color:red;font-size:18px;">
                <%= session.getAttribute("errorMsg") %>
            </p>
            <% session.removeAttribute("errorMsg"); %>
    <% 
        }
    %>

    <% 
        // Check for succMsg and display if not empty
        if (session.getAttribute("succMsg") != null && !session.getAttribute("succMsg").toString().isEmpty()) {
    %>
            <p class="success-message" style="color:green;font-size:18px;">
                <%= session.getAttribute("succMsg") %>
            </p>
            <% session.removeAttribute("succMsg"); %>
    <% 
        }
    %>
                    <div class="card-body">
                        <form action="ChangePassword" method="post">
                            <div class="mb-3">
                                <label for="newPassword">Enter New Password</label>
                                <input type="password" id="newPassword" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="oldPassword">Enter Old Password</label>
                                <input type="password" id="oldPassword" class="form-control" required>
                            </div>
                            <input type="hidden" id="uid" value="${userObj.id}" name="uid">
                            <button type="submit" id="changePasswordBtn" class="btn btn-success col-md-12">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
    </div>
    

</body>
</html>