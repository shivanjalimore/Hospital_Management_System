<%@page import="com.Beans.*" %>
<%@page import="com.DAO.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Doctor</title>
<link rel="stylesheet" href="doctor.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
  #editContent {
    display: none;
  }
</style>
</head>
<body>
<%@include file="admin_navbar.jsp"%>
 <div class="containeradmin">
       
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Add Doctor</p>
                        <!-- Your error and success messages here -->
                        <form action="../AddDoctor" method="post">
                            <div class="form-group">
                                <label class="form-label" for="fullname">Full Name</label>
                                <input type="text" required name="fullname" id="fullname" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="dob">DOB</label>
                                <input type="date" required name="dob" id="dob" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="qualification">Qualification</label>
                                <input type="text" required name="qualification" id="qualification" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="spec">Specialist</label>
                                <select name="spec" required id="spec" class="form-control">
                                    <option>--select--</option>
                                    
                                    <%
									SpecialistInsert dao = new SpecialistInsert();
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
                                    
                                    
                                    <!-- Your options from database -->
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="email">Email</label>
                                <input type="text" required name="email" id="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="mobno">Mob No</label>
                                <input type="text" required name="mobno" id="mobno" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="password">Password</label>
                                <input type="password" required name="password" id="password" class="form-control">
                            </div>
                            <button type="submit" class="btn-primary">ADD</button>
                        </form>
                    </div>
                    
                    <div class="card-body-1">
                      <p class="heading"> Doctor Details</p>
                      <table class="table">
                         <thead>
                         <tr>
                           <th class="col">Id</th>
                           <th class="col">Full Name</th>
                           <th class="col">DOB</th>
                           <th class="col">Qualification</th>
                           <th class="col">Specialist</th>
                           <th class="col">Email</th>
                           <th class="col">Mob No</th>
                           <th class="col">Password</th>
                           <th class="col">Action</th>
                         </tr>
                         </thead>
                         <tbody>
        
        <% DoctorInsert DI = new DoctorInsert();
           List<Doctor> list2 = DI.getAllDoctor();
           for(Doctor d :list2)
           {
        %>
        
              <tr>
                <td><%=d.getId() %></td>
                <td><%=d.getFullName() %></td>
                <td><%=d.getDob() %></td>
                <td><%=d.getQualification() %></td>
                <td><%=d.getSpecialist() %></td>
                <td><%=d.getEmail() %></td>
                <td><%=d.getMobNo() %></td>
                <td><%=d.getPassword() %></td>
                <td>
                
                <form action="../EditDoctor" method="post">
                <input type="hidden" name="id" value="<%=d.getId() %>">
               <button type="submit" class="edit-btn" style="background-color:blue;padding:8px;color:white onclick="togglePages()">Edit</button>
              </form>
              <form action="../DeleteDoctor" method="post" >
                <input type="hidden" name="id" value="<%=d.getId() %>">
                <button type="submit" class="delete-btn" style="background-color:red;padding:8px;color:white">Delete</button>
              </form>
                    
                </td>
            </tr>
           <%
           }
           %>
        </tbody>
                      </table>
                    </div>
                </div>
                
                
                <%
   Doctor existingDoctor = (Doctor) request.getAttribute("existingDoctor");
   %>
            
             <div id="editContent">
        <div class="container">
            <h1> Edit Doctor Information</h1>
            <form id="registrationForm" action="Updatedoctor" method="post">
               
               <input type="hidden" id="id" name="id" value="<%= existingDoctor != null ? existingDoctor.getId() : "" %>">
       <div class="form-group">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" value="<%= existingDoctor != null ? existingDoctor.getFullName() : "" %>">
      </div>
      <div class="form-group">
        <label for="dob">DOB:</label>
        <input type="date" id="dob" name="dob" value="<%= existingDoctor != null ? existingDoctor.getDob() : "" %>">
      </div>
      <div class="form-group">
        <label for="name">Qualification:</label>
        <input type="text" id="qualification" name="qualification" value="<%= existingDoctor != null ? existingDoctor.getQualification() : "" %>">
      </div>
      
      <div class="form-group">
                                <label class="form-label" for="spec">Specialist</label>
                                <select name="spec" id="spec" class="form-control" value="<%= existingDoctor != null ? existingDoctor.getSpecialist() : "" %>">
                                    <option>--select--</option>
                                    
                                    <%
									SpecialistInsert dao1 = new SpecialistInsert();
									List<Specialist> list1 = dao1.getAllSpecialist();
									for (Specialist s : list1) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>
                                    
                                    
                                    <!-- Your options from database -->
                                </select>
                            </div>
                            
      <div class="form-group">
        <label for="email">Email ID:</label>
        <input type="email" id="email" name="email" value="<%= existingDoctor != null ? existingDoctor.getEmail() : "" %>">
      </div>
      <div class="form-group">
      <label class="form-label" for="mobno">Mob No</label>
      <input type="text"  name="mobno" id="mobno" class="form-control" value="<%= existingDoctor != null ? existingDoctor.getMobNo(): "" %>">
      </div>
                            
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="<%= existingDoctor != null ? existingDoctor.getPassword() : "" %>">
      </div>
      <button type="submit" style="background-color:blue;">Edit</button>

                <button type="submit" style="background-color: blue;">Edit</button>
            </form>
        </div>
    </div> 
            
            
           
    </div>
    
    <script>
function togglePages() {
    var initialContent = document.querySelector(".card.paint-card");
    var editContent = document.getElementById("editContent");

    // Toggle visibility
    if (initialContent.style.display !== "none") {
        initialContent.style.display = "none";
        editContent.style.display = "block"; // Show the edit content
    } else {
        initialContent.style.display = "block"; // Show the initial content
        editContent.style.display = "none";
    }
}
</script>

</body>
</html>