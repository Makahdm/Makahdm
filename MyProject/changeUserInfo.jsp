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
String power=request.getParameter("power");
String academy=request.getParameter("academy");

String sql = "update account set password='"+password+"' where username='"+username+"'";
String sql2 = "update account set email='"+email+"' where username='"+username+"'";
String sql3 = "update account set power='"+power+"' where username='"+username+"'";
String sql4 = "update account set academy='"+academy+"' where username='"+username+"'";

if(session.getAttribute("academy").equals("all")){
i=dbCon.update(sql);
i=dbCon.update(sql2);
i=dbCon.update(sql3);
i=dbCon.update(sql4);
out.print("<script language='javascript'>alert('修改成功');window.location.href='main_admin_manage.jsp';</script>");
}
else{
	out.print("<script language='javascript'>alert('只有总管理员才能修改');window.location.href='main_admin_manage.jsp';</script>");
}
dbCon.close();



%>
