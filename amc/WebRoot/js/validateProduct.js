	function validate(){
		 pname=document.getElementById("pname").value;
		 psize=document.getElementById("psize").value;
		 pweight=document.getElementById("pweight").value;
		 psaleprice=document.getElementById("psaleprice").value;
		 ppurchaseprice=document.getElementById("ppurchaseprice").value;
		 pinventoryamount=document.getElementById("pinventoryamount").value;
		 psafeamount=document.getElementById("psafeamount").value;
		 
		 if(isNull(pname)){
		 	swal("请输入有效的产品名称!","","warning");
		 	return false;
		 }
		  if(isNull(psize)||!checkPositiveRealNumber(psize)){
		 	swal("请输入有效的产品规格!","","warning");
		 	return false;
		 }
		 if(isNull(pweight)||!checkPositiveRealNumber(pweight)){
		 	swal("请输入有效的产品重量!","","warning");
		 	return false;
		 }
		  if(isNull(psaleprice)||!checkPositiveRealNumber(psaleprice)){
		 	swal("请输入有效的销售价格!","","warning");
		 	return false;
		 }
		  if(isNull(ppurchaseprice)||!checkPositiveRealNumber(ppurchaseprice)){
		 	swal("请输入有效的采购价格!","","warning");
		 	return false;
		 }
		  if(pinventoryamount!=0 &&(isNull(pinventoryamount)||!checkPositiveNumber(pinventoryamount))){
		 	swal("库存量输入不正确!","","warning");
		 	return false;
		 }
		  if(isNull(psafeamount)||!checkPositiveNumber(psafeamount)){
		 	swal("请输入有效的安全库存数!","","warning");
		 	return false;
		 }
		  swal({title: "正在处理!",   text: "请稍等...",type:"success",    showConfirmButton: false });
		  //swal("正在处理!","稍等","success");	
		 return true;
		
	}
	function trim(str){ // 删除左右两端的空格
		return str.replace(/(^\s*)|(\s*$)/g, ""); 
	}
	function isNull(str){
		 if(str==null || trim(str)==""){
		 	return true;
		 }
		 return false;
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
	
	function validateAdd(){
		 var pid=document.getElementById("pid").value;
		 if(isNull(pid)){
			 	swal("请输入产品编码!","","warning");
			 	return false;
		}
		 if(!checkPositiveNumber(pid)){
			 	swal("产品编码不能出现字符!","","warning");
			 	return false;
		}
		 if(pid.length<6 || pid.length>10){
			 	swal("产品编码的长度不对!","","warning");
			 	return false;
		}
		 
		if(validate()){
			$.ajax({ 
				type: "post",
				url: "/amc/product.do?method=validateId", 
				dataType: "html", 
				async: true,
				data: { "pid": $("#pid").val()},	
				beforeSend: function() { 
	        		//请求前的处理 
					
					swal({   
						title: "正在处理!",   text: "请稍等",type:"success",    showConfirmButton: false 
						//closeOnConfirm: false,  
						//showLoaderOnConfirm: true,
						}, function(){  
							 setTimeout(function(){     
								 swal("网络状况不佳");   
							}, 5000);
						});
	        		
	   			 }, 
				success: function(date) {
					if(date==1){
						swal("产品编号已存在!","请严格按照产品编码规范输入新的编号","error");				
					}else{
						$("#addProduct").submit();
					}	
				},
				error: function() {
					return false;
				}
			});
		}
		
		
		
	}