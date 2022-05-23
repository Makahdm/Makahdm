<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="myPac.FileDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./CSS/courselist.css">
    <link rel="stylesheet" href="./CSS/tablestyle.css">
  
    <link rel="stylesheet" href="./CSS/main_student.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <title>我的课表</title>
  
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
    <header>
         <div class="alert alert-dark" style="font-size:30px;height=20px;">我的课表</div>
    </header>
    
    


    <div class="container">
        
      <%    
            int temp;
            String[] Monday = new String[12];
            
	        String[] Tuesday=new String[12];
	        String[] Wednesday=new String[12];
	        String[] Thursday=new String[12];
	        String[] Friday=new String[12];
	        for(int i=1;i<12;i++){
	        	Monday[i]="";
	        	Tuesday[i]="";
	        	Wednesday[i]="";
	        	Thursday[i]="";
	        	Friday[i]="";
	        	
	        }
	        String course_name;
		    String username=(String)session.getAttribute("username");
		    String t1;
		    String t2;
			FileDAO dao = new FileDAO();
			ArrayList<Map<String, String>> files = dao.queryMycourse(username);
	

			for (Map<String, String> file : files) {
				 course_name=file.get("course_name");
				 t1=file.get("course_time1");
				 t2=file.get("course_time2");
				 String[] arr=t2.split(",");
				 temp=Integer.parseInt(arr[0]);
				 System.out.println(temp);
				 if(t1.equals("Monday")){
					 Monday[temp]=course_name;
					 Monday[temp+1]=course_name;
				 }
				 if(t1.equals("Tuesday")){
					 Tuesday[temp]=course_name;
					 Tuesday[temp+1]=course_name;
				 }
				 if(t1.equals("Wednesday")){
					 Wednesday[temp]=course_name;
					 Wednesday[temp+1]=course_name;
				 }
				 if(t1.equals("Thursday")){
					 Thursday[temp]=course_name;
					 Thursday[temp+1]=course_name;
				 }
				 if(t1.equals("Friday")){
					 Friday[temp]=course_name;
					 Friday[temp+1]=course_name;
				 }
			}
			%>
        <table cellspacing="0" align="center" width="100%" cellpadding="8px" font-size:"50%">
            <tbody>
            <tr>
                <th>节次</th>
                <th>星期一</th>
                <th>星期二</th>
                <th>星期三</th>
                <th>星期四</th>
                <th>星期五</th>
              
            </tr>
            <%for(int i=1;i<=10;i=i+1)
            {
                  	
            	%>
            <tr>
                <td><%=i %></td>
                <% if(i%2==1){ %>
                <td rowspan="2"><%=Monday[i] %></td>
                <td rowspan="2"><%=Tuesday[i] %></td>
                <td rowspan="2"><%=Wednesday[i] %></td>
                <td rowspan="2"><%=Thursday[i] %></td>
                <td rowspan="2"><%=Friday[i] %></td>
               <%} %>
            </tr>
            <%
            }
            %>
            </tbody>
        </table>
      
    </div>
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

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
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