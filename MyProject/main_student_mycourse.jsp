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
 
      <div class="alert alert-dark" style="font-size:30px;height=20px;">我的课程</div>
     
      
                        
      <div class="text">
      <table class="table table-hover table-striped table-bordered">
		<tr>
		    <th>序号</th>
			<th>课程名</th>
			<th>开设学院</th>
			<th>课程类型</th>
			<th>教师</th>
			<th>上课时间</th>
			<th>上课节次</th>
			<th>学分</th>
			<th>操作</th>
		</tr>

		<%  
		    
		   
		    String username=(String)session.getAttribute("username");
			FileDAO dao = new FileDAO();
			ArrayList<Map<String, String>> files = dao.queryMycourse(username);
			int i=0;

			for (Map<String, String> file : files) {
				
			%>
		<tr>
			<td><%=++i %></td>
		
			<td><%=file.get("course_name") %></td>
			<td><%=file.get("course_from") %></td>
			
			<td><%=file.get("course_type") %></td>
			<td><%=file.get("teacher") %></td>
			<td><%=file.get("course_time1") %></td>
			<td><%=file.get("course_time2") %></td>
			<td><%=file.get("credit") %></td>
			
		<td><button type="button" class="btn btn-danger" onclick=show_confirm('<%=username%>','<%=file.get("course_name") %>')>退选</button></td>	
		</tr>
		
		<script>
		function show_confirm(username,classname)
		  {
		  var r=confirm("确定退选该课程？");
		  if (r==true)
		    {
			  location.href="dropcourse.jsp?username="+username+"&"+"course_name="+classname;
			 
			
		    }
		  else
		    {
		    alert("您已取消退选操作");
		    }
		  }
		</script>
			<%
			}
		%>
		
	</table></div>
  </section>
   <script src='https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js'></script>
  <script>
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  closeBtn.addEventListener("click", () =>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

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
