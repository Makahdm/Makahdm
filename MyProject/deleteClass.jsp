<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection" %>

<%


Connection conn=null;
Statement stmt=null;
ResultSet rs;


String ClassID=request.getParameter("ClassID");
DBConnection dbCon=new DBConnection();
dbCon.createConnection();

String sql = "DELETE FROM TB_Class WHERE ClassID=" + ClassID;
dbCon.update(sql);
dbCon.close();

    
%>
   <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Details modal</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
</head>

<body onload="myFunction()" >
    <script>
    
    <% int flag=1;
    if(flag==1){%>
    
    function myFunction(){
        Swal.fire({

  type: 'success',
  title: 'delete successfully',
  showConfirmButton: false,
  timer: 2000
})
setTimeout("location.href='main_admin_class.jsp'",1000);
    }
    <%}%>
    
      <% if(flag==0){%>
    
    function myFunction(){
    Swal.fire({
  type: 'error',
  title: 'fail to login',
  text: 'Wrong password',
  
})
setTimeout("location.href='login.html'",1000);
    }
    <%}%>
    
    </script>
</body>

</html>
