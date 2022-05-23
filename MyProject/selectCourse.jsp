<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
    <meta charset="UTF-8">
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="myPac.classInfo" %>
<%@ page import="myPac.FileDAO" %>


<%  
   int temp =0;
    String course_id=request.getParameter("course_id");
    String student_name=(String)session.getAttribute("username");
    String course_name=request.getParameter("course_name");
    String coursefrom=request.getParameter("coursefrom");
    String coursetype=request.getParameter("coursetype");
    String teacher=request.getParameter("teacher");
    String course_time=request.getParameter("course_time");
    String course_time2=request.getParameter("course_time2");
    String credits=request.getParameter("credits");
    String capacity=request.getParameter("capacity");
    FileDAO dao=new FileDAO();
    dao.insert(student_name,course_name,coursefrom,coursetype,teacher,course_time,course_time2,credits,course_id);
    
    
    temp=Integer.parseInt(capacity);
    temp--;
    capacity=temp+"";
    DBConnection db=new DBConnection();
    db.createConnection();
    String sql="update course set capacity='"+capacity+"'where course_name='"+course_name+"' and course_id>0";
    db.update(sql);
    db.close();
    
    out.print("<script language='javascript'>alert('已添加课程');window.location.href='main_student.jsp';</script>");
    
%>
    
   
