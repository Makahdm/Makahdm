<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
    <meta charset="UTF-8">
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBtrain"%>
<%@ page import="encrypt.SM3"%>
<%  

    Connection conn=null;
    Statement stmt=null;
    int flag=0;
    int i=0;
	DBtrain dbCon=new DBtrain();
	dbCon.createConnection();
	ResultSet rs;
	
    String user_name=request.getParameter("username");

    String sql = "select * from user";
	rs=dbCon.queryForRS(sql);
	while(rs.next()){
		
		String name=rs.getString("user_name");
	
		if(user_name.equals(name)){
			flag=1;
			break;
		}	
	}
    dbCon.close();
    
%>
    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Details modal</title>
  <script src="CSS/sweetalert2@8"></script>
</head>

<body onload="myFunction()" >
    <script>
    
    <% if(flag==1){%>
    
    function myFunction(){
        Swal.fire({

  type: 'success',
  title: 'Log in successfully',
  showConfirmButton: false,
  timer: 2000
})
setTimeout("location.href='https://www.yyfandyy.xyz/train/Index/index.html'",1000);
    }
    <%}%>
    
      <% if(flag==0){%>
    
    function myFunction(){
    Swal.fire({
  type: 'error',
  title: 'fail to login',
  text: 'This acount does not exist',
  timer: 2000
})
setTimeout("location.href='https://www.yyfandyy.xyz/Security/train.jsp'",1000);
    }
    <%}%>
    
    </script>
</body>

</html>