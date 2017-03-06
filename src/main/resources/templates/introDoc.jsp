<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.askingdata.fopen.db.pojo.Task"%>
<%@ page import="com.alibaba.fastjson.JSONObject"%>
<%@ page import="com.alibaba.fastjson.JSONArray"%>

<%@ include file="common/session.jspf" %>
<!DOCTYPE html>
<html lang="zh">

<head>
<title>所问数据-用户手册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="logoIcon" href="img/logos/favicon.ico"/>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/simple-sidebar.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">


<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	
</head>

<body id="page-top" class="index">
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=request.getContextPath()%>">
					<img style="width:201px;height:50px;" class="pull-left" alt="所问数据" src="img/logos/logoIcon.png">
				</a>
				<input  id="source" class="hidden" value="<%=request.getParameter("source")%>" />
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li>
					<a href="<%=request.getContextPath()%>/action/retrieveTasksAction.do">
					<!-- <a href="#" onclick="history.go(-1);" > -->
							<span class="fa fa-chevron-left"></span> 返回任务管理
					</a>
				</li>
				<li><div class="nav-string">|</div></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user"></i> <%= user.get("userName").toString() %> 
						<b class="fa fa-caret-down"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-fw fa-user"></i> 个人资料</a>
						</li>
						<li><a href="#"><i class="fa fa-fw fa-envelope"></i> 收件箱</a></li>
						<li><a href="#"><i class="fa fa-fw fa-gear"></i> 设置</a>
						</li>
						<li class="divider"></li>
						
					</ul>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/action/logoutAction.do"><i class="fa fa-sign-out"></i> 退出</a>
				</li>
				<li><div class="nav-string">|</div></li>
				<li><a href="<%=request.getContextPath()%>/introDoc.jsp?source=userGuide"><i class="fa fa-info-circle"></i> 用户手册</a></li>
				<li><a href="<%=request.getContextPath()%>/introDoc.jsp?source=contactUs"><i class="fa fa-comment-o"></i> 联系我们</a></li>
				
			</ul>
			
			<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li class="navLi" style="padding-top:20px;">
						用户手册 
					</li>
					<li id="introProductLi" class="subLi">
						<a href="#">
								<span class="fa fa-file-text-o"></span> 产品介绍
						</a>
					</li>
					<li id="useGuideLi" class="subLi">
						<a href="#" onclick="">
							<span class="fa fa-map-o"></span> 使用说明
						</a>
					</li>
					<li id="QALi" class="subLi">
						<a href="#">
							<span class="fa fa-question-circle"></span> 常见问题
						</a>
					</li>
					<li class="navLi">
						联系我们 
					</li>
					<li id="cooperationLi" class="subLi">
						<a href="#">
							<span class="fa fa-comments"></span> 合作意向
						</a>
					</li>
					<li id="suggestionLi" class="subLi">
						<a href="#">
							<span class="fa fa-commenting-o"></span> 意见反馈
						</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">
			<!-- 产品介绍 -->
			<div id="introProduct" class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							产品介绍
						</h3>
					</div>
				</div>
				<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <h6>什么是所问数据开放平台？</h6>
								<p>
									所问数据开放平台依托在大数据领域的资源优势、技术优势、人才优势， 对外提供平台化预测服务，开放所问数据的大数据预测能力，让大数据辅助企业进行商业运营决策。<br>

									基于所问数据积累整合的各行业数据，自动探索、分析、预测大数据中与预测目标最相关的因素，并对预测目标建立时间序列分析、机器学习、大规模深度学习等模型， 以此来预测未来一段时间的结果。
                          		</p>
                          		
                          		<h6>典型应用场景</h6>
								<p>
									某汽车零配件供应商，希望预测未来3个月的汽配件的销售量，以便提前规划进货、仓储、人员分工等工作。<br>
									
									该供应商只要从其CRM系统中导出过去2年以上的每个月的汽配件的销售数据，将其上传到所问数据预测开放平台，并填写需要预测的月数（这里是3个月的未来数据），提交预测任务；所问数据预测开放平台就会自动挖掘与各汽配件销售量相关的因素，建立大数据预测模型，来准确预测汽配件的销售量。<br>
									
									让供应商相关的部门可以对未来一定时间内的销售量做出相对准确的预估，并以此来进行合理的资源分配和工作安排。
								</p>
								
                            </div>
                        </div>
                    </div>
                </div>
			</div>
			
			<hr>
			
			<!-- 使用说明 -->
			<div id="useGuide" class="container-fluid" style="margin-top:10px;">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							使用说明
						</h3>
					</div>
				</div>
				<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <h6>一、登录所问数据开放平台</h6>
								<p>登录示例</p>
								<img src="img/example/login-example.jpg" alt="登录示例">
								<h6>二、新建预测任务</h6>
								<p>
									填写方便识别的任务名称，选择任务所属的分组，方便日后管理。<br>
									历史数据支持上传月粒度及季度粒度的时序数据，为保证预测准确可行，请上传至少24个月（月粒度）/24个季度（季度粒度）的历史数据，数据格式说明请下载数据模板查阅。<br>
									填写预测的个数，为1到12之间的整数。<br>
									新建任务<br>
									<img src="img/example/new-task-example.jpg" alt="新建任务示例">
								</p>
								<h6>三、查看任务状态</h6>
								<p>
									提交任务后，可点击“全部任务”或者任务分组进入任务列表，查看任务计算状态。<br>
									查看状态<br>
									<img src="img/example/task-list-example.jpg" alt="查看任务状态示例">
								</p>
								<h6>四、查看任务详情</h6>
								<p>
									任务计算完成后，可点击任务名称查看预测结果，预测结果可下载。<br>
									任务详情<br>
									<img src="img/example/task-detail-example.jpg" alt="查看任务详情示例">
								</p>							
                            </div>
                        </div>
                    </div>
                </div>
			</div>
			
			<hr>
			
			<!-- QA -->
			<div id="QA" class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							常见问题
						</h3>
					</div>
				</div>
				<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
								<h6>1. 所问数据开放平台是否收费</h6>	
								<p>所问数据预测开放平台试运营期间可免费使用。<br></p>					
								<h6>2. 所问数据开放平台的适用范围</h6>	
								<p>
									 所问数据测开放平台目前适用于月粒度和季度粒度的时序数据预测，未来会支持日粒度、周粒度和年粒度。<br>
								</p>
								<h6>3. 提交预测任务有什么限制</h6>
								<p>	
									试运营期间，每个账号每天可以提交5个预测任务。<br>
								</p>
								<h6>4. 所问数据可以预测未来多长时间的数据</h6>	
								<p>
									上传的历史数据的时间跨度不同，可预测的时间不同；历史数据越多，可预测的时间越长。目前支持预测1到12个月（月粒度即1到12个月，季度数据即1到4个季度）。
								</p>
								<h6>5. 上传历史数据时，有哪些注意事项</h6>	
								<p>
									（1）为保证数据文件的可用性，推荐使用数据模板上传。<br>
									（2）目前支持上传月粒度和季度粒度的时序数据，文件格式为文本文件（.txt后缀）。<br>
									（3）文件分两列，第一列是日期，第二列是数据值，中间用tab或空格分隔（从excel表格将数据复制到文本文件，直接就是tab分隔）； 一个日期对应一个数据值，多个数据值请拆分成多个文件。<br>
									（4）日期请顺序输入，支持以下两种格式：2014M1、2014Q1，分别对应月度数据和季度数据。<br>
									（5）为保证预测准确可行，请上传至少24个无缺失的数据点的历史数据。<br>
									（6）用数据模板上传历史数据时，请将开头的说明文字删除。<br>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
			
			
			<!-- /#page-wrapper -->
		</div>
		
		<div id="page-wrapper">
			<!-- 合作意向-->
			<div id="cooperation" class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							合作意向
						</h3>
					</div>
				</div>
				<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
 
								<div class="col-lg-12">
									<form name="sentMessage" id="contactForm" novalidate="">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<input type="text" class="form-control" placeholder="您的姓名" id="name" 
														required="" data-validation-required-message="Please enter your name.">
													<p class="help-block text-danger"></p>
												</div>
												<div class="form-group">
													<input type="email" class="form-control" placeholder="您的联系方式：邮箱" id="email" 
														required="" data-validation-required-message="Please enter your email address.">
													<p class="help-block text-danger"></p>
												</div>
												<div class="form-group">
													<input type="tel" class="form-control" placeholder="您的联系方式：您的电话" id="phone" 
														required="" data-validation-required-message="Please enter your phone number.">
													<p class="help-block text-danger"></p>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<textarea class="form-control" style="height:140px;" placeholder="您的合作方式及内容" id="message" 
														required="" data-validation-required-message="Please enter a message."></textarea>
													<p class="help-block text-danger"></p>
												</div>
											</div>
											<div class="clearfix"></div>
											<div class="col-lg-12 text-center">
												<div id="success"></div>
												<button id="contactSubmitBtn" type="submit" class="btn btn-info" data-loading-text="正在提交...">提交</button>
											</div>
										</div>
									</form>
								</div>
														
                            </div>
                        </div>
                    </div>
                </div>
                <hr> 
			</div>
			
			<!-- 意见反馈 -->
			<div id="suggestion" class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							意见反馈
						</h3>
					</div>
				</div>
				<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">

                                <div class="col-lg-12">
									<form name="sentMessage" id="contactForm" novalidate="">
										<div class="row">
											<div class="col-md-6 col-md-offset-3">
												<div class="form-group">
													<textarea class="form-control" style="height:140px;" placeholder="您的意见或建议" id="message" 
														required="" data-validation-required-message="Please enter a message."></textarea>
													<p class="help-block text-danger"></p>
												</div>
											</div>
											<div class="col-md-6 col-md-offset-3">
												<div class="form-group">
													<input type="tel" class="form-control" placeholder="您的联系方式" id="phone" 
														required="" data-validation-required-message="Please enter your phone number.">
													<p class="help-block text-danger"></p>
												</div>
											</div>
										
											<div class="clearfix"></div>
											<div class="col-lg-12 text-center">
												<div id="success"></div>
												<button id="contactSubmitBtn" type="submit" class="btn btn-info" data-loading-text="正在提交...">提交</button>
											</div>
										</div>
									</form>
								</div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <hr> 
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	
<!-- footer -->
<%@ include file="common/innerFooter.jspf" %>	
	
<!-- 个人资料 -->
<%@ include file="common/userInfo.jspf" %>
<!-- jQuery -->
<script type="text/javascript" src="js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/animatescroll.min.js"></script>
<script type="text/javascript" src="js/passwordStrengthMeter.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/commonJs.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	if($('#source').val()=="contactUs"){ // 用户手册
		$(".nav").find(".active").removeClass("active");
		$('#cooperation').animatescroll({scrollSpeed:2000,padding:80,easing:'easeInOutBack'});
		$("#cooperationLi").addClass("active");
	}else if($('#source').val()=="userGuide"){ // 联系我们
		$(".nav").find(".active").removeClass("active");
		$('#introProduct').animatescroll({scrollSpeed:2000,padding:80,easing:'easeInOutBack'});
		$("#introProductLi").addClass("active");
		
	}
});

</script>
</body>
</html>
