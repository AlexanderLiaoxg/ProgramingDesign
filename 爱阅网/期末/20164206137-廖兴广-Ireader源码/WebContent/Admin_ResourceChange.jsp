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
	$('#resource_change_form').form('submit', {
	    url: "Admin_ResourceChangeServlet",
	    onSubmit: function(){
			// do some check
			// return false to prevent submit;
	    },
	    success:function(data){
 	    		$.messager.show({
 	    			title:'系统消息',
 	    			msg:"修改用户: "+ $("#resource_name").val() + "成功",
 	    			timeout:5000,
 	    			showType:'slide'
 	    		});
 	    		$("#change").dialog("close");
//  	    		$("#resources").datagrid('reload');
	    }
	});
}
</script>
	<form  id="resource_change_form" >
		<table>
			<tbody>
				<tr>
					<td>资源号：
					<td />
 					<td><input type="text" name="id" readonly="readonly"/></td><!--不可修改 -->
				</tr>
				<tr>
					<td>资源名名称：
					<td />
					<td><input type="text" name="name" id="resource_name"/></td>
				</tr>
				<tr>
					<td>资源类别：
					<td />
					<td><select id="type" name="type">
							<option value="文学">文学</option>
								<option value="军事">军事</option>
								<option value="工科">工科</option>
								<option value="外语">外语</option>
					</select></td>
					<td>
						<div name="msg_change"></div>
					</td>
				</tr>
				<tr>
					<td>资源价值：
					<td />
					<td><input type="text" name="value" /></td>
				</tr>
				<tr>
					<td>试阅资源：
					<td />
					<td><input type="text" name="part_file_path" /></td>
				</tr>
				<tr>
					<td>资源路径：
					<td />
					<td><input type="text" name="file_path" /></td>
					<td>
						<button type="button" onclick="sub()" id="tochage">修改</button>
					</td>
				</tr>

				<!-- <tr><td>vip到期时间：<td/><td><input type="date"/></td><td> <div name="msg_change"></div></td></tr> -->
				<tr>
					<td>封面路径：
					<td />
					<td><input type="text" name="img_path"/></td>
				</tr>
				<tr>
					<td>上传账户：
					<td />
					<td><input type="text" name="up_account"/></td>
				</tr>
				<tr>
					<td>上传者：
					<td />
					<td><input type="text" name="up_user"/></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>