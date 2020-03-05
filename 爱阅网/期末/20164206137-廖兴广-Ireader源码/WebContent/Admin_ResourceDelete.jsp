<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function sub(){
	$('#delet_reource_form').form('submit', {
	    url: "Admin_ResourceDeleteServlet",
	    onSubmit: function(){
			// do some check
			// return false to prevent submit;
	    },
	    success:function(data){
	    		$.messager.show({
	    			title:'系统消息',
	    			msg:"删除资源: "+ $("#resource_name").val() + "成功",
	    			timeout:5000,
	    			showType:'slide'
	    		});
	    		$("#change").dialog("close");
// 	    		$("#resources").datagrid("reload");
    }
	});
}
</script>
	<form  id="delet_reource_form" >

		<br/>	
		<table>
			<tbody>
				<tr>
					<td style="text-align:center" ><font size=5>您确定要删除资源：</font>
					</td>
				</tr>
				<tr>
					<td style="text-align:center">资源id：   <input name="account"   type="text" readonly="readonly"></input>
					</td>
				</tr>
				<tr>
					<td style="text-align:center">资源名称：<input id="resource_name" name="name"   type="text" readonly="readonly"></input>
					</td>
				</tr>
				<tr>
					<td style="text-align:center">
					<button id="delet_btn"  type="button" style="cursor :pointer;width:72px;height:25px;" onclick="sub()" value="删除">删除</button>
					</td>
				</tr>
			</tbody>
			</table>
	</form>
</body>
</html>