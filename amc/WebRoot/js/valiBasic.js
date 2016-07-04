function trim(str){ //删除左右两端的空格 
		return str.replace(/(^\s*)|(\s*$)/g, ""); 
}
function isNull(str){
	 if(str==null || trim(str)==""){
	 	return true;
	 }
	 return false;
}
function validatePwd(pwd){
	
	if(isNull(pwd)){
	 	swal("密码不能为空","","warning");
	 	return false;
	 }else if(pwd.length<6){
		 	swal("密码不能小于6位","","warning");
			return false;
	}else if(pwd.length>18){
			swal("密码不能大于18位","","warning");
			return false;
	}
	if(pwd != pwd_c ){
	 	 swal("两次密码输入不相同","","warning");
		 return false;
	}
	if(!checkpsd(pwd)){
	 	 swal("密码只能为数字或字母","","warning");
		 return false;
	 }
	return true;
	
}
function checkPositiveNumber(number){// 检查是否是正整数
	var type = /^[0-9]*[1-9][0-9]*$/;
	if(type.test(number)){
		return true;
	}else{
		return false;
	}
}
function checkPositiveRealNumber(number){// 检查是否是正数
	var type = /^\d{1,9}$|^\d{1,9}[.]\d{1,3}$/;
	if(type.test(number)){
		return true;
	}else{
		return false;
	}
}
function checkpsd(value) {
    var Regx = /^[A-Za-z0-9]*$/;
    if (Regx.test(value)) {
        return true;
    }
    else {
        return false;
    }
}
function checkTel(phone){
	var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
		var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
	if(isMob.test(phone)||isPhone.test(phone)){
    	return true;
	}else{
    	return false;
	}
} 
function checkEmail(email){
  var isEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z0-9\.-]+)\.([a-z\.]{2,6})$/;
  if(isEmail.test(email)){
  	return true;
  }else{
  	return false;
  }
}
