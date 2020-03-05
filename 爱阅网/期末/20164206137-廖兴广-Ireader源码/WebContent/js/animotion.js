window.onload = function() {
	var row3 = document.getElementById("row3")
	var row4 = document.getElementById("row4")
	window.onscroll = function() {
		if(document.documentElement.scrollTop > (row3.offsetTop - 200)) {
			row3.style.transform = "translateX(0px) rotate(0deg)";
		}
		if(document.documentElement.scrollTop > (row4.offsetTop - 200)) /*滚动条超过第三行的位置，（滚动条位置，第三行位置）*/ {
			row4.style.transform = "translateX(0px) rotate(0deg)"; //style动态改变CSS
		}
	}; /*滚动条滚动的时候*/
};

function deminish() {
	var fontSize = document.getElementById("fontsize");
	var text = document.getElementById("txt");
	var t = document.defaultView.getComputedStyle(text); /*获取对象属性*/
	var fontSize_value = parseInt(t.fontSize); /*只能这样获取信息*/

	/*改变对象属性*/
	fontSize_value--;
	fontSize.innerHTML = fontSize_value;
	text.style.fontSize = fontSize_value + "px";
}

function plus() {
	var fontSize = document.getElementById("fontsize");
	var text = document.getElementById("txt");
	var t = document.defaultView.getComputedStyle(text); /*获取对象属性*/
	var fontSize_value = parseInt(t.fontSize); /*只能这样获取信息*/

	/*改变对象属性*/
	fontSize_value++;
	fontSize.innerHTML = fontSize_value;
	text.style.fontSize = fontSize_value + "px";
}

/*时间*/
function startTime() {
				var today = new Date(); //定义日期对象   
				var yyyy = today.getFullYear(); //通过日期对象的getFullYear()方法返回年    
				var MM = today.getMonth() + 1; //通过日期对象的getMonth()方法返回年    
				var dd = today.getDate(); //通过日期对象的getDate()方法返回年     
				var hh = today.getHours(); //通过日期对象的getHours方法返回小时   
				var mm = today.getMinutes(); //通过日期对象的getMinutes方法返回分钟   
				var ss = today.getSeconds(); //通过日期对象的getSeconds方法返回秒   
				// 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09   
				MM = checkTime(MM);
				dd = checkTime(dd);
				mm = checkTime(mm);
				ss = checkTime(ss);
				var day; //用于保存星期（getDay()方法得到星期编号）
				if(today.getDay() == 0) day = "星期日 "
				if(today.getDay() == 1) day = "星期一 "
				if(today.getDay() == 2) day = "星期二 "
				if(today.getDay() == 3) day = "星期三 "
				if(today.getDay() == 4) day = "星期四 "
				if(today.getDay() == 5) day = "星期五 "
				if(today.getDay() == 6) day = "星期六 "
				document.getElementById('nowDateTimeSpan').innerHTML = yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "   " + day;
				setTimeout('startTime()', 1000);
			}

			function checkTime(i) {
				if(i < 10) {
					i = "0" + i;
				}
				return i;
			}
		
		
function ChangeBackground_eye(){
	var back = document.getElementById('txt');
	var eye = document.getElementById('eye');
    back.style.backgroundColor = "greenyellow";
}

function ChangeBackground_sun(){
	var back = document.getElementById('txt');
	var eye = document.getElementById('eye');
    back.style.backgroundColor = "white";
}

function ChangeBackground_return(){
	var back = document.getElementById('txt');
	var eye = document.getElementById('eye');
    back.style.backgroundColor = "antiquewhite";
}

function ToRed(num){
				alert("感谢您的评价,请不要吝啬您分数!!");
				if(num==1){
					document.getElementById("1").style.color="red";
					document.getElementById("2").style.color="#ADADAD";document.getElementById("3").style.color="#ADADAD";document.getElementById("4").style.color="#ADADAD";document.getElementById("5").style.color="#ADADAD";
				}
				if(num==2){
					document.getElementById("1").style.color="red";document.getElementById("2").style.color="red";
					document.getElementById("3").style.color="#ADADAD";document.getElementById("4").style.color="#ADADAD";document.getElementById("5").style.color="#ADADAD";
				}
				if(num==3){
					document.getElementById("1").style.color="red";document.getElementById("2").style.color="red";document.getElementById("3").style.color="red";
				    document.getElementById("4").style.color="#ADADAD";document.getElementById("5").style.color="#ADADAD";
				}
				if(num==4){
					document.getElementById("1").style.color="red";document.getElementById("2").style.color="red";document.getElementById("3").style.color="red";document.getElementById("4").style.color="red";
				    document.getElementById("5").style.color="#ADADAD";
				}
				if(num==5){
					document.getElementById("1").style.color="red";document.getElementById("2").style.color="red";document.getElementById("3").style.color="red";document.getElementById("4").style.color="red";
				    document.getElementById("5").style.color="red";
				}
			}