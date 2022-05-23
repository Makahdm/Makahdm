<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection" %>

<%

ResultSet rs;

String username = request.getParameter("username");
DBConnection dbCon=new DBConnection();
dbCon.createConnection();

String sql = "DELETE FROM account WHERE username='"+username+"'";

dbCon.update(sql);
dbCon.close();


out.print("<script language='javascript'>window.location.href='main_admin_manage.jsp';</script>"); 
%>