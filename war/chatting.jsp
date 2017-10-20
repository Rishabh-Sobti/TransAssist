<%@page import="com.experts.TransAssist.dao.UserDao"%>
<%@page import="com.experts.TransAssist.dao.DoctorDao"%>
<%@page import="com.experts.TransAssist.services.UserService"%>
<%@page import="com.experts.TransAssist.services.DoctorService"%>
<%@page import="com.google.appengine.api.images.ServingUrlOptions"%>
<%@page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@page import="com.google.appengine.api.images.ImagesService"%>
<%@page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@page import="java.util.LinkedList"%>
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
<title>TransAssist - Chat</title>

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
		Doctor d = new Doctor();
		User u = new User();
		int check=0;
		List<String> frnd = new LinkedList<String>();
		int mode = 0;
		int i = 0;
		List<User> userFrnd = new LinkedList<User>();
		List<Doctor> docFrnd = new LinkedList<Doctor>();
		User us = new User();
		Doctor doc = new Doctor();
		if (((Integer) session.getAttribute("mode")).compareTo(new Integer(1)) == 0) {
			doc = (Doctor) session.getAttribute("curr_doc");

		} else if (((Integer) session.getAttribute("mode")).compareTo(new Integer(0)) == 0) {
			us = (User) session.getAttribute("curr_user");
			mode = 1;

		}

		BlobKey bk;
		if (mode == 0) {
			bk = new BlobKey(doc.profilePic);
		} else {
			bk = new BlobKey(us.profilePic);
		}

		ImagesService imagesService = ImagesServiceFactory.getImagesService();
		ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk);
		String servingUrl = imagesService.getServingUrl(servingOptions);

		if (mode == 0) {
			frnd = doc.friends;
		} else {
			frnd = us.friends;
		}
		userFrnd = new LinkedList<User>();
		docFrnd = new LinkedList<Doctor>();
		for (i = 0; i < frnd.size(); i++) {
			d = (new DoctorService()).checkCredentials(frnd.get(i));
			if (d != null)
				docFrnd.add(d);
			if (d == null) {
				u = (new UserService()).checkCredentials(frnd.get(i));
				if (u != null)
					userFrnd.add(u);
			}
		}
		int l=0,m=0;
		if(request.getParameter("m").equals("null")){
			l=Integer.parseInt(request.getParameter("l"));
		}
		else{
			m=Integer.parseInt(request.getParameter("m"));
		}
	%>

			<div class="box-shadow-for-ui">
			<div class="uou-block-2b">
				<div class="container">
					<a href="/index.jsp"><img style="width:50px; height:50px;" src="images/logo.png" alt=""></a>
      <a href="/index.jsp" ><img style="width:250px; height:50px;" src="images/logo2.png" alt=""></a> 
					
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
						<h2>Chat Portal</h2>
					</div>

				
				</div>
</div>
	<%
															if (mode == 0) {
																
														%>
<div class="show" id="myModal<%=doc.myChats.get(l).with%>" tabindex="-1"
															role="dialog">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<div class="container">
																		<h6>
																			Send Message
																		</h6>

																		<!-- Forms -->
																		<form action="/chat">
																			<ul class="row">
																			 
																				<li class="col-xs-12"><textarea style="height: 500px"
																						readonly="readonly">
										<%
										out.println("");
											for (int q = 0; q < doc.myChats.get(l).chat.size(); q++) {
														out.println(doc.myChats.get(l).chat.get(q).msg);
													}
										%>
											</textarea></li>
																				<li><input type="hidden" name="with"
																					value="<%=doc.myChats.get(l).with%>">
																				<li class="col-xs-12"><textarea rows="1"
																						placeholder="Your Message" name="message"></textarea></li>
																				<li class="col-xs-12">
																					<button type="submit" class="btn btn-primary">Send
																						message</button><br><br>
																				</li>
																			</ul>
																		</form>
																	</div>
																</div>
															</div>
</div>
<%
															}
															

															else {
																
														%>
<div class="show" id="myModal<%=us.myChats.get(m).with%>">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<div class="container">
																		<h6>
																			
																			Send Message
																		</h6>

																		<!-- Forms -->
																		<form action="/chat">
																			
																				<div class="col-xs-12"><textarea style="height: 500px"
																						readonly="readonly">
												<%
												 out.println("");
													for (int q = 0; q < us.myChats.get(m).chat.size(); q++) {
																out.println(us.myChats.get(m).chat.get(q).msg);
															}
												%>
													</textarea></div>
																				<div><input type="hidden" name="with"
																					value="<%=us.myChats.get(m).with%>"></div>
																				<div class="col-xs-12"><textarea rows="1"
																						placeholder="Your Message" name="message"></textarea></div>
																				<div class="col-xs-12">
																					<button type="submit" class="btn btn-primary">Send
																						message</button><br><br>
																				</div>
																		</form>
																	</div>
																</div>
															</div>
														</div>
														<% } %>

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
</body>
</html>