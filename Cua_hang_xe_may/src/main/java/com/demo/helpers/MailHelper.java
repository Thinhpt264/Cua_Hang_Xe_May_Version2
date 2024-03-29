package com.demo.helpers;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

public class MailHelper {
	final static String username = "tmotoshop.service@gmail.com";//your email id
    final static String password = "yroy ynqy hznh azjv";// your password

	 public static void MailHelper(String email, String subject, String final_Text) {
		 Properties props = new Properties();
	        props.put("mail.smtp.auth", true);
	        props.put("mail.smtp.starttls.enable", true);
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");
		 Session session = Session.getInstance(props,
	              new javax.mail.Authenticator() {
	                  @Override
	                  protected PasswordAuthentication getPasswordAuthentication() {
	                      return new PasswordAuthentication(username, password);
	                  }
	              });
	      try {
	          Message message = new MimeMessage(session);
	          message.setFrom(new InternetAddress(username));
	          message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	          MimeBodyPart textPart = new MimeBodyPart();
	          Multipart multipart = new MimeMultipart();
	          textPart.setContent(final_Text, "text/html; charset=utf-8");
	          message.setSubject(subject);
	          multipart.addBodyPart(textPart);
	          message.setContent(multipart);
	          message.setSubject(subject);
	          //out.println("Sending");
	          Transport.send(message);
	        
	      } catch (Exception e) {
	        
	      }
	 }
	 public static void main(String[] args) {
		MailHelper("phucthanh2104@gmail.com", "Verify tai khoan cua ban", "Ban hay nhap vao lien ket sau de verify tai khoan <br>"
				+ "<a href='google.com'>Lien ket</a>");
	}
	
	
}
