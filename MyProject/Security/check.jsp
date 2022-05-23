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
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="encrypt.SM3"%>
<%
int flag=0;
int i=0;
ResultSet rs;
String academy=null;
String power=null;
String username=request.getParameter("username");
	DBConnection dbCon=new DBConnection();
	dbCon.createConnection();
	session.setAttribute("username",username);
	String sq="select * from account";
	rs=dbCon.queryForRS(sq);
	while(rs.next()){
		
		String name=rs.getString("username");
		power=rs.getString("power");
		academy=rs.getString("academy");
		if(username.equals(name)){
			flag=1;
			break;
		}	
	}
		dbCon.close();
		if(flag==1){
		    
		    if(power.equals("admin")){
		session.setAttribute("academy",academy);
		
	out.print("<script language='javascript'>window.location.href='../main_admin.jsp';</script>");
	}
	else if(power.equals("user")){
	out.print("<script language='javascript'>window.location.href='../main_student.jsp';</script>");
	}
	else{
	out.print("<script language='javascript'>window.location.href='../main_teacher.jsp';</script>");
	}
	
}
	
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Details modal</title>
  <script src="CSS/sweetalert2@8"></script>
</head>
<body onload="myFunction()">

    <script>
      <% if(flag==0){%>
    
    function myFunction(){
    Swal.fire({
  type: 'error',
  title: 'fail to login',
  text: 'This acount does not exist',
  timer: 2000
})
setTimeout("location.href='https://www.yyfandyy.xyz/Security/index.jsp'",1000);
    }
    <%}%>
    
    </script>
</body>

</html>