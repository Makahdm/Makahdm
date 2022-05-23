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

request.setCharacterEncoding("UTF-8");
int i=0;

DBConnection dbCon=new DBConnection();
dbCon.createConnection();

String courseid=request.getParameter("courseid");
String coursename=request.getParameter("coursename");
String startfrom=request.getParameter("startfrom");
String coursetype=request.getParameter("coursetype");
String teacher=request.getParameter("teacher");
String coursetime1=request.getParameter("coursetime1");
String coursetime2=request.getParameter("coursetime2");
String credit=request.getParameter("credit");
String limitcourse=request.getParameter("limitcourse");
String limitmajor=request.getParameter("limitmajor");

String sql0="update course set course_name='"+coursename+"' where qid='"+courseid+"'";
String sql = "update course set startfrom='"+startfrom+"' where qid='"+courseid+"'";
String sql2= "update course set coursetype='"+coursetype+"' where qid='"+courseid+"'";
String sql3= "update course set teacher='"+teacher+"' where qid='"+courseid+"'";
String sql4= "update course set course_time='"+coursetime1+"' where qid='"+courseid+"'";
String sql5= "update course set course_time2='"+coursetime2+"' where qid='"+courseid+"'";
String sql6= "update course set credits='"+credit+"' where qid='"+courseid+"'";
String sql7= "update course set limitcourse='"+limitcourse+"' where qid='"+courseid+"'";
String sql8= "update course set limitmajor='"+limitmajor+"' where qid='"+courseid+"'";

i=dbCon.update(sql0);
i=dbCon.update(sql);
i=dbCon.update(sql2);
i=dbCon.update(sql3);
i=dbCon.update(sql4);
i=dbCon.update(sql5);
i=dbCon.update(sql6);
i=dbCon.update(sql7);
i=dbCon.update(sql8);
out.print("<script language='javascript'>alert('change course info successfully');window.location.href='main_admin_delete.jsp';</script>");
dbCon.close();



%>
