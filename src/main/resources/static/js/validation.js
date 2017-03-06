
jQuery(document).ready(function(){
	$('#password').keyup(function(){
		if($('#newPassword').length>0){
			$('#passwordStrength').html(passwordStrength($('#password').val()))
		}
	});
	$('#newPassword').keyup(function(){
		$('#passwordStrength').html(passwordStrength($('#newPassword').val()))
	});
});

function showMore(){
	$('#more').slideDown()
}

function isUserNameEmpty(){
	if($('#userName').val() == ''){
		return true;
	}
	else{
		return false;
	}
}

function isPasswordEmpty(){
	if($('#password').val() == ''){
		return true;
	}
	else{
		return false;
	}
}


function isPasswordLengthOk(){
	if($('#password').val().length < 6 || $('#password').val().length > 16){
		return false;
	}
	else{
		return true;
	}
}

function isNewPasswordLengthOk(){
	if($('#newPassword').val().length ==0 ){
		$('#checkNewPasswordLabel').html('');
		$('#checkNewPasswordLabel').hide();
		return true;
	}else{
	
		if($('#newPassword').val().length < 6 || $('#newPassword').val().length > 16){
			return false;
		}
		else{
			return true;
		}
	}
}

function isRepasswordEmpty(){
	if($('#repassword').val() == ''){
		return true;
	}
	else{
		return false;
	}
}

function isRepasswordMatchPassword(){
	if($('#repassword').val() == $('#password').val()){
		return true;
	}
	else{
		return false;
	}
}

function isEmailEmpty(){
	if($('#email').val() == ''){
		return true;
	}
	else{
		return false;
	}
}

function validateEmail(){
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test($('#email').val());
}

// 用户名
function userNameOnBlur(){
	if(isUserNameEmpty()){
		$('#checkUserNameLabel').html('用户名不能为空');
		$('#checkUserNameLabel').show();
		return false;
	}
	else{
		$('#checkUserNameLabel').html('');
		$('#checkUserNameLabel').hide();
		if(checkUserName()){
			return true;
		}else{
			return false;
		}
		
	}
}

// 检查用户名是否重复
function checkUserName(){
	new Ajax.Request(global+'/servlet/AjaxCheckEmail?userName='
			+ $('#userName').val(), {
		method : 'get',
		onSuccess : function(transport) {
			var data = eval(transport.responseText);
			if (data[0] == 'false') {
				$('#checkUserNameLabel').html('该用户名可用');
				$('#checkUserNameLabel').css("color","green");
				$('#checkUserNameLabel').show();
				return true;
			} else {
				$('#checkUserNameLabel').html('该用户名已被注册');
				$('#checkUserNameLabel').css("color","red");
				$('#checkUserNameLabel').show();
				return false;
			}
		}
	});
}

function passwordOnBlur(){
	if(isPasswordEmpty()){
		$('#checkPasswordLabel').html('密码不能为空');
		$('#checkPasswordLabel').show();
		return false;
	}else{
		if(!isPasswordLengthOk()){
			$('#checkPasswordLabel').html('长度不符合规定');
			$('#checkPasswordLabel').show();
			return false;
		}
		else{
			$('#checkPasswordLabel').html('');
			$('#checkPasswordLabel').hide();
			return true;
		}
	}
}

function editpassworldOnBlur(){
	if($('#password').val().length>0){
		var pwd = $('#password').val(),
			shaObjpwd = new jsSHA("SHA-1", "TEXT");
		shaObjpwd.update(pwd);
		// 判断密码是否正确
		$.ajax({ // edit -1 校验原始密码 ； 1提交修改 0 显示个人资料
			url:global+'/action/userRegistAction.do?edit=-1&pwd='+shaObjpwd.getHash("HEX"),
			type : 'get',
			success : function(data) {

				if(data!="wrongPwd") {
					$('#checkPasswordLabel').html('原密码正确');
					$('#checkPasswordLabel').css("color","green");
					$('#checkPasswordLabel').show();
				} else {
					$('#checkPasswordLabel').html('原密码错误');
					$('#checkPasswordLabel').css("color","red");
					$('#checkPasswordLabel').show();
				}
				
			},
			error:function(){
				alert("error");
			}
		});
	}
	
	if($('#newPassword').val().length>0){
		passwordOnBlur();
	}else{
		$('#checkPasswordLabel').html('');
		$('#checkPasswordLabel').hide();
		return true;
	}
}

// 新密码
function newPasswordOnBlur(){

	if(!isNewPasswordLengthOk()){
		$('#checkNewPasswordLabel').html('长度不符合规定');
		$('#checkNewPasswordLabel').show();
		return false;
	}
	else{
		if($("#repassword").val().length>0){
			if(!isRepasswordMatchPassword()){
				$('#checkRepasswordLabel').html('两次密码不一致');
				$('#checkRepasswordLabel').show();
				return false;
			}
			else{
				$('#checkRepasswordLabel').html('');
				$('#checkRepasswordLabel').hide();
				return true;
			}
		}
		$('#checkNewPasswordLabel').html('');
		$('#checkNewPasswordLabel').hide();
		return true;
	}
}

// 注册页面--确认密码
function repasswordOnBlur(){
	
	if(isRepasswordEmpty()){
		$('#checkRepasswordLabel').html('请再次输入密码');
		$('#checkRepasswordLabel').show();
		return false;
	}
	else{
		if(!isRepasswordMatchPassword()){
			$('#checkRepasswordLabel').html('两次密码不一致');
			$('#checkRepasswordLabel').show();
			return false;
		}
		else{
			$('#checkRepasswordLabel').html('');
			$('#checkRepasswordLabel').hide();
			return true;
		}
	}
}
// 确认新密码
function repassNewpasswordOnBlur(){
	if($("#newPassword").val().length>0){
		repasswordOnBlur();
	}else{
		$('#checkRepasswordLabel').html('');
		$('#checkRepasswordLabel').hide();
		return true;
	}
}

// email
function emailOnBlur(){
	if(isEmailEmpty()){
		$('#checkEmailLabel').html('邮箱不能为空');
		$('#checkEmailLabel').show();
	}
	else if(!validateEmail()){
		$('#checkEmailLabel').html('请输入正确的邮箱');
		$('#checkEmailLabel').show();
		return false;
	}else{
		$('#checkEmailLabel').hide();
		new Ajax.Request(global+'/servlet/AjaxCheckEmail?email='
							+ $('#email').val(), {
						method : 'get',
						onSuccess : function(transport) {
							var data = eval(transport.responseText);
							if (data[0] == 'false') {
								$('#checkEmailLabel').html('该邮箱可用');
								$('#checkEmailLabel').css("color","green");
								$('#checkEmailLabel').show();
							} else {
								$('#checkEmailLabel').html('该邮箱已被注册');
								$('#checkEmailLabel').css("color","red");
								$('#checkEmailLabel').show();
							}
						}
					});
	}
}

function isEmailOk(){
	emailOnBlur();
	if ('该邮箱可用' == $('#checkEmailLabel').html()) {
		return true;
	} else {
		return false;
	}
}

function checkEditUserInfoForm(){

	editpassworldOnBlur();
	newPasswordOnBlur();
	repassNewpasswordOnBlur();
	emailOnBlur();
	if (userNameOnBlur() && newPasswordOnBlur() && repassNewpasswordOnBlur()
			&& isEmailOk()) {
		
	} else {
		return;
	}
}
 
// 注册form submit
function authenticateBeforeSubmit(){
	userNameOnBlur();
	passwordOnBlur();
	repasswordOnBlur();
	emailOnBlur();
	if (userNameOnBlur() && passwordOnBlur() && repasswordOnBlur()
			&& isEmailOk()) {
		var pwd = $('#password').val();
		sha1(pwd); // SHA1加密密码
		$('#userSignUpForm').submit();
	} else {
		return;
	}
}


// SHA1加密密码
function sha1(pwd){
	var shaObj = new jsSHA("SHA-1", "TEXT");
	shaObj.update(pwd);
	$('#password').val(shaObj.getHash("HEX"));
}

