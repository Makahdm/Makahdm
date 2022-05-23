<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection" %>

<%
if(session.getAttribute("username")==null){	
	 out.print("<script language='javascript'>alert('请先登录');window.location.href='log.jsp';</script>");
}

Connection conn=null;
Statement stmt=null;
ResultSet rs;

String id = request.getParameter("id");
String academy=request.getParameter("coursefrom");

String nowacademy=(String)session.getAttribute("academy");
if(nowacademy.equals("all")){
	nowacademy=academy;
}


DBConnection dbCon=new DBConnection();
dbCon.createConnection();

String sql = "DELETE FROM course WHERE course_id=" + id;
if(nowacademy.equals(academy)){
dbCon.update(sql);

out.print("<script language='javascript'>window.location.href='main_admin_delete.jsp';</script>");
}
else{
	out.print("<script language='javascript'>alert('您不能删除非您学院以外的课程');window.location.href='main_admin_delete.jsp';</script>");
}
dbCon.close();

    
%>