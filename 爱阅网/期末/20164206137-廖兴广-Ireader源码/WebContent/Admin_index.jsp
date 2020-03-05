<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
		<link rel="icon" href="img/Download/bird.png"/>
		<script src="easyui/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="easyui/jquery.easyui.min.js" type="text/javascript" charset="utf-8"></script>
		<sript type="te"></sript>
		<meta charset="utf-8" />
		<title>爱阅阅读网站管理系统</title>
	</head>
	<body>
		
		<script type="text/javascript">
			$(function(){
				$('#main_tree').tree({
					onClick:function(node){
						if($("#main_tabs").tabs("getTab",node.text)==null){
							$('#main_tabs').tabs('add',{
								title:node.text,
								selected:true,
								cache:true,
								closable:true,
								href:node.attributes.fileName	
							})
						}
					}
				})
			})
			
		</script>
		
		
	<body class="easyui-layout">
		<!--布局的一个属性：split不仅有线条的功能，页涵盖了是否能够变换控制,dataoption里面的*/-->
    <div data-options="region:'north',title:'爱阅阅读网站管理系统'" style="height:100px;">
    	<div style="width: 400px; height: 100%;float: left;">
    		<img src="img/Download/logo.png" style="width: 50%;height: 100%;float: right;">
    	</div>
    	<div style="width: 800px; height: 100%;float: left;">
    		<img src="img/Admin_Control/ireader.png" style="width: 100%;height: 100%;float: right;padding-left: 250px;">
    	</div>
    	
    </div>
    <div data-options="region:'south',title:'底部声明'" style="height:100px;">
    	<div style="width: 100%; height: 100%; color: gray; line-height: 70px;text-align: center;">Copyright&copy;2018爱阅阅读网站</div>
    </div>
    <div data-options="region:'west',title:'菜单'" style="width:200px;">
    	<ul id="main_tree">
    	   <c:forEach items="${menus}" var="i">
							    <li data-options="attributes:{'fileName':'${i.getFileName() }'}"><span><a href="#">${i.getText()}</a></span></li> <!-- 这里设置了菜单的子文件(面板)路径 -->
				</c:forEach>
    	</ul>
    </div>
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
    	<!--
        	作者：1285984525@qq.com
        	时间：2019-01-02
        	描述：选项卡
        -->
    	<div id="main_tabs" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true"><!-- tab栏 -->
    <div title="欢迎您，亲爱的管理员" style="padding:20px;display:none;">
		
    </div>

</div>
    </div>
</body>
		
	</body>
</html>
