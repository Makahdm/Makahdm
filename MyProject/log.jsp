<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="java.sql.*"%>
<%@ page import="myPac.DBConnection"%>
<%@ page import="myPac.classInfo" %>
<%@ page import="myPac.FileDAO" %>


<%
session.invalidate();
request.setCharacterEncoding("utf-8"); 
String username = ""; 
String password = ""; 
Cookie[] cookies = request.getCookies(); 
if(cookies != null && cookies.length > 0) { 
    for(Cookie c:cookies) { 
        if(c.getName().equals("usernameCookie")) { 
            username = c.getValue();
        } else if(c.getName().equals("passwordCookie")) { 
            password = c.getValue();
        } 
    } 
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

<link rel="stylesheet" href="./CSS/style.css">
<link rel="stylesheet" media="(max-width: 400px)" href="./CSS/style2.css">
<link rel="stylesheet" media="(min-width: 400px)" href="./CSS/style.css">
</head>
<body>
<div class="container right-panel-active">
   
    <div class="container_form container--signup">
        <form action="signup" class="form" id="form1" method="post" οnSubmit="return finalcheck();">
            <h2 class="form_title">Sign Up</h2>
            <input id="user" type="text" placeholder="User" class="input" name="username"  onblur="checkoutusername()" />
            <span id="hint"></span>
            <input id="em" type="email" placeholder="Email" class="input" name="email"  onblur="checkoutemail()"/>
            <span id="hint2"></span>
            <input id="psd" type="password" placeholder="Password" class="input" name="password" onblur="checkoutpassword()"/>
            <span id="hint3"></span>
            <button type="submit" class="btn" id="temp" onclick="return finalcheck();">Sign Up</button>
        </form>
    </div>


    <div class="container_form container--signin">
        <form action="login" class="form" id="form2">
            <h2 class="form_title">Log In</h2>
            <input type="text" placeholder="User" class="input" name="username" value="<%=username%>"/>
            <input type="password" placeholder="Password" class="input" name="password" value="<%=password%>"/>
          
            <div style="margin-top:15px" class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="remember" value="true">
            <label class="form-check-label" for="flexSwitchCheckDefault">Remember Password?</label>
            </div>
            <button class="btn">Sign In</button>
            <table style="margin-top:15px"><tr>
            <td><a href="https://github.com/login/oauth/authorize?client_id=622f961167ad4e5a091b&redirect_uri=https://www.yyfandyy.xyz/authorize/redirect" class="link"><img style="margin-right:15px" src=github.png border=0></a></td>
            <td><a href="Security/index.jsp" class="link"><img src=email.png></a></td>
            </tr></table>
        </form>
          
    </div>

  
    <div class="container_overlay">
        <div class="overlay">
            <div class="overlay_panel overlay--left">
                <button class="btn" id="signIn">Log In</button>
            </div>
            <div class="overlay_panel overlay--right">
                <button class="btn" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>




<!-- partial -->
 <script>
 const temp = document.getElementById("temp");
 const signInBtn = document.getElementById("signIn");
 const signUpBtn = document.getElementById("signUp");
 const firstForm = document.getElementById("form1");
 const secondForm = document.getElementById("form2");
 const container = document.querySelector(".container");


 signInBtn.addEventListener("click",function(){
 	container.classList.remove("right-panel-active");
 });
 signUpBtn.addEventListener("click", function(){
 	container.classList.add("right-panel-active");
 });

 function myfun(){
	 
	 container.classList.remove("right-panel-active");
 }
 window.onload = myfun;
 
 function checkoutusername(){
		
		var value=document.getElementById("user").value;
		var hint=document.getElementById("hint");
		if(value.length==0){
			hint.innerHTML="it is empty"
	        return false;
		}
		else{
			hint.innerHTML="";
		}
		
	}
 function checkoutemail(){
		
		var value=document.getElementById("em").value;
		var hint2=document.getElementById("hint2");
		if(value.length==0){
			hint2.innerHTML="it is empty"
	        return false;
		}
		else{
			hint2.innerHTML="";
		}
		
	}
 function checkoutpassword(){
		
		var value=document.getElementById("psd").value;
		var hint3=document.getElementById("hint3");
		if(value.length==0){
			hint3.innerHTML="it is empty"
	        return false;
		}
		else{
			hint3.innerHTML="";
		}
		
	}
 function finalcheck(){
	    checkoutusername();
	    checkoutemail();
	    checkoutpassword();
	  return (checkoutusername()&&checkoutemail()&&checkoutpassword());
	}

 </script>
</body>
</html>