<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<!--
        	作者：1285984525@qq.com
        	时间：2018-12-30
        	描述：JQuery部分
        -->
        <script src="JQuery/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="JQuery/jquery.js" type="text/javascript" charset="utf-8"></script>
        <link rel="stylesheet" type="text/css" href="css/testAnimotion.css" />
        <!-- 自带的code.html-->
		<link rel="icon" href="img/Download/bird.png"/>
		<link rel="stylesheet" type="text/css" href="css/Background.css" />
		<link rel="stylesheet" type="text/css" href="css/css.css"/>
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.css"/>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>固定资源</title>
		<link href="css/style.css" rel="stylesheet" />
		<script src="js/control.js">
			</script>
		<script src="js/animotion.js">
		</script>
	</head>

	<body onload="startTime()">
		<div class="headTop">
			<div style="width: 200px;height: 30px;float: left;" id="headname">
					<p style=" margin: 0px;">  <!-- 从这下面开始 -->
				<b style="text-decoration: none;">Ireader提醒您当前访问人数：<font color="red">${onLineNum }</font></b>
			</p>
			</div>
			<div id="msg_login" style="width: 420px;height: 30px;float: left;"></div>
			<div id="find" style="float: right;margin: 2px 0px 0px 0px; width: 220px;height: 30px;">
				[
				<a style="margin: 0px;" href="Register.jsp">新用户注册</a>] [
				<a style="margin: 0px;" href="">找回密码</a>]&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</div>
			<span id="welcome"></span>
			<div class="login" id="login_div">
			<form id="login_info" action="LoginServlet">
			<label>用户名</label>&nbsp<input type="text" class="account" id="account" />&nbsp
			<label>密 码</label>&nbsp<input type="password" class="account" id="login_password" />&nbsp
			<button type="button" style="color: white;" id="login"><font  style="color: white;text-decoration: none;">登录</font></button>
			</form>
			</div>
		</div>
		<div class="title_background">
			<img src="img/Admin_Control/bird.ico" style="height: 100%; width: 100px;padding-left: 250px" />
			<img src="img/Admin_Control/ireader.png" style="height: 80%; width: 700px;padding-left: 150px;padding-bottom:11px;" />
			
		</div>

		<div class="navigation ">
			<div class="fixed">

			</div>
			<nav>
				<ul>
					<li style="padding-left: 100px;"></li>
					<li>
						<a href="index.jsp">首 页</a>
					</li>
					<li>
						<a href="">连线故事会</a>
						<ul>
							<li>
								<a href="">刊物导读</a>
							</li>
							<li>
								<a href="">作品赏析</a>
							</li>
							<li>
								<a href="">信息传真</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="">故事创作</a>
						<ul>
							<li>
								<a href="">世态</a>
							</li>
							<li>
								<a href="">情感</a>
							</li>
							<li>
								<a href="">幽默</a>
							</li>
							<li>
								<a href="">悬疑</a>
							</li>
							<li>
								<a href="">传奇</a>
							</li>
							<li>
								<a href="">怪谈</a>
							</li>
							<li>
								<a href="">励志</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="">网络故事</a>
						<ul>
					</li>
					<li>
						<a href="">情感驿站</a>
					</li>
					<li>
						<a href="">美丽心灵</a>
					</li>
					<li>
						<a href="">青春部落</a>
					</li>
					<li>
						<a href="">幽默段子</a>
					</li>
					</ul>
					<li>
						<a href="Admin_Login.jsp">管理员接口</a>
						
					</li>

					<li>
						<a href="Voucher_Center.jsp">去充值</a>
						
					</li>

					<li>
						<a href="Conversion.jsp">兑换</a>
					</li>
					<li>
						<a href="ToDownPageServlet">资源中心</a>
					</li>
					<li>
						<a href="UpPage.jsp">上传资源</a>
					</li>
					<li>
						<a href="ToMyResourceServlet">我的资源</a>
					</li>
					<li style="width: 100px;"> 
					
					</li>
					<form action="ToSearchServlet" style="width:0px;height:0px;float:right;padding-top:8px;">
					<input  type="search" name="to_search" required="" placeholder="Search" x-webkit-speech="" x-webkit-grammar="builtin:search" lang="zh-CN" class="account">&nbsp&nbsp<button type="submit" style="position: relative;"><a  style="color: white;text-decoration: none;">搜索</a></button>
					</form>
				</ul>
			</nav>
		</div>
  <div >
  	
  	<!--
      	作者：1285984525@qq.com
      	时间：2018-12-05
      	描述：主阅读界面
      -->
  	
  	<div id="chose" >
  		<font color="#31B0D5"><span id="nowDateTimeSpan"></span></font> <span>
  		<label style="padding-left: 15%;">调节字体：</label> 
  		<input type="button" id="minus" value="小" class="button" onclick="deminish()"/>
  		<label id="fontsize">15</label>
  		<input type="button" id="plus" value="大" class="button" onclick="plus()"/>
  		<label style="padding-left: 12%;">改变背景：
  		<i id="eye" class="fa fa-eye" aria-hidden="true" onclick="ChangeBackground_eye()"></i>
  		<i id="sun" class="fa fa-sun-o" aria-hidden="true" onclick="ChangeBackground_sun()"></i>
  		<i id="return" class="fa fa-retweet" aria-hidden="true" onclick="ChangeBackground_return()"></i>
  		</label>
  	</div>
  <h3>
时  代</h3>
  <h4>作者：张咪   发布时间：2018-12-03</h4>
   <div class="txt" id="txt">
   	<p>
有人说，三年五年前的事回忆起来，都像是上辈子的事；或许，只有那个写故事的人才知道，有时，回忆如同昨夜的一场梦境，会不定时的来拨动一下岁月的歌声。　　1991年，夏。　　西方的太阳灼灼的燃烧着，烤的这片黄土地就像要着火了似的，腾腾的冒着热气儿。东福地，一个叫福地却没什么福气的村子，住着土房子，走着土路子，面朝黄土背朝天。除了三年前王化仁家的大儿子去城里当了城里人的女婿以外，这个小村子几乎与城市毫无瓜葛。　　“哎呦娘呀……可算到了……汉武？汉武？汉武？”一辆破旧的面包车停在了村口，从车上下来一个烫着卷发的女人，一身黑衣，靠着车窗，难耐的敲着头。　　“让你别来，晕车还非得过来。”王汉武从另一边下来，一边付钱一边看了一眼丽霞。　　“哎呦娘呀……快来扶我一下，真是遭罪……有一点办法我也不踏这门！”丽霞扶着车门晃晃悠悠的。　　“什么时候你也不忘碎碎叨叨……”王汉武走过去像是审视一样看着丽霞，丽霞弯着腰靠过去，跨上王汉武的胳膊。两人并肩向村南走去。　　进村必要经过供销社和小卖部，而这里是人最集中的地方，闲暇功夫，男女老少都集在这里聊着东家长西家短。王汉武和丽霞走过去，大伙的眼睛齐刷刷的盯着看。　　“哎？他三婶儿，这是谁家亲戚？”　　“嘿呦！王汉武城里的媳妇！也怪不得你不知道，连我这三舅母也没见过，结婚是在城里结的，这可算是如愿留在城里了……”　　三婶儿是村里有名的“千里眼”和“顺风耳”，那些鸡毛蒜皮、男男女女的事都知道的清清楚楚。　　“这就是王化仁家大儿媳？这城里人长得也不好看！眼睛里连个人也没有，哎？那脖子上那一片一片的是啥？”　　一提这，三婶儿撇了撇嘴，眼睛斜斜的挂着：“白癫疯！听说是从小就有这病，你以为人家城里户口为啥能看上个乡下人？”　　“天呀！有病的货！”　　“那可不是，还以为多有本事能留在城里，就是靠吃软饭！还是馊了的软饭！”　　“嗐！要是有个城里的女人能看上我家虎子，不用出彩礼，管他啥我都愿意！”刘大姐撇撇嘴。　　“嘿，我可不行，看看刚才那城里媳妇的德行……我就稀罕咱乡下丫头，清秀憨实，会过日子，就像秀凤那样。”三婶儿努嘴一笑。　　“他三婶儿，您也别秀凤了，秀凤的心可不在你家……”　　三婶儿心里不得劲儿，这也是她的心病……　　“哟，秀凤，来买东西了？”刘大姐戳了戳边上几个人的胳膊肘，挤了挤眼睛。　　“三婶儿在这呐！看，这是我刚摘的喇叭花，开的正艳，送您，跟您这身衣服真配！”秀凤笑的眉眼弯弯，把花别在三婶儿扣子上随后掀起门帘进了小卖部。　　“嗐，三婶儿，看着没，你相中这‘媳妇’呀今天很开心呐！”大伙一片笑声。　　全村人都知道，秀凤是王汉武定过亲的媳妇，后来王汉武去了城里突然就结了婚，与秀凤的亲事也就不了了之了。　　三婶儿站起来拍了拍裤子上的土，“走了走了，回家做饭了。”　　晌午了，人都散去了。　　王化仁是东福地村大队的书记，当过兵，是个老党员，据说小的时候还打死过日本鬼子。老王为人勤勤恳恳，老老实实，就是有些倔，脾气上来的时候跟拉不回圈里的驴一样，直和人对着干。别看老王在大队挂个书记的职，其实什么好处也捞不着，加上老王那倔驴脾气，家里更是沾不上一点光，穷的丁当响。那年头村里人人靠着一亩三分地的收成过日子，不追求什么也就够个自给自足。　　王化仁六十岁，看起来却跟三十岁的年轻小伙一样精神，许是因为当过兵的原因，身体也是十分的好，上房接瓦下地干活都不在话下，从来不生病，就连头昏脑热也很少。老王爱干净，整个人收拾的利利索索，看起来不差年轻时的俊朗。　　乔金莲是王化仁的老伴儿，当年就是看上了老王的俊朗，17岁就跟了30岁的老王，生下了大儿子王汉武，18岁生下二儿子王汉国，19岁生下小闺女王汉青，直到现在，乔金莲看着自己老头子的眼里还是满满的稀罕。　　两个儿子随了老王，都去当了兵，可当兵回来却是没有什么发展，都闲置在家。王汉武不愿守着一亩三分地的收成过日子，三年前去市里自来水厂找了份活干，后来认识了自来水厂厂管的女儿，俩人结了婚王汉武就留在了城里，三年没有回来。　　“哎哟娘呀……到了？”丽霞猫着腰，脸色蜡黄。　　“是不是汉武回来了？”听到说话声，乔金莲急急忙忙的从炕上下来。　　“妈快别出来了，我们进来了。”王汉武不着痕迹的一转胳膊，快速上前去扶乔金莲。　　乔金莲年轻时得过脑溢血，左手和右腿不灵活，走路一颠一颠的。　　“哎哟娘呀……我先躺会儿……”丽霞一进门便倒在炕上。　　乔金莲四下张望：“没领明明回来？”　　“明明离不开我妈，回来遭罪……哎哟娘呀，难受死我了……妈您把户口本准备好，下午我们就走了。”丽霞靠着墙又坐起来，阴阳怪气的说着。　　乔金莲被这一声“妈”膈应了一下，有些怔楞，这是乔金莲第二次见自己的大儿媳，第一次是在俩人的结婚典礼上。　　王化仁正蹲在灶火口拨弄灶火，听到这话“蹭”的一下站起来：“户口本没有！想都别想！”头一甩，饭也不做了，摔门走了出去。王化仁是个不善于用语言表达情感的人。　　“哎哟娘呀……这是跟我甩脸了？这几年汉武靠谁了？不都是我爸帮衬吗？他们就我一个女儿，想传个香火，你们还有一个儿子，那边也要生了，想要多少孙子有的是，至于一进门就给我摔脸嘛！”丽霞像只斗鸡一样，头发都要竖起来了。　　“你叫唤啥！闭嘴！”王汉武瞪着眼睛。　　“我就知道我不该回来，哎哟娘呀……一家人不给我好脸色！”丽霞小声嘟囔。　　“哪有孩子跟女人姓的，说出来让人们笑话！这是咱们家的大孙子，肯定得姓王！”乔金莲揉着自己不灵活的左手。　　丽霞放软语气：“妈！你看，明明的户口至今没上，这也不是回事，要是不把明明的户上在我们家，我爸说了……一分钱也不分给闺女……我爸身体越来越不好，到时候汉武又没着落了，您说这三口人咋活！”　　乔金莲愣了一下：“你爸是这么说的？”　　“是，这回要是还不能给明明上户，丽霞她爸就把自来水那边的工作给明明他大伯……”王汉武坐在炕边上，耷拉着脑袋。　　乔金莲看着锅盖上腾腾升起的热气：“这么说……可自古哪有……唉……行了，先躺着休息会儿，一会儿起来吃饭，这事再说，我再问问你爹。”　　“妈，我们下午就走了，户口本……”　　“行了！回来就住两天！吃完饭去看看汉国他们。”王汉武打断丽霞的话，跳下炕接着王化仁做了一半的饭开始做饭。
  </p> </div>
  </div>
  <!--
  	作者：1285984525@qq.com
  	时间：2018-12-30
  	描述：JQuery
  -->
  <div id="btnSide">
			<span id="">
					展开侧边栏
				</span>
		</div>
	
		
		<div id="divSide" src="html body#by div#iframe-wrap iframe#iframe">
   <i class="fa fa-window-close" id="remove_left"></i>
  <iframe id="iframe" src="http://demo.sc.chinaz.com//Files/DownLoad/webjs1/201709/jiaoben5405" width="100%" height="100%" frameborder="0"> </iframe>
</div>
		<img id="rTop" src="img/Download/rtop.jpg"></img>
  
  <script type="text/javascript">

			$(document).ready(
				function() {
					$('#btnSide').click(function() {
						/*多次触发动画出现闪问题，先停掉动画在执行，400是时间毫秒*/
						$('#divSide').stop();
						$('#divSide').animate({
							left: '0px'
						}, 400).animate({
							left: '-10px'
						}, 400).animate({
							left: '0px'
						}, 400); /*动画形式出来*/
						/*$('#divSide').stop().animate({left:'0px'},400);链式写法连续动画*/
					})
					
					
					$('#remove_left').click(function(){
						/*回返*/
						$('#divSide').stop();
						$('#divSide').animate({
							left: '-250px'
						}, 400);
					})
					
					$('#rTop').click(function(){
						$('body,html').animate({scrollTop:0},200);
					})
				}
			);
			
			$(document).ready(function(){
				
					/*回到顶部*/

					$(window).scroll(function() {
						if($(document).scrollTop() > 100) {
							$('#rTop').stop().animate({bottom:'160px'});
						}else{
							$('#rTop').stop().animate({
								bottom:
								'-160px'
							});
						}
					})
					}
			);
					
		</script>
 
<!--
	作者：1285984525@qq.com
	时间：2018-12-05
	描述：评分
-->
  <span>
   	 <ul class="stars">
   	 	    <p style="text-align: center; color:coral" >   	辛辛苦苦写的时间和评分，请您点俩下试试看： </p>
            <li onclick="ToRed(1)" id="1">★</li>
            <li onclick="ToRed(2)" id="2">★</li>
            <li onclick="ToRed(3)" id="3">★</li>
            <li onclick="ToRed(4)" id="4">★</li>
            <li onclick="ToRed(5)" id="5">★</li>
       </ul>
   	
   </span>

 </body>
</html>
