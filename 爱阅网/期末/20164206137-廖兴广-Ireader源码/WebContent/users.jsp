<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="easyui-datagrid">
<script type="text/javascript">
			$(function(){
				$('#main_tree').tree({
					onClick:function(node){
						if($("#main_tabs").tabs("getTab",node.text)==null){
							$('#main_tabs').tabs('add',{
								title:node.attributes.fileName,
								selected:true,
								cache:true,
								closable:true,
								
							})
						}
					}
				})
			})
			
		</script>
    <thead>
		<tr>
			<th data-options="field:'code'">Code</th>
			<th data-options="field:'name'">Name</th>
			<th data-options="field:'price'">Price</th>
		</tr>
    </thead>
    <tbody>
		<tr>
			<td>001</td><td>name1</td><td>2323</td>
		</tr>
		<tr>
			<td>002</td><td>name2</td><td>4612</td>
		</tr>
	</tbody>
</table>
</body>
</html>