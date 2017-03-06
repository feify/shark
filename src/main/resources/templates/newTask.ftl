<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.askingdata.fopen.db.pojo.Task"%>

<%@ include file="common/session.jspf" %>

<%
	JSONArray groupListByUserId= new JSONArray();
	if(null!=request.getSession().getAttribute("groupListByUserId")){
		groupListByUserId = (JSONArray)request.getSession().getAttribute("groupListByUserId");
	}
%>
<!DOCTYPE html>
<html lang="zh">

<head>
<title>所问数据-新建任务</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="logoIcon" href="img/logos/favicon.ico"/>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-select.min.css" rel="stylesheet">

<link href="css/simple-sidebar.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">

<link href="css/fileupload.css" rel="stylesheet" type="text/css"/>
<link href="css/d3/linechart.css" rel="stylesheet" type="text/css"/>
<link href="css/d3/nv.d3.css" rel="stylesheet" type="text/css"/>
<link href="css/c3.css" rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

</head>

<body id="page-top" class="index">
	<div id="wrapper">
		<!-- 导航 -->
		<%@ include file="common/mainNav.jspf" %>

		<div id="page-wrapper" style="min-width:800px;">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<span class="fa fa-plus" style="padding-right:10px"></span>新建任务 
						</h3>
					</div>
				</div>
				<!-- /.row -->
				
				<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o" style="padding-right:10px"></i>任务选项</h3>
                            </div>
                            <div class="panel-body">
                                <form id="newTaskForm"
								action="<%=request.getContextPath()%>/action/submitTaskAction.do"
								method="post">
								
								<div class="form-group col-sm-12 clearfix">
									<label class="pull-left" style="width:110px; padding-top:6px;">
										 任务名称：
									</label>
									<div class="input-group pull-left ">
										<input class="form-control pull-left" style="width:200px;" name="taskName" id="taskName" type="text"
											title="输入您的任务名" onblur="javascript:checkTaskName();"/>
										<label id="checkTaskNameLabel" for="taskName" class="lable-warning" style="padding-top:6px;"></label>
									</div>
								</div>
								
								<div class="form-group col-sm-12 clearfix">
									<label class="pull-left" style="width:110px; padding-top:6px;">
										 分组：
									</label>
									<div class="input-group pull-left ">
										<select id="assignGroup" class="selectpicker form-control show-tick"
											data-size="5" data-live-search="true" data-width="200px">
											<% 
												if(groupListByUserId.size()>0){
											%>
											<c:forEach var="groupInfo" items="<%=groupListByUserId%>">
												<option value='${groupInfo.groupId}'>${groupInfo.groupName}</option>											
											</c:forEach> 
											<%}else{ %>
												<option>default</option>
											<%} %>
										</select>
										<input id="groupId" name="groupId" type="hidden">
										<input id="groupName" name="groupName" type="hidden">
									</div>
								</div>
								
								<div class="form-group col-sm-12 clearfix">
									<label class="pull-left" style="width:110px; padding-top:6px;">
										 上传历史数据：
									</label>
									<div class="input-group pull-left" >
										<div id="fileuploader" name="fileuploader">
											<i class="fa fa-bar-chart-o" style="padding-right:10px"></i>选择数据文件
										</div>
										<label id="checkUploadFile" for="fileuploader" class="lable-warning" style="padding-top:6px;"></label>
									</div>
								</div>
								
								<div class="form-group col-sm-12 clearfix">
									<label class="pull-left" style="width:110px; padding-top:6px;">
										预测未来个数：
									</label>
									<div class="input-group pull-left">
										<input class="form-control pull-left" style="width:200px;"  name="ahead" id="ahead" type="text"
											title="输入预测未来的个数" onblur="javascript:checkAhead();"/>
										<label id="checkAheadLabel" for="ahead" class="lable-warning" style="padding-top:6px;"></label>
									</div>
								</div>
								<div class="form-group" style="margin-left:15px;">
									<button type="button" class="btn btn-info" onclick="submitTask()">提交任务</button>
								</div>
							</form>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- /#page-wrapper -->

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
<script type="text/javascript" src="js/bootstrap-select.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/jquery.uploadfile.min2.js"></script>

<script type="text/javascript" src="js/commonJs.js"></script>
<script type="text/javascript">
	$('#assignGroup').selectpicker();
	var oldGroups= <%=groupListByUserId%>,
		global = '<%=request.getContextPath()%>';
	
	jQuery(document).ready(function() {
		$("#fileuploader").uploadFile({
			url : "${pageContext.request.contextPath}/action/fileUploadAction.do",
			fileName:"historyFile",
			showFileCounter : false,
			multiple : false,
	//			maxFileCount : 1,
			doneStr : "上传成功",
			showDone : false,
			showDelete: true,
			deleteCallback : true,
			deleteCallback: function (aa, data, pd) {
			     // note here params "aa" and "pd" are useless. they're placeholder so that
			     // this callback function can be called by line 716 of jquery.uploadfile.min.js: C.deleteCallback.call(this, F, x)
	//			     if(data.filename == undefined){
	//			    	 $.post("http://localhost:8089/FOpenWeb/servlet/FileDelete?fileToDel=" + data.name); 
	//			     }else{
	//			    	 $.post("http://localhost:8089/FOpenWeb/servlet/FileDelete?fileToDel=" + data.filename.text());
	//			     }
				 $.post("${pageContext.request.contextPath}/action/fileDeleteAction.do");
			},
			onSuccess: function () {
				$('#checkUploadFile').hide();
		    }
		});
		
		$(".bs-searchbox input").css({
			"width":"100%",
			"margin-bottom":"10px"
		});

	});
	
	// taskName判断
	function checkTaskName(){
		if($('#taskName').val() == ''){
			$('#checkTaskNameLabel').html('任务名不能为空');
			$('#checkTaskNameLabel').show();
			return false;
		}
		else{
			$('#checkTaskNameLabel').hide();
			return true;
		}
	}
	
	// 预测个数判断
	function checkAhead(){
		if($('#ahead').val() == ''){
			$('#checkAheadLabel').html('请输入预测个数');
			$('#checkAheadLabel').show();
			return false;
		}
		else{
			$('#checkAheadLabel').hide();
			return true;
		}
	}
	
	// 数据文件
	function checkUploadFile(){
		// 判断是否有新文件上传
		var upload = $("#peng-statusbar");
		// 没有上传upload
		if(upload.length == 0){ 		
			$('#checkUploadFile').html('请上传预测文件');
			$('#checkUploadFile').show();
			return false;
		}else{
			return true;
		}		
	
	}
	var checkSubmitFlg = false;
	function submitTask(){
		 if (!checkSubmitFlg){
			checkTaskName();
			checkAhead();
			checkUploadFile();
			if (checkTaskName() && checkAhead() && checkUploadFile()) {
				// 设置groupId
				$('#groupId').val($('#assignGroup').val());
				// 设置groupName
				$('#groupName').val($("#assignGroup").find("option:selected").text());
				checkSubmitFlg = true;
				$('#newTaskForm')[0].submit();
			} else {
				return;
			}	
		 }
	}

</script>
</body>
</html>
