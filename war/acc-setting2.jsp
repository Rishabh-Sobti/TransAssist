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



<form id="msform" action="<%= blobstoreService.createUploadUrl("/docAccSett") %>" method="post" enctype="multipart/form-data">
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
    <input type="text" name="name" placeholder="Full Name" value="<%=doc.name%>" required readonly="readonly" />
      <input type="text" name="bday" placeholder="DOB(yyyy-mm-dd)" value="<%=doc.birthDate%>" required>
    
    <select style = "width:260px; height:50px;"  name="gender" required>
    <option value="Gender">   Gender    </option>
    
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other" selected="selected">Other</option>
   
</select> <br> 
Upload your picture:<br>
    <input type="file" name="proPic">
      <input type="password" name="password" placeholder="Password" value="<%=doc.password%>" required="required"/>
   <input type="password" name="rePassword" placeholder="Re-Enter Password" required="required" value="<%=doc.password%>" />
    
   <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  <fieldset>
    <h2 class="fs-title">Contact Details</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="Contact" placeholder="Contact Number (Mandatory)" value="<%=doc.mobileNo%>" readonly="readonly" />
    <input type="text" name="Fax" placeholder="Fax" value="<%=doc.fax%>" />
    <input type="text" name="Email" placeholder="Email Id (Mandatory)" required value="<%=doc.emailId%>" readonly="readonly"/>
    <input type="text" name="website" placeholder="Website" value="<%=doc.website%>" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
    
  <fieldset>
    <h2 class="fs-title">Professional Details</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="Expe" placeholder="Experience" value="<%=doc.experience%>" />
    <input type="text" name="degree" placeholder="Degree" value="<%=doc.degree%>" />
     <input type="text" name="specsf" placeholder="Speicailization" value="<%=doc.specialisation%>" />
  
    <input type="text" name="Role" placeholder="Enter Role" value="<%=doc.role%>" />
    <input type="text" name="clicname" placeholder="Clinic/Hospital Name" value="<%=doc.hospitalName%>" />
    <input type="text" name="Dur" placeholder="Duration" value="<%=doc.duration%>" />
    <textarea name="roledes" placeholder="Role Description" value="<%=doc.roleDescription%>" ></textarea>
    
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    
  </fieldset>
  
  <fieldset>
   <h2 class="fs-title"> Clinic/Hospital Location</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="stradd" placeholder="Street Address" value="<%=doc.hospStreet%>" />
    <input type="text" name="loc" placeholder="Locality" value="<%=doc.hospLocality%>" />
    <input type="text" name="city" placeholder="City" value="<%=doc.hospCity%>" />
    <input type="text" name="state" placeholder="State" value="<%=doc.hospState%>" />
    <input type="text" name="country" placeholder="Country" />
    <input type="text" name="pin" placeholder="Pincode" value="<%=doc.hospPinCode%>" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    </fieldset>
  
  <fieldset>
    <h2 class="fs-title">About Me</h2>
    <h3 class="fs-subtitle">What your patients need to know about you</h3>
    <input type="text" name="AboutMe" placeholder="Write something about yourself" value="<%=doc.aboutMe%>" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="submit" name="submit" class="action-button" value="Submit" />
  </fieldset>
  
</form>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

    <script src="js/reg-index.js"></script>

</body>
</html>
