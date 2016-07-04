jQuery(document).ready( function () { 
	$('#div_supplier').mousedown( function (event) { 
			var isMove = true; 
			var abs_x = event.pageX - $('#div_supplier').offset().left; 
			var abs_y = event.pageY - $('#div_supplier').offset().top; 
			$(document).mousemove(function (event) { 
					if (isMove) { 
						var obj = $('#div_supplier'); 
						obj.css({'left':event.pageX - abs_x, 'top':event.pageY - abs_y}); 
					} 
			} ).mouseup( function () { 
					isMove = false; 
				} ); 
	} ); 
} ); 
 
function setSupplier(str) {
	s = str.split(",");
	$('#sid').val(s[0]);
	$('#sname').val(s[1]);
	showSupplierDiv();
}
function showSupplierDiv() {
	var oDiv = document.getElementById('div_supplier');
	if (oDiv.style.display == 'block') {
		oDiv.style.display = 'none';
	} else {
		oDiv.style.display = 'block';
	}
	
	$(function(){
		$("#sid").click(function(event){
			var e=window.event || event;
			if(e.stopPropagation){
				e.stopPropagation();
			}else{
				e.cancelBubble = true;
			}   
			$("#div_supplier").show();
		});
		$("#div_supplier").click(function(event){
			var e=window.event || event;
			if(e.stopPropagation){
				e.stopPropagation();
			}else{
				e.cancelBubble = true;
			}
		});
		document.onclick = function(){
			$("#div_supplier").hide();
		};
	});
	
}

function checkPositiveNumber(number){// 检查是否是正整数
	var type = /^[0-9]*[1-9][0-9]*$/;
	if(type.test(number)){
    	return true;
	}else{
    	return false;
	}
} 
function getInfoFromTable() {
    var tableInfo = "";
    var tableObj = document.getElementById("purchaseDetailTable");
    for (var i = 1; i < tableObj.rows.length; i++) {    // 遍历Table的所有Row
        // for (var j = 0; j < tableObj.rows[i].cells.length-1; j++) {
		// //遍历Row中的每一列
            tableInfo += tableObj.rows[i].cells[1].innerText;   // 获取Table中单元格的内容
            tableInfo += "&";        
            tableInfo += tableObj.rows[i].cells[5].innerText; 
            tableInfo += "&";
            tableInfo += tableObj.rows[i].cells[7].innerText; 
            tableInfo += "&";        
        // }
        tableInfo += "^&";
    }
    return tableInfo.substring(0,tableInfo.length-3);
}
function isNull(str){
	 if(str==null || trim(str)==""){
	 	return true;
	 }
	 return false;
}
function trim(str){ // 删除左右两端的空格
	return str.replace(/(^\s*)|(\s*$)/g, ""); 
}
function validateBeforeSubmit(){
	 var sid=document.getElementById("sid").value;
	 var ctime=document.getElementById("ctime").value;
	 if(isNull(sid)){
		 swal("请输入采购商","","warning");
		 	return false;
	 }
	 if(isNull(ctime)){
		 swal("请填写采购时间","","warning");
		 	return false;
	 }
	 return true;
}
function submitTableAndForm() {
	if(validateBeforeSubmit()){

		var content=getInfoFromTable();
		if(isNull(content)){
			swal("没有需要采购的产品","请勿提交空订单","warning");
			return false;
		}
		$(".submit").attr({"disabled":"disabled"});
		$.ajax({ 
			type: "post",
			url: "/amc/purchase.do?method=add", 
			dataType: "html", 
			async: true,
			data: { "sid": $("#sid").val(),"uname": $("#uname").val(),"ctime": $("#ctime").val(),"totalMoney": $("#totalMoney").val(),"pod": content },		
			beforeSend: function() { 
        		//请求前的处理 
				swal({   
					title: "正在添加!",   
					text: "稍等...",
					type:"success",    
					showConfirmButton: false
				});
   			 }, 
			success: function(date) {
				if(date==-1){
					swal("订单已存在!","请勿重复提交","error");
				}else if(date==1){
					swal({   
						title: "提交成功",   
						text: "是否关闭本页？",   
						type: "success",   
						showCancelButton: true,   
						confirmButtonColor: "#DD6B55",   
						confirmButtonText: "是",   
						cancelButtonText: "否",   
						closeOnConfirm: false,   
						closeOnCancel: false 
						}, function(isConfirm){   
							if (isConfirm) {     
								// 关闭当前页
							    top.topManager.closePage();
								} else 
								{     
									// 刷新当前页
								    top.topManager.reloadPage();
									} });
					
				}
			}, 			
			error: function() {
				
			}
		});	
		
	}
}
function getTotalMoney(){
	var m= 0.0; 
	var tableObj = document.getElementById("purchaseDetailTable");
	 for (var i = 1; i < tableObj.rows.length; i++) {    // 遍历Table的所有Row
		 	m += eval(tableObj.rows[i].cells[8].innerText);  
	        
	    }
	    return m;
}
