<%@ page contentType="text/html; charset=UTF-8" language="java"  errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import ="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="myPac.infopac" %>
<%@ page import="myPac.DBConnection"%>
<%@ page import="identify.htmlText"%>
<%@ page import="identify.RandomUtil"%>

<%
String email="";
String username="";
email=(String)session.getAttribute("email");
username=(String)session.getAttribute("usernametemp");

if(username==(null)){
	username="";
}
if(email==(null)){
	email="";
}
String identifyCode=(String)session.getAttribute("identifycode");
if(identifyCode==(null)){
	identifyCode="";
}
%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>三因子认证</title>
   <link rel="stylesheet" href="CSS/bootstrap.min.css">
      <link rel="stylesheet" href="./style.css">
      <script src="CSS/sweetalert2@8"></script>
      <script src='CSS/bootstrap.min.js'></script>
      <script  src="./script.js"></script>
     
		
</head>
<body>
<!-- partial:index.partial.html -->
<h1 class="text-center">3 types of validation</h1>

<section>
        <div class="container">
            <div class="accordion" id="accordionExample">
                <div class="steps">
                    <progress id="progress" value=0 max=100 ></progress>
                    <div class="step-item">
                        <button class="step-button text-center" type="button" data-toggle="collapse"
                            data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            1           
                        </button>
                        <div class="step-title">
                            Email
                        </div>
                    </div>
                    <div class="step-item">
                        <button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                            data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            2
                        </button>
                        <div class="step-title">
                            UsbKey
                        </div>
                    </div>
                    <div class="step-item">
                        <button class="step-button text-center collapsed" type="button" data-toggle="collapse"
                            data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            3
                        </button>
                        <div class="step-title">
                            Password
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div  id="headingOne">
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                        data-parent="#accordionExample">
                        <div class="card-body">
                            <form class="needs-validation" novalidate>
                               <div class="form-group">
                                  <label for="exampleInputEmail1">Username</label>
                                  <input id="username" type="text" name="email" class="form-control"  aria-describedby="emailHelp" placeholder="Enter Username" value=<%=username%> >
                                </div>
                            
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input id="email" type="email" name="email" class="form-control"  aria-describedby="emailHelp" placeholder="Enter email" value=<%=email%>>
                                </div>
                    
                                  <button  class="btn btn-info" type="button" onclick="send()">send</button>
                                  <script>
                               
                                 function send(){
                                 var username=document.getElementById("username").value;
	                             var address=document.getElementById('email').value;
	                             var tempaddress="../sendmail4.jsp?email=";
	                             var finaladdress=tempaddress+address+"&username="+username;
	                             window.location.href=finaladdress;
                                 }
                               </script>
                                <br>
                                <br>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Identifying code</label>
                                  <input type="text" class="form-control" id="inputCode" name="inputCode" placeholder="please input the message you received" minlength="6" required>
                                  
                                </div>
                                
                           
                              
                                <button  class="btn btn-primary" type="button" onclick="indenify()">Submit</button>
                                    <script>
                               
	                             function indenify(){
	                                 var username=document.getElementById("username").value;
	                                 var idCode=document.getElementById("inputCode").value;
	                                 if(idCode=='<%=identifyCode%>'){
	                                     
	                                     window.location.href="checkfortrain.jsp?username="+username;
	                         
	                                 }
	                                 else{
	                                     Swal.fire({
                                         type: 'error',
                                         title: 'fail to login',
                                         text: 'Wrong identifying code',
   
                                     })
	                                 }
	                             }
                               </script>
                              </form>
                              
                        </div>
                    </div>
                </div>
                 <div class="card">
                    <div  id="headingTwo">
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                  <label for="disabledTextInput">型号列表</label>
                                    <select class="form-control" id="platform" name="academy">
                                        <option value="K5">K5</option>	
            							<option value="GM3000">GM3000</option>	
            							<option value="GM3000PCSC">GM3000PCSC</option>
            							<option value="K7">K7</option>		
            							<option value="TF">TF</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                  <label for="disabledTextInput">设备列表</label>
                                    <select class="form-control" id="sele_devices" name="academy">
                                    </select>
                                    <input type="button" value="查找" class="btn btn-primary btn-mini float-right" style="width: 60px;margin-top: 5px;height: 30px;line-height: 11px;" onClick="return enumDevice()"/>
                                </div>
                                 <div class="form-group">
                                  <label for="disabledTextInput">容器列表</label>
                                    <select class="form-control" id="sele_contentList" name="academy">
                                    </select>
                                    <input type="button" value="列举容器证书" class="btn btn-primary btn-mini float-right" style="width: 120px;margin-top: 5px;height: 30px;line-height: 11px;" onClick="return enumDevice()"/>
                                </div>
                                 <div class="form-group">
                                  <label for="disabledTextInput">用户密码</label>
                                  <input class="form-control" type="text" value="12345678" id="txt_pwd" name="pwd"/>
                                    <input type="button" value="登陆" class="btn btn-primary btn-mini float-right" style="width: 60px;margin-top: 5px;height: 30px;line-height: 11px;" onClick="return enumDevice()"/>
                                </div>
                                <div class="form-group">
                                  <label for="disabledTextInput">导出指定数字证书</label>
                                  <textarea class="form-control" id="cerInfo" row="3" cols="23" style="height:80px;width:950px"></textarea>
            					   <input type="button" value="导出"  class="btn btn-primary btn-mini float-right" style="width: 60px;margin-top: 5px;height: 30px;line-height: 11px;" onClick="return exportUserCert()"/>
                                </div>
                                 <div class="form-group">
                                  <label for="disabledTextInput">获取证书信息</label>
                                  <input class="form-control" type="text" value="12345678" id="txt_pwd" name="pwd"/>
                                    <input type="button" value="登陆" class="btn btn-primary btn-mini float-right" style="width: 60px;margin-top: 5px;margin-bottom:5px;height: 30px;line-height: 11px;" onClick="return enumDevice()"/>
                                </div>
                               
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div  id="headingThree">
                        
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                        data-parent="#accordionExample">
                        <div class="card-body">
                           <form>
   <a style="margin-top:6px" href="https://www.yyfandyy.xyz/train/landr/login.html" class="link">login by password</a>
   <a href="../log.jsp"></a>
   <script>
     function goHome(){
                         
                              var inputCode=document.getElementById("inputCode").value;
                              var email=document.getElementById("email").value;
                              var name=document.getElementById("name").value;
                              var password=document.getElementById("password1").value;
                              var address=document.getElementById("address").value;
                              var birthday=document.getElementById("birthday").value;
                              var whichclass=document.getElementById("class").value;
                             
                             if(name==""||email==""||password==""||address==""||birthday==""){
                                swal("提交失败！","信息未填写完整")
                                
                               
                                 
                             }
                             else{
                                 swal("欢迎！","welcome","success");
                                 window.location.href='http://www.yyfandyy.xyz/start/home.html';
                                 swal("欢迎！","welcome","success");
                             }
     }
   </script
</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



</body>
</html>
