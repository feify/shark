<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.askingdata.fopen.db.pojo.Task"%>
<%@ page import="com.askingdata.fopen.utils.Params"%>

<%@ include file="common/session.jspf" %>
<%
	List<Task> allTasksList;
	List<Task> taskList = null;
	Integer groupQueryFlag = (Integer)request.getSession().getAttribute("groupQueryFlag");
	if(groupQueryFlag.equals(0)){ // 全部任务页面
		allTasksList = (ArrayList) session.getAttribute("allTasksList");
	}else{ // 分组查询页面
		allTasksList= (ArrayList) session.getAttribute("tasklist");
		taskList= (ArrayList) session.getAttribute("tasklist");
	}                                                                                                                                                                                                                    
	List<Task> finishedTasksList = (ArrayList) session.getAttribute("finishedTasksList");	
	List<Task> failedTasksList = (ArrayList) session.getAttribute("failedTasksList");	
	List<Task> runningTasksList = (ArrayList) session.getAttribute("runningTasksList");	
	Iterator<Task> allTasksListIt = allTasksList.iterator();		
	Iterator<Task> finishedTasksListIt = finishedTasksList.iterator();
	Iterator<Task> failedTasksListIt = failedTasksList.iterator();
	Iterator<Task> runningTasksListIt = runningTasksList.iterator();
	JSONArray groupListByUserId= new JSONArray();
	if(null!=request.getSession().getAttribute("groupListByUserId")){
		groupListByUserId = (JSONArray)request.getSession().getAttribute("groupListByUserId");
	}
	
%>

<!DOCTYPE html>
<html lang="zh">

<head>
<title>所问数据-全部数据</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="logoIcon" href="../img/logos/favicon.ico"/>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/simple-sidebar.css" rel="stylesheet">
<link href="../css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/dataTables.bootstrap.css">

<!-- Custom CSS -->
<link href="../css/agency.css" rel="stylesheet">
<link href="../css/task-details.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body id="page-top" class="index">

	<div id="wrapper">
		<!-- Navigation -->
		<div id="main-container">
		<!-- 导航 -->

		<%@ include file="common/mainNav.jspf" %>
		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-line-chart"></i> <span id="headerName"> </span><small> 任务详细信息</small>
						</h3>
					</div>
				</div>
				<!-- /.row -->
				<div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-dashboard"></i> 任务列表</h3>
                            </div>

							<div class="panel-body">
								<ul class="nav nav-tabs" style="background-color:#fff;font-weight:900;">
									<li class="active"><a data-toggle="tab" href="#sectionA" ><i class="fa fa-files-o"></i> 全部</a></li>
									<li><a data-toggle="tab" href="#sectionB"><i class="fa fa-check"></i> 成功</a></li>
									<li><a data-toggle="tab" href="#sectionC"><i class="fa fa-close"></i> 失败</a></li>
									<li><a data-toggle="tab" href="#sectionD"><i class="fa fa-spinner"></i> 计算中</a></li>
								</ul>
								<div class="tab-content hidden">
									<!-- 全部任务 start -->
									<div id="sectionA" class="tab-pane fade in active" >
										<table class="list-group table table-striped table-bordered " cellspacing="0" style="min-width:600px" >
											<thead>
											    <tr>
											        <th >全部任务</th>
											    </tr>
											</thead>
											<tbody>
 												<%
													while (allTasksListIt.hasNext()) {
														Task task = allTasksListIt.next();
												%> 

												
												<tr>
													
													<td class="list-group-item">
														
														<div>
															<span><%=task.getTaskName()%></span>
															<span style="float: right"><fmt:formatDate value='<%=task.getTaskCreationTime()%>' type="time" pattern="yyyy/MM/dd HH:mm"/></span>
														</div> 
														<%
														 	if (task.getTaskStatus().equalsIgnoreCase(
														 				Params.TASK_STATUS_FINISHED)) {
														 %>
														<div style="margin-top:15px;">
															<span><font color="green"><b>任务成功</b></font></span>
															<a href="#" style="float: right; padding-left: 40px;" onclick='delTask("<%=task.getId()%>");' >
																<span class="glyphicon glyphicon-trash"></span><b> 删除</b>
															</a> 
															<a style="float: right"
																href="<%=request.getContextPath()%>/action/editTaskAction.do?taskId=<%=task.getId()%>">
																<span class="glyphicon glyphicon-edit"></span><b> 编辑</b>
															</a>
														</div> 
														<a class="manager-task-item-link"
															href="<%=request.getContextPath()%>/action/taskDetailsAction.do?taskId=<%=task.getId()%>"></a>
														</div>
														<%
														 	} else if (task.getTaskStatus().equalsIgnoreCase(
														 				Params.TASK_STATUS_FAILED)) {
														 %>
				
														<div style="margin-top:15px;">
															<span><font color="red"><b>任务失败</b></font></span>
															<a href="#" style="float: right; padding-left: 40px" onclick='delTask("<%=task.getId()%>");' >
																<span class="glyphicon glyphicon-trash"></span><b> 删除</b>
															</a> 
															<a style="float: right"
																href="<%=request.getContextPath()%>/action/editTaskAction.do?taskId=<%=task.getId()%>">
																<span class="glyphicon glyphicon-edit"></span><b> 编辑</b>
															</a>
														</div> 
														<%
														 	} else if (task.getTaskStatus().equalsIgnoreCase(
														 				Params.TASK_STATUS_IN_PROGRESS)) {
														 %>
		
														<div style="margin-top:15px;position:relative">
															<div class="prograssbarText">计算进度0% </div>
															<div id="<%=task.getId()%>" class="progress">
																<div class="progress-bar progress-bar-striped active" style="width:5%;" ></div>
															</div>												
														</div> 
														<%
														 	} else if (task.getTaskStatus().equalsIgnoreCase(
														 				Params.TASK_STATUS_UNSTARTED)) {
														 %>
														<div style="margin-top:15px;">	
															<div id="<%=task.getId()%>">	
																<span>任务未启动</span>		
															</div>									
														</div> 
														<%
														 	}
														 %> 
				 									</td>	
												</tr>
												
												<%
													}
												%>
											
											</tbody>
										</table>
									</div>
									<!-- 全部任务 end -->
									
									<!-- 成功任务 start -->
									<div id="sectionB" class="tab-pane fade">
										<table class="list-group table table-striped table-bordered" style="width:100%" >
											<thead>
											    <tr>
											        <th >成功任务</th>
											    </tr>
											</thead>
											<tbody>
												<%
													while (finishedTasksListIt.hasNext()) {
														Task task = finishedTasksListIt.next();
												%>
												<tr>
													<td class="list-group-item">
														<div>													
															<span><%=task.getTaskName()%></span>													
															<span style="float: right"><fmt:formatDate value='<%=task.getTaskCreationTime()%>' type="time" pattern="yyyy/MM/dd HH:mm"/></span>													
														</div>
														<div style="margin-top:15px;">
															<span><font color="green"><b>任务成功</b></font></span>												
															<a href="#" style="float: right; padding-left: 40px;" onclick='delTask("<%=task.getId()%>");' >
																<span class="glyphicon glyphicon-trash"></span><b> 删除</b>
															</a> 
															<a style="float: right"
																href="<%=request.getContextPath()%>/action/editTaskAction.do?taskId=<%=task.getId()%>">
																<span class="glyphicon glyphicon-edit"></span><b> 编辑</b>
															</a>													
														</div> 
														
														<a class="manager-task-item-link"
															href="<%=request.getContextPath()%>/action/taskDetailsAction.do?taskId=<%=task.getId()%>"></a>
													</td>
												</tr>
												
												<%
													}
												%>
											</tbody>
										</table>
									</div>
									<!-- 成功任务 end -->
									
									<!-- 失败任务 start -->
									<div id="sectionC" class="tab-pane fade">
										<table class="list-group table table-striped table-bordered" style="width:100%" >
											<thead>
											    <tr>
											        <th >失败任务</th>
											    </tr>
											</thead>
											<tbody>
												<%
													while (failedTasksListIt.hasNext()) {
														Task task = failedTasksListIt.next();
												%>
												<tr>
													<td class="list-group-item">
														<div>													
															<span><%=task.getTaskName()%></span>													
															<span style="float: right"><fmt:formatDate value='<%=task.getTaskCreationTime()%>' type="time" pattern="yyyy/MM/dd HH:mm"/></span>												
														</div>
														<div style="margin-top:15px;">													
															<span><font color="red"><b>任务失败</b></font></span>
															<a href="#" style="float: right; padding-left: 40px" onclick='delTask("<%=task.getId()%>");' >
																<span class="glyphicon glyphicon-trash"></span><b> 删除</b>
															</a> 													
														</div>
													</td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
									<!-- 失败任务 end -->
									
									<!-- 计算中任务 start -->
									<div id="sectionD" class="tab-pane fade">
										<table class="list-group table table-striped table-bordered" style="width:100%" >
											<thead>
											    <tr>
											        <th >计算中任务</th>
											    </tr>
											</thead>
											<tbody>
												<%
													while (runningTasksListIt.hasNext()) {
														Task task = runningTasksListIt.next();
												%>
												<tr>
													<td class="list-group-item">
														<div>													
															<span><%=task.getTaskName()%></span>													
															<span style="float: right"><fmt:formatDate value='<%=task.getTaskCreationTime()%>' type="time" pattern="yyyy/MM/dd HH:mm"/></span>												
														</div>
														<div style="margin-top:15px;position:relative">
															<div class="prograssbarText">计算进度0% </div>
															<div id="<%=task.getId()%>" class="progress">
																<div class="progress-bar progress-bar-striped active" style="width:5%;" ></div>
															</div>												
														</div> 
													</td>
												</tr>
												<%} %>
											</tbody>
										</table>
									</div>
									<!-- 进行中任务 end -->
								</div>
							
							</div>
                    	</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- /#page-wrapper -->
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
</div>
<!-- footer -->
<%@ include file="common/innerFooter.jspf" %>	
<!-- 个人资料 -->
<%@ include file="common/userInfo.jspf" %>
<!-- jQuery -->
<script type="text/javascript" src="../js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="../js/commonJs.js"></script>
<script type="text/javascript" src="../js/passwordStrengthMeter.js"></script>
<script type="text/javascript" src="../js/validation.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="../js/sha.js"></script>

<script type="text/javascript">

	var oldGroups= <%=groupListByUserId%>,
		global = '<%=request.getContextPath()%>';

	jQuery(document).ready(function(){
		if(<%=groupQueryFlag%>==1){
			var headerName= '<%=(String)request.getSession().getAttribute("groupName") %>';
			
			$("#headerName").text(headerName+"分组任务列表");
			
		}else{
			$("#headerName").text("全部任务列表");
		}
		<%request.getSession().setAttribute("groupQueryFlag", 0);%>

		var flag = true;
		setInterval(function(){
		    $.ajax({
		          	url : '<%=request.getContextPath()%>/servlet/AjaxGetTaskProgress?userId=<%=user.get("id").toString()%>',
		           	success : function(data) {
			           	var taskList = $.parseJSON(data);
			           //	console.log(taskList);

			           	for(i = 0; i < taskList.length; i++){
			           		
							var taskId = taskList[i].id,
							    progress = Math.floor(taskList[i].taskProgress*100),
								   status = taskList[i].taskStatus,
								   barParWidth = Math.floor($('#' + taskId).width()),
							    barWidth = Math.floor($('#' + taskId).find('div').width());
							/* if($('#' + taskId).length==0){
								console.log("taskName" +taskList[i].taskName + " taskId:"+taskId+ "status:"+status+ " 滚动条有没有:"+$('#' + taskId).hasClass("progress"));
			           			continue;
			           		}  */
							 
			           		
		        		   // 正在进行的任务
		        		   if(status=="running"){
		        			   // 进度条动画
		        			   if(progress==0||barWidth==Math.floor(barParWidth*progress/100)+1||barWidth==Math.floor(barParWidth*progress/100)-1||barWidth==Math.floor(barParWidth*progress/100)){
				        		   // 进度未出现变化的任务
				        	   }else{
				        		   $('#' + taskId).find('div').animate({width: Math.floor(progress)+"%"});
				        		   $('#' + taskId).prev().text("计算进度"+ Math.floor(progress)+"%");
				        		  
				        	   }
				        		   
		        			   // 控制启动任务出现进度条
		        			   if(!$('#' + taskId).hasClass("progress")){
		        				   var str = "<div class='progress-bar progress-bar-striped active' style='width:5%;'></div>";
					        		   $('#' + taskId).html(str);
					        		   $('#' + taskId).addClass("progress");
		        			   }
		        		   }else if(status=="finished"){ // 结束的任务
				        	   if($('#' + taskId).hasClass("progress")){
				        		  var str = 
				        			  "<div style='margin-top:15px;'>"+
				        		  		    "<span><font color='green'><b>任务成功</b></font></span>"+
	  		  								"<a href='#' style='float: right; padding-left: 40px;' onclick='delTask("+ taskId +");'>"+
	  		  									"<span class='glyphicon glyphicon-trash'></span><b> 删除</b>"+
	  		  								"</a>" +
	  		  								"<a style='float: right' href='/faster/action/editTaskAction.do?taskId="+ taskId +"'>"+
	  		  									"<span class='glyphicon glyphicon-edit'></span><b> 编辑</b>"+
	  		  								"</a>"+
	  		  							"</div> "+
	  		  							"<a class='manager-task-item-link' href='/faster/action/taskDetailsAction.do?taskId="+ taskId +"'></a>"
				        		   $('#' + taskId).html(str);
				        		   $('#' + taskId).removeClass("progress");
				        		  
				        	   }
			        	   }

				      }
		           }
			}); 
			
		}, 5000);
		

		$(".list-group").DataTable({
		  "dom": '<"top pull-left searchTb"i><"searchTb" f>r t<"bottom" <"lengthChangeTb"l>><"clear">p <"clear">',
		  "autoWidth":true,
		  "scrollX": false,
		  "scrollY": 740,
		  "scrollCollapse":false,
		  "searching":true,
		  sort:false,
		  language: {
		           "sProcessing": "处理中...",
		           "sLengthMenu": "显示 _MENU_ 项结果",
		           "sZeroRecords": "没有匹配结果",
		           "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
		           "sInfoEmpty": "显示 第 0 至 0 项 结果，共 0 项",
		           "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
		           "sInfoPostFix": "",
		           "sSearch": "搜索: ",
		           "sUrl": "",
		           "sEmptyTable": "表中数据为空",
		           "sLoadingRecords": "载入中...",
		           "sInfoThousands": ",",
		           "oPaginate": {
		               "sFirst": "首页",
		               "sPrevious": "上页",
		               "sNext": "下页",
		               "sLast": "末页"
		           },
		           "oAria": {
		               "sSorbtAscending": ": 以升序排列此列",
		               "sSortDescending": ": 以降序排列此列"
		           }
		        }	
		}); 
		 
		$(".tab-content").removeClass("hidden").addClass("show");
		 
		adjustHeader();
		  
		
	});
	
	//删除任务
	function delTask(id){
		if(confirm("确定要删除该任务吗？")){
			location.href= "<%=request.getContextPath()%>" + "/action/deleteTaskAction.do?taskId="+id;
		}
	}
	
 	// resize table in order to adjust header
	$(window).resize( function () {
		adjustHeader();
	} ); 
	

	// tab切换事件
	 $(function(){
	    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	    	adjustHeader();
	   });
	 });
	
	 // reset width
	 function adjustHeader(){
		$(".dataTables_scrollHeadInner").css({
			"width":"100%"
		});
		 $(".dataTables_scrollHeadInner table").css({
			"width":"100%"
		});
	 }

</script>

</body>
</html>
