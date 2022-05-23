<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="myPac.FileDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>


<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./CSS/tablestyle.css">

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
    
	
	
 <div class="alert alert-dark" style="font-size:30px;height=20px;">文件列表</div>
	<table class="table table-hover table-striped table-bordered">
		<tr>
			<th style="width: 6%;">序号</th>
			<th>文件名</th>
			<th>上传日期</th>
			<th>上传时间</th>
		
			<th>下载</th>
		</tr>


		<%
			FileDAO dao = new FileDAO();
			ArrayList<Map<String, String>> files = dao.queryAllfile();
			int i=0;

			for (Map<String, String> file : files) {
				
			%>
		<tr>
			<td style="width: 6%;"><%=++i %></td>
			<td><%=file.get("filename") %></td>
			<td><%=file.get("date") %></td>
			<td><%=file.get("time") %></td>
			
		<td><a href='download?filename=<%=URLEncoder.encode(file.get("filename"), "UTF-8") %>'>下载文件</a></td>	
		</tr>
			<%
			}
		%>
		
	</table>
	

	
  </section>
   <script src='https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js'></script>
  <script>
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

  closeBtn.addEventListener("click", () =>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

 //filecheck
  function validate() {
		if (form1.file.value == "") {
			alert("请选择要上传的文件");
			return false;
		}
	}
  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }
  </script>
</body>
</html>
