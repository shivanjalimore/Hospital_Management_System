
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Home</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
   
</head>
<body>
<%@include file="/navbar.jsp"%>

<div class="slideshow-container">
    
    <div class="mySlides fade">
      <div class="numbertext">1 / 3</div>
      <img src="img\background_img.jpg" style="width:100%">
     
    </div>
    
    <div class="mySlides fade">
      <div class="numbertext">2 / 3</div>
      <img src="img\back1.jpg" style="width:100%">
      
    </div>
    
    <div class="mySlides fade">
      <div class="numbertext">3 / 3</div>
      <img src="img\back2.jpg" style="width:100%">
      
    </div>
	    <div class="dot-container">
	      <span class="dot"></span> 
	      <span class="dot"></span> 
	      <span class="dot"></span> 
	    </div>
    </div>
    
     <div class="container-3">
        <div class="section-3">
            <h2>Key Features of our Hospital</h2>
            <div class="sec-1">
            <div class="blocks">
                <div class="inner-section">
                    <div class="row-3">
                        <div class="col-3">
                            <div class="card-body">
                                <p class="fs-5">100% Safety</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, inventore</p>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card-body">
                                <p class="fs-5">Clean Environment</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, inventore</p>
                            </div>
                        </div>
                    </div>
                    <div class="row-3">
                        <div class="col-3" >
                            <div class="card-body">
                                <p class="fs-5">Friendly Doctors</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, inventore</p>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card-body">
                                <p class="fs-5">Medical Research</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, inventore</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="img-3">
                <img src="img\doctor1.jpg">
            </div>
        </div>
        </div>
       </div>
       
       <div class="container p-2">
    <p class="text-center fs-2">Our Team</p>
    
    <div class="row">
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body-4">
                    <img src="img\doctor2.jpg"  alt="Doctor Image">
                    <p class="fw-bold fs-5">Samuani Simi</p>
                    <p class="fs-7">(CEO & Chairman)</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body-4">
                    <img src="img\doctor3.jpg" >
                    <p class="fw-bold fs-5">Dr. Siva Kumar</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body-4">
                    <img src="img\doctor4.jpg"  alt="Doctor Image">
                    <p class="fw-bold fs-5">Dr. Niuise Paule</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body-4">
                    <img src="img\doctor1.jpg"  alt="Doctor Image">
                    <p class="fw-bold fs-5">Dr. Mathue Samuel</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
    </div>
</div>
       
    
  
    
     <%@include file="/footer.jsp"%> 
    <script src="slider.js"></script>
</body>
</html>