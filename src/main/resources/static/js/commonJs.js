
var newGroupId,               // groupId
	newGroups = new Array(),  // 页面操作后的分组
	jsonGroups = new Array(); // 有变化的group(传给后台)

jQuery(document).ready(function() {
	// 侧边导航滚动条初始化
	 $(".collapse .side-nav").niceScroll({
	  touchbehavior:true, // 是否在触摸屏下使用
	  cursorcolor:"#ffd216",
	  cursorwidth:6,
	  cursorborder: "0px solid #fff", 
	  grabcursorenabled:false,
	  autohidemode:false,
	  preservenativescrolling:false
	 });
});

// nav-group 防止冒泡
$("a,input,li").mousedown(function(e){ 
	stopBubble(event);
}); 
$("a,input,li").mouseover(function(e){ 
	stopBubble(event);
}); 

// 防止页面冒泡事件
function stopBubble(e) { 
    if (e && e.stopPropagation){ // 非IE浏览器
    	e.stopPropagation();
    }else{ // IE
    	window.event.cancelBubble = true;
    }       
}

// 修改分组
$("#btnEditGroup").click(function(){
	$(".nav-group input").attr("readonly",false);
	$(".nav-group input").removeClass("nav-left-group").addClass("nav-left-group-input");
	$(".nav-left-del").removeClass("hidden");
	$("#saveGroup").removeClass("hidden").addClass("show");
	$("#addGroup").removeClass("hidden").addClass("show");
	$("#editGroup").removeClass("show").addClass("hidden");
});

// 保存分组
$("#btnSaveGroup").click(function(){
	$(".nav-group input").attr("readonly",true);
	$(".nav-group input").removeClass("nav-left-group-input").addClass("nav-left-group");
	$(".nav-left-del").addClass("hidden");
	$("#saveGroup").removeClass("show").addClass("hidden");	
	$("#addGroup").removeClass("show").addClass("hidden");
	$("#editGroup").removeClass("hidden").addClass("show");
	// remove未命名的分组
	removeUndefined();
	// 过滤有变化的group
	filtrateGroupList();
	
	// 判断是否有修改
	if(jsonGroups.length==0){
		//alert("没有修改的分组，请修改后再保存！");
		return;
	}
	
	$.ajax({
		type:"POST",
	    url : global + "/action/groupAction.do",
	    data:{display:"updateGroup",groupes:JSON.stringify(jsonGroups)},
	    success : function() {
	    	
	    }
	});
	// 重置相关数据
	resetList();
});

//remove未命名的分组，并给新加分组分配id
function removeUndefined(){
	initGroupId();
	$(".nav-group li").each(function (){
		if($(this).find("input").val()==""){
			$(this).remove();	
		}else{
			if(null==$(this).attr("Id")){// 新增分组分配id
				newGroupId++;
				$(this).attr("Id",newGroupId);
			}
			// groupFlag 初始值 0 增加1 修改2 删除 3
			newGroups.push( jQuery.parseJSON( '{ "groupId": '+$(this).attr("Id")+', "groupName": "'+$(this).find("input").val()+'", "groupFlag": 1 }' ));
		}
	})
}

// 过滤有变化的group
function filtrateGroupList(){
	var oldLength = oldGroups.length;
	if(oldGroups.length==0){ // 新用户第一次操作分组
		jsonGroups = newGroups;
	}else{
		$.each(newGroups, function(i, newGroupItem){
			var count = 0;
			$.each(oldGroups, function(index, oldGroupItem){
				if(oldGroupItem.groupId==newGroupItem.groupId){ // 原有分组修改
					if(oldGroupItem.groupName!=newGroupItem.groupName){
						// groupFlag 初始值 0 增加1 修改2 删除 3
						if(newGroupItem.groupName!=""){
							newGroupItem.groupFlag=2;
						}
						
						jsonGroups.push(newGroupItem);
					}
					return;
				}else{
					count++;
					if(count==oldLength){ // 新的分组
						jsonGroups.push(newGroupItem);
					}
				}
				
			});
		});
	}

}

// 重置相关数据
function resetList(){	
	oldGroups = newGroups;	  // 重新设置oldGroups
	newGroups = new Array();  // 重置newGroups
	jsonGroups = new Array(); // 重置jsonGroups
	// 重新绑定select（新建task&编辑task页面）
	if($("#assignGroup").length>0){
		$("#assignGroup").empty();
		$.each(oldGroups, function(i, item){
			$("#assignGroup").append("<option value="+item.groupId+">"+item.groupName+"</option>"); 
		});	 
		$('#assignGroup').selectpicker('refresh');
	}	
}

// 初始化groupId
function initGroupId(){
	var groupIdArr = new Array();
	$.each(oldGroups, function(i, item){
		groupIdArr.push(item.groupId);
	});
	if(groupIdArr.length==0){ // 新用户没有分组
		newGroupId = 0;
	}else{
		newGroupId = Math.max.apply(null, groupIdArr.valueOf());
	}
	
}

// 添加分组
$("#addGroup a").click(function(){	
	var str = "<a href='#'><span class='fa fa-group'>"+" "+
				"<input class='nav-left-group-input' placeholder='输入分组名称'>"+" "+
				"<button class='btn btn-warning nav-left-del' onclick='delGroup(this)';>删除</button>"+
				"</span></a>";
	var newLi = document.createElement('li');
	newLi.innerHTML = str;
	//newLi.setAttribute("Id",newGroupId);
	$(".nav-group").append(newLi);
	$(".nav-group:last-child").find(":input").focus();
});

// 删除分组
function delGroup(obj){
	if(confirm("确定要删除该分组吗？")){
		var p = obj.parentNode.parentNode.parentNode;
		if(p){
			if(null!=$(p).attr("Id")){ // 删除原有分组
				// groupFlag 初始值 0 增加1 修改2 删除 3
				newGroups.push( jQuery.parseJSON( '{ "groupId": '+$(p).attr("Id")+', "groupName": "", "groupFlag": 3 }' ));
			}
			p.remove();
		}
	}
}

// 产品介绍li
$("#introProductLi").click(function(){
	$(".nav").find(".active").removeClass("active");
	$('#introProduct').animatescroll({scrollSpeed:2000,padding:80,easing:'easeInOutBack'});
});

// 使用说明li
$("#useGuideLi").click(function(){
	$(".nav").find(".active").removeClass("active");
	$('#useGuide').animatescroll({scrollSpeed:2000,padding:80,easing:'easeInOutBack'});
});

// 常见问题li
$("#QALi").click(function(){
	$(".nav").find(".active").removeClass("active");
	$('#QA').animatescroll({scrollSpeed:2000,padding:80,easing:'easeInOutBack'});
});

// 合作意向li
$("#cooperationLi").click(function(){
	$(".nav").find(".active").removeClass("active");
	$('#cooperation').animatescroll({scrollSpeed:2000,padding:80,easing:'easeInOutBack'});
});

// 意见反馈li
$("#suggestionLi").click(function(){
	$(".nav").find(".active").removeClass("active");
	$('#suggestion').animatescroll({scrollSpeed:2000,padding:80,easing:'easeInOutBack'});
});

// 按组跳转
function groupManage(groupId,obj,global){
	stopBubble(event);
	if($(obj).find("input").attr("readonly")){
	   location.href = global + "/action/groupAction.do?display=displayTaskesByGroupId&groupId="+ groupId;
	}
}

// 取得最近任务列表
function getRecentTask(path,num){
	var str="";
	$.ajax({
		type:'get',
		url : path+'/action/retrieveTasksAction.do?recentNum='+num,
	   	success : function(data) {
	       	var taskList = $.parseJSON(data);
	       	console.log(taskList);
	       	for(i = 0; i < taskList.length; i++){
	
	       	str = str+	"<li>"+
				"<a href="+path+"/action/taskDetailsAction.do?taskId="+ taskList[i].id +">"+
	       		taskList[i].taskName+
				"</a>"+
			"</li>";
	       	console.log(str);
	       	}
	        $("#recentTask").html(str);
	   	}
	});
}

