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



try{

	htmlText ht=new htmlText();
	RandomUtil ru=new RandomUtil();
	String temp=ru.getRandom();
	session.setAttribute("identifycode", temp);
	temp=ht.html(temp);
	
	request.setCharacterEncoding("gb2312");
	String from="2426527199@qq.com";
	String to=request.getParameter("email");
	String subject="Indentify to change password";
	String messageText=temp;
    String AuthorizationCode="oxmfuevidbteecah";
	//生成SMTP的主机名称
	int n =from.indexOf('@');
	int m=from.length() ;
	String mailserver ="smtp."+from.substring(n+1,m);
    //String mailserver="wanggh";    
    //建立邮件会话
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
    //新建一个消息对象
    MimeMessage message=new MimeMessage(sess);
    //设置发件人
    InternetAddress from_mail=new InternetAddress(from);
    message.setFrom(from_mail);
   //设置收件人
    InternetAddress to_mail=new InternetAddress(to);
    message.setRecipient(Message.RecipientType.TO ,to_mail);
    //设置主题
    message.setSubject(subject);
   //设置内容
   message.setText(messageText);
   //设置发送时间
   message.setSentDate(new Date());
   //发送邮件
   message.saveChanges();  //保证报头域同会话内容保持一致
   Transport transport =sess.getTransport("smtp");
   transport.connect(mailserver,from,AuthorizationCode);
   transport.sendMessage(message,message.getAllRecipients());
   transport.close();
   out.println("<script language='javascript'>alert('邮件已发送！');window.history.go(-1);</script>");
}catch(Exception e){
	     e.printStackTrace();
	out.println(e.getMessage());
}
%>
