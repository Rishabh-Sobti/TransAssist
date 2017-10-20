<%@page import="com.google.appengine.api.images.ServingUrlOptions"%>
<%@page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@page import="com.google.appengine.api.images.ImagesService"%>
<%@page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@page import="javax.print.DocFlavor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.experts.TransAssist.services.UserService"%>
<%@page import="com.experts.TransAssist.services.DoctorService"%>
<%@page import="java.util.List"%>
<%@page import="com.experts.TransAssist.entities.User"%>
<%@page import="com.experts.TransAssist.entities.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>TransAssist - Account Settings</title>

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
	<%
	Doctor d=new Doctor();
	User u=new User();
	List<String> frnd=new LinkedList<String>();
	List<String> frndP=new LinkedList<String>();
		int mode = 0;
		int i=0;
	List<User> userFrnd = new LinkedList<User>();
	List<Doctor> docFrnd = new LinkedList<Doctor>();
	List<User> userFrndP = new LinkedList<User>();
	List<Doctor> docFrndP = new LinkedList<Doctor>();
		 User us = new User(); 
		Doctor doc = new Doctor();
		if (((Integer)session.getAttribute("mode")).compareTo(new Integer(1))==0) {
			doc = (Doctor) session.getAttribute("curr_doc");
			
		} else if(((Integer)session.getAttribute("mode")).compareTo(new Integer(0))==0) {
				us = (User) session.getAttribute("curr_user");
				mode = 1;
				
			}
		

BlobKey bk;
if(mode==0){
	bk=new BlobKey(doc.profilePic);
}
else{
	bk=new BlobKey(us.profilePic);
}

  ImagesService imagesService = ImagesServiceFactory.getImagesService();
  ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
  String servingUrl = imagesService.getServingUrl(servingOptions);
%>
<div id="main-wrapper"> 
  
  
  <div class="box-shadow-for-ui">
    <div class="uou-block-2b">
  <div class="container"> <a href="/index.jsp"><img style="width:50px; height:50px;" src="images/logo.png" alt=""></a> 
      <a href="/index.jsp" ><img style="width:250px; height:50px;" src="images/logo2.png" alt=""></a> <a href="#" class="mobile-sidebar-button mobile-sidebar-toggle"><span></span></a>
					<nav class="nav">
          <ul class="sf-menu">
            <li> <a href="listing-filter2.jsp">Get support</a> </li>
                          
                <li class="active"><a href="user-dashboard.jsp"> Dashboard </a></li>
            <li> <a href="SearchUser.jsp">Search User</a></li>
            <li><a href="blog2.html">Awareness Section</a></li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- end .uou-block-2b --> 
  </div>
  <!-- end .uou-block-2b --> 
  
  <!-- SUB Banner -->
  <div class="profile-bnr sub-bnr user-profile-bnr">
    <div class="position-center-center">
      <div class="container">
        <h2>User Dashboard</h2>
      </div>
    </div>
  </div>
  
  <!-- Compny Profile -->
  <div class="compny-profile"> 
    
    <!-- Profile Company Content -->
    <div class="profile-company-content" data-bg-color="fff">
      <div class="container">
        <div class="row"> 
          
          <!-- SIDE BAR -->
          <div class="col-md-4"> 
            <!-- Company Information -->
            <div class="sidebar">
              <a href="/my-profile.jsp"><h5 class="main-title"><%
										if (mode == 0)
											out.println(doc.name);
										else
											out.println(us.name);
									%></h5>
              <div class="sidebar-thumbnail"> <img src="<%=servingUrl%>" alt=""> </div></a>
              <div class="sidebar-information">
                <div class="profile-usermenu">
                  <ul class="nav nav-links">
                    <li> <a href="/user-dashboard.jsp#ggg"> <i class="fa fa-heart-o"></i> Network </a> </li>
                    <li> <a href="/user-dashboard(post).jsp#ggg"> <i class="fa fa-group"></i> Post </a> </li>
                    <li> <a href="/account.jsp#ggg"> <i class="fa fa-plus-circle"></i> Messages </a> </li>
                    <li class="active"> <a href="/user-dashboard(acc).jsp#ggg"> <i class="fa fa-cog"></i> Account Settings </a> </li>
                    <li> <a href="/signOut"> <i class="fa fa-sign-out"></i> Sign out </a> </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Tab Content -->
          <div class="col-md-8">
            <div class="network" id="ggg">
              <h4>Account Settings</h4>
              
              <div class="tab-content"> 
                
                <!-- Connections -->
                <div id="connec" class="tab-pane fade in active">
                  <div class="net-work-in"> 
                    
                    
                    
                    <!-- Members -->
                    <div class="main-mem"> 
                    <div class="profile-in">
											
											<form action="/accSetting" method="post">
												<br>
												<h5>Enter your password to proceed:  </h5><input type="password" name="pass">
												<br>
												<button type="submit" class="btn btn-primary">Confirm</button>
											</form>
										</div>
                     </div>
                  </div>
                </div>
               </div>
            </div>
          </div>
		  
        </div>
      </div>
    </div>
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
				
				<li><a href="terms-and-conditions2.html">Terms &amp; Conditions</a></li>
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
      <li><a href="listing-filter2.jsp">Get support</a></li>

						<li class="active"><a href="user-dashboard.jsp">
								Dashboard </a></li>
						<li><a href="SearchUser.jsp">Search User</a></li>
						<li><a href="blog2.html">Awareness Section</a></li>
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
</body>
</html>