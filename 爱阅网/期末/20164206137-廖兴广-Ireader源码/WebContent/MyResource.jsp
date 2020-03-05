<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<script src="JQuery/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="JQuery/jquery.js" type="text/javascript" charset="utf-8"></script>
		<!--
       			JQuery
        -->
		<link rel="icon" href="img/Download/bird.png"/>
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="css/Background.css" />
		<link href="css/testAnimotion.css" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>我的资源</title>
		<link href="css/style.css" rel="stylesheet" />
			</script>
		</script>
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
		</div>
		<!--
        	作者：1285984525@qq.com
        	时间：2018-11-28
        	描述：主体部分
       -->

			<div id="main-left">
				<!-- 数据库控制的资源 -->
			     <c:forEach items="${myResources}" var="i">
				<div class="read">
					<a target="_blank"   href=${i.getPart_file_path() }><img src=${i.getImg_path() } /></a>
					<div style="width: 386px;height: 26px;">
						<a target="_blank"   href=${i.getPart_file_path() } ><i id="full" class="fa fa-columns fa-2x"></i><a/>
						<h4 style="text-align: center;width: 306px;float: left;">${i.getResource_name()}</h4>
						<a href="DownloadServlet?resource_id=${i.getId() }&filepath=${i.getFile_path() }"><i id="down" class="fa fa-cloud-download fa-2x"></i><a/>
						
					</div>
				</div>
				</c:forEach>
				
			</div>
		
		</body>
</html>