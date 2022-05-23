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
        <div class="logo_name">Welcome</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
      
      <li>
       <a href="main_admin.jsp">
         <i class='bx bx-add-to-queue' ></i>
         <span class="links_name">Add Course</span>
       </a>
       <span class="tooltip">Add Course</span>
     </li>
     
     <li>
       <a href="main_admin_delete.jsp">
         <i class='bx bx-spreadsheet' ></i>
         <span class="links_name">Courses</span>
       </a>
       <span class="tooltip">Courses</span>
     </li>
     <li>
       <a href="main_admin_manage.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">User Info</span>
       </a>
       <span class="tooltip">UserInfo</span>
     </li>
     
     <li>
       <a href="main_admin_class.jsp">
         <i class='bx bx-edit' ></i>
         <span class="links_name">Class Manage</span>
       </a>
       <span class="tooltip">Class Manage</span>
     </li>
     <li>
     
      <li>
       <a href="main_admin_chart.jsp">
         <i class='bx bx-chart' ></i>
         <span class="links_name">Chart</span>
       </a>
       <span class="tooltip">Chart</span>
     </li>
     <li>
     
       <a href="main_admin_upload.jsp">
         <i class='bx bx-folder' ></i>
         <span class="links_name">File Manager</span>
       </a>
       <span class="tooltip">Files</span>
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
    
	
	<%
		if (request.getAttribute("result") != null) { //判断保存在request范围内的对象是否为空
			out.println("<script >alert('" + request.getAttribute("result")
					+ "');</script>"); //页面显示提示信息    	
		}

		//查询所有文件信息
	%>
 <div class="alert alert-dark" style="font-size:30px;height=20px;">文件列表</div>
	<table class="table table-hover table-striped table-bordered">
		<tr>
			<th style="width: 6%;">序号</th>
			<th>文件名</th>
			<th>上传日期</th>
			<th>上传时间</th>
			<th>路径</th>
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
			<td><%=file.get("path") %></td>
		<td><a href='download?filename=<%=URLEncoder.encode(file.get("filename"), "UTF-8") %>'>下载文件</a></td>	
		</tr>
			<%
			}
		%>
		
	</table>
	
 <form action="UploadServlet" method="post"
		enctype="multipart/form-data" name="form1" id="form1"
		onsubmit="return validate()">
		<ul>
		
			<li style="margin:20px">上传文件： <input type="file" style="margin:10px" name="file" class="btn btn-info"/> <!-- 文件上传组件 --></li>
			<li><input style="margin: 10px" type="submit" name="Submit" value="上传"  class="btn btn-success"/> 
			<input type="reset" name="Submit2" value="重置" class="btn btn-success"/></li>
		</ul>
	</form>
	
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
