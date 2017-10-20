<%@page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@page import="com.experts.TransAssist.entities.Doctor"%>
<%@page import="com.experts.TransAssist.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
  <title>TransAssist - Account Settings</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="css/reg-style.css">

  
</head>

<body>
  <!-- multistep form -->

<%
User us = new User(); 
int mode=0;
Doctor doc = new Doctor();
if (((Integer)session.getAttribute("mode")).compareTo(new Integer(1))==0) {
	doc = (Doctor) session.getAttribute("curr_doc");
	
} else if(((Integer)session.getAttribute("mode")).compareTo(new Integer(0))==0) {
		us = (User) session.getAttribute("curr_user");
		mode = 1;
		
	}
BlobstoreService blobstoreService = BlobstoreServiceFactory
	.getBlobstoreService();
%>


<form id="msform" action="<%= blobstoreService.createUploadUrl("/userAccSett") %>" method="post" enctype="multipart/form-data">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">Personal Details</li>
        <li>Social Profiles</li>
        <li>About User</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Personal Details</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="name" placeholder="Full Name" value="<%= us.name%>" />
    <input type="text" name="bday" placeholder="DOB(yyyy-mm-dd)" value="<%=us.birthDate %>"/>
    <input type="text" name="loc" placeholder="Location" value="<%= us.location%>"/>
     <select style = "width:260px; height:50px; "  name="gender">
    <option value="Gender">   Gender    </option>
    
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option> </select> 
    <br> <br> 
    
   <input type="text" name="employ" placeholder="Employment Status " value="<%= us.employStatus%>"/>
    <input type="text" name="Contact" placeholder="Phone" value="<%= us.phone%>"/>
    <input type="text" name="Email" placeholder="Email Id"  value="<%= us.email%>"/>
    <input type="password" name="password" placeholder="Password" value="<%= us.password%>"/>
   <input type="password" name="rePassword" placeholder="Re-Enter Password" value="<%= us.password%>"/>
    <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
  
    <fieldset>
    <h2 class="fs-title">Social Profiles</h2>
    <h3 class="fs-subtitle">Your presence on the social network</h3>
    <input type="text" name="twitter" placeholder="Twitter" value="<%= us.twitter%>"/>
    <input type="text" name="facebook" placeholder="Facebook" value="<%= us.facebook%>"/>
    <input type="text" name="gplus" placeholder="Google Plus" value="<%= us.googlePlus%>"/>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  <fieldset>
    <h2 class="fs-title">About User</h2>
    <textarea name="aboutme" placeholder="Tell us something about you!" value="<%= us.aboutMe%>"></textarea>
    <textarea name="hobbies" placeholder="Hobbies and Interests" value="<%= us.hobbies%>"></textarea>    
     <br>
    <p>Upload your picture:</p>
    <input name="proPic" type="file" size=40> 
     <input type="button" name="previous" class="previous action-button" value="Previous" />
   <input type="submit" name="submit" class="action-button" value="Submit" >
  </fieldset>
  
</form>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

    <script src="js/reg-index1.js"></script>

</body>
</html>
