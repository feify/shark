<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.askingdata.fopen.db.pojo.Task"%>
<%@ include file="common/session.jspf" %>
<%

	JSONArray historyJSON = (JSONArray)session.getAttribute("historyJSON");
	JSONArray forecastJSON = (JSONArray)session.getAttribute("forecastJSON");
	String forecastStartDate = (String)session.getAttribute("forecastStartDate");
	JSONObject obj = (JSONObject)forecastJSON.get(0);
	JSONArray forecastValuesJSONArr = (JSONArray)obj.get("values");
	JSONArray groupListByUserId= new JSONArray();
	if(null!=request.getSession().getAttribute("groupListByUserId")){
		groupListByUserId = (JSONArray)request.getSession().getAttribute("groupListByUserId");
	}
%>
<!DOCTYPE html>
<html lang="zh">

<head>
<title>所问数据-预测结果</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="logoIcon" href="../img/logos/favicon.ico"/>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/simple-sidebar.css" rel="stylesheet">
<link href="../css/sb-admin.css" rel="stylesheet">
<link href="../css/bootstrap-select.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.min.css">


<!-- Custom CSS -->
<link href="../css/agency.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">

<link href="../css/fileupload.css" rel="stylesheet" type="text/css"/>
<link href="../css/d3/linechart.css" rel="stylesheet" type="text/css"/>
<link href="../css/d3/nv.d3.css" rel="stylesheet" type="text/css"/>
<link href="../css/c3.css" rel="stylesheet" type="text/css">


<!-- Custom Fonts -->
<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

</head>

<body id="page-top" class="index">
	<div id="wrapper">
		<!-- 导航 -->
		<%@ include file="common/mainNav.jspf" %>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							预测结果 <small>结果分析</small>
						</h1>
					</div>
				</div>
				<!-- /.row -->
				
				
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				  <div class="panel panel-default">
				    <div class="panel-heading" role="tab" id="headingOne">
				      
				        <a class="panel-title" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          	<i class="fa fa-bar-chart-o fa-fw"></i> 趋势分析
				        </a>
				         <a style="margin-left:15px;" href="<%=request.getContextPath()%>/action/retrieveTasksAction.do"> 任务列表</a>&nbsp;&nbsp;/&nbsp;
							预测结果
				        <!-- <button id="exportExcel" class="btn btn-info pull-right"
				         onclick="exportExcel1();">导出预测数据（Excel） </button> -->
				      
				    </div>
				    
				    <div id="collapseOne" class="panel-collapse collapse in" style="width:100%;" role="tabpanel" aria-labelledby="headingOne">
				    	<div class="panel-body">

							<div class="row" style="margin-bottom:10px;">
								<div class="col-lg-12">
									<select id="result1" data-style="btn-info" class="selectpicker show-tick">
										<option data-icon="glyphicon glyphicon-signal" value="lineChartOption1"> 曲线图</option>
										<option data-icon="glyphicon glyphicon-th" value="tableChartOption1"> 表格图</option>
									</select>
								</div>
							</div>
						
							<div class="row">
	                    		<!-- <div class="col-lg-12"><div id="lineChartDiv1" class='with-transitions'><svg></svg></div></div> -->
	                    		<div class="col-lg-12"><div id="lineChartDiv1" class='with-transitions'><svg></svg></div></div>
	                    		
	                    		<div class="col-lg-12">
		                    		<div id="tableChartDiv1" class='with-transitions hide'>
		                    			<div class="table-responsive">
		                    				<table id="data1" class="table table-striped table-bordered table-hover" width="100%" >
												<thead data-tableexport-display="always">
													<tr>
														<th  data-tableexport-value="日期">日期</th>
														<th  data-tableexport-value="预测数据">预测数据</th>
													</tr>
												</thead>
												<%-- <tbody>
											 	<%
													for(int i = 0; i < forecastValuesJSONArr.length(); i++){
													JSONObject date2ValObj = (JSONObject)forecastValuesJSONArr.get(i);
														String date = (String)date2ValObj.get("x");
														String value = String.valueOf(date2ValObj.get("y"));
												%>
													<tr>
														<td><%=date %></td>
														<td><%=value%></td>
													</tr>
												<%} %>  
												</tbody> --%>
											</table>
											
				                      </div>
				                    </div>
			                    </div>
							</div>
		                
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
<script type="text/javascript" src="../js/jquery.js"></script> 

<!-- <script type="text/javascript" src="../js/jquery-1.12.0.min.js"></script> -->
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="../js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-select.js"></script>

<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="../js/buttons.flash.min.js"></script>
<script type="text/javascript" src="../js/jszip.min.js"></script>
<script type="text/javascript" src="../js/buttons.html5.min.js"></script>
<script type="text/javascript" src="../js/buttons.print.min.js"></script>

<!-- <script type="text/javascript" src="../js/d3.js"></script>
<script type="text/javascript" src="../js/nv.d3.js"></script>
<script type="text/javascript" src="../js/c3.min.js"></script> -->
<script type="text/javascript" src="../js/d3.v3.min.js"></script>
<script type="text/javascript" src="../js/c3.js"></script>
<script type="text/javascript" src="../js/commonJs.js"></script>
<script type="text/javascript">

	$('#result1').selectpicker();
	$('#result2').selectpicker();
	var table;
		oldGroups= <%=groupListByUserId%>,
		global = '<%=request.getContextPath()%>';
	$(document).ready(function(){

		// datatable
		table = $('#data1').DataTable({
			 data: eval( <%= forecastValuesJSONArr %> ),
			 columns: [
			        { data: 'x' },
			        { data: 'y' }
			 ],
			"autoWidth":true,
			"scrollX": "disabled",
			"scrollY": 200,
			"searching":true,
			"processing": true,
			"bStateSave": false, // 记住查询翻页排序等状态
			 dom: 'Bfrtip',
			 lengthMenu: [
	              [ 10, 25, 50, -1 ],
	              ["每页10条", "每页25条", "每页50条", "显示全部"]
	         ],
	         buttons: [
	              [
	               	{ extend: 'pageLength', text: "每页显示数据量" },
	               	{ extend: 'csv', text: "导出到csv",title: "预测数据" },
	               	{ extend: 'excel', text: "导出到excel",title: "预测数据" }
	              ]
	         ],
    		 language: {
	            "sProcessing": "处理中...",
	            "sLengthMenu": "显示 _MENU_ 项结果",
	            "sZeroRecords": "没有匹配结果",
	            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
	            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
	            "sInfoPostFix": "",
	            "sSearch": "搜索:",
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
	                "sSortAscending": ": 以升序排列此列",
	                "sSortDescending": ": 以降序排列此列"
	            }
	         }	
		}); 
		table.columns.adjust();
	});
	
	// resize table in order to adjust header
	$(window).resize( function () {
        table.columns.adjust();
    } );
	
	// control linechart&tablechart
	$('#result1').change(function(){
    	var selectedChartType = $("#result1 option:selected").val();
    	if($("#result1 option:selected").val() == 'lineChartOption1'){
    		$('#tableChartDiv1').removeClass("show").addClass("hide");
    		$('#lineChartDiv1').addClass("show").removeClass("hide");
    	}
    	else if($("#result1 option:selected").val() == 'tableChartOption1'){
    		$('#lineChartDiv1').removeClass("show").addClass("hide");
    		$('#tableChartDiv1').addClass("show").removeClass("hide");
    		table.columns.adjust();
    	}
    });
    
    $('#result2').change(function(){
    	var selectedChartType = $("#result2 option:selected").val();
    	if($("#result2 option:selected").val() == 'lineChartOption2'){
    		$('#tableChartDiv2').removeClass("show").addClass("hide");
    		$('#lineChartDiv2').addClass("show").removeClass("hide");
    	}
    	else if($("#result2 option:selected").val() == 'tableChartOption2'){
    		$('#lineChartDiv2').removeClass("show").addClass("hide");
    		$('#tableChartDiv2').addClass("show").removeClass("hide");
    	}
    });
	
	var historyJSON = <%=historyJSON%>;
	var forecastJSON = <%=forecastJSON%>;
	var forecastStartDate = '<%=forecastStartDate%>';
	var aaa = myData();
	
	var chart = c3.generate({
		bindto: '#lineChartDiv1',
	    data: myData(),
	    size: {
	        height: 500
	    },
	    axis: {
	        x: {
	        	//type: 'category',
	            type: 'timeseries',
	            tick: {
	            	culling: {
	                    max: 4 // the number of tick texts will be adjusted to less than this value
	                },
	                 rotate: 45,
// 	                format: '%Y-%m-%d'
					format: function (d) {
						var output;
		            	var year = d.getFullYear();
		            	var month = d.getMonth() + 1;
		            	var day = d.getDate();
		            	if(day ==28){
		            		output = year +"年"+month +"月";
		            	}else{
			            	switch(month){
			            	case 1:
			            		output = year + "年第一季度";
			    				break;
			    			case 4:
			    				output = year + "年第二季度";
			    				break;
			    			case 7:
			    				output = year + "年第三季度";
			    				break;
			    			case 10:
			    				output = year + "年第四季度";
			    				break;
			            	}
		            	}
		            	return output;
					}
	            }
	        }
	    },
	    tooltip: {
	        format: {
	            title: function (d) {
	            	var output;
	            	var year = d.getFullYear();
	            	var month = d.getMonth() + 1;
	            	var day = d.getDate();
	            	if(day ==28){
	            		output = year +"年"+month +"月";
	            	}else{
		            	switch(month){
		            	case 1:
		            		output = year + "年第一季度";
		    				break;
		    			case 4:
		    				output = year + "年第二季度";
		    				break;
		    			case 7:
		    				output = year + "年第三季度";
		    				break;
		    			case 10:
		    				output = year + "年第四季度";
		    				break;
		            	}
	            	}
	            	return output;
	            },
	            value: function (value, ratio, id) {
	                var format = id === 'data1' ? d3.format(',') : d3.format('$');
	                return format(value);
	            }
//	            value: d3.format(',') // apply this format to both y and y2
	        }
	    }
	});
	
	
// 	var chart2 = c3.generate({

// 		bindto: '#lineChartDiv2',
// 	    data:myData(),
// 	    size: {
// 	        height: 500
// 	    },
// 	    axis: {
// 	        x: {
// 	        	type: 'category',
// 	            //type: 'timeseries',
// 	            tick: {
// 	            	culling: {
// 	                    max: 4 // the number of tick texts will be adjusted to less than this value
// 	                } 
// 	              /*   rotate: 45,
// 	                format: '%Y-%m-%d' */
// 	            }
// 	        }
// 	    }
// 	}); 
	
	
	function myData() {
		var arr1 = [];
		var arr11 = [];
		var arr12 = [];
		var arr13 = [];
		arr11.push('x');
		arr12.push('历史数据');
		arr13.push('预测数据');
		for (var i = 0; i < historyJSON[0].values.length; i++) {
			arr11.push(formatDate(historyJSON[0].values[i].x));
			arr12.push(historyJSON[0].values[i].y);
			arr13.push(null);
		}

		for (var i = 0; i < forecastJSON[0].values.length; i++) {
			arr11.push(formatDate(forecastJSON[0].values[i].x));
			arr12.push(null);
			arr13.push(forecastJSON[0].values[i].y);
		}
		arr1.push(arr11, arr12, arr13);
		console.log(arr1);
		return {
			x: 'x',
			columns: arr1,
			type: 'line'
			
		};
		
	}
	
	function setColor(d){
		var aaa = myData();
		return {pattern: ['#ff0000']};
	}
	
	function formatDate(data){
		if(data.indexOf("Q")!=-1){ // 数据带季度 如2015M1
			data = data.replace(/Q/,"年第") + "季度";
		}else if(data.indexOf("M")!=-1){ // 数据格式 如2015M1
			data = data.replace(/M/,"年") + "月";
		} 
		
/* 		if(data.indexOf("Q")!=-1){ // 数据带季度 如2015M1
			data = data.replace(/Q/,"-") + "-01";
		}else if(data.indexOf("M")!=-1){ // 数据格式 如2015M1
			data = data.replace(/M/,"-") + "-01";
		} */
		return data;
	}
	
	

</script>
</body>
</html>