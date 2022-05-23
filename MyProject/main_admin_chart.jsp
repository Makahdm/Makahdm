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
      <div class="alert alert-dark" style="font-size:20px;height=20px;text-align:center;">选课情况</div>
      <div class="text">
      </div>
	
<div id="container" style="min-width:400px;height:650px"></div>

	
  </section>
   <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
   <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
   <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
   <script src='https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js'></script>
  <script>
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

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
  
  var keys = [];
  var vals = [];
  
  <%     
  
	FileDAO dao = new FileDAO();
	ArrayList<Map<String, String>> files = dao.queryAll();
	int i=0;

	for (Map<String, String> file : files) {
		
		String course_name=file.get("course_name");
		String capacity=file.get("capacity");
		int temp=Integer.parseInt(capacity);
	%>
	
	  keys.push(<%=i+1 %>);
	  vals.push(<%=temp%>);
	<%
	i++;
	}
%>
  
  
  
  //chart
var chart = Highcharts.chart('container', {
	credits: {
		enabled: false
	},
	chart: {
		type: 'bar'
	},
	title: {
		text: '课程剩余容量条形图'
	},
	subtitle: {
		text: 'y轴:课程序号  x轴:剩余容量'
	},
	xAxis: {
		categories: keys,
		title: {
			text: null
		}
	},
	yAxis: {
		min: 0,
		title: {
			text: '剩余数量',
			align: 'high'
		},
		labels: {
			overflow: 'justify'
		}
	},
	tooltip: {
		valueSuffix: ' 个'
	},
	plotOptions: {
		bar: {
			dataLabels: {
				enabled: true,
				allowOverlap: true 
			}
		}
	},
	legend: {
		layout: 'vertical',
		align: 'right',
		verticalAlign: 'top',
		x: -40,
		y: 100,
		floating: true,
		borderWidth: 1,
		backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
		shadow: true
	},
	series: [{
		name: '余量',
		data: vals
	}]
});
  </script>
</body>
</html>
