<%@page import="com.experts.TransAssist.entities.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>TransAssist</title>

<!-- Fonts Online -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800,300' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

<!-- Style Sheet -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main-style.css">
<link rel="stylesheet" href="css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
<% if(session.getAttribute("curr_doc")!=null || session.getAttribute("curr_user")!=null){
	response.sendRedirect("/user-dashboard.jsp");
}
	%>
<div id="main-wrapper"> 

  
  <div class="box-shadow-for-ui">
    <div class="uou-block-2b">
      <div class="container"> <a href="#"><img style="width:50px; height:50px;" src="images/logo.png" alt=""></a> 
      <a href="#" ><img style="width:250px; height:50px;" src="images/logo2.png" alt=""></a> 
      <a href="#" class="mobile-sidebar-button mobile-sidebar-toggle"><span></span></a>
        <nav class="nav">
          <ul class="sf-menu">
            <li class="active"><a href="index.jsp"><i class="fa  fa-home"></i></a></li>
            <li> <a href="listing-filter.jsp">Get Support</a> </li>
            <li><a href="blog.html">Awareness Section</a></li>
            <li><a href="about_us.html">About Us</a></li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- end .uou-block-2b --> 
  </div>
  
  <!-- HOME PRO-->
  <div class="home-pro"> 
    
    <!-- PRO BANNER HEAD -->
    <div class="banr-head">
      <div class="container">
        <div class="row"> 
          
          <!-- CONTENT -->
          <div class="col-sm-7">
            <div class="text-area">
              <div class="position-center-center col-md-10">
                <h1> Here comes the social networking platform that you have been waiting for!</h1>
              </div>
            </div>
          </div>
          
          <!-- FORM SECTION -->
          <div class="col-sm-5">
            <div class="login-sec"> 
              
              <!-- TABS -->
              <div class="uou-tabs">
                
                
                <!-- REGISTER -->
                <!-- 
                <ul class="tabs">
                  <li><a href="#register">Register </a></li>
                  <li class="active"><a href="#log-in"> Login</a></li>
                </ul> -->
                
                <div class="content">
                  <div id="register">
                  
                    <form>
                      <input type="text" placeholder="Full Name">
                      <input type="email" placeholder="Email Address">
                      <input type="text" placeholder="Phone">
                      <input type="password" placeholder="Password">
                      <a href="reg_user.html">Register as User</a><br>
                       <a href="reg_docs.html">Register as Doctor</a>
                     </form>
                  </div>
                  
                  <!-- LOGIN -->
                  <div id="log-in" class="active"><br>
                  <font size="5" face="verdana" color="blue"><b><center>Login</center></b></font>
                    <form action="/loginController" method="post">
                      <input type="email" placeholder="Email Address" name="email">
                      <input type="password" placeholder="Password" name="password">
                      <button type="submit">Login</button> 
                      <div class="forget">Forgot your password? <a href="forgotpass.html">Click Here</a></div>
                      <div class="forget">New User?<br><a href="reg_user.jsp">Register as User</a><br><a href="reg_docs.jsp">Register as Doctor</a></div>
                    </form>
                  </div>
                  <div id="forget">
                    <form>
                      <input type="email" placeholder="Email Address">
                      <button type="submit">Login</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- SERVICES -->
    <section class="services"> 
      
      <!-- SERVICES ROW -->
      <ul class="row">
        
        <!-- SECTION -->
        <li class="col-md-4">
          <div class="ser-inn">
          <i class="fa fa-globe"></i>
            <h4>Stay in touch with your
              friends</h4>
            <i class="fa fa-globe big"></i>
          </div>
        </li>
        
        <!-- SECTION -->
        <li class="col-md-4">
          <div class="ser-inn">
            <i class="fa fa-book"></i>
            <h4>Chat within your community</h4>
            <i class="fa fa-book big"></i>
          </div>
        </li>
        
        <!-- SECTION  -->
        <li class="col-md-4">
          <div class="ser-inn">
          <i class="fa fa-picture-o"></i>
            <h4>Share what's up
              with you</h4>
            <i class="fa fa-picture-o big"></i>
          </div>
        </li>
      </ul>
    </section>
    
    <!-- PRO SECTION -->
    <section class="pro-content">
      <div class="container-fluid">
        <div class="row"> 
          
          <!-- PRO IMAGE -->
          <div class="col-md-6 pro-inside" style="background:url(images/pro-img-1.jpg) center center no-repeat;"></div>
          
          <!-- PRO CONTENT -->
          <div class="col-md-6 pro-inside">
            <div class="position-center-center col-md-6">
              <h1>Interact with
                Health Professionals</h1>
              <p> We have the best health professionals to offer psychological as well as medical assistance. </p>
            </div>
          </div>
        </div>
      </div>
      
      <!-- PRO SECTION -->
      <div class="container-fluid">
        <div class="row"> 
          
          <!-- PRO TEXT -->
          <div class="col-md-6 pro-inside">
            <div class="position-center-center col-md-6">
              <h1>Interact with other users</h1>
              <p> This is the world's largest online trans-community, according to leading news papers.  </p>
            </div>
          </div>
          
          <!-- PRO BACKGROUND -->
          <div class="col-md-6 pro-inside" style="background:url(images/pro-img-2.jpg) center center no-repeat;"></div>
        </div>
      </div>
    </section>
    
    
    <!-- TESTIMONIALS -->
         <section class="clients-says">
      <div class="container">
      <center><h3>Well!  It's time that you join us!</h3></center>
        <div class="testi">
          <div class="texti-slide"> 
            </div>
        </div>
      </div>
    </section>
    
  
      </div>
</div>

<!-- Footer -->
<div class="uou-block-4e">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<a href="#" class="logo"><img src="images/logo.png" alt=""></a>
					<ul class="contact-info has-bg-image contain"
						data-bg-image="images/footer-map-bg.png">
						<li><i class="fa fa-map-marker"></i>
							<address>MSIT, C-4, Janakpuri, New Delhi, India</address></li>
						<li><i class="fa fa-phone"></i> <a href="tel:#">091-8800506400</a></li>
						<li><i class="fa fa-envelope"></i> <a href="mailto:#">transgenderassist@gmail.com</a>
						</li>
					</ul>
				</div>
				<div class="col-md-4 col-sm-6">
					<h5>Photostream</h5>
					<ul class="photos-list">
						<li><img src="images/photostream4.jpg" alt=""></li>
						<li><img src="images/photostream6.jpg" alt=""></li>
						<li><img src="images/photostream3.jpg" alt=""></li>
						<li><img src="images/photostream2.jpg" alt=""></li>
						<li><img src="images/photostream1.jpg" alt=""></li>
						<li><img src="images/photostream.jpg" alt=""></li>
					</ul>
				</div>
				<div class="col-md-4 col-sm-6">
					<h5>Newsletter</h5>
					<p>Subscribe to our newsletter to receive our latest news and
						updates. We do not spam.</p>
					<form class="newsletter-form" action="#">
						<input type="email" placeholder="Enter your email address">
						<input type="submit" class="btn btn-primary" value="Subscribe">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end .uou-block-4e -->

	<div class="uou-block-4a secondary dark">
		<div class="container">
			<ul class="links">
				
				<li><a href="terms-and-conditions.html">Terms &amp; Conditions</a></li>
			</ul>
			<p>
				Copyright &copy; 2017 <a href="http://www.msit.in/">MSIT</a>. All
				Rights reserved.
			</p>
		</div>
	</div>
	<!-- end .uou-block-4a -->

<div class="uou-block-11a">
  <h5 class="title">Menu</h5>
  <a href="#" class="mobile-sidebar-close">&times;</a>
  <nav class="main-nav">
    <ul>
      <li class="active"><a href="index.jsp">Home</a></li>
            <li> <a href="listing-filter.jsp">Get Support</a> </li>
            <li><a href="blog.html">Awareness Section</a></li>
            <li><a href="about_us.html">About Us</a></li>
    </ul>
  </nav>
  <hr>
</div>

<!-- Scripts --> 
<script src="https://maps.googleapis.com/maps/api/js"></script> 
<script src="js/jquery-2.1.3.min.js"></script> 
<script src="js/bootstrap.js"></script> 
<script src="js/plugins/superfish.min.js"></script> 
<script src="js/jquery.ui.min.js"></script> 
<script src="js/plugins/rangeslider.min.js"></script> 
<script src="js/plugins/jquery.flexslider-min.js"></script> 
<script src="js/uou-accordions.js"></script> 
<script src="js/uou-tabs.js"></script> 
<script src="js/plugins/select2.min.js"></script> 
<script src="js/owl.carousel.min.js"></script> 
<script src="js/gmap3.min.js"></script> 
<script src="js/scripts.js"></script> 
<script>

</script>

</body>
</html>