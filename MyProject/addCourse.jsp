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
   classInfo result=(classInfo)application.getAttribute("classlist");
   Connection conn=null;
   Statement stmt=null;
  
   ResultSet rs;
    int flag=1;
    int i=0;
    
	DBConnection dbCon=new DBConnection();
	dbCon.createConnection();
	
	String classfrom=result.getCoursefrom();
	if(classfrom==null){
		classfrom=(String)session.getAttribute("tempAcademy");
	}
	String classtype=result.getCoursetype();
	String classtime1=result.getCoursetime();
	String classtime2=result.getCoursetime2();
	String classname=result.getCoursename();
	String teachername=result.getTeachername();
	String credit=result.getCredit();
	String capacity=result.getCapacity();
	
	String qid=result.getQid();
	String limitcourse=result.getLimitcourse();
	String limitmajor=result.getLimitmajor();
	String startfrom=result.getStartfrom();
	String info=result.getInfo();
	
	String sql = "insert into course(course_name,coursefrom,coursetype,teacher,credits,capacity,course_time,course_time2,qid,limitcourse,limitmajor,startfrom,intro) values('"+classname+"','"+classfrom+"',+'"+classtype+"',+'"+teachername+"',+'"+credit+"',+'"+capacity+"',+'"+classtime1+"',+'"+classtime2+"',+'"+qid+"',+'"+limitcourse+"',+'"+limitmajor+"',+'"+startfrom+"',+'"+info+"')";
	
	String academy=(String)session.getAttribute("academy");
	if(academy==null){
		academy="all";
	}
	if(academy.equals("all")){
		academy=classfrom;
	}
	if(academy.equals(classfrom)){
		i=dbCon.update(sql);	
		out.print("<script language='javascript'>alert('添加成功');window.location.href='main_admin.jsp';</script>");
	}
	else{
    out.print("<script language='javascript'>alert('您不能添加其他学院的课程');window.location.href='main_admin.jsp';</script>");
	}
	dbCon.close();
%>
    
   
