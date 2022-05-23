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
  <link rel="stylesheet" href="./CSS/bootstrap.min.css">
    <link rel="stylesheet" href="./CSS/main_student.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>

<!-- Modal修改 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Info Change</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
 <form action="changeClassInfo.jsp" method="post"> 
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">班级编码</label>
    <div class="col-sm-10">
     <input type="text" class="form-control" name="ClassID" id="ClassID" placeholder="Class code" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">班级名称</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="ClassName" id="inputPassword" placeholder="Class name">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">系部</label>
    <div class="col-sm-10">
      <input type="text" name="DeptName" class="form-control" id="inputPassword" placeholder="Dept">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Teacher</label>
    <div class="col-sm-10">
     <select style="width:200px;height:30px;font-size:15px" name="TeacherName">
        <option value="null">null</option>
        <option value="程靖">程靖</option>
        <option value="沈丽">沈丽</option>
        <option value="陈玲">陈玲</option>
        <option value="李琳分">李琳分</option>
        <option value="龙永图">龙永图</option>
        <option value="韩汉">韩汉</option>
        <option value="沈天一">沈天一</option>
        <option value="曾远">曾远</option>
        <option value="黄三清">黄三清</option>
          </select>
    </div>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">修改</button>
      </div>
      </form>  
    </div>
  </div>
</div>

<!-- Modal添加 -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Add Class</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
 <form action="addClass.jsp" method="post"> 
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">班级编码</label>
    <div class="col-sm-10">
     <input type="text" class="form-control" name="ClassID" id="inputPassword" placeholder="Class code">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">班级名称</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="ClassName" id="inputPassword" placeholder="Class name">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">系部</label>
    <div class="col-sm-10">
      <input type="text" name="DeptName" class="form-control" id="inputPassword" placeholder="Dept">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Teacher</label>
    <div class="col-sm-10">
     <select style="width:200px;height:30px;font-size:15px" name="TeacherName">
        <option value="null">null</option>
        <option value="程靖">程靖</option>
        <option value="沈丽">沈丽</option>
        <option value="陈玲">陈玲</option>
        <option value="李琳分">李琳分</option>
        <option value="龙永图">龙永图</option>
        <option value="韩汉">韩汉</option>
        <option value="沈天一">沈天一</option>
        <option value="曾远">曾远</option>
        <option value="黄三清">黄三清</option>
          </select>
    </div>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-success">添加课程</button>
      </div>
      </form>  
    </div>
  </div>
</div>

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
     
     <li>
       <a href="main_admin_class.jsp">
         <i class='bx bx-edit' ></i>
         <span class="links_name">Class Manage</span>
       </a>
       <span class="tooltip">Class Manage</span>
     </li>
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
  
<div class="alert alert-dark" style="font-size:30px;height=20px;">班级信息维护</div>
<form action="main_admin_class.jsp" method="post" style="margin-left:20px">
  <div class="form-row align-items-center">
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect" style="font-size:25px">系部</label>
      <select name="limit" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="all">Choose</option>
        <option value="机电工程系">机电工程系</option>
        <option value="电子工程系">电子工程系</option>
        <option value="化纺工程系">化纺工程系</option>
        <option value="外语系">外语系</option>
        <option value="艺术设计系">艺术设计系</option>
        <option value="管理系">管理系</option>
        <option value="基础部">基础部</option>
        <option value="体育部">体育部</option>
      </select>
    </div>
    <div class="col-auto my-1">
      <button type="submit" class="btn btn-primary" style="font-size:10px;margin-top:40px">筛选</button>
    </div> <div class="col-auto my-1">
      <button  type="button" class="btn btn-success" style="font-size:10px;margin-top:40px" data-target="#exampleModalCenter2" data-toggle="modal">添加课程</button>
    </div>
  </div>
</form>


      <div class="text">
      <table class="table table-hover table-striped table-bordered">
		<tr style="width=20px;">
		<th>班级编码</th>
		<th>班级名称&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
	    <th>系部</th>
		<th>班主任&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
		<th>操作</th>
		<th>操作</th>
		</tr>

		<%
		   request.setCharacterEncoding("UTF-8");
		   String limit=request.getParameter("limit");
		   String sql;
       
		   ResultSet rs;
		   ResultSet rs1;
		   DBConnection dbCon=new DBConnection();
	       dbCon.createConnection();
	       if(limit==null||limit.equals("all"))
	        sql="select * from TB_Class,TB_Teacher,TB_Dept where TB_Class.TeacherID=TB_Teacher.TeacherID and TB_Dept.DeptID=TB_Class.DeptID";
	       else{
	           	String sqlfordept="select * from TB_Dept where TB_Dept.DeptName='"+limit+"'";
	            rs1=dbCon.queryForRS(sqlfordept);
	            rs1.next();
	            String DeptID=rs1.getString("DeptID");
	            sql="select * from TB_Class,TB_Teacher,TB_Dept where TB_Class.TeacherID=TB_Teacher.TeacherID and TB_Dept.DeptID=TB_Class.DeptID and TB_Class.DeptID='"+DeptID+"'";
	       }
	       
	       rs=dbCon.queryForRS(sql);
	       
			 while(rs.next()) {
			 
			 String ClassID=rs.getString("ClassID");
			 String ClassName=rs.getString("ClassName");
			 String DeptID=rs.getString("DeptName");
			 String TeacherID=rs.getString("TeacherName");
			
			%>
		<tr>
		
			<td><%=ClassID%></td>
			<td><%=ClassName %></td>
			
			<td><%=DeptID %></td>
			<td><%=TeacherID%></td>
			<td><button id=<%=ClassID%> value=<%=ClassID%> type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" onclick="myfunction('<%=ClassID%>')">修改</button></td>	
		    <td><button  type="button" class="btn btn-danger" onclick=show_confirm('<%=ClassID%>')>删除</button></td>	
		</tr>
			<%
			}
		%>
		
	</table></div>
	
	
	<ul style="margin-left:1cm" class="pagination pagination-lg">

		</ul>
	
  </section>
  <script>
        function myfunction(ClassID){
            var target=document.getElementById("ClassID");
            target.value=ClassID;
        }
		function show_confirm(ClassID)
		  {
		  var r=confirm("确定删除该课程？");
		  if (r==true)
		    {
			  location.href="deleteClass.jsp?ClassID="+ClassID;
		    }
		  else
		    {
		    alert("您已取消删除操作");
		    }
		  }
		</script>
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
