<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="css/Background.css" />
		<link rel="stylesheet" type="text/css" href="css/content.css" />
		<link rel="icon" href="img/Download/bird.png"/>
		<link rel="stylesheet" type="text/css" href="ReponsiveCss/Reponsive_Register.css"/>
		<script src="js/js.js">
		</script>
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.css"/>
		<meta charset="UTF-8">
		<title>注册</title>
	</head>
	<body>
		<div class="headTop">
			<div style="width: 200px;height: 30px;float: left;" id="headname">
					<p style=" margin: 0px;">  <!-- 从这下面开始 -->
				<b style="text-decoration: none;">Ireader提醒您当前访问人数：<font color="red">${onLineNum }</font></b>
			</p>
			</div>
			<div id="msg_login" style="width: 420px;height: 30px;float: left;"></div>
			<div id="find" style="float: right;margin: 2px 0px 0px 0px; width: 220px;height: 30px;">
				[
				<a style="margin: 0px;" href="Register.jsp">新用户注册</a>] [
				<a style="margin: 0px;" href="">找回密码</a>]&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</div>
			<span id="welcome"></span>
			<div class="login" id="login_div">
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
		<div class="mainBorder">
			<div class="content" id="bodyMent">
			<form action="RegisterSvaeServlet" id="info">
				<table border="0" cellspacing="" cellpadding="12px">
					<tr>
						<td>
							<label>
							<i class="fa fa-user-o"></i>&nbsp;&nbsp;用户名：</label>
							<input autofocus="autofocus" type="text" name="name" id="name" value="这里输入您的用户名" onfocus="clearTxT(event.srcElement)" onblur="checkName()"/>
						</td>
						<td ><div id="msg_name" style="width: 250px;height:22px;float="left""/></td>
					</tr>
					<tr>
						<td>
							<label><i class="fa fa-key"></i>&nbsp;&nbsp;密码：</label>
							<input type="password" name="password" id="password" value="123456" onfocus="clearTxT(this)" />
						</td>
						<td ><div id="msg_password" style="width: 250px;height:22px;float="left""/></td>
					</tr>
					<tr>
						<td>
							<label> <i class="fa fa-id-card"></i>&nbsp;&nbsp;身份证号：</label>
							<input required="required" type="text" name="idcard" id="idcard" value="这里输入您的身份证号" onfocus="clearTxT(this)" />
						</td>
						<td><div id="msg_idcard" style="width: 200px;height:30px;"></td>
					</tr>
					<tr>
						<td style="text-align: left;padding-left: 30px;">
							<label style="margin-left: 0px;"><i class="fa fa-mars"></i>&nbsp;&nbsp;性别：</label>
						</br><label id="sex" style="padding-left: 100px;">男</label>
							<input type="radio" name="sex" value="男" checked/> <label>女</label>
							<input type="radio" name="sex" value="女" />
						</td>
					</tr>
					
					<tr>
						<td style="text-align: left;padding-left: 30px;">
							<label><i class="fa fa-map-marker"></i>&nbsp;&nbsp;省份：</label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
							<select id="shengfeng" name="shengfen">
								<option value="安徽">安徽</option>
								<option value="北京">北京</option>
								<option value="重庆">重庆</option>
								<option value="福建">福建</option>
								<option value="甘肃">甘肃</option>
								<option value="广东">广东</option>
								<option value="广西">广西</option>
								<option value="贵州">贵州</option>
								<option value="海南">海南</option>
								<option value="河北">河北</option>
								<option value="河南">河南</option>
								<option value="黑龙江">黑龙江</option>
								<option value="湖北">湖北</option>
								<option value="湖南">湖南</option>
								<option value="吉林">吉林</option>
								<option value="江苏">江苏</option>
								<option value="江西">江西</option>
								<option value="辽宁">辽宁</option>
								<option value="内蒙古">内蒙古</option>
								<option value="宁夏">宁夏</option>
								<option value="青海">青海</option>
								<option value="山东">山东</option>
								<option value="山西">山西</option>
								<option value="陕西">陕西</option>
								<option value="上海">上海</option>
								<option value="四川">四川</option>
								<option value="天津">天津</option>
								<option value="西藏">西藏</option>
								<option value="新疆">新疆</option>
							</select>
						</td>
					 </tr>
							<tr>
								<td>
									<label><i class="fa fa-envelope"></i>&nbsp;&nbsp;电子邮箱：</label>
									<input type="text" name="email" id="email" value="e-mail" onclick="clearTxT(this)"/>
								</td>
								<td><div id="msg_email" style="width: 200px;height:30px;"></td>
							</tr>
							<tr>
								<td>
									<label><i class="fa fa-phone"></i>&nbsp;&nbsp;电话：</label>>
									<input type="text" name="phone" id="phone" value="十一位数" onclick="clearTxT(this)"/>
								</td>
								<td><div id="msg_phone" style="width: 200px;height:30px;"></td>
							</tr>
				</table>
<!-- 							<script type="text/javascript" src="ue/utf8-jsp/ueditor.config.js"> -->
<!-- 	</script> -->
	<label id="gerenjianjie" style="padding-left: 250px;"><strong>个人简介：</strong></label><br><br>
	<!--
    	作者：1285984525@qq.com
    	时间：2019-01-04
    	描述：隐藏的文本框
    -->
	<label id="txtspace" style="padding-left: 40px;margin: auto;"></label>
	<input name="txt" id="txt" type="text" style="display:block;height:90px;width:38%;margin: auto;"/>
	<br/>

<div id="tijiao"style="margin: 30px 50%;height: 100px; width: 100%;">
		<button type="button" style="color: white;cursor:pointer;" id="is_finish" ><font  style="color: white;text-decoration: none;"/>提交</button>
	</div>
		</div>
</form>
	</body>

</html>