<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="decorator" content="blank"/>
	<style type="text/css">
    	html,table{background-color:#f5f5f5;width:100%;text-align:center;height:100%;}
    	body{height:100%;background:url("../images/safe-bg.jpg") center right no-repeat;background-size:cover;background-color:#f3f3f3;}
    	body,div,ul,li,h1,h2,h3,h4,form,iframe,input,select,p,button,dl,dt,dd,fieldset,textarea,label,del,pre{margin:0;padding:0;outline:none;}
    	img,fieldset{border:0}
    	.form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#fff;}
    	.form-signin .checkbox{margin-bottom:10px;color:#0663a2;} 
    	.form-signin .input-label{font-size:16px;line-height:23px;color:#999;text-align:left;}
    	.form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
    	.form-signin .btn.btn-large{font-size:16px;}
    	.form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
    	.form-signin div.validateCode {padding-bottom:0px;} 
    	.mid{vertical-align:middle;}
    	.header{height:80px;padding-top:20px;} 
    	.alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
    	label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    	#blank {height:20%;}
    	#login_box{width:313px;height:380px;position:absolute;top:57%;margin-top:-170px;left:50%;margin-left:-150px;}
    	.layer_box{background:url("../images/login_box.png") center center no-repeat;opacity: 0.9;filter:alpha(opacity=90);width:313px;height:380px;position:absolute;top:57%;margin-top:-170px;left:50%;margin-left:-150px;}
    	.login_txt{width:240px;height:60px;border-bottom:1px solid #007adb;margin:0 auto;margin-top:10px;}
		.login_txt p{font-size:24px;color:#444;text-align:left;line-height:58px;}
		.name_pwd{width:240px;height:145px;margin:0 auto;margin-top:0px;text-align:left;}
		#username,#password{width:238px;height:40px;border:1px solid #ccc;border-radius:5px;margin-bottom:10px;margin-top:8px;line-height:40px;text-indent:2em;text-indent:2em\9;color:#666;+margin-left:-28px;}
    	#logon{display:block;width:238px;height:40px;font-size:16px;color:#fff;background-color:#0969b6;margin:0 auto;border-radius:5px;border:0px;line-height:40px;margin-top:18px;}
		#logon:hover{background-color:#007adb;transition: all 0.3s;}
		.head,.pwd{position:absolute;margin-top:22px;margin-top:22px\9;left:45px;}
		.head{margin-top:-48px;left:45px;}
	    .head,.pwd{margin-top:-38px;}
	    .footer{position:absolute;bottom:5px;left:0;right:0;color:white;}
	    #navi{height:243px;}
	    /*** Logo ***/
		.logo{text-align:left;width:16%;position:relative;left:12%;top:20%;}
		.logo img{background-color:#fff;border-radius:10px;}
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>
<body>
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	<div id="navi">
		<div class="logo flt">
			<img alt="创之智" src="../images/login_logo.png">
		</div>
		<!-- <span>${fns:getConfig('productName')}</span> -->
		<div id="logo-explain" class="form-signin-heading" style="margin-top:75px;margin-bottom:0px;">为了您的本质安全&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用安全生产管家婆</div>
		<div class="header">
			<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}" style="z-index:9999;"><button data-dismiss="alert" class="close">×</button>
				<label id="loginError" class="error">${message}</label>
			</div>
		</div>
	</div>
	<!-- <div class="header">
		<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error">${message}</label>
		</div>
	</div> -->
	<!-- <h1 class="form-signin-heading">${fns:getConfig('productName')}</h1> -->
	<div class="layer_box"></div>
	<div id="login_box">
		<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
		<!-- <form id="loginForm" action="${ctx}/login" method="post"> -->
			<div class="login_txt">
				<p>登录</p>
			</div>
			<div class="name_pwd">
				<label class="input-label" for="username">登录名</label>
				<input type="text" id="username" name="username" class="input-block-level required" value="${username}">
				<img class="head" src="../images/login_name.png" style="top: 40%;"/>
				<label class="input-label" for="password">密码</label>
				<input type="password" id="password" name="password" class="input-block-level required">
				<img class="pwd" src="../images/login_pwd.png" style="top: 61.5%;"/>
				<c:if test="${isValidateCodeLogin}"><div class="validateCode">
					<label class="input-label mid" for="validateCode" default_txt="验证码" style="margin-left: 8px;margin-top:-4px;width:50px;">验证码</label>
					<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
				</div></c:if><%--
				<label for="mobile" title="手机登录"><input type="checkbox" id="mobileLogin" name="mobileLogin" ${mobileLogin ? 'checked' : ''}/></label> --%>
				<%--<input class="btn btn-large btn-primary" type="submit" value="登 录"/>&nbsp;&nbsp;--%>
				<input id="logon" type="submit" value="登     录"/>&nbsp;&nbsp;
				<label for="rememberMe" title="下次不需要再登录" style="float:left;"><input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）</label>
				<div id="themeSwitch" class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}<b class="caret"></b></a>
					<ul class="dropdown-menu">
					  <c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
					</ul>
				<!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
				</div>
			</div>
		</form>
	</div>
	<div class="footer">
		Copyright &copy; ${fns:getConfig('copyrightYear')} ${fns:getConfig('productName')} - Powered By 四川创之智 ${fns:getConfig('version')} 
	</div>
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>