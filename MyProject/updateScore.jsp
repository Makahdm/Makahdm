<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8");%> 
    <meta charset="UTF-8">
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>



<%  
    request.setCharacterEncoding("utf-8");
    int i=0;
    String sql1,sql2,sql3,sql4,sql5,temp="";
    String cursor;
	DBConnection dbCon=new DBConnection();
	dbCon.createConnection();
	double CommonScore;
	double MiddleScore;
	double LastScore;
	double GradeSeedID;
	double TotalScore;
	String[] ScoreList = new String[500];
	String[]  GradeSeedIDList = new String[500];
	
	int length=(int)session.getAttribute("i");
	GradeSeedIDList=(String[])session.getAttribute("GradeSeedIDList");

      for(int j=0;j<length;j++){
      cursor="input"+j;
      ScoreList = request.getParameterValues(cursor);
      TotalScore=Double.parseDouble(ScoreList[0])*0.3+Double.parseDouble(ScoreList[1])*0.1+Double.parseDouble(ScoreList[2])*0.6;
      sql1= "update TB_Grade set CommonScore='"+ScoreList[0]+"' where GradeSeedID='"+GradeSeedIDList[j]+"'";
      i=dbCon.update(sql1);	
      sql2="update TB_Grade set MiddleScore='"+ScoreList[1]+"' where GradeSeedID='"+GradeSeedIDList[j]+"'";
      i=dbCon.update(sql2);	
      sql3="update TB_Grade set LastScore='"+ScoreList[2]+"' where GradeSeedID='"+GradeSeedIDList[j]+"'";
      i=dbCon.update(sql3);	
      sql4="update TB_Grade set TotalScore='"+TotalScore+"' where GradeSeedID='"+GradeSeedIDList[j]+"'";
      i=dbCon.update(sql4);	
      if(ScoreList.length>3){
      temp="L";
      sql5="update TB_Grade set LockFlag='"+temp+"' where GradeSeedID='"+GradeSeedIDList[j]+"'";
      i=dbCon.update(sql5);
      }
      ScoreList=null;
      }
    
	dbCon.close();
%>
    
   <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Details modal</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
</head>

<body onload="myFunction()" >
    <script>
    
    <% int flag=1;
    if(flag==1){%>
    
    function myFunction(){
        Swal.fire({

  type: 'success',
  title: 'update score successfully',
  showConfirmButton: false,
  timer: 2000
})
setTimeout("location.href='main_teacher.jsp'",1000);
    }
    <%}%>
    
      <% if(flag==0){%>
    
    function myFunction(){
    Swal.fire({
  type: 'error',
  title: 'fail to login',
  text: 'Wrong password',
  
})
setTimeout("location.href='login.html'",1000);
    }
    <%}%>
    
    </script>
</body>

</html>
