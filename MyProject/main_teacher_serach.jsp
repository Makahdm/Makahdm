<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="myPac.FileDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*"%>
<%@page import="myPac.DBConnection"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./CSS/tablestyle.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" >
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
       <a href="main_teacher.jsp">
        <i class='bx bx-edit' ></i>
         <span class="links_name">Input Score</span>
       </a>
       <span class="tooltip">Input Score</span>
     </li>
         <li>
       <a href="https://www.yyfandyy.xyz/main_teacher_serach.jsp">
          <i class='bx bx-table' ></i>
         <span class="links_name">Score Record</span>
       </a>
       <span class="tooltip">Score Record</span>
     </li>
     <li class="profile">
         
        <a href="log.jsp">
         <span class="links_name">Exit</span>
         <i class='bx bx-log-out' id="log_out" ></i>
           </a>
     </li>
    </ul>
  </div>
  
  <%
    DBConnection dbCon=new DBConnection();
	dbCon.createConnection();
    ResultSet rs2;
    request.setCharacterEncoding("UTF-8");
    String TI=(String)session.getAttribute("username");
    String sqlforteacher="select * from TB_Teacher where TB_Teacher.TeacherID='"+TI+"'";
	rs2=dbCon.queryForRS(sqlforteacher);
	rs2.next();
	String TeacherName=rs2.getString("TeacherName");
  %>
  
  <section class="home-section">
      <div class="alert alert-dark" style="font-size:20px;height=20px;text-align:center;">课程班分数查询</div>
      <div class="text">
      
      <form action="main_teacher_serach.jsp" method="post" style="margin-left:20px;margin-bottom:15px">
  <div class="form-row align-items-center">
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect" style="font-size:18px">教师</label>
      <input type="text" class="form-control" value=<%=TeacherName%> id="exampleInputEmail1" style="height:26px" readonly="readonly">
    </div>
 
    <div  class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect" style="font-size:18px">课程名称</label>
      <select name="limit" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
      
         <%
          
		   String sql;
		   ResultSet rs;
	       sql="SELECT * FROM TB_CourseClass TCC,TB_Course TC WHERE TCC.CourseID=TC.CourseID AND TeacherID='"+TI+"'";
	        rs=dbCon.queryForRS(sql);
	       
			 while(rs.next()) {
			 
			 String CourseName=rs.getString("CourseName");
			 String CourseClassID=rs.getString("CourseClassID");
			 String TeachingPlace=rs.getString("TeachingPlace");
			 String TeachingTime=rs.getString("TeachingTime");
			%>
			 <option value=<%=CourseClassID%>><%=CourseName+"||"+TeachingPlace+"||"+TeachingTime%></option>
			
			<%}%>
       
      </select>
    </div>
    
    <div class="col-auto my-1" >
      <button type="submit" class="btn btn-primary" style="font-size:16px;margin-top:35px">查询</button>
    </div>
  </div>
</form>
     
      	
      
      <table class="table table-hover table-striped table-bordered">
		<tr>
		    <th style="width:160px">学号</th>
			<th style="width:135px">姓名</th>
			<th style="width:135px">平时成绩</th>
			<th style="width:135px">期中成绩</th>
			<th style="width:135px">期末成绩</th>
			<th style="width:135px">总评成绩</th>
		</tr>
        <%  
	    String limit=request.getParameter("limit");
	    if(limit==null){
		sql="SELECT TG.StuID,StuName,CommonScore,MiddleScore,LastScore,TotalScore FROM TB_Grade TG,TB_Student TS WHERE TG.StuID=TS.StuID ";
		}
		else{
		    
	    sql="SELECT TG.StuID,StuName,CommonScore,MiddleScore,LastScore,TotalScore FROM TB_Grade TG,TB_Student TS WHERE TG.StuID=TS.StuID AND CourseClassID='"+limit+"'";    
		}
		rs=dbCon.queryForRS(sql);
	     
			 while(rs.next()) {
			 
			 String StuID=rs.getString("TG.StuID");
			 String StuName=rs.getString("StuName");
			 String CommonScore=rs.getString("CommonScore");
			 String MiddleScore=rs.getString("MiddleScore");
			 String LastScore=rs.getString("LastScore");
			 String TotalScore=rs.getString("TotalScore");
			
			%>
		<tr>
			<td><%=StuID %></td>
			<td><%=StuName %></td>
			<td><%=CommonScore %></td>
			<td><%=MiddleScore %></td>
			<td><%=LastScore %></td>
			<td><%=TotalScore %></td>
		</tr>
	
			<%
			}
			dbCon.close();
		%>
		
	</table>
      </div>
	
<div id="container" style="min-width:400px;height:300px"></div>
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
