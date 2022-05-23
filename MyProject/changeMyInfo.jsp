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
<%@ page import="encrypt.SM3"%>
<%

request.setCharacterEncoding("UTF-8");
int i=0;

DBConnection dbCon=new DBConnection();
dbCon.createConnection();

String username=request.getParameter("username");
String password=request.getParameter("password");
SM3 sm3=new SM3();
password=sm3.hash(password);
String email=request.getParameter("email");
String[] sum=request.getParameter("academy").split(",");

String sql = "update account set password='"+password+"' where username='"+username+"'";
String sql2 = "update account set email='"+email+"' where username='"+username+"'";
String sql3 = "update account set academy='"+sum[0]+"' where username='"+username+"'";
String sql4 = "update account set major='"+sum[1]+"' where username='"+username+"'";

session.setAttribute("studentAcademy", sum[1]);
i=dbCon.update(sql);
i=dbCon.update(sql2);
i=dbCon.update(sql3);
i=dbCon.update(sql4);
out.print("<script language='javascript'>alert('ÐÞ¸Ä³É¹¦');window.location.href='main_student_info.jsp';</script>");

dbCon.close();



%>
