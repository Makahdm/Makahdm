<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
    <meta charset="UTF-8">
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="encrypt.SM3"%>
<%  

   infopac result=(infopac)application.getAttribute("infolist");
   Connection conn=null;
   Statement stmt=null;
  
   
    int flag=1;
    int i=0;
	String power="user";
	DBConnection dbCon=new DBConnection();
	dbCon.createConnection();
	ResultSet rs;
	
	String username=result.getUsername();
	String password=result.getPassword();
	String email=result.getEmail();
	
	String sq="select * from account";
	rs=dbCon.queryForRS(sq);
	while(rs.next()){
		
		String name=rs.getString("username");
		if(username.equals(name)){
			flag=0;
		}	
	}
	SM3 sm3=new SM3();
	password=sm3.hash(password);
	if(flag==1){
	String sql = "insert into account(username,password,email,power) values('"+username+"','"+password+"','"+email+"','"+power+"')";
	i=dbCon.update(sql);
	dbCon.close();

		out.print("<script language='javascript'>alert('注册成功');window.location.href='log.jsp';</script>");
	}
	else{
     out.print("<script language='javascript'>alert('账户已存在');window.location.href='log.jsp';</script>");
	}
    
%>
    
   
