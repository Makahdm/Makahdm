<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import ="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="myPac.DBConnection"%>
<%@ page import="identify.htmlText"%>
<%@ page import="identify.RandomUtil"%>
<%
int flag=1;
try{
    
	htmlText ht=new htmlText();
	RandomUtil ru=new RandomUtil();
	String temp=ru.getRandom();
	session.setAttribute("identifycode", temp);
	temp=ht.html(temp);
	
	request.setCharacterEncoding("gb2312");
	String from="2426527199@qq.com";
	String to=request.getParameter("email");
	session.setAttribute("email",to);
	String name=request.getParameter("username");
	session.setAttribute("usernametemp",name);
	String subject="Indentify to change password";
	String messageText=temp;
    String AuthorizationCode="oxmfuevidbteecah";
	int n =from.indexOf('@');
	int m=from.length() ;
	String mailserver ="smtp."+from.substring(n+1,m);
	Properties pro=new Properties();
	pro.put("mail.smtp.host","smtp.qq.com");
	pro.put("mail.smtp.auth","true");
	pro.put("mail.smtp.socketFactory.fallback", "false");
	pro.setProperty("mail.smtp.port", "587");
    pro.setProperty("mail.smtp.socketFactory.port", "587");
    pro.setProperty("mail.debug","true");
    pro.setProperty("mail.transport.protocol", "smtp"); 
    Session sess=Session.getInstance(pro);
    sess.setDebug(true);
    MimeMessage message=new MimeMessage(sess);
    InternetAddress from_mail=new InternetAddress(from);
    message.setFrom(from_mail);
    InternetAddress to_mail=new InternetAddress(to);
    message.setRecipient(Message.RecipientType.TO ,to_mail);
    message.setSubject(subject);
    message.setText(messageText);
    message.setSentDate(new Date());
    message.saveChanges();  
    Transport transport =sess.getTransport("smtp");
    transport.connect(mailserver,from,AuthorizationCode);
    transport.sendMessage(message,message.getAllRecipients());
    transport.close();
   
}catch(Exception e){
         flag=2;
	     e.printStackTrace();
	out.println(e.getMessage());
}
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Details modal</title>
<script src="train/landr/js/sweetalert2@8"></script>
</head>

<body onload="myFunction()" >
    <script>
    
    <% if(flag==1){%>
    
    function myFunction(){
        Swal.fire({

  type: 'success',
  title: 'please check out your email',
  showConfirmButton: false,
  timer: 2000
})

setTimeout("location.href='http://www.yyfandyy.xyz/Security/train.jsp'",1000);
    }
    <%}%>
    
      <% if(flag==0){%>
    
    function myFunction(){
    Swal.fire({
  type: 'error',
  title: 'fail to send',
  text: 'please check your address',
  
})
setTimeout("location.href='http://www.yyfandyy.xyz/Security/train.jsp'",1000);
    }
    <%}%>
    
    </script>
</body>

</html>