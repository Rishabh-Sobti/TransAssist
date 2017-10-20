<%@page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>TransAssist - Doctor Registration</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="css/reg-style.css">

  
</head>
<body>
<!-- multistep form -->
<%
 	BlobstoreService blobstoreService = BlobstoreServiceFactory
 			.getBlobstoreService();
 %>
<form id="msform" action="<%= blobstoreService.createUploadUrl("/docReg") %>" method="post" enctype="multipart/form-data">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">Personal Details</li>
    <li>Contact Details</li>
    <li>Professional Details</li>
    <li>Clinic/Hospital Location </li>
    <li>About Me</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Personal Details</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="name" placeholder="Full Name" required />
      <input type="text" name="bday" placeholder="DOB(yyyy-mm-dd)" required>
    
    <select style = "width:260px; height:50px;"  name="gender" required>
    <option value="Gender">   Gender    </option>
    
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option>
   
</select> <br> 
Upload your picture (Mandatory)<br>
    <input type="file" name="proPic" required >
      <input type="password" name="password" placeholder="Password" required />
   <input type="password" name="rePassword" placeholder="Re-Enter Password" required />
    
   <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Contact Details</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="Contact" placeholder="Contact Number (Mandatory)" required />
    <input type="text" name="Fax" placeholder="Fax" />
    <input type="text" name="Email" placeholder="Email Id (Mandatory)" required />
    <input type="text" name="website" placeholder="Website" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
    
  <fieldset>
    <h2 class="fs-title">Professional Details</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="Expe" placeholder="Experience (in no. of years)" />
    <input type="text" name="degree" placeholder="Degree" required />
     <input type="text" name="specsf" placeholder="Speicailization" />
  
    <input type="text" name="Role" placeholder="Enter Role" />
    <input type="text" name="clicname" placeholder="Clinic/Hospital Name" required />
    <input type="text" name="Dur" placeholder="Duration (in years)" />
    <textarea name="roledes" placeholder="Role Description"></textarea>
    
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    
  </fieldset>
  
  <fieldset>
   <h2 class="fs-title"> Clinic/Hospital Location</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="stradd" placeholder="Street Address" />
    <input type="text" name="loc" placeholder="Locality" />
    <input type="text" name="city" placeholder="City" />
    <input type="text" name="state" placeholder="State" required />
    <input type="text" name="country" placeholder="Country" required />
    <input type="text" name="pin" placeholder="Pincode" required />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
  
  <fieldset>
    <h2 class="fs-title">About Me</h2>
    <h3 class="fs-subtitle">What your patients need to know about you</h3>
    <input type="text" name="AboutMe" placeholder="Write something about yourself" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="submit" name="submit" class="action-button" value="Submit" />
  </fieldset>
  
</form>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

    <script src="js/reg-index.js"></script>

</body>
</html>