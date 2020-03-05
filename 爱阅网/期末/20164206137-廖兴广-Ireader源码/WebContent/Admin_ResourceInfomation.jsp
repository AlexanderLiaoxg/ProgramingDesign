<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ireader.userBean.UserInfo"%>
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
			$(function(){
				

				$('#resources').datagrid({
					fixed:true,
					pagination:true,
					fitColumns:true,
					striped:true,
					//url:"PaginationChange",
					pageSize: 5,//每页显示的记录条数，默认为10 
					pageList: [5,10,15,20],
					rows: 5,
					pageNum:1,
					
					toolbar: [{
						iconCls: 'icon-edit',
						handler: function(){
							/*弹出窗口需要div下面*/
							if($("#resources").datagrid("getSelections").length==1){
							$('#change').dialog({
							    title: '修改资源信息',
							    width: 400,
							    height: 250,
							    closed: false,
							    cache: false,
							    href: "Admin_ResourceChange.jsp",
							    modal: true, //模态化
							    onLoad:function(){
							    	$("#resource_change_form :text:eq(0)").val($("#resources").datagrid("getSelected").id);       
							    	$("#resource_change_form :text:eq(1)").val($("#resources").datagrid("getSelected").name);  
							    	$("#resource_change_form :text:eq(2)").val($("#resources").datagrid("getSelected").value);  
							    	$("#resource_change_form :text:eq(3)").val($("#resources").datagrid("getSelected").part_file_path);  
							    	$("#resource_change_form :text:eq(4)").val($("#resources").datagrid("getSelected").file_path); 
							    	$("#resource_change_form :text:eq(5)").val($("#resources").datagrid("getSelected").img_file_path); 
							    	$("#resource_change_form :text:eq(6)").val($("#resources").datagrid("getSelected").account); 
							    	$("#resource_change_form :text:eq(7)").val($("#resources").datagrid("getSelected").user); 
							    	
							    	/*选中指定值的选项*/
							    	var type=$("#resources").datagrid("getSelected").type;	
							    	$("#type").val(type);
							    	
							    	
					
							//将选中行的第一个数据赋值给changeUserinfo.jsp
							    }
							});
							}else{
								$.messager.alert("系统信息","请选择<font color='red' size=15 >1</font>行信息");
							}
						}
					},'-',{
						iconCls:'icon-add',
						handler: function(){
							$.messager.alert("系统信息","该功能尚在开发中（datatime）");
						}
							
					},'-',{
						iconCls: 'icon-cancel',
						handler: function(){

							/*弹出窗口需要div下面*/
							if($("#resources").datagrid("getSelections").length==1){
							$('#change').dialog({
							    title: '删除用户',
							    width: 400,
							    height: 200,
							    closed: false,
							    cache: false,
							    href: "Admin_ResourceDelete.jsp",
							    modal: true, //模态化
							    onLoad:function(){
							    	$("#delet_reource_form :input:eq(0)").val($("#resources").datagrid("getSelected").id);       
							    	$("#delet_reource_form :input:eq(1)").val($("#resources").datagrid("getSelected").name);  
							    }
							});
							}else{
								$.messager.alert("系统信息","请选择<font color='red' size=15 >1</font>行信息");
							}
							
						}
					}],
					
					columns:[[
					    {field:'id',title:'资源号',rowspan:2,width:80,sortable:true,align:'center'},
					    {field:'name',title:'资源名',rowspan:2,width:80,sortable:true,align:'center'},//行属性name
					    {title:'资源信息',colspan:5},
					    {field:'account',title:'上传账户',width:80,rowspan:2,align:'center'},
					    {field:'user',title:'上传者',width:150,rowspan:2,align:'center'},
					    {field:'uptime',title:'上传时间',width:280,rowspan:2,align:'center'}
					    
					],[
					    {field:'type',title:'种类',width:110,align:'right',sortable:true},
					    {field:'value',title:'价值',width:50,align:'right',sortable:true},
					    {field:'part_file_path',title:'试阅资源',width:165,align:'center'},
					    {field:'file_path',title:'资源路径',width:165,align:'center'},
					    {field:'img_file_path',title:'封面路径',width:160}
					]]
				})
				
			})
			
			function test() {
				//alert($('#resources').datagrid('options').pageNumber);
			}
		</script>

    <table id="resources" class="easyui-datagrid">
    <%if(request.getAttribute("begin")==null){request.setAttribute("begin", 0);} %>
    <tbody>
		<c:forEach items="${resource_list}" var="i" >
			<tr>
							    <td>${i.getId()}</td>
							    <td>${i.getResource_name() }</td>
							    <td>${i.getType() }</td>
							    <td>${i.getValue() }</td>
							    <td>${i.getPart_file_path() }</td>
							    <td>${i.getFile_path() }</td>
							    <td>${i.getImg_path() }</td>
							    <td>${i.getUper_account() }</td>
							    <td>${i.getUper_name() }</td>
							    <td>${i.getUp_time() }</td>
			</tr>				    
				</c:forEach>
	</tbody>
</table>

<div id="change">dailog</div>
</body>
</html>