<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="jquery,ui,easy,easyui,web">
    <meta name="description" content="easyui help you build your web page easily!">
    <title>Báo cáo tháng</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/datagrid-cellediting.js" />"></script>
</head>
<body>
<div class="easyui-accordion" style="width:100%;height:auto;padding:3px;" data-options="multiple:true">
    <div class="row d-flex justify-content-center" style="margin-top: 5px;">
	<div class="col-md-8">
		<div class="card">
			<div class="card-header d-flex justify-content-left" style="padding: .3rem 1.25rem;">
				    Kết xuất báo cáo
			</div>
			<div class="card-body">
				<div class="row">
					<div class="form-group col-md-1 col-water1" id="leftKybc">
					</div>
					<div class="form-group col-md-6 col-water-4">
						<div id="bcThang" style="display: block;">
							<label for="timeCheckIn" class="d-flex justify-content-left">Tháng báo cáo:</label>
							<div class="input-group date">
								<input type="text" id="thangBc" name="thangBc" class="textbox datepicker-waters" style="text-align: center;width: 130px;" placeholder="MM-YYYY" />
							</div>
						</div>
					</div>
					<div class="form-group col-md-5 col-water-4" id="sandbox-container">
						<div class="input-group" style="margin-top: 1.4rem;">
							<a href="#" class="easyui-linkbutton" onclick="exportReport()" data-options="iconCls:'icon-search'" style="width:100%;height:40px;">Kết xuất báo cáo</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<div id="w" class="easyui-window" title="Kết xuất báo cáo" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:90%;height:90%;padding:10px;">
	<form id="formPdf">
		<iframe id="frPDF" height="800" width="100%" src=""></iframe>
	</form>
</div>

<script type="text/javascript">
    var url_combo_kyThu= '${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change=';
    var url_createReportThue = '${sessionScope.apiContext}/report/createReportThue';
   	var comboKyThu=null;
   	
	$(function(){
		var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    	var type = cacheActionRp; // cacheActionRp dc truyen tu menu
        var checkin = $('#thangBc').datepicker({
        	format: "mm-yyyy",
        	viewMode: "months", 
            minViewMode: "months",
            changeMonth: true,
            changeYear: true,
            onRender: function (date) {
                return date.valueOf() > now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            checkin.hide();
        }).data('datepicker');
	});
	
   	
   	function exportReport(){
   		var kyThuSearch = $("#thangBc").val();
   		if(kyThuSearch.length <=0){
    		warning("Bạn phải nhập tháng báo cáo!");
   			return;
		}
       	downloadFile(kyThuSearch);
       	progressStart();
    }
   	
   	function downloadFile(kyThuSearch){
   		var request = new XMLHttpRequest();
        request.open('POST', url_createReportThue, true);
        request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
        request.setRequestHeader('Authorization', SessionId);
        request.responseType = 'blob';

        request.onload = function() {
          	// Only handle status code 200
			if(request.status === 200) {
				// Try to find out the filename from the content disposition `filename` value
           	 	var disposition = request.getResponseHeader('content-disposition');
            	// The actual download
            	var blob = new Blob([request.response], { type: 'application/pdf' });
            	$('#frPDF').attr('src', window.URL.createObjectURL(blob));
            	setTimeout(function(){
               		progressStop();
               		var iframe = document.frames ? window.frames.frames["frPDF"] : document.getElementById("frPDF");
                	var ifWin = iframe.contentWindow || iframe;
                	try {
                    	ifWin.focus();
                    	ifWin.print();
                	}
                	catch (e) {
                    	window.print(false);
                	}
           		}, 3000);
          	}else{
          		$.messager.alert('Lỗi', response.error.description,'error');
          		progressStop();
          	}
        };

        request.send('kyThuSearch=' + kyThuSearch);
   	}
    
    function setcomboKyThu(data)
    {
    	comboKyThu=data; 
    }
    
    function refreshFormAndDataGrid(action){
    	var kyThuSearch = $("#thangBc").val();
    }
    
    </script>
</body>
</html>