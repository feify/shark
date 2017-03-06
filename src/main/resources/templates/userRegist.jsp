<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<title>所问数据-用户注册</title>
<link rel="logoIcon" href="img/logos/favicon.ico"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
</head>

<body id="page-top" onkeydown="if(event.keyCode==13){authenticateBeforeSubmit();}" class="index">
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
	<!-- userSignUpForm -->
	<section id="contact">
		<div class="container" style="width:600px;mix-height:450px;margin:0 auto;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">注册开放平台</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-body" style="padding-top:15px;">
									<form id="userSignUpForm"
										action="<%=request.getContextPath()%>/action/userRegistAction.do"
										method="post">
										<fieldset>
											<div class="row div-userRegist">
												<div class="col-sm-12 col-md-12">
													<a href="<%=request.getContextPath()%>/userLogin.jsp" class="pull-right">													
														<i class="fa fa-chevron-left"></i> 返回登录
													</a>
												</div>
											</div>
											<div class="row div-userRegist">
												<div class="col-sm-12 col-md-12">
													<label class="pull-left lable-info" for="userName">
														<i class="fa fa-user"></i> 用户名<span class="spanRed"> *</span>：
													</label>
													<div class="input-group pull-left" style="width:70%">
														<input id="userName" name="userName" class="form-control input-userInfo" 
															type="text" onblur="javascript:userNameOnBlur();" /> 
														<label id="checkUserNameLabel" class="lable-warning" for="userName"></label>
													</div>
												</div>
											</div>
											
											<div class="row div-userRegist">
												<div class="col-sm-12 col-md-12">
													<label class="pull-left lable-info" for="email">
														<i class="fa fa-envelope" style="margin-right:5px;"></i> 邮箱<span class="spanRed"> *</span>：
													</label>
													<div class="input-group  pull-left" style="width:70%">
														<input id="email" name="email" type="text" class="form-control" 
															onblur="javascript:emailOnBlur();" /> 
														<label id="checkEmailLabel" class="lable-warning" for="email"></label>
													</div>											
												</div>										
											</div>
											
											<div class="row div-userRegist">
												<div class="col-sm-12 col-md-12">
													<label class="pull-left lable-info" for="password">
														<i class="fa fa-lock" style="margin-right:10px;"></i> 密码<span class="spanRed"> *</span>：
													</label>
													<div class="input-group pull-left" style="width:70%">
														<input id="password" name="password" type="password" class="form-control"
															onblur="javascript:passwordOnBlur();" />
														<label id="checkPasswordLabel" class="lable-warning" for="password"></label>
													</div>
												</div>
											</div>

											<div class="row div-userRegist">
												<div class="col-sm-12 col-md-12">
													<label  class="pull-left lable-info"  for="repassword">
														<i class="fa fa-lock"></i> 确认密码<span class="spanRed"> *</span>：
													</label>
													<div class="input-group pull-left" style="width:70%">
														<input id="repassword" name="repassword" type="password" class="form-control" 
															onblur="javascript:repasswordOnBlur();" /> 
														<label id="checkRepasswordLabel" class="lable-warning" for="repassword"></label>
														<label class="clearfix" style="font-size: 12px;text-indent:5px; margin-top:5px;">
															<i class="fa fa-info-circle"></i> 密码长度必须由6位到16位的非空白字符组成
														</label>
													</div>
												</div>
											</div>
										
											<div class="row div-userRegist">	
												<div class="col-sm-12 col-md-12">											
													<button type="button"
														class="btn btn-lg  btn-main btn-block"
														onclick="authenticateBeforeSubmit()">
														<i class="fa fa-send"></i> 立即注册
													</button>
												</div>
											</div>
											
										</fieldset>
									</form>
								</div>
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
	
<script type="text/javascript" src="js/ajax/prototype.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/passwordStrengthMeter.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/sha1.js"></script>
<script type="text/javascript">
var global = "<%=request.getContextPath()%>";

</script>

</body>
</html>