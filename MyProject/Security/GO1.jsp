<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="encrypt.SM3"%>
<%  
   String academy=null;
   String remember="";
   infopac result=(infopac)application.getAttribute("loginlist");
   remember=(String)application.getAttribute("remember");
   if (remember==null){
	   remember="";
   }
   ResultSet rs;
   int flag=0;
   int i=0;

	DBConnection dbCon=new DBConnection();
	dbCon.createConnection();
	String power=null;
	String username=result.getUsername();
	String password=result.getPassword();
    password=SM3.hash(password);
	
    session.setAttribute("username",username);
    
	String sq="select * from account";
	rs=dbCon.queryForRS(sq);
	while(rs.next()){
		
		String name=rs.getString("username");
		String psd=rs.getString("password");
		power=rs.getString("power");
		academy=rs.getString("academy");
		if(username.equals(name)&&password.equals(psd)){
			flag=1;
			break;
		}	
	}
	if(flag==1){
		if(remember.equals("true")){
		Cookie usernameCookie = new Cookie("usernameCookie", username); 
        Cookie passwordCookie = new Cookie("passwordCookie", password); 
        // 设置cookie的有效期7天，单位为秒 
        usernameCookie.setMaxAge(604800); 
        passwordCookie.setMaxAge(604800); 
        // 写入cookie对象 
        response.addCookie(usernameCookie); 
        response.addCookie(passwordCookie);
		}
	dbCon.close();
	if(power.equals("admin")){
		session.setAttribute("academy",academy);
		
	out.print("<script language='javascript'>window.location.href='main_admin.jsp';</script>");
	}
	else{

	out.print("<script language='javascript'>window.location.href='main_student.jsp';</script>");
	}
	}
	else{
	dbCon.close();
     out.print("<script language='javascript'>alert('账户密码错误');window.location.href='log.jsp';</script>");
	}
	
%>
    
   
