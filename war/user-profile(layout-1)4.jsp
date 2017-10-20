<!-- Doctor who is NOT a friend -->

<%@page import="java.util.List"%>
<%@page import="com.experts.TransAssist.services.UserService"%>
<%@page import="com.experts.TransAssist.services.DoctorService"%>
<%@page import="com.experts.TransAssist.entities.Doctor"%>
<%@page import="com.experts.TransAssist.entities.User"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.google.appengine.api.images.ServingUrlOptions"%>
<%@page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@page import="com.google.appengine.api.images.ImagesService"%>
<%@page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>TransAssist - Doctor's Profile</title>

<!-- Fonts Online -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800,300'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

<!-- Style Sheet -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
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
		int mode = 0;
		int i=0;
	List<User> userFrnd = new LinkedList<User>();
	List<Doctor> docFrnd = new LinkedList<Doctor>();
		 User us = new User(); 
		Doctor doc = new Doctor();
		if(session.getAttribute("DocToOpen")==null){
		doc=new DoctorService().checkCredentials(request.getParameter("docId"));
		session.setAttribute("DocToOpen", doc);
		}
		else{
			doc=(Doctor)session.getAttribute("DocToOpen");
		}

BlobKey bk;
	bk=new BlobKey(doc.profilePic);


  ImagesService imagesService = ImagesServiceFactory.getImagesService();
  ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
  String servingUrl = imagesService.getServingUrl(servingOptions);

			frnd = doc.friends;
		userFrnd = new LinkedList<User>();
		docFrnd = new LinkedList<Doctor>();
		for (i = 0; i < frnd.size(); i++) {
			d = (new DoctorService()).checkCredentials(frnd.get(i));
			if(d!=null)
				docFrnd.add(d);
			if (d == null) {
				u = (new UserService()).checkCredentials(frnd.get(i));
				if(u!=null)
					userFrnd.add(u);
			}
		}
  %>
	<div id="main-wrapper">

			<div class="box-shadow-for-ui">
			<div class="uou-block-2b">
				<div class="container">
					<a href="/index.jsp"><img style="width:50px; height:50px;" src="images/logo.png" alt=""></a> 
      <a href="/index.jsp" ><img style="width:250px; height:50px;" src="images/logo2.png" alt=""></a> <a href="#" class="mobile-sidebar-button mobile-sidebar-toggle"><span></span></a>
					<nav class="nav">
						<ul class="sf-menu">
            <li class="active"> <a href="listing-filter2.jsp">Get support</a> </li>
                          
                <li><a href="user-dashboard.jsp"> Dashboard </a></li>
            <li> <a href="SearchUser.jsp">Search User</a></li>
            <li><a href="blog2.html">Awareness Section</a></li>
          </ul>
					</nav>
				</div>
			</div>
			<!-- end .uou-block-2b -->
		</div>
		<!-- end .uou-block-2b -->

		<div class="compny-profile">
			<!-- SUB Banner -->
			<div class="profile-bnr user-profile-bnr">
				<div class="container">
					<div class="pull-left">
						<h2><%= doc.name %></h2>
						<h5><%= doc.specialisation %></h5>
					</div>
<div class="right-top-bnr">
          <div class="connect"> <a href="/sendReq?userId=null&docId=<%=doc.emailId%>"><i class="fa fa-user-plus"></i>Send/Accept Request</a> 
            </div>
          </div>
        </div>

				</div>

				<!-- Modal POPUP -->
							</div>

			<!-- Profile Company Content -->
			<div class="profile-company-content user-profile main-user"
				data-bg-color="f5f5f5">
				<div class="container">
					<div class="row">

						<!-- Nav Tabs -->
						<div class="col-md-12">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
								<li><a data-toggle="tab" href="#jobs">Jobs</a></li>
								<li><a data-toggle="tab" href="#contact">Contact</a></li>
							</ul>
						</div>

						<!-- Tab Content -->
						<div class="col-md-12">
							<div class="tab-content">

								<!-- PROFILE -->
								<div id="profile" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<div class="profile-main">
												<h3>About</h3>
												<div class="profile-in">
													<div class="media-left">
														<div class="img-profile">
															<img class="media-object" src="<%=servingUrl%>"
																alt="">
														</div>
													</div>
													<div class="media-body">
														<p><%=doc.aboutMe %></p>
													</div>
												</div>
											</div>
										</div>
										
										
										<div class="col-md-8">

											<!-- Skills -->
											<div class="sidebar">
												<h5 class="main-title">Skills</h5>
												<div class="job-skills">

													<!-- Logo Design -->
													<ul class="row">
														<li class="col-sm-4">
															<h6>
																<i class="fa fa-plus"></i> Medical Expertise
															</h6>
														</li>
														<li class="col-sm-8">
															<div class="progress">
																<div class="progress-bar" role="progressbar"
																	aria-valuenow="60" aria-valuemin="0"
																	aria-valuemax="100" style="width: <%= (doc.rate[1]+doc.rate[2])*10 %>;"></div>
															</div>
														</li>
													</ul>

													<!-- Logo Design -->
													<ul class="row">
														<li class="col-sm-4">
															<h6>
																<i class="fa fa-plus"></i> Counselling
															</h6>
														</li>
														<li class="col-sm-8">
															<div class="progress">
																<div class="progress-bar" role="progressbar"
																	aria-valuenow="60" aria-valuemin="0"
																	aria-valuemax="100" style="width: <%= (doc.rate[3]+doc.rate[4])*10 %>;"></div>
															</div>
														</li>
													</ul>

													<!-- Logo Design -->
													<ul class="row">
														<li class="col-sm-4">
															<h6>
																<i class="fa fa-plus"></i> Experience
															</h6>
														</li>
														<li class="col-sm-8">
															<div class="progress">
																<div class="progress-bar" role="progressbar"
																	aria-valuenow="60" aria-valuemin="0"
																	aria-valuemax="100" style="width: <%= doc.rate[5]*20 %>;"></div>
															</div>
														</li>
													</ul>

												</div>
											</div>

											<!-- Professional Details -->
											<div class="sidebar">
												<h5 class="main-title">Patient's Reviews</h5>
											
												<!-- Similar -->
												<div class="similar">
												<% for(int r=doc.review.size()-1; r>-1; r--){ %>
													<div class="media">
														<div class="media-left">
															<div class="inn-simi">
																<img class="media-object" src="<%= ImagesServiceFactory.getImagesService().getServingUrl(ServingUrlOptions.Builder.withBlobKey(new BlobKey(doc.review.get(r).u.profilePic))) %>"
																	alt=""> 
															</div>
														</div>
														<div class="media-body">
															<h5><%= doc.review.get(r).u.name %></h5>
															<br>
															<p><%= doc.review.get(r).comment %></p>

															
														</div>
													</div>
													<%} %>

												</div>
											</div>
										</div>

										<!-- Col -->
										<div class="col-md-4">

											<!-- Professional Details -->
											<div class="sidebar">
												<h5 class="main-title">Professional Details</h5>
												<div class="sidebar-information">
													<ul class="single-category">
														<li class="row">
															<h6 class="title col-xs-6">Name</h6> <span
															class="subtitle col-xs-6"><%= doc.name %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Date Of Birth</h6> <span
															class="subtitle col-xs-6"><%= doc.birthDate %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Location</h6> <span
															class="subtitle col-xs-6"><%= doc.hospCity %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Experience</h6> <span
															class="subtitle col-xs-6"><%= doc.experience %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Degree</h6> <span
															class="subtitle col-xs-6"><%= doc.degree %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Website</h6> <span
															class="subtitle col-xs-6"><a href="<%= doc.website %>"><%= doc.website %>
															</a></span>
														</li>
													</ul>
												</div>
											</div>

											<!-- Rating -->
											<div class="sidebar">
												<h5 class="main-title">Rating</h5>
												<div class="sidebar-information">
													<ul class="single-category com-rate">
														<li class="row">
															<h6 class="title col-xs-6">Expertise:</h6> <span
															class="col-xs-6">
															<% for(int r=0; r<doc.rate[1]; r++){ %>
															<i class="fa fa-star"></i> <%} for(int r=doc.rate[1]; r<5; r++){%> <i
																class="fa fa-star-o"></i> <%} %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Knowledge:</h6> <span
															class="col-xs-6"><% for(int r=0; r<doc.rate[2]; r++){ %>
															<i class="fa fa-star"></i> <%} for(int r=doc.rate[2]; r<5; r++){%> <i
																class="fa fa-star-o"></i> <%} %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Behaviour:</h6> <span
															class="col-xs-6"><% for(int r=0; r<doc.rate[3]; r++){ %>
															<i class="fa fa-star"></i> <%} for(int r=doc.rate[3]; r<5; r++){%> <i
																class="fa fa-star-o"></i> <%} %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Price:</h6> <span
															class="col-xs-6"><% for(int r=0; r<doc.rate[4]; r++){ %>
															<i class="fa fa-star"></i> <%} for(int r=doc.rate[4]; r<5; r++){%> <i
																class="fa fa-star-o"></i> <%} %></span>
														</li>
														<li class="row">
															<h6 class="title col-xs-6">Services:</h6> <span
															class="col-xs-6"><% for(int r=0; r<doc.rate[5]; r++){ %>
															<i class="fa fa-star"></i> <%} for(int r=doc.rate[5]; r<5; r++){%> <i
																class="fa fa-star-o"></i> <%} %></span>
														</li>
													</ul>
												</div>
											</div>

																					</div>
									</div>
								</div>

								<!-- Jobs -->
								<div id="jobs" class="tab-pane fade">

									<div class="listing listing-1">
										<div class="listing-section">
											<div class="listing-ver-3">
												<div class="listing-heading">
													<h5><%= doc.role %></h5>
												</div>
												<div class="listing-inner">
													<div class="listing-content">
														<h6 class="title-company"><%= doc.hospitalName %></h6>
														<span class="location"> <i class="fa fa-map-marker"></i>
															<%=doc.hospCity %>, <%=doc.hospState %>, <%=doc.hospPinCode %>
														</span> <span class="type-work full-time"> Full Time </span>
														<p>
															<%= doc.roleDescription %> 
														</p>
														<br>
													</div>
												</div>
												<div class="listing-tabs">
													<ul>
														<li><a href="#"><i class="fa fa-envelope"></i>
																<%= doc.emailId %></a></li>
														<li><a href="#"><i class="fa fa-phone"></i><%= doc.mobileNo %></a></li>
														<li><a href="#"><i class="fa fa-globe"></i><%= doc.website %></a></li>
														<li class="share-button"><a href="#"><i
																class="fa fa-share"></i><%= doc.specialisation %></a>
															</li>
													</ul>
												</div>
											</div>
																					</div>
									</div>
								</div>

								<!-- Contact -->
								<div id="contact" class="tab-pane fade">
									<div class="profile-main">
										<h3>Contact the Doctor</h3>
										<div class="profile-in">
											<p>Tell me your concerns and I will revert back to you as
												soon as practically possible.</p>
											<form action="/chatNew">
												<textarea name="message" placeholder="Your Message"></textarea>
												<input type="hidden" value="<%=doc.emailId%>" name="docId">
												<button type="submit" class="btn btn-primary">Send message</button>
											</form>
										</div>
									</div>
								</div>
<div id="portfolio" class="tab-pane fade">
                <div class="profile-main">
                  <h3>Photos</h3>
                  <div class="profile-in">
                    <div class="uou-portfolio"> 
                      <!-- Portfolio Item -->
                      <section class="portfolio">
                        <div class="portfolio-filters-content"> 
                          <!-- Portfolio Item -->
                          <% 
                           for(int l=(doc.photos.size()-1); l>-1; l--){ %>
                        	  <article class="development design"> <a href="<%= ImagesServiceFactory.getImagesService().getServingUrl(ServingUrlOptions.Builder.withBlobKey(new BlobKey(doc.photos.get(l).photoId))) %>" class="swipebox"> <img src="<%= ImagesServiceFactory.getImagesService().getServingUrl(ServingUrlOptions.Builder.withBlobKey(new BlobKey(doc.photos.get(l).photoId))) %>" alt="" class="work img-responsive"> <span class="overlay"> <i class="fa fa-plus"></i> <b class="title"><%= doc.photos.get(l).caption%></b> </span> </a> </article>
                         <% }%>
                          </div>
                      </section>
                    </div>
                    <!-- end uou-portfolio --> 
                  </div>
                </div>
              </div>
								<!-- Blog Post -->
								<div id="blog-tab" class="tab-pane fade">
									<div class="profile-main">
										<h3>Blog Post</h3>
										<div class="profile-in">
											<div class="row">
												<div class="col-md-12">
													<%  
                           for(int l=(doc.posts.size()-1); l>-1; l--){ %>
                        <article class="uou-block-7f"> <img src="<%= ImagesServiceFactory.getImagesService().getServingUrl(ServingUrlOptions.Builder.withBlobKey(new BlobKey(doc.posts.get(l).photoId))) %>" alt="" class="thumb">
                          <div class="meta">  </div>
                          <h1><a href="#"><%= doc.posts.get(l).subject %></a></h1>
                          <p><%= doc.posts.get(l).body %></p>
                           </article>
                            <% }%>
												</div>
											</div>
											<!-- end row -->

											<!-- end blog-content -->

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
      <li class="active"><a href="listing-filter2.jsp">Get support</a></li>

						<li><a href="user-dashboard.jsp">
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
	<script>
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
	<% session.removeAttribute("DocToOpen"); %>
</body>
</html>