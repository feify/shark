<!DOCTYPE html>
<head> 
    <title>askingdata</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" pageEncoding="UTF-8" />
</head> 
<html lang="zh">
<head>
<title>所问数据-用户登录</title>
<link rel="logoIcon" href="img/logos/favicon.ico"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">

</head>

<body id="page-top" class="index" onkeydown="if(event.keyCode==13){submitForm();}" style="background-color:#222">
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<a class="navbar-brand" href="<%=request.getContextPath()%>">
					<img style="width:201px;height:50px;" class="pull-left" alt="所问数据" src="img/logos/logoIcon.png">
				</a>
			</div>
		</div>
	</nav>
	<!-- Logoin form -->
	<section id="contact">
		<div class="container" style="max-width:600px;margin:0 auto;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">登录开放平台</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body" style="padding-top:35px;">
						  <h2 class="muted">User</h2>
							<form name="user" action="http://localhost:8080/login" onsubmit=""
								method="post">
								<fieldset>
									<div class="row">
										<div class="col-sm-12 col-md-10  col-md-offset-1 ">
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon"> 
														<i class="glyphicon glyphicon-user"></i>
													</span> 
													<input class="form-control login-input" placeholder="用户名" id="username"
														name="username" type="text" autofocus>
												</div>
											</div>
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon"> 
														<i class="glyphicon glyphicon-lock"></i>
													</span> 
													<input class="form-control login-input" placeholder="密码" id="password"
														name="password" type="password">
												</div>
											</div>
											
											<div class="form-group rememberMe">
												<input id="rememberMe" type="checkbox"/>
												<lable class="rememberMeLb">&nbsp;&nbsp;记住我</lable>
											</div>
											<div class="form-group">
												<button type="button"
													class="btn btn-lg btn-main btn-block"
													onclick="submitForm()"><i class="fa fa-sign-in"></i> 登录</button>
											</div>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="panel-footer">
							<i class="fa fa-warning"></i> 还没注册? <a href="userRegist.jsp" class=""><i class="fa fa-hand-o-right"></i><strong> 用户注册</strong></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<footer>
			<div style="text-align:center;">
				<span class="copyright">
						&nbsp;&nbsp;Copyright &copy; 2016 北京所问数据科技有限公司 (askingdata.com) 京ICP备16004320号 <br>
					010-56579694 support@askingdata.com 北京市朝阳区广渠门外名敦道2号楼1503 100022
				</span>
			</div>
		</footer>
		
	</section>
	
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/sha.js"></script>
<script type="text/javascript">

	if(true){ // 登录失败
		$("#userName").val("");
		$("#password").val("");
		$("#rememberMe").attr("checked", false);
		if($.cookie('cookie_userName')!=undefined) {
			$.removeCookie('cookie_userName');
			$.removeCookie('cookie_password');
		}
		$("#userName")[0].focus();
		alert("用户名或密码错误!");
		<% request.getSession().setAttribute("responseCode", 1);%> // 重新设置判断是否登录成功的标志位
	}else{ 
		// 判断之前是否有设置cookie，如果有，则设置【记住我】选择框
		if($.cookie('cookie_userName')!=undefined){
			$("#rememberMe").attr("checked", true);
		}else{
			$("#rememberMe").attr("checked", false);
		}
	
		// 读取cookie
		if($('#rememberMe:checked').length>0){
			$('#userName').val($.cookie('cookie_userName'));
			$('#password').val($.cookie('cookie_password'));
		}
	}

	function submitForm(){
		// 用户名
		if($("#userName").val()==""){
			 $("#userName")[0].focus();
			 $("#rememberMe").attr("checked", false);
			 alert("请输入用户名！");
			 return;
		}
		
		// 密码
		if($("#password").val()==""){
			$("#password")[0].focus();
			$("#password").attr("checked", false);
			alert("请输入密码！");
			return;
		}
		 
		// 监听【记住我】事件
		if($('#rememberMe:checked').length>0){ // 设置cookie
			if($.cookie('cookie_userName')!=undefined) {
				$.removeCookie('cookie_userName');
				$.removeCookie('cookie_password');
			}
			$.cookie('cookie_userName', $('#userName').val(), { expires: 365 });
			$.cookie('cookie_password', $('#password').val(), { expires: 365 });
		}else{// 清除cookie
			$.removeCookie('cookie_userName');
			$.removeCookie('cookie_password');
		}
		var pwd = $('#password').val();
		sha1(pwd); // SHA1加密密码
	 	$("#userLoginForm").submit();

	}

</script>

</body>
</html>