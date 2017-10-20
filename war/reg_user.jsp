<%@page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>TransAssist - User Registration</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="css/reg-style1.css">

</head>
<body>
 <%
 	BlobstoreService blobstoreService = BlobstoreServiceFactory
 			.getBlobstoreService();
 %>
 <!-- multistep form -->
<form id="msform" action="<%= blobstoreService.createUploadUrl("/userReg") %>" method="post" enctype="multipart/form-data">
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
    <input type="text" name="name" placeholder="Full Name" required />
    <input type="text" name="bday" placeholder="DOB(yyyy-mm-dd)" required />
    <input type="text" name="loc" placeholder="Location" required />
     <select style = "width:260px; height:50px; "  name="gender" required >
    <option value="Gender">   Gender    </option>
    
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option> </select> 
    <br> <br> 
    
   <input type="text" name="employ" placeholder="Employment Status " />
    <input type="text" name="Contact" placeholder="Phone (Mandatory)" required />
    <input type="text" name="Email" placeholder="Email Id (Mandatory)" required />
    <input type="password" name="password" placeholder="Password" required />
   <input type="password" name="rePassword" placeholder="Re-Enter Password" required />
    <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
  
    <fieldset>
    <h2 class="fs-title">Social Profiles</h2>
    <h3 class="fs-subtitle">Your presence on the social network</h3>
    <input type="text" name="twitter" placeholder="Twitter" />
    <input type="text" name="facebook" placeholder="Facebook" />
    <input type="text" name="gplus" placeholder="Google Plus" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  <fieldset>
    <h2 class="fs-title">About User</h2>
    <textarea name="aboutme" placeholder="Tell us something about you!"></textarea>
    <textarea name="hobbies" placeholder="Hobbies and Interests"></textarea>    
     <br>
    <p>Upload your picture (Mandatory)</p>
    <input name="proPic" type="file" size=40 required > 
     <input type="button" name="previous" class="previous action-button" value="Previous" />
   <input type="submit" name="submit" class="action-button" value="Submit" >
  </fieldset>
  
</form>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

    <script src="js/reg-index1.js"></script>

</body>
</html>