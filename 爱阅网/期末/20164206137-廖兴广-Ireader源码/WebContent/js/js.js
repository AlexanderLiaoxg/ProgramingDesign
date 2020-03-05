window.onload=function(){
	/*
	 * me: 尽量实现代码的复用，也能减少创建对象耗费的内存
	 * */
	var name = document.getElementById("name");
	var password = document.getElementById("password");
	var idcard = document.getElementById("idcard");
	var email = document.getElementById("email");
	var phone = document.getElementById("phone");
	var login = document.getElementById("login");
	var account = document.getElementById("account");
	var login_password = document.getElementById("login_password");


	/*1、创建XMLHttpRequest对象*/
	var xmlHttp = new XMLHttpRequest();
	var url;
	var finish_num = new Array(false,false,false,false,false);
	var can_submit = false;
	
	/*name*/
	name.onblur = function(){
		if(name.value==""){
			document.getElementById("msg_name").innerHTML="<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>名字不能为空！</font></div>";
			finish_num[0] = false;
		}else{
			 url = "RegisterServlet?name="+name.value;
				xmlHttp.open("POST",url);
				/*3、指定响应事件处理函数*/
				xmlHttp.onreadystatechange=processResult;
				/*4、发出请求*/
				xmlHttp.send();
				
				function processResult(){
					if(xmlHttp.readyState==4&&xmlHttp.status==200){
						var msg = xmlHttp.responseText;
						var msg_is_right = msg.split("?");
					    msg = msg_is_right[0];
					    var is_right = msg_is_right[1];
					    if(is_right=="true"){
					    	finish_num[0] = true;
					    }else{
					    	finish_num[0] = false;
					    }
						document.getElementById("msg_name").innerHTML=msg;
					}
				}
		}
	}
	
	/*password*/
	password.onblur= function(){
		if(password.value.length>=6&&password.value.length<=16){
			document.getElementById("msg_password").innerHTML="<img src='img/Register/ok.png' style='margin:auto;float:left;padding-top:4px;padding-right:4px'/><div style='float:left'><font size='2'></font></div>";
			finish_num[1] = true;
		}else{
			document.getElementById("msg_password").innerHTML="<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>密码必须在6~16位之间</font></div>";
			finish_num[1] = false;
		}
	}
	
	/*idcard*/
	idcard.onblur= function(){
		/*正则表达式表示正整数*/
		var s = /^[1-9]*[0-9][0-9]*$/;
		if(idcard.value.length==18&&s.test(idcard.value)){
			url = "RegisterServlet?idcard="+idcard.value;
			xmlHttp.open("POST",url);
			/*3、指定响应事件处理函数*/
			xmlHttp.onreadystatechange=processResult;
			/*4、发出请求*/
			xmlHttp.send();
			
			function processResult(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					var msg = xmlHttp.responseText;
					var msg_is_right = msg.split("?");
				    msg = msg_is_right[0];
				    var is_right = msg_is_right[1];
				    if(is_right=="true"){
				    	finish_num[2] = true;
				    }else{
				    	finish_num[2] = false;
				    }
					document.getElementById("msg_idcard").innerHTML=msg;
				}
			}
		}else{
			finish_num[2] = false;
			document.getElementById("msg_idcard").innerHTML="<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>请输入正确的身份证！</font></div>";
		}
	}
	
	/*phone*/
	phone.onblur = function(){
		var forPhone = /^[1-9][0-9]*$/;
		if(phone.value.length==11&&forPhone.test(phone.value)){
			document.getElementById("msg_phone").innerHTML="<img src='img/Register/ok.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'></font></div>";
			finish_num[3] = true;
		}else{
			document.getElementById("msg_phone").innerHTML="<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>请输入正确的手机号码！</font></div>";
			finish_num[3] = false;
		}
	}
	
	email.onblur = function(){
		var forEmail =  /^[\w]*[@][\w]*(.com)$/;
		if(forEmail.test(email.value)){
			document.getElementById("msg_email").innerHTML="<img src='img/Register/ok.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'></font></div>";
			finish_num[4] = true;
		}else{
			document.getElementById("msg_email").innerHTML="<img src='img/Register/no.png' style='margin:auto;float:left;padding-top:5px;padding-right:5px'/><div style='float:left'><font size='2'>错误的邮箱格式！</font></div>";
			finish_num[4] = false;
		}
	}
	
//	name.onblur = function(){
//		 url = "RegisterServlet?name="+name.value;
//		xmlHttp.open("POST",url);
//		/*3、指定响应事件处理函数*/
//		xmlHttp.onreadystatechange=processResult;
//		/*4、发出请求*/
//		xmlHttp.send();
//		
//		function processResult(){
//			if(xmlHttp.readyState==4&&xmlHttp.status==200){
//				var msg = xmlHttp.responseText;
//				document.getElementById("msg_name").innerHTML=msg;
//			}
//		}
//	}
	
	is_finish.onclick = function (){
		var obj = document.getElementById("info");
		for (var i = 0; i < finish_num.length; i++) {
			if(finish_num[i]){
			}else{
				alert("请填写完整信息！~.~"+i);
				break;
			}
			if(i==4){
				can_submit = true;
				alert("注册成功！^_^");
			}
		}
		if(can_submit){
			obj.submit();
		}
	}
	
	login.onclick = function (){
		url = "LoginServlet?account="+account.value+"&login_password="+login_password.value;
		xmlHttp.open("POST",url);
		/*3、指定响应事件处理函数*/
		xmlHttp.onreadystatechange=processResult;
		/*4、发出请求*/
		xmlHttp.send();
	
		function processResult(){
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				var msg = xmlHttp.responseText;
				var t = msg.split("?");
			    var msg = t[0];
			    var isright = t[1];
				if(isright=="true"){
					document.getElementById("find").style.display ="none";
					document.getElementById("login_div").style.display ="none";
					document.getElementById("welcome").innerHTML=msg;
				}else{
				document.getElementById("msg_login").innerHTML=msg;
				}
			}
		}
	}

}


function clearTxT(obj){
if(obj.value=="这里输入您的用户名"||obj.value=="这里输入您的身份证号"||obj.value=="e-mail"||obj.value=="十一位数"||obj.value=="123456"){
	obj.value = "";
}
}


function is_loginServlet() {
		
		url = "Is_login";
		xmlHttp.open("POST",url);
		/*3、指定响应事件处理函数*/
		xmlHttp.onreadystatechange=processResult;
		/*4、发出请求*/
		xmlHttp.send();
	
		function processResult(){
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				var msg = xmlHttp.responseText;
				var t = msg.split("?");
			    var msg = t[0];
			    var isright = t[1];
				if(isright=="true"){
					document.getElementById("find").style.display ="none";
					document.getElementById("login_div").style.display ="none";
					document.getElementById("welcome").innerHTML=msg;
				}
			}
		}
}

function check(){
	var forPhone =  /^[\w]*[@][\w]*(.com)$/;
	alert(forPhone.test("128565@qq.com"));
}





//function checkName(){
//	 url = "RegisterServlet?name="+name;
//	xmlHttp.open("POST",url);
//	/*3、指定响应事件处理函数*/
//	xmlHttp.onreadystatechange=processResult;
//	/*4、发出请求*/
//	xmlHttp.send();
//	
//	function processResult(){
//		if(xmlHttp.readyState==4&&xmlHttp.status==200){
//			var msg = xmlHttp.responseText;
//			document.getElementById("msg_Name").innerHTML=msg;
//		}
//	}
//}


/*
 * lxg:密码默认不行是因为，没用离开焦点
 */
