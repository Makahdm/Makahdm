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


infopac result=(infopac)application.getAttribute("changelist");
int i=0;

DBConnection dbCon=new DBConnection();
dbCon.createConnection();

String username=result.getUsername();
String password=result.getPassword();
String email=result.getEmail();
String identifycode=result.getIdentifycode();
String identifycode2=(String)session.getAttribute("identifycode");
if(identifycode.equals(identifycode2)){
String sql = "update account set password='"+password+"'where username='"+username+"'";
i=dbCon.update(sql);
dbCon.close();
out.print("<script language='javascript'>alert('修改成功');window.location.href='log.jsp';</script>");
}
else{
	out.print("<script language='javascript'>alert('验证码错误');window.location.href='forgetpassword.html';</script>");
}

%>
