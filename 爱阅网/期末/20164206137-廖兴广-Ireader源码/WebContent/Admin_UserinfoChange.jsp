<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 利用easyui自带的ajax方法不需要写原生的了！T T感动 ajax -->
<script type="text/javascript">
function sub(){
	$('#change_form').form('submit', {
	    url: "Admin_UserinfoChangeServlet",
	    onSubmit: function(){
			// do some check
			// return false to prevent submit;
	    },
	    success:function(data){
 	    		$.messager.show({
 	    			title:'系统消息',
 	    			msg:"修改用户: "+ $("#name").val() + "成功",
 	    			timeout:5000,
 	    			showType:'slide'
 	    		});
 	    		$("#change").dialog("close");
	    }
	});
}
</script>
	<form  id="change_form" >
		<table>
			<tbody>
				<tr>
					<td>账户：
					<td />
					<td><input type="text" id="" name="account"/></td>
				</tr>
				<tr>
					<td>名称：
					<td />
					<td><input type="text" name="name" id="name"/></td>
				</tr>
				<tr>
					<td>性别：
					<td />
					<td><label>男</label><input type="radio" name="sex" value="男"
						checked /> <label>女</label> <input type="radio" name="sex"
						value="女" /></td>
				</tr>
				<tr>
					<td>身份证：
					<td />
					<td><input type="text" name="idcard" /></td>
				</tr>
				<tr>
					<td>邮箱：
					<td />
					<td><input type="text" name="email" /></td>
					<td>
						<button type="button" onclick="sub()" id="tochage">修改</button>
					</td>
				</tr>
				<tr>
					<td>省份：
					<td />
					<td><select id="shengfen" name="shengfen">
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
					</select></td>
					<td>
						<div name="msg_change"></div>
					</td>
				</tr>
				<!-- <tr><td>vip到期时间：<td/><td><input type="date"/></td><td> <div name="msg_change"></div></td></tr> -->
				<tr>
					<td>个性签名：
					<td />
					<td><input type="text" name="txt"/></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>