<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
    <meta charset="UTF-8">
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="myPac.classInfo" %>


<%  
int temp =0;
String capacity=null;
String student_name=(String)session.getAttribute("username");
String course_name=request.getParameter("course_name");

DBConnection db=new DBConnection();
db.createConnection();
String sql="delete from course_selected_info where student_name='"+student_name+"'and course_name='"+course_name+"'";
db.update(sql);

String sql2="select * from course";
ResultSet rs=db.queryForRS(sql2);
while(rs.next()){
	
	String course=rs.getString("course_name");
	if(course.equals(course_name)){
    capacity=rs.getString("capacity");
    temp=Integer.parseInt(capacity);
    temp++;
    capacity=temp+"";
    break;
	}
	
}
String sql3="update course set capacity='"+capacity+"'where course_name='"+course_name+"' and course_id>0";

db.update(sql3);
db.close();

out.print("<script language='javascript'>alert('已退选课程');window.location.href='main_student_mycourse.jsp';</script>");
    
%>
    
   
