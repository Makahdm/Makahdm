<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="myPac.FileDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="java.sql.*"%>

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
   <script>
   
   function showinfo(){
		  var studentid=document.getElementById("studentid");
		  var username=document.getElementById("username");
		  var password=document.getElementById("password");
		  var email=document.getElementById("email");
		  var academy=document.getElementById("academy");
		  var major=document.getElementById("major");
		  
		  <% 
		    DBConnection dbCon=new DBConnection();
			dbCon.createConnection();
			ResultSet rs;
			String temp=(String)session.getAttribute("username");
			if(temp==null){
			    temp="vistor109";
			    session.setAttribute("username",temp);
			}
			String sq="select * from account where username='"+temp+"'";
		    rs=dbCon.queryForRS(sq);
		    while(rs.next()){
		    	session.setAttribute("studentAcademy", rs.getString("major"));
		    	%>
		    studentid.value=<%=rs.getString("id")%>;
		    username.value='<%=temp%>';

		    email.value='<%=rs.getString("email")%>';
		    academy.value='<%=rs.getString("academy")%>'+','+'<%=rs.getString("major")%>';
		    major.innerText='Academy&Major:       '+'<%=rs.getString("major")%>';
		  
		    
		    	<%
		    	
		    }
		  %>
	  }
   
   </script>
<body onload = "showinfo()">
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
         <i class='bx bx-calendar-check' ></i>
         <span class="links_name">My Course</span>
       </a>
       <span class="tooltip">My course</span>
     </li>
       <li>
       <a href="main_student_learned.jsp">
         <i class='bx bx-user' ></i>
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
 
      <div class="alert alert-dark" style="font-size:30px;height=20px;">我的信息</div>
     
<form action="changeMyInfo.jsp" style="margin:30px;margin-left:250px">


   <div class="form-group" >
    <label for="exampleInputEmail1" style="font-size:16px">Student Id</label>
    <input type="text" class="form-control" id="studentid" aria-describedby="emailHelp" placeholder="Enter StudentId" style="width:700px;height:40px; font-size:15px" readonly>
  </div>
  
   <div class="form-group" >
    <label for="exampleInputEmail1" style="font-size:16px;margin-top:10px">Username</label>
    <input type="email" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="Enter Username" style="width:700px;height:40px; font-size:15px" readonly>
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1" style="font-size:16px;margin-top:10px">Password</label>
    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" value="" style="width:700px;height:40px; font-size:15px">
  </div>
  
  <div class="form-group" >
    <label for="exampleInputEmail1" style="font-size:16px;margin-top:10px">Email address</label>
    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" style="width:700px;height:40px; font-size:15px">
  </div>

   <div class="form-group">
    <label for="exampleFormControlSelect1" id="major" style="font-size:16px;margin-top:10px">Academy&Major</label>
    <select class="form-control" id="academy" name="academy" style="width:700px;height:40px; font-size:15px">
    <option value="null,null">null</option>
      <optgroup label="国服学院">
      <option value="国服学院,软件工程">软件工程</option>
      <option value="国服学院,计算机科学">计算机科学</option>
      </optgroup>
     <optgroup label="数学学院">
      <option value="数学学院,应用数学">应用数学</option>
      <option value="数学学院,统计数学">统计数学</option>
      </optgroup>
     <optgroup label="音乐学院">
      <option value="音乐学院,钢琴">钢琴</option>
      <option value="音乐学院,美声">美声</option>
      </optgroup>
      <optgroup label="人文学院">
      <option value="人文学院,马克思">马克思</option>
      <option value="人文学院,中文">中文</option>
      </optgroup>
      <optgroup label="体育学院">
      <option value="体育学院,马拉松">马拉松</option>
      <option value="体育学院,田径">田径</option>
      </optgroup>

    </select>
  </div>
  
  <button type="submit" class="btn btn-primary" style="width:700px;height:40px; font-size:15px;margin-top:10px">Submit</button>
</form>


                     
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
