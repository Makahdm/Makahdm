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

<!-- Modal -->
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
       
       
 <form action="changeUserInfo.jsp" method="post"> 
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
    <div class="col-sm-10">
     <input type="text" class="form-control" name="username" id="inputPassword" placeholder="User">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Password">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control" id="inputPassword" placeholder="Email">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">academy</label>
    <div class="col-sm-10">
     <select  name="academy">
        <option value="null">null</option>
        <option value="国服学院">国服学院</option>
         <option value="音乐学院">音乐学院</option>
          <option value="数学学院">数学学院</option>
           <option value="外国语学院">外国语学院</option>
            <option value="人文学院">人文学院</option>
             <option value="体育学院">体育学院</option>
          </select>
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Power</label>
    <div class="col-sm-10">
     <select  name="power">
 
        <option value="admin">&nbsp&nbspadmin</option>
         <option value="user">&nbsp&nbspuser</option>
         <option value="teacher">teacher</option>
          </select>
    </div>
  </div>
  

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
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
         <span class="links_name">My Info</span>
       </a>
       <span class="tooltip">Info</span>
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
  
  
      <div class="alert alert-dark" style="font-size:30px;height=20px;">所有用户列表</div>
<form action="main_admin_manage.jsp" method="post" style="margin-left:20px">
  <div class="form-row align-items-center">
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect" style="font-size:18px">权限</label>
      <select name="l1" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="null">Choose</option>
        <option value="admin">admin</option>
        <option value="user">user</option>
      </select>
    </div>
    <div class="col-auto my-1">
      <button type="submit" class="btn btn-primary" style="font-size:13px;margin-top:40px">筛选</button>
    </div>
  </div>
</form>
 <h3 style="margin-left:15px;margin-top:15px ">
            当前在线人数为：<%=application.getAttribute("count") %>
    </h3>

      <div class="text">
      <table class="table table-hover table-striped table-bordered">
		<tr style="width=20px;">
		    <th>序号</th>
			<th>用户名&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
			<th>密码(SM3加密)&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
			
			<th>邮箱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
			<th>所属学院</th>
			<th>权限&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
			<th>操作</th>
			<th>操作</th>
		</tr>

		<%
		
		   request.setCharacterEncoding("UTF-8");
	       ArrayList<Map<String, String>> files;
	       String l1=request.getParameter("l1");
		
		
		
		    int pageNow;
	        String pageNowtemp=(request.getParameter("pageNow"));
	        if (pageNowtemp==null){
	    	 pageNow=1;
	    }
	        else{
	    	pageNow=Integer.parseInt(pageNowtemp);
	    }
            int judge=0;
	        int pageSize=8;
	        int lineCount;
	        int pageCount;
			FileDAO dao = new FileDAO();
			files = dao.queryUser();
			if(l1==null){
				files = dao.queryUser();
				}
				else{
				 files = dao.queryuserlimit(l1);
				}
			lineCount=files.size();
			pageCount=lineCount % pageSize==0?lineCount/pageSize:lineCount/pageSize+1;
			int i=1;

			for (Map<String, String> file : files) {
				if(judge>=pageSize*(pageNow-1)&&judge<pageSize*pageNow){	
			%>
		<tr>
		
			<td><%=i %></td>
			<td><%=file.get("username") %></td>
			<td style="font-size:20%"><%=file.get("password") %></td>
			<td><%=file.get("email") %></td>
			<td><%=file.get("academy") %></td>
			<td><%=file.get("power") %></td>
			<td><button id=<%=file.get("username") %>  type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" value=<%=file.get("username") %>>
  修改
</button></td>	
		    <td><button  type="button" class="btn btn-danger" onclick=show_confirm('<%=file.get("username")%>')>删除</button></td>	
		    
	   <script>
		function show_confirm(username)
		  {
		  var r=confirm("确定删除该用户？");
		  if (r==true)
		    {
			  location.href="deleteuser.jsp?username="+username;
		    }
		  else
		    {
		    alert("您已取消删除操作");
		    }
		  }
		</script>
		</tr>
			<%
				}
			judge++;
			i++;
			}
		%>
		
	</table></div>
	
	<ul style="margin-left:1cm" class="pagination pagination-lg">
	
	
		<%
		for(int k=1;k<=pageCount;k++){
			
			%>
			<li><a href="main_admin_manage.jsp?pageNow=<%=k%>"><%=k %></a></li>
			<% 
		}
		
		%>
		</ul>
	
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
