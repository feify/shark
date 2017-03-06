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
<link href="css/common_1.css" rel="stylesheet" type="text/css">
<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet"  type="text/css">
 <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body id="page-top" class="index" onkeydown="if(event.keyCode==13){submitForm();}" style="background-color:#222">
	<!-- Navigation -->
	<div class="narbar navbar-default">
	<div class="container">
	<div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>">
		<img style="width:170px;" alt="所问数据" src="/img/logos/logoIcon.png">
	  </a>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div id="menu" class="collapse navbar-collapse ">
	<ul class="nav navbar-nav navbar-right top-nav">
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
			<i class="fa fa-user"></i> 
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="#"><i class="fa fa-fw fa-user"></i> 个人资料</a>
			</li><li class="divider"></li>
			<li><a href="#"><i class="fa fa-fw fa-envelope"></i> 收件箱</a></li>
			<li class="divider"></li>
			<li><a href="#"><i class="fa fa-fw fa-gear"></i> 设置</a>
			</li>
				
		</ul>
	</li>
	<li>
		<a href="#"><i class="fa fa-sign-out"></i> 退出</a>
	</li>
	<li><a href="#"><i class="fa fa-info-circle"></i> 用户手册</a></li>
	<li><a href="#"><i class="fa fa-comment-o"></i> 联系我们</a></li>
	</ul>
	</div>
	</div>
	</div>
	<!-- char form -->
	<section id="contact">
		<div class="container" style="max-width:600px;margin:0 auto;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">数据分析</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body" style="padding-top:35px;">
						  <h3 class="muted">选择数据表</h3>
						  	<div class="off-1">
								<form class="form-horizontal" role="form">
									    <div class="form-group">
									      <div class="col-lg-12">
									        <select id="basic" class="selectpicker show-tick form-control  char_input" data-live-search="true">
									          <option  selected disabled class="op1">———请选择———</option>
									          <option class="op1">cow</option>
									          <option class="op1">bull</option>
									          <option class="op1">ox</option>
									        </select>
									      </div>
									    </div>
								 </form>
								 <div class="input-group charCode_d1">
								  <span class="input-group-addon" id="sizing-addon1"> &nbsp;URL&nbsp;&nbsp;</span>
								  <input type="text" class="form-control char_input" placeholder="请输入网址..." aria-describedby="sizing-addon1">
								</div>
								
								<div class="input-group  charCode_d2">
								  <span class="input-group-addon" id="sizing-addon2">USER</span>
								  <input type="text" class="form-control char_input" placeholder="请输入用户名..." aria-describedby="sizing-addon2">
								</div>
								
								<div class="input-group  charCode_d2">
								  <span class="input-group-addon" id="sizing-addon3"> &nbsp;PWD&nbsp;</span>
								  <input type="text" class="form-control char_input" placeholder="请输入密码..." aria-describedby="sizing-addon3">
								</div>
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
<script type="text/javascript  src="js/charDate_corn.js"></script>	
<script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
</body>
</html>