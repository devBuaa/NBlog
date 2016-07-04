$(document).ready(function () {

 $('#dialog-overlay').click(function () {  
  $('#dialog-overlay, #dialog-box').hide();  
  return false;
 });
 $(window).resize(function () {

  if (!$('#dialog-box').is(':hidden')) popup();  
 }); 
 
 
});

//Popup dialog
function popup() {
 var ztj=getTotalSizeOrWeight(6);
 var zzl=getTotalSizeOrWeight(7);
 $("#ztj").text(ztj);
 $("#zzl").text(zzl);
 var maskHeight = $(document).height();  
 var maskWidth = $(window).width();
 var dialogTop =  (maskHeight/3) - ($('#dialog-box').height());  
 var dialogLeft = (maskWidth/2) - ($('#dialog-box').width()/2); 
 $('#dialog-overlay').css({height:maskHeight, width:maskWidth}).show();
 $('#dialog-box').css({top:dialogTop, left:dialogLeft}).show();
   
}
function submitDispatchOrder() {
	
		var content=getInfo();		
		$.ajax({ 
			type: "post",
			url: "/amc/dispatchOrder.do?method=add", 
			dataType: "html", 
			async: true,
			data: { "soid": $("#ddbh").text(),"uname": $("#uname").text(),"sdate": $("#fhrq").text(),"tsize": $("#ztj").text(),"tweight": $("#zzl").text(),"sdetail": content },		
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
					swal("发货单已存在!","请勿重复提交","error");
				}else if(date==1){
					top.topManager.reloadPage('showStockDetail'+$("#ddbh").text());
					swal({   
						title: "提交成功",   
						text: "是否关闭本页？",   
						type: "success",   
						showCancelButton: true,   
						confirmButtonColor: "#DD6B55",   
						confirmButtonText: "是",   
						cancelButtonText: "否",   
						closeOnConfirm: false,   
						closeOnCancel:  true
						}, function(isConfirm){   
							if (isConfirm) {   
								top.topManager.reloadPage('stockList');
								// 关闭当前页
							    top.topManager.closePage();
								} else 
								{     
									top.topManager.reloadPage();
									} });
					
				}
			}, 			
			error: function() {
				
			}
		});
		 
		 
	
	
}
function getInfo() {
    var tableInfo = "";
    var tableObj = document.getElementById("dispatchdetailAdd");
    for (var i = 1; i < tableObj.rows.length; i++) {    // 遍历Table的所有Row
        // for (var j = 0; j < tableObj.rows[i].cells.length-1; j++) {
		// //遍历Row中的每一列
            tableInfo += tableObj.rows[i].cells[1].innerText;   // 获取Table中单元格的内容
            tableInfo += "&";
            tableInfo += tableObj.rows[i].cells[5].innerText; 
            tableInfo += "&";
        // }
        tableInfo += "^&";
    }
    return tableInfo.substring(0,tableInfo.length-3);
}
function getTotalSizeOrWeight(cell){
	var t = 0.0;
	 var tableObj = document.getElementById("dispatchdetailAdd");
	    for (var i = 1; i < tableObj.rows.length; i++) {    // 遍历Table的所有Row
	    	t+=eval((tableObj.rows[i].cells[cell].innerText).replace(",",""));	    	 
	    }
	 return t;
}