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
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
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
  
   <!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top:50px;padding:150px">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Info Look</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
       
 <form action="changeClassInfo.jsp" method="post"> 
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label" >课程编号</label>
    <div class="col-sm-10">
     <input id="courseid" type="text" class="form-control" name="courseid" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">课程名称</label>
    <div class="col-sm-10">
     <input id="coursename" type="text" class="form-control" name="coursename" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">开设学期</label>
    <div class="col-sm-10">
      <input id="startfrom" type="text" class="form-control" name="startfrom" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">课程类型</label>
    <div class="col-sm-10">
      <input id="coursetype" type="text" name="coursetype" class="form-control" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">教师</label>
    <div class="col-sm-10">
      <input id="teacher" type="text" name="teacher" class="form-control"  readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">上课时间</label>
    <div class="col-sm-10">
      <input id="coursetime1" type="text" name="coursetime1" class="form-control" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">上课节次</label>
    <div class="col-sm-10">
      <input type="text" name="coursetime2" class="form-control" id="coursetime2" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">学分</label>
    <div class="col-sm-10">
      <input type="text" name="credit" class="form-control" id="credit" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">前置课程</label>
    <div class="col-sm-10">
      <input type="text" name="limitcourse" class="form-control" id="limitcourse" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">适用专业</label>
    <div class="col-sm-10">
      <input type="text" name="limitmajor" class="form-control" id="limitmajor" readonly="readonly">
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">课程介绍</label>
    <div class="col-sm-10">
      <input type="text" name="intro" class="form-control" id="intro" readonly="readonly">
    </div>
  </div>
  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
      </form>  
    </div>
  </div>
</div>
  
  
  
  <section class="home-section">
 
      <div class="alert alert-dark" style="font-size:30px;height=20px;">课程列表</div>
     
 <form action="main_student.jsp" method="post" style="margin-left:20px;margin-bottom:15px">
  <div class="form-row align-items-center">
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect" style="font-size:18px">开设学院</label>
      <select name="l1" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="null">Choose</option>
        <option value="国服学院">国服学院</option>
        <option value="音乐学院">音乐学院</option>
        <option value="数学学院">数学学院</option>
        <option value="人文学院">人文学院</option>
        <option value="外国语学">外国语学院</option>
        <option value="体育学院">体育学院</option>
      </select>
    </div>
    
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect" style="font-size:18px">课程类型</label>
      <select name="l2" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
       <option value="null">Choose</option>
        <option value="通识课">通识课</option>
        <option value="选修课">选修课</option>
        <option value="必修课">必修课</option>
      </select>
    </div>
    
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect" style="font-size:18px">课程时间</label>
      <select name="l3" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="null">Choose</option>
        <option value="Monday">Monday</option>
        <option value="Tuesday">Tuesday</option>
        <option value="Wednesday">Wednesday</option>
        <option value="Thursday">Thursday</option>
        <option value="Friday">Friday</option>
     
      </select>
    </div>
    
    <div class="col-auto my-1">
      <button type="submit" class="btn btn-primary" style="font-size:18px;margin-top:20px">筛选</button>
    </div>
  </div>
</form>
     
                        
      <div class="text">
      <table class="table table-hover table-striped table-bordered">
		<tr>
		    <th>序号</th>
			<th>课程编号</th>
			<th>课程名</th>
			<th>开设学院</th>
			<th>开设学期</th>
			<th>课程类型</th>
			<th>教师</th>
			<th>上课时间</th>
			<th>上课节次</th>
			<th>学分</th>
			<th>容量</th>	
			<th>适用专业</th>
			<th>操作</th>
			<th>操作</th>
		</tr>

		<%
		    request.setCharacterEncoding("UTF-8");
		    ArrayList<Map<String, String>> files;
		    String l1=request.getParameter("l1");
    		String l2=request.getParameter("l2");
    		String l3=request.getParameter("l3");
		    int flag2=0;
		    int flag=1;
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
		    
		    String username=(String)session.getAttribute("username");	
		    String selectedtime1;
		    String selectedtime2;
		    String course_name;
		    String coursefrom;
		    String coursetype;
		    String teacher;
		    String course_time;
		    String course_time2;
		    String credits;
		    String capacity;
		    String course_id;
			FileDAO dao = new FileDAO();
			if(l1==null){
		     files = dao.queryAll();
			}
			else{
			 files = dao.querylimit(l1,l2,l3);
			}
			//判断该时间段是否有课
			ArrayList<Map<String, String>> selectedlists = dao.queryMycourse(username);
			ArrayList<Map<String, String>> limitcourselists = dao.queryLearned(username);
			lineCount=files.size();
			pageCount=lineCount % pageSize==0?lineCount/pageSize:lineCount/pageSize+1;
			
			
			
			int i=1;

			for (Map<String, String> file : files) {
				flag2=0;
			    String k="";
				course_name=file.get("course_name");
				coursefrom=file.get("coursefrom");
				coursetype=file.get("coursetype");
				teacher=file.get("teacher");
				course_time=file.get("course_time");
				course_time2=file.get("course_time2");
			    credits=file.get("credits");
			    capacity=file.get("capacity");
			    course_id=file.get("course_id");
			    String qid=file.get("qid");
			    String limitcourse=file.get("limitcourse");
			    String limitmajor="";
			    limitmajor=file.get("limitmajor");
			    String startfrom=file.get("startfrom");
			    flag=1;
			    k=limitmajor;
			    if(limitmajor.equals("null")||limitmajor==null||limitmajor.equals("")){
			    	
			    	limitmajor=tempAcademy;
			    }
			    if(!limitmajor.equals(tempAcademy)){
			    	flag=0;
			    	System.out.println(limitmajor);
			    	System.out.println(tempAcademy);
			    }
			     if(limitcourselists.size()==0){
			    	flag2=1;
			    }
			    for(Map<String,String> limitcourselist:limitcourselists){
			    	String learnedcourse=limitcourselist.get("course_name");
			    	System.out.println(learnedcourse);
			    	System.out.println(limitcourse);
			    	if(learnedcourse.equals(limitcourse)){
			    		flag2=1;
			    	}
			    	if(limitcourse==null||limitcourse.equals("")||limitcourse.equals("null")){
			    		flag2=1;
			    		
			    	}
			    	System.out.println(flag2);
			    	
			    }
			    
			    for(Map<String,String> selectedlist:selectedlists){
					 selectedtime1=selectedlist.get("course_time1");
					 selectedtime2=selectedlist.get("course_time2");
					 if(selectedtime1.equals(course_time)&&selectedtime2.equals(course_time2)){
						 
						flag=0;
					 }
					}
					
			    
			    if(judge>=pageSize*(pageNow-1)&&judge<pageSize*pageNow){
			    	
			%>
		<tr>
			<td><%=i %></td>
			<td><%=qid %></td>
			<td><%=course_name %></td>
			<td><%=coursefrom %></td>
			<td><%=startfrom %></td>
			<td><%=coursetype %></td>
			<td><%=teacher %></td>
			<td><%=course_time%></td>
			<td><%=course_time2 %></td>
			<td><%=credits %></td>
			<td><%=capacity %></td>
		
			<td><%=k %></td>
			 <td><button  type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModalCenter" onclick=showlog('<%=file.get("qid")%>','<%=file.get("course_name")%>','<%=file.get("startfrom")%>','<%=file.get("coursetype")%>','<%=file.get("teacher")%>','<%=file.get("course_time")%>','<%=file.get("course_time2")%>','<%=file.get("credits")%>','<%=file.get("limitcourse")%>','<%=file.get("limitmajor")%>','<%=file.get("intro")%>')>查看详情</button></td>
		<%if(flag==1&&flag2==1) { %>
		<td><button type="button" class="btn btn-success" onclick=location.href="selectCourse.jsp?course_name=<%=course_name%>&coursefrom=<%=coursefrom%>&coursetype=<%=coursetype%>&teacher=<%=teacher%>&course_time=<%=course_time %>&course_time2=<%=course_time2 %>&credits=<%=credits %>&capacity=<%=capacity %>&course_id=<%=course_id %>">添加课程</button></td>
		<%} else{ %>
		<td><button type="button" class="btn btn-danger">不能添加</button></td>
		<%
		}%>	
		<%//dao.insert(course_name,coursefrom,coursetype,teacher,course_time,course_time2,credits,capacity);%>

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
			<li><a href="main_student.jsp?pageNow=<%=k%>"><%=k %></a></li>
			<% 
		}
		
		%>
		</ul>

  </section>
   <script src='https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js'></script>
  <script>
  
  function showlog(t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10){
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
