<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
    <meta charset="UTF-8">
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>



<%  
    int i=0;
    ResultSet rs1;
    ResultSet rs2;
    ResultSet rs3;
	DBConnection dbCon=new DBConnection();
	dbCon.createConnection();
	String ClassID=request.getParameter("ClassID");
    String ClassName=request.getParameter("ClassName");
    String DeptName=request.getParameter("DeptName");
    String TeacherName=request.getParameter("TeacherName");
    
	String sqlfordept="select * from TB_Dept where TB_Dept.DeptName='"+DeptName+"'";
	rs1=dbCon.queryForRS(sqlfordept);
	rs1.next();
	String DeptID=rs1.getString("DeptID");
	
	String sqlforteacher="select * from TB_Teacher where TB_Teacher.TeacherName='"+TeacherName+"'";
	rs2=dbCon.queryForRS(sqlforteacher);
	rs2.next();
	String TeacherID=rs2.getString("TeacherID");

	String sql = "insert into TB_Class(ClassID,ClassName,DeptID,TeacherID) values('"+ClassID+"','"+ClassName+"',+'"+DeptID+"',+'"+TeacherID+"')";
    i=dbCon.update(sql);	
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
  title: 'add class successfully',
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
