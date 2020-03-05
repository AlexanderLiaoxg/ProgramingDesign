<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewpbort" content="width=device-width, initial-scale=1.0">
<title>爱阅管理员登陆接口</title>

<link rel="stylesheet" type="text/css" href="Admin_Login/Background/css/bootstrap.css">
<link rel="stylesheet" href="Admin_Login/Background/css/style.css">	
<link rel="icon" href="img/Download/bird.png"/>
<script src="js/Admin_login.js"></script>
<!-- Body-->
<link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href="Admin_Login/Login_Body/css/style.css" rel="stylesheet" type="text/css" media="all"/>

</head>
<body>

<div id="top-image">
  <div id="content" class="container center-block">
    <div class="jumbotron">
      <div class="container">
        <div class="login">
	<h2>爱阅阅读网站管理员登陆接口</h2>
	<div class="login-top">
		<h1>Admin 😁Login</h1>
		<form action="Admin_LoginServlet">
			<input type="text" value="User Id" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Id';}" name="account">
			<input type="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}" name="password">
	   
	    <div class="forgot">
	    	<a href="#" onclick="forgetPassword()">forgot Password</a>
	    	<input type="submit" value="Login">
	    </div> </form>
	</div>
	<div class="login-bottom">
		<h3>New User &nbsp;<a href="Register.jsp">Register</a>&nbsp Here</h3>
	</div>
</div>
      </div>
    </div>
  </div>
</div>

<script src="Admin_Login/Background/js/jquery.min.js"></script>
<script src="Admin_Login/Background/js/ios-parallax.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
  $('#top-image').iosParallax({
	movementFactor: 120
  });
});
</script>

</body>
</html>
