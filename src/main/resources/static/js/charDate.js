//charDate表单验证
$(document).ready(function() {
	// 1.用户名
	$("#username").focus(function() {
		elemFocus("username_msg", "输入相应的用户名！");
	}).blur(userValidator);
	// 2.密码
	$("#password").focus(function() {
		elemFocus("pwd_msg", "输入相应的密码！");
	}).blur(pwdValidator);
	// 2.url
	$("#url").focus(function() {
		elemFocus("url_msg", "输入相应的url地址！");
	}).blur(urlValidator);
	// sql
	$("#sql").focus(function() {
		elemFocus("sql_msg", "输入相应的sql语句！");
	}).blur(sqlValidator);

	$('#data').change(function() {
		var value = $("#data").find("option:selected").val();
		if (value == '1') {
			$('#a2,#a3,#a8,#a4').removeClass('hide');
			$('#a1').addClass('hide');
		}
		if (value == '2') {
			$('#a1,#a8').removeClass('hide');
			$('#a2,#a3,#a4').addClass('hide');
		}
		if (value == '3') {
			$('#a2,#a3,#a8').removeClass('hide');
			$('#a1,#a4').addClass('hide');
		}
	});
	
	/********corn表达式*************/
	/*$(".numberspinner").numberspinner({
		onChange:function(){
			$(this).closest("div.radio").children().children().eq(0).click();
		}
	});*/

	var vals = $("input[name^='v_']");
	console.log(vals);
	var cron = $("#cron");
	vals.change(function() {
		var item = [];
		vals.each(function() {
			item.push(this.value);
			
		});
	    //修复表达式错误BUG，如果后一项不为* 那么前一项肯定不为为*，要不然就成了每秒执行了
	    //获取当前选中tab
		var currentIndex = 0;
		$(".tabs>li").each(function (i, item) {
		    if($(item).hasClass("tabs-selected")){
		        currentIndex =i;
		        return false;
		    }

		});
        //当前选中项之前的如果为*，则都设置成0
		for (var i = currentIndex; i >= 1; i--) {
		    if (item[i] != "*" && item[i - 1] == "*") {
		        item[i - 1] = "0";
		    }
		}
	    //当前选中项之后的如果不为*则都设置成*
		if (item[currentIndex] == "*") {
		    for (var i = currentIndex + 1; i < item.length; i++) {
		        if (i == 5) {
		            item[i] = "?";
		        } else {
		            item[i] = "*";
		        }
		    }
		}
		cron.val(item.join(" ")).change();
	});
	//指定固定天数函数
	var dayList = $(".dayList").children().children();
	$("#day_appoint").click(function(){
	    if (this.checked) {
	        if ($(dayList).filter(":checked").length == 0) {
	            $(dayList.eq(0)).attr("checked", true);
	        }
			dayList.eq(0).change();
		}
	});
	
	dayList.change(function() {
		var day_appoint = $("#day_appoint").prop("checked");
		if (day_appoint) {
			var vals = [];
			dayList.each(function() {
				if (this.checked) {
					vals.push(this.value);
				}
			});
			var val = "?";
			if (vals.length > 0 && vals.length < 31) {
				val = vals.join(",");
			}else if(vals.length == 31){
				val = "*";
			}
			var item = $("input[name=v_day]");
			item.val(val);
			item.change();
		}
	});
	
	var mouthList = $(".mouthList").children().children();
	$("#mouth_appoint").click(function(){
	    if (this.checked) {
	        if ($(mouthList).filter(":checked").length == 0) {
	            $(mouthList.eq(0)).attr("checked", true);
	        }
			mouthList.eq(0).change();
		}
	});
	
	mouthList.change(function() {
		var mouth_appoint = $("#mouth_appoint").prop("checked");
		if (mouth_appoint) {
			var vals = [];
			mouthList.each(function() {
				if (this.checked) {
					vals.push(this.value);
				}
			});
			var val = "?";
			if (vals.length > 0 && vals.length < 12) {
				val = vals.join(",");
			}else if(vals.length == 12){
				val = "*";
			}
			var item = $("input[name=v_mouth]");
			item.val(val);
			item.change();
		}
	});
	
	var weekList = $(".weekList").children().children();
	$("#week_appoint").click(function(){
	    if (this.checked) {
	        if ($(weekList).filter(":checked").length == 0) {
	            $(weekList.eq(0)).attr("checked", true);
	        }
			weekList.eq(0).change();
		}
	});
	
	weekList.change(function() {
		var week_appoint = $("#week_appoint").prop("checked");
		if (week_appoint) {
			var vals = [];
			weekList.each(function() {
				if (this.checked) {
					vals.push(this.value);
				}
			});
			var val = "?";
			if (vals.length > 0 && vals.length < 7) {
				val = vals.join(",");
			}else if(vals.length == 7){
				val = "*";
			}
			var item = $("input[name=v_week]");
			item.val(val);
			item.change();
		}
	});


});

// 定义函数-通用信息提示
function elemFocus(eleId, text) {
	var ele_msg = $("#" + eleId);
	ele_msg.text(text);
	ele_msg.attr("class", "focus");
}
// 定义用户名的函数
function userValidator() {
	var value = $("#username").val();
	var username_msg = $("#username_msg")
	if (value == "" || value == null) {
		username_msg.text("用户名不能为空！");
		username_msg.attr("class", "error");
		return false;
	} else if (!/^[a-zA-Z0-9-_]{4,20}$/.test(value)) {
		username_msg.text("用户名输入不正确！");
		username_msg.attr("class", "error");
		return false;
	}
	// 验证通过修改正确样式
	if (!username_msg.hasClass("hide")) {
		username_msg.text("");
		username_msg.attr("class", "hide");
	}
	return true;
}
// 定义验证密码的函数
function pwdValidator() {
	var value = $("#password").val();
	var pwd_msg = $("#pwd_msg");
	if (value == "" || value == null) {
		pwd_msg.text("密码不能为空!");
		pwd_msg.attr("class", "error");
		return false;
	} else if (!/^[a-zA-Z0-9]{6,20}$/.test(value)) {
		pwd_msg.text("密码输入不正确！");
		pwd_msg.attr("class", "error");
		return false;
	}
	if (!pwd_msg.hasClass("hide")) {
		pwd_msg.text("");
		pwd_msg.attr("class", "hide");
	}
	return true;
}
// 定义验证url的函数
function urlValidator() {
	var value = $("#url").val();
	var url_msg = $("#url_msg");
	if (value == "" || value == null) {
		url_msg.text("url不能为空!");
		url_msg.attr("class", "error");
		return false;
	} else if (!/http:\/\/.*/.test(value)) {
		url_msg.text("url输入格式不正确!");
		url_msg.attr("class", "error");
		return false;
	}
	if (!url_msg.hasClass("hide")) {
		url_msg.text("");
		url_msg.attr("class", "hide");
	}
	return true;
}

// 定义验证sql的函数
function sqlValidator() {
	var value = $("#sql").val();
	var sql_msg = $("#sql_msg");
	if (value == "" || value == null) {
		sql_msg.text("sql不能为空!");
		sql_msg.attr("class", "error");
		return false;
	}

	if (!sql_msg.hasClass("hide")) {
		sql_msg.text("");
		sql_msg.attr("class", "hide");
	}
	return true;
}

function validateForm() {
	if (!userValidator() || !pwdValidator() || !pwdRepeatValidator()
			|| !emailValidator()) {
		return false;
	}
	return true;
}



var txtDaily;
//corn
/*****按天算片段*******/
$(function(){
		
		var dayList=$(".dayList").children().children();
		$("#day_appoint").click(function(){
			if(this.checked){
				dayList.eq(0).change();
				return txtDaily;
			}
		});
		dayList.change(function(){
				var day_appoint=$("#day_appoint").prop("checked");
				if(day_appoint){
					var vals=[];
					dayList.each(function(){
						if(this.checked){
							vals.push(this.value);
						}
					});
					function compare(a,b){return a-b}
					vals.sort(compare);
					txtDaily="?"
					if(vals.length>0 && vals.length<31){
						txtDaily=vals.join(",");
					}else if(vals.length == 31){
						txtDaily="*";
					}
				}
				return txtDaily;
		});
		$("#cycle_day").click(function(){
			if(this.checked){
				cyc.eq(0).change();
			}
			return txtDaily;
		});
		var cyc=$(".cyc");
		cyc.change(function(){
			var cycle_day=$("#cycle_day").prop("checked");
			if(cycle_day){
				var Start_day=$("#Start_day").val();
				var End_day=$("#End_day").val();
				txtDaily=Start_day+"-"+End_day;
			}
			return txtDaily;
		});
		$("#latestDay").click(function(){
			if(this.checked){
				day1.eq(0).change();
			}
			return txtDaily;
		});
		var day1=$(".day1");
		day1.change(function(){
			var latestDay=$("#latestDay").prop("checked");
			if(latestDay){
				var dayStart_1=$("#dayStart_1").val();
				var dayEnd_1=$("#dayEnd_1").val();
				txtDaily=dayStart_1+"/"+dayEnd_1;
			}
			return txtDaily;
		});
		var eve_day=$("#eve_day");
		$("#every_day").click(function(){
			if(this.checked){
				eve_day.change();
			}
			return txtDaily;
		});
		eve_day.change(function(){
			var every_day=$("#every_day").prop("checked");
			if(every_day){
				var eve_day=$("#eve_day").val();
				txtDaily=eve_day+"W";
			}
			return txtDaily;
		});
		function lastDay(){
			txtDaily="L"
			return txtDaily;
		}
		function getExp(){
			var mycron = "-1";
			var nowdisplay = $("#nowdisplay").val();
			if (nowdisplay == "Daily") {
				var txtDaily = $("#txtDaily").val();
				var hourPart = $("#hourPart").val();
				var minutePart = $("#minutePart").val();
				var mycron = "* * * " + " 1/" + txtDaily
						+ " * ?";
			}
		}
		
		function ret() {
			var txt = document.getElementById("#cron").value;
			var isSure = confirm('确认将表达式: \"' + txt + "\" 返回给父窗口?");
			if (isSure) {
				alert("success");
			}
		}
		
});
