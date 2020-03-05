<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<!--
       			JQuery
        -->
		<link rel="icon" href="img/Download/bird.png"/>
		<link rel="stylesheet" type="text/css" href="css/Background.css" />
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.css" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>上传成功</title>
		<link href="css/style.css" rel="stylesheet" />

	</head>

	<body>
		<div class="headTop">
			<div style="width: 200px;height: 30px;float: left;" id="headname">
					<p style=" margin: 0px;">  <!-- 从这下面开始 -->
				<b style="text-decoration: none;">Ireader提醒您当前访问人数：<font color="red">${onLineNum }</font></b>
			</p>
			</div>
			<div id="msg_login" style="width: 420px;height: 30px;float: left;"></div>
			<div id="find" style="float: right;margin: 2px 0px 0px 0px; width: 220px;height: 30px;display:none">
				[
				<a style="margin: 0px;" href="">新用户注册</a>] [
				<a style="margin: 0px;" href="">找回密码</a>]&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</div>
			<span id="welcome">欢迎您进行下载，亲爱的，${name }</span>
			<div class="login" id="login_div" style="display:none">
			<form id="login_info" action="LoginServlet">
			<label>用户名</label>&nbsp<input type="text" class="account" id="account" />&nbsp
			<label>密 码</label>&nbsp<input type="password" class="account" id="login_password" />&nbsp
			<button type="button" style="color: white;" id="login"><font  style="color: white;text-decoration: none;">登录</font></button>
			</form>
			</div>
		</div>
		<div class="title_background">
			<img src="img/Admin_Control/bird.ico" style="height: 100%; width: 100px;padding-left: 250px;" />
			<img src="img/Admin_Control/ireader.png" style="height: 80%; width: 700px;padding-left: 150px;padding-bottom:11px;" />
			
		</div>

		<div class="navigation ">
			<div class="fixed">

			</div>
			<nav>
				<ul>
					<li style="padding-left: 100px;"></li>
					<li>
						<a href="index.jsp">首 页</a>
					</li>
					<li>
						<a href="">连线故事会</a>
						<ul>
							<li>
								<a href="">刊物导读</a>
							</li>
							<li>
								<a href="">作品赏析</a>
							</li>
							<li>
								<a href="">信息传真</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="">故事创作</a>
						<ul>
							<li>
								<a href="">世态</a>
							</li>
							<li>
								<a href="">情感</a>
							</li>
							<li>
								<a href="">幽默</a>
							</li>
							<li>
								<a href="">悬疑</a>
							</li>
							<li>
								<a href="">传奇</a>
							</li>
							<li>
								<a href="">怪谈</a>
							</li>
							<li>
								<a href="">励志</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="">网络故事</a>
						<ul>
					</li>
					<li>
						<a href="">情感驿站</a>
					</li>
					<li>
						<a href="">美丽心灵</a>
					</li>
					<li>
						<a href="">青春部落</a>
					</li>
					<li>
						<a href="">幽默段子</a>
					</li>
					</ul>
					<li>
						<a href="Admin_Login.jsp">管理员接口</a>
					</li>

					<li>
						<a href="Voucher_Center.jsp">去充值</a>
						
					</li>

					<li>
						<a href="Conversion.jsp">兑换</a>
					</li>
					<li>
						<a href="ToDownPageServlet">资源中心</a>
					</li>
					<li>
						<a href="UpPage.jsp">上传资源</a>
					</li>
					<li>
						<a href="ToMyResourceServlet">我的资源</a>
					</li>
					<li style="width: 100px;"> 
					
					</li>
					<form action="ToSearchServlet" style="width:0px;height:0px;float:right;padding-top:8px;">
					<input  type="search" name="to_search" required="" placeholder="Search" x-webkit-speech="" x-webkit-grammar="builtin:search" lang="zh-CN" class="account">&nbsp&nbsp<button type="submit" style="position: relative;"><a  style="color: white;text-decoration: none;">搜索</a></button>
					</form>
				</ul>
			</nav>
		</div>
		<!--
        	作者：1285984525@qq.com
        	时间：2018-11-28
        	描述：主体部分
       -->

		<div class="main-up">
			<div class="jumbotron" style="margin-top: 100px;height: 600px;">
				<h1 style="text-align: center; padding:45px;padding-top: 90px;">感谢您为爱阅共享做出的贡献！</h1>
				<form action="UpPage.jsp" method="post">

					<table class="up_list">
						<tbody>
							<tr>
								<td>
								<p style="font-size: 38px;margin: auto;text-align: center;">恭喜您！获得了8积分</p>
								</td>
							</tr>
							<tr></tr>
							<tr>
								<td><p style="font-size: 38px;margin: auto;text-align: center;">温馨提示： 越多的积分可以换取越多的下载卷哦！</p></td>
							</tr>
							<tr></tr>

							<tr>
								<td style="padding-left: 325px;padding-top: 10px;">
									<button type="submit" class="return" style="vertical-align:middle;height: 60px;"><span>返回 </span></button>
								</td>
							</tr>
						</tbody>
					</table>

				</form>
			</div>
		</div>
	</body>

</html>