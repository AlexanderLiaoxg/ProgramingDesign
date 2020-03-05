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
				

				$('#users').datagrid({
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
							if($("#users").datagrid("getSelections").length==1){
							$('#change').dialog({
							    title: '修改用户信息',
							    width: 400,
							    height: 250,
							    closed: false,
							    cache: false,
							    href: "Admin_UserinfoChange.jsp",
							    modal: true, //模态化
							    onLoad:function(){
							    	$("#change_form :text:eq(0)").val($("#users").datagrid("getSelected").account);       
							    	$("#change_form :text:eq(1)").val($("#users").datagrid("getSelected").name);  
							    	$("#change_form :text:eq(2)").val($("#users").datagrid("getSelected").idcard);  
							    	$("#change_form :text:eq(3)").val($("#users").datagrid("getSelected").email);  
							    	$("#change_form :text:eq(4)").val($("#users").datagrid("getSelected").txt); 
							    	var sex=$("#users").datagrid("getSelected").sex;
							    	if(sex=="男"){
							    		$("input:radio[name='sex']").eq(0).attr("checked",'checked');
							    	}else{
							    		$("input:radio[name='sex']").eq(1).attr("checked",'checked');
							    	}
							    	/*选中指定值的选项*/
							    	var shengfen=$("#users").datagrid("getSelected").shengfen;	
							    	$("#shengfen").val(shengfen);
							    	
							    	
					
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
							if($("#users").datagrid("getSelections").length==1){
							$('#change').dialog({
							    title: '删除用户',
							    width: 400,
							    height: 200,
							    closed: false,
							    cache: false,
							    href: "Admin_UserinfoDelete.jsp",
							    modal: true, //模态化
							    onLoad:function(){
							    	$("#delet_form :input:eq(0)").val($("#users").datagrid("getSelected").account);       
							    	$("#delet_form :input:eq(1)").val($("#users").datagrid("getSelected").name);  
							    	
							    	
					
							//将选中行的第一个数据赋值给changeUserinfo.jsp
							    }
							});
							}else{
								$.messager.alert("系统信息","请选择<font color='red' size=15 >1</font>行信息");
							}
							
						}
					}],
					
					columns:[[
					    {field:'account',title:'账号',rowspan:2,width:80,sortable:true,align:'center'},
					    {field:'name',title:'用户名',rowspan:2,width:80,sortable:true,align:'center'},//行属性name
					    {title:'个人信息',colspan:5},
					    {field:'is_vip',title:'类别',width:80,rowspan:2,align:'center'},
					    {field:'vipdate',title:'vip到期时间',width:230,rowspan:2,align:'center'},
					    {field:'txt',title:'个性签名',width:280,rowspan:2,align:'center'}
					    
					],[
					    {field:'phone',title:'电话',width:110,align:'right',sortable:true},
					    {field:'sex',title:'性别',width:50,align:'right',sortable:true},
					    {field:'idcard',title:'身份证',width:165,align:'center'},
					    {field:'email',title:'邮箱',width:165,align:'center'},
					    {field:'shengfen',title:'省份',width:60}
					]]
				})
				
			})
			
			function test() {
				//alert($('#users').datagrid('options').pageNumber);
			}
		</script>

    <table id="users" class="easyui-datagrid">
    <%if(request.getAttribute("begin")==null){request.setAttribute("begin", 0);} %>
    <tbody>
		<c:forEach items="${userinfos}" var="i" begin="${begin}" end="${userinfos.size()>8 ? 8:userinfos.size() }">
			<tr>
							    <td>${i.getAccount()}</td>
							    <td>${i.getName() }</td>
							    <td>${i.getPhone() }</td>
							    <td>${i.getSex() }</td>
							    <td>${i.getIdcard() }</td>
							    <td>${i.getEmail() }</td>
							    <td>${i.getShengfen() }</td>
							    <td>${i.getIs_vip() }</td>
							    <td>${i.getVipdate() }</td>
							    <td>${i.getTxt() }</td>
			</tr>				    
				</c:forEach>
	</tbody>
</table>

<div id="change">dailog</div>
</body>
</html>