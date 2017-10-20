package com.experts.TransAssist.services;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService {
	private static Logger log = Logger.getLogger(MailService.class.getCanonicalName());
	  private static String fromAddress = "transgenderassist@gmail.com";
	  
	 public void newUserMail(String toAddress) throws IOException{
		 MailService ms=new MailService();
		 ms.send(toAddress, "Welcome To TransAssist!", "Greetings!\n\n"
		 		+ " We, at TransAssist, welcome you to our community and hope you will have a great time with us! We hope you connect with other users and doctors very well, and expand our community while doing so.\n Always with you\n Team TransAssist");
	 }
	  
	 public void newDocMail(String toAddress) throws IOException{
		 MailService ms=new MailService();
		 ms.send(toAddress, "Welcome To TransAssist!", "Greetings!\n\n We, at TransAssist, welcome you to our community and hope you will have a great time with us! We hope you will be very helpful to our users and connect to fellow doctors very well, and expand our community while doing so.\nAlways with you\nTeam TransAssist");
	 }
	 
	 public void forgotPass(String toAddress, String msg) throws IOException{
		 new MailService().send(toAddress, "Password Information from TransAssist", msg);
	 }
	 
	 public void send(String toAddress, String subject, String msgBody)
		      throws IOException {
			  
			  
			  Properties props = new Properties();
			  Session session = Session.getDefaultInstance(props, null);

			 

			  try {
			      Message msg = new MimeMessage(session);
			      msg.setFrom(new InternetAddress(fromAddress));
			      InternetAddress to = new InternetAddress(toAddress);
			      msg.addRecipient(Message.RecipientType.TO, to);
			      msg.setSubject(subject);
			      msg.setText(msgBody);
			      Transport.send(msg);
			      

			      } catch (AddressException addressException) {
		      log.log(Level.SEVERE, "Address Exception , mail could not be sent", addressException);
		    } catch (MessagingException messageException) {
		      log.log(Level.SEVERE, "Messaging Exception , mail could not be sent", messageException);
		    }
		  }
}
