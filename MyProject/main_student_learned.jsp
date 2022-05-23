<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="myPac.FileDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="java.sql.*"%>



<%
if(session.getAttribute("username")==null){
	
	 out.print("<script language='javascript'>alert('请先登录');window.location.href='log.jsp';</script>");
}
DBConnection dbCon=new DBConnection();
dbCon.createConnection();
ResultSet rs;
String temp=(String)session.getAttribute("username");
String tempAcademy="";
String sq="select * from account where username='"+temp+"'";
rs=dbCon.queryForRS(sq);
while(rs.next()){
	tempAcademy=rs.getString("major");
	if(rs.getString("major")==null||rs.getString("major").equals("null")){
		
		out.print("<script language='javascript'>alert('请先补充基本信息');window.location.href='main_student_info.jsp';</script>");
	}
}
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
     
 <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./CSS/tablestyle.css">
      <link rel="stylesheet" href="./CSS/bootstrap.min.css">
    <link rel="stylesheet" href="./CSS/main_student.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>

  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus icon'></i>
        <div class="logo_name"><%="Hi,"+(session.getAttribute("username")) %></div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
     
      <li>
       <a href="main_student.jsp">
         <i class='bx bx-spreadsheet' ></i>
         <span class="links_name">Course</span>
       </a>
       <span class="tooltip">Course</span>
     </li>
     <li>
       <a href="main_student_mycourse.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">My Course</span>
       </a>
       <span class="tooltip">My course</span>
     </li>
     <li>
       <a href="main_student_learned.jsp">
         <i class='bx bx-calendar-check' ></i>
         <span class="links_name">Course Learned</span>
       </a>
       <span class="tooltip">Course Learned</span>
     </li>
     <li>
       <a href="main_student_courselist.jsp">
         <i class='bx bx-table' ></i>
         <span class="links_name">Curriculum</span>
       </a>
       <span class="tooltip">Curriculum</span>
     </li>
     <li>
       <a href="main_student_download.jsp">
         <i class='bx bx-folder' ></i>
         <span class="links_name">File Manager</span>
       </a>
       <span class="tooltip">Files</span>
     </li>
     
      <li>
       <a href="main_student_info.jsp">
         <i class='bx bx-edit' ></i>
         <span class="links_name">My Info</span>
       </a>
       <span class="tooltip">Info</span>
     </li>
     
    
     <li class="profile">
         
        <a href="log.jsp">
         <span class="links_name">Exit</span>
         <i class='bx bx-log-out' id="log_out" ></i>
           </a>
           
     </li>
    </ul>
  </div>
  

  <section class="home-section">
 
      <div class="alert alert-dark" style="font-size:30px;height=20px;">成绩查询</div>
    
      <div class="text">
      <table class="table table-hover table-striped table-bordered">
		<tr>
		    
			<th>课程名称</th>
			<th>平时成绩</th>
			<th>期中成绩</th>
			<th>期末成绩</th>
			<th>课程成绩</th>
			<th>补考成绩</th>
		</tr>

		<%  
		    request.setCharacterEncoding("UTF-8");
		    String username=(String)session.getAttribute("username");
		    String sql="select * from TB_Grade TG join TB_Course TC on TG.CourseID=TC.CourseID and StuID='"+username+"'";
		    rs=dbCon.queryForRS(sql);
			while (rs.next()) {

			%>
		<tr>
			<td><%=rs.getString("CourseName") %></td>
			<td><%=rs.getString("CommonScore") %></td>
			<td><%=rs.getString("MiddleScore") %></td>
			<td><%=rs.getString("LastScore") %></td>	
			<td><%=rs.getString("TotalScore") %></td>
			<td><%=rs.getDouble("RetestScore") %></td>
		</tr>
			<%
			    }
          dbCon.close();
		%>
		
	</table></div>


  </section>
   <script src='https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js'></script>
  <script>
  
  function showlog(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10){
        console.log(t0);
		var courseid=document.getElementById("courseid");
		
		var coursename=document.getElementById("coursename");
		var startfrom=document.getElementById("startfrom");
		var coursetype=document.getElementById("coursetype");
		var teacher=document.getElementById("teacher");
		var coursetime1=document.getElementById("coursetime1");
		var coursetime2=document.getElementById("coursetime2");
		var credit=document.getElementById("credit");
		var limitcourse=document.getElementById("limitcourse");
		var limitmajore=document.getElementById("limitmajor");
		var intro=document.getElementById("intro");
		
		courseid.value=t0;
		coursename.value=t1;
		startfrom.value=t2;
		coursetype.value=t3;
		teacher.value=t4;
		coursetime1.value=t5;
		coursetime2.value=t6;
		credit.value=t7;
		limitcourse.value=t8;
		limitmajor.value=t9;
		intro.value=t10;
		
	}
  
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");


  closeBtn.addEventListener("click", () =>{
    sidebar.classList.toggle("open");
    menuBtnChange();
  });

  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");
   }
  }
  </script>
</body>
</html>
