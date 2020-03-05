window.onload=function(){
//	/*Ajax检测是否余额充足*/
//	var is_ok = document.getElementsByName("is_ok");
//	
//	/* 1、创建XMLHttpRequest对象 */
//	var xmlHttp = new XMLHttpRequest();
//	var url;
//	var can_submit = false;
//	
//	var radio = document.getElementsByName("voucher_type");
//	var money_time = document.getElementById("money_time");
//	var down_value = document.getElementById("down_value");
//	
//	for(var i=0;i<radio.length;i++)
//	{
//		if(radio[i].checked){
//			var s =radio[i].value;
//			alert(s)
//			break;
//			}
//	}
//	
//
//	is_ok.onclick=function(){
//		
//		 url = "VoucherServlet?money="+name.value;
//			xmlHttp.open("POST",url);
//			/* 3、指定响应事件处理函数 */
//			xmlHttp.onreadystatechange=processResult;
//			/* 4、发出请求 */
//			xmlHttp.send();
//			
//			function processResult(){
//				if(xmlHttp.readyState==4&&xmlHttp.status==200){
//					var msg = xmlHttp.responseText;
//					var msg_is_right = msg.split("?");
//				    msg = msg_is_right[0];
//				    var is_right = msg_is_right[1];
//				    if(is_right=="true"){
//				    	finish_num[0] = true;
//				    }else{
//				    	finish_num[0] = false;
//				    }
//					document.getElementById("msg_name").innerHTML=msg;
//				}
//			}
//	}

}

function select(Index_value){
	var money_time = document.getElementById("money_time");
	var money = document.getElementById("money");
	money.innerHTML = Index_value*10;
}

function change(value){
	var radio = document.getElementsByName("voucher_type");
		var length = radio.length;
		var label = document.getElementById("voucher_type_label");
		var money = document.getElementById("money_time");
		var down = document.getElementById("down_value");
		
		var down_value = document.getElementById("down_value");
		var money_time = document.getElementById("money_time");
		
			if(value=="voucher_down"){
				label.innerHTML="充值下载卷:";
				money.style.display="none";
				down.style.display="";
				to_result(parseInt(down_value.value));
			}else{
				label.innerHTML="充值时限：";
				money.style.display="";
				down.style.display="none";
				select(parseInt(money_time.value));
			}
			
}

function to_result(down_num){
	if(down_num==null){
		var money = document.getElementById("money");
	money.innerHTML = 0;
	}else{
	var num = parseInt(down_num);<!-- JS强转-->
	var money = document.getElementById("money");
	money.innerHTML = down_num*1;
	}
}

function to_down(jifen){
	if(jifen==null){
		var money = document.getElementById("money");
	money.innerHTML = 0;
	}else{
	var jifen_num = parseInt(jifen);
	var jifen_label = document.getElementById("jifen");
	jifen_label.innerHTML = jifen_num*10;
	}
}
