function submitWantSilp(id) {
	var content = GetInfoFromTable();
	$.ajax({
		type : "post",
		url : "/amc/want.do?method=add&soid=" + id,
		dataType : "html",
		async : true,
		data : {
			"wuid" : $("#wuid").val(),
			"wctime" : $("#wctime").val(),
			"wetime" : $("#wetime").val(),
			"wsd" : content
		},
		beforeSend: function() { 
    		//请求前的处理 
			swal({   
				title: "正在添加!",   
				text: "稍等...",
				type:"success",    
				showConfirmButton: false
			});
		}, 
		success : function(data) {
			if (data == -1) {
				swal("缺货单已存在!", "请勿重复提交", "error");
			} else if (data == 1) {
				swal({
					title: "提交成功",   
					text: "是否关闭本页？",   
					type : "success",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "是",
					cancelButtonText : "否",
					closeOnConfirm : false,
					closeOnCancel : false
				}, function(isConfirm) {
					if (isConfirm) {
						top.topManager.reloadPage('stockList');
						// 关闭当前页
						top.topManager.closePage();
					} else {
						top.topManager.reloadPage();
					}
				});

			}
		},
		error : function() {

		}
	});

}
function GetInfoFromTable() {
	var tableInfo = "";
	var tableObj = document.getElementById("wantsilpdetail");
	for ( var i = 1; i < tableObj.rows.length; i++) { // 遍历Table的所有Row
		// for (var j = 0; j < tableObj.rows[i].cells.length-1; j++) {
		// //遍历Row中的每一列
		tableInfo += tableObj.rows[i].cells[1].innerText; // 获取Table中单元格的内容
		tableInfo += "&";
		tableInfo += tableObj.rows[i].cells[5].innerText;
		tableInfo += "&";
		// }
		tableInfo += "^&";
	}
	return tableInfo.substring(0, tableInfo.length - 3);
}