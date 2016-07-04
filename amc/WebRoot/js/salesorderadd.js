jQuery(document).ready( function () { 
$('#div_customer').mousedown( function (event) { 
			var isMove = true; 
			var abs_x = event.pageX - $('#div_customer').offset().left; 
			var abs_y = event.pageY - $('#div_customer').offset().top; 
			$(document).mousemove(function (event) { 
					if (isMove) { 
						var obj = $('#div_customer'); 
						obj.css({'left':event.pageX - abs_x, 'top':event.pageY - abs_y}); 
					} 
			} ).mouseup( function () { 
					isMove = false; 
				} ); 
		} ); 
$('#productDIv').mousedown( function (event) { 
	var isMove = true; 
	var abs_x = event.pageX - $('#productDIv').offset().left; 
	var abs_y = event.pageY - $('#productDIv').offset().top; 
	$(document).mousemove(function (event) { 
			if (isMove) { 
				var obj = $('#productDIv'); 
				obj.css({'left':event.pageX - abs_x, 'top':event.pageY - abs_y}); 
			} 
	} ).mouseup( function () { 
			isMove = false; 
		} ); 
} ); 
} ); 

function setCustomer(str) {
	s = str.split(",");
	$('#cid').val(s[0]);
	$('#cname').val(s[1]);
	$('#caddress').val(s[2]);
	$('#cphone').val(s[3]);
	showCustomerDiv();
}
function showCustomerDiv() {
	var oDiv = document.getElementById('div_customer');
	if (oDiv.style.display == 'block') {
		oDiv.style.display = 'none';
	} else {
		oDiv.style.display = 'block';
	}
	
	$(function(){
		$("#cid").click(function(event){
			var e=window.event || event;
			if(e.stopPropagation){
				e.stopPropagation();
			}else{
				e.cancelBubble = true;
			}   
			$("#div_customer").show();
		});
		$("#div_customer").click(function(event){
			var e=window.event || event;
			if(e.stopPropagation){
				e.stopPropagation();
			}else{
				e.cancelBubble = true;
			}
		});
		document.onclick = function(){
			$("#div_customer").hide();
		};
	});
	
}
function showProduct() {
	var oDiv = document.getElementById('productDIv');
	if (oDiv.style.display == 'block') {
		oDiv.style.display = 'none';
	} else {
		oDiv.style.display = 'block';
	}
	
	$(function(){
		$("#add_product_img").click(function(event){
			var e=window.event || event;
			if(e.stopPropagation){
				e.stopPropagation();
			}else{
				e.cancelBubble = true;
			}   
			$("#productDIv").show();
		});
		$("#productDIv").click(function(event){
			var e=window.event || event;
			if(e.stopPropagation){
				e.stopPropagation();
			}else{
				e.cancelBubble = true;
			}
		});
		document.onclick = function(){
			$("#productDIv").hide();
		};
	});
}
function changeProductById(o){
	id=$(o).val();
	if(id==0){
		$("#pname option:first").prop("selected", 'selected');
		$('#pprice').val("");
		return;
	}
	for(i=0;i<value.length;i++){
		p=value[i].split("&");
		if(p[0]==id){
			$('#pname').val(p[1]);
			$('#pprice').val(p[2]);
		}
	}	
}
function changeProductByName(o){
	name=$(o).val();
	if(name==0){
		$("#pid option:first").prop("selected", 'selected');
		$('#pprice').val("");
		return;
	}
	for(i=0;i<value.length;i++){
		p=value[i].split("&");
		if(p[1]==name){
			$('#pid').val(p[0]);
			$('#pprice').val(p[2]);
		}
	}
}
function addProduct() {
	id=$("#pid").val();
	name=$("#pname").val();
	number=$("#pnumber").val();
	price=$("#pprice").val();
	if(id==0){
		$("#validatePid").css("display","inline");
		return;
	}else{
		$("#validatePid").css("display","none");
	}
	if(name==0){
		$("#validatePname").css("display","block");
		return;
	}else{
		$("#validatePname").css("display","none");
	}
	if(!checkPositiveNumber(number)){
		$("#validatePnum").css("display","inline");
		return;
	}else{
		$("#validatePnum").css("display","none");
	}
	if(price==null ||price==""){
		$("#validatePprice").css("display","block");
		return;
	}else{
		$("#validatePprice").css("display","none");
	}
	addTableRow();
	resetForm();
}
function resetForm(){
	$("#pid option:first").prop("selected", 'selected');
	$("#pname option:first").prop("selected", 'selected');
	$('#pprice').val("");
	$('#pnumber').val("");
}
function checkPositiveNumber(number){// 检查是否是正整数
	var type = /^[0-9]*[1-9][0-9]*$/;
	if(type.test(number)){
    	return true;
	}else{
    	return false;
	}
} 
function addTableRow(){
	var tableObj = document.getElementById("productDetailTable");
	for (i = 0; i < tableObj.rows.length; i++) {  // 遍历Table的所有Row
	      tid = tableObj.rows[i].cells[0].innerText;  // 获取Table中单元格的内容
	      if(tid==id){
	    	  on=tableObj.rows[i].cells[2].innerText;
	    	  op=tableObj.rows[i].cells[4].innerText;
	    	  tableObj.rows[i].cells[2].innerText=parseInt(on)+number*1;
	    	  tableObj.rows[i].cells[4].innerText=parseFloat(op)+number*price;
	    	  ctmoney=$('#ctotalMoney').val();
	    	  $('#ctotalMoney').val(eval(ctmoney)+number*price);
	    	  return;
	      }	  	  
	}
	$("#productDetailTable").append(
			'<tr><td>'+id+'</td><td>'+name+'</td><td>'+number+'</td><td>'+price+'</td><td>'+
			number*price+'</td><td><a onclick="deleteTableRow(this)" style="cursor:pointer;">删除</a></td></tr>'
			);
	 ctmoney=$('#ctotalMoney').val();
	 $('#ctotalMoney').val(eval(ctmoney)+number*price);
}
function deleteTableRow(o){
	 var i=o.parentNode.parentNode.rowIndex;
	 var ctmoney=$('#ctotalMoney').val();
	 var tableObj = document.getElementById("productDetailTable");
	 money=tableObj.rows[i].cells[4].innerText;
	 $('#ctotalMoney').val(eval(ctmoney)-money*1);
	 document.getElementById('productDetailTable').deleteRow(i);
}
function submitTableAndForm() {
	if(validateBeforeSubmit()){
		var content=GetInfoFromTable();
		$(".submit").attr({"disabled":"disabled"});
		$.ajax({ 
			type: "post",
			url: "/amc/salesOrder.do?method=add", 
			dataType: "html", 
			async: true,
			data: { "cid": $("#cid").val(),"caddress": $("#caddress").val(),"creceiver": $("#creceiver").val(),"ctime": $("#ctime").val(),"cuser": $("#cuser").val(),"sodetail": content },		
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
				$(".submit").removeAttr("disabled");
				if(date==-1){
					swal("订单已存在!","请勿重复提交","error");
				}else if(date==1){
					swal({   
						title: "提交成功",   
						text: "",   
						type: "success",   
						showCancelButton: true,   
						confirmButtonColor: "#DD6B55",   
						confirmButtonText: "离开本页",   
						cancelButtonText: "继续添加",   
						closeOnConfirm: false,   
						closeOnCancel: false 
						}, function(isConfirm){   
							if (isConfirm) {     
								// 关闭当前页
								top.topManager.reloadPage('orderList');
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
function GetInfoFromTable() {
    var tableInfo = "";
    var tableObj = document.getElementById("productDetailTable");
    for (var i = 1; i < tableObj.rows.length; i++) {    // 遍历Table的所有Row
        // for (var j = 0; j < tableObj.rows[i].cells.length-1; j++) {
		// //遍历Row中的每一列
            tableInfo += tableObj.rows[i].cells[0].innerText;   // 获取Table中单元格的内容
            tableInfo += "&";
            tableInfo += tableObj.rows[i].cells[2].innerText; 
            tableInfo += "&";
        // }
        tableInfo += "^&";
    }
    return tableInfo.substring(0,tableInfo.length-3);
}
function validateBeforeSubmit(){
	 var cname=document.getElementById("cname").value;
	 var cphone=document.getElementById("cphone").value;
	 var caddress=document.getElementById("caddress").value;
	 var creceiver=document.getElementById("creceiver").value;
	 var ctime=document.getElementById("ctime").value;
	 if(isNull(cname)||isNull(creceiver)){
		 	swal("请输入有效的顾客名和收件人!","","warning");
		 	return false;
		 }
	  if(isNull(cphone) || !checkTel(cphone)){
	 	swal("请输入有效的手机号码!","","warning");
	 	return false;
	 }
	 if(isNull(caddress)){
	 	swal("请输入地址!","","warning");
	 	return false;
	 }
	 if(!checkDate(ctime)){
		 swal("请输入有效的日期!","","warning");
		 	return false;
	 }
	 var tableRow = document.getElementById("productDetailTable").rows.length;
	 if(tableRow==1){
		 swal("订单无效!","请填入订单明细","warning");
		 	return false;
	 }
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
function checkTel(phone){
	var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
	var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
	if(isMob.test(phone)||isPhone.test(phone)){
   	return true;
	}else{
   	return false;
	}
} 
function checkDate(dtime) {
	var isDate=/^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/;
	if(isDate.test(dtime)||isDate.test(dtime)){
	   	return true;
		}else{
	   	return false;
		}
}