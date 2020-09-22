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
    <title>Nhập dữ liệu từ file Excel</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/datagrid-cellediting.js" />"></script>
</head>
<body>
<div class="easyui-accordion" style="width:100%;">
    <div title="Tra cứu thông tin khách hàng" data-options="iconCls:'icon-search'" style="width:100%;">
		<div class="row" style="width: 100%;">
			<div class="col-md-12 col-water-9">
				<div class="card">
				  <!-- <div class="card-header">
				    Tra cứu thông tin
				  </div> -->
				  <div class="card-body">
				    <form id="formTk" method="post" >	
					    <div class="row">
					    	<div class="col-sm-12 col-md-6 col-water-3">
					    		<label for="kyThuSearch" >Tháng:</label></br>
					    		<div class="form-inline" style="100%">
					    			<a href="#" class="easyui-linkbutton" data-options="iconCls:'pagination-prev'" onclick="chonKyNamTruoc();" style="width:25px;height:25px"></a>
										<input class="easyui-combobox" id="kyThuSearch" name="kyThuSearch" style="width:110px;height:auto;"
							            data-options="
					                    url:'${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change=',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    panelHeight:'auto'">
										<a href="#" class="easyui-linkbutton" data-options="iconCls:'pagination-next'" onclick="chonKyNamNay();" style="width:25px;height:25px"></a>
					    		</div>
					    		<label for="tenKhSearch" >Tên KH:</label>
					    		<div class="input-group-sm">
					    			<input class="easyui-textbox" id="tenKhSearch" name="tenKhSearch" style="height:auto">
					    		</div>
					    	</div>
					    	<div class="col-sm-12 col-md-6 col-water-3">
					    		<label for="tuyenSearch" >Tuyến:</label>
					    		<div class="input-group-sm">
					    			<input class="easyui-combobox" id="tuyenSearch" name="tuyenSearch" style="height:auto"
					            		data-options="
					                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    panelHeight:'auto'">
			                    </div>
					            <label for="khuVucSearch" >Khu vực:</label>
					            <div class="input-group-sm">
					    			<input class="easyui-combobox" id="khuVucSearch" name="khuVucSearch" style="height:auto"
					            		data-options="
					                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    panelHeight:'auto'">
			                     </div>
					    	</div>
					    	<div class="col-sm-12 col-md-6 col-water-3">
					    		<label for="idHdrSearch" >Bảng giá:</label>
					    		<div class="input-group-sm">
					    			<input class="easyui-combobox" id="idHdrSearch" name="idHdrSearch" style="height:auto"
						            		data-options="
						            		url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmDv',
						                    method:'get',
						                    valueField:'id',
						                    textField:'text',
						                    panelHeight:'auto'">
			                    </div>
						         <button type="button" class="btn btn-outline-primary btn-sm" style="margin-top: 1rem;" onclick="timkiem()"><i class="fa fa-search"></i>Tra cứu</button>
					    	</div>
					    </div>
					</form>
				 	</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6 col-water-3">
			  <div class="row" style="padding-top: 35px;">
			  	<div class="col-md-1"></div>
			  	<div class="col-md-10 text-center">
				  	<button type="button" class="btn btn-outline-info btn-block" onclick="printpdf();"><i class="fa fa-print"></i>&nbsp;In phiếu thu</button></br>
			  	</div>
			  	<div class="col-md-1"></div>
			  </div>
			</div>
		</div>
	</div>
</div>
<div style="margin:5px 0;">
</div>
<form id="form1" method="post">
	<table id="dgAll" style="width: 100%;">
		<tr>
			<td>
				<table id="dg" class="easyui-datagrid" style="width:100%;height:370px"
			            rownumbers="true" pagination="true" sortName="khuVuc" sortOrder=""
			            data-options="toolbar: '#tb' ">
			        <thead>
			            <tr>
				        	<th field="maCs" width="100" align="center" hidden="hidden" />
				        	<th field="maTt" width="100" align="center" hidden="hidden" />
				        	<th field="maKh" width="100" align="center" hidden="hidden" />
				            <th data-options="field:'ck1',checkbox:true"></th>
							<th field="codeKh" width="10%" sortable="true" align="left">Mã KH</th>
							<th field="tenKh" width="13%" sortable="true" align="left">Họ tên</th>
							<th field="maSo" width="7%" align="left">Sổ ghi</th>
							<th field="tuyen" width="5%" align="left">Tuyến</th>
							<th field="khuVuc" width="7%" sortable="true" align="left" height="auto">Khu vực</th>
							<th field="maSoThue" width="10%" align="left">MS thuế</th>
							<th field="idDichVu" width="10%" align="left">Dịch vụ</th>
							<th field="csTu" width="10%" align="left" >Số ĐK</th>
							<th field="csDen" width="10%" align="left" >Số CK</th>
							<th field="soM3" width="10%" align="left" >m3</th>
							<th field="soTien" class="easyui-numberbox" data-options="precision:2,groupSeparator:'.',decimalSeparator:','" width="10%" align="left" >Thành tiền</th>
							<th field="tienThueVat" width="10%" align="left" >Thuế VAT</th>
							<th field="phi" width="10%" align="left" >Phí NT</th>
							<th field="tongTien" width="10%" align="left" >Tổng tiền</th>
							<th field="diaChi" width="15%" align="left">Địa chỉ</th>
			            </tr>
					</thead>
				</table>
			</td>
		</tr>
	</table>
	<div id="tb" style="height:auto;">
		<a href="#" id="saveData" onclick="saveDaThuTien();" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" style="width:10%;position:right;">Đã thu tiền</a>
	</div>
<!-- 	<div id="tb" style="height:auto;"> -->
<!-- 		<span style="color: red;font-size: 14px; font-family: tahoma;margin-left: 7px">Chọn: -->
<!-- 			<input type="checkbox" id="checkall" value="all" onchange="checkallKH();"> để in phiếu thu -->
<!-- 		</span> -->
<!-- 	</div> -->
</form>
<div>
<!-- <span style="color: red;font-size: 16px;">Chọn Tất cả: <input type="checkbox" id="checkall" value="all" onchange="checkallKH();"></span> -->
</div>

<div id="w" class="easyui-window" title="In hóa đơn" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:90%;height:90%;padding:10px;">
	<form id="formPdf">
		<iframe id="frPDF" height="800" width="100%" src=""></iframe>
	</form>
</div>
     
    <script type="text/javascript">
    var url_ViewPhieuThu = '${sessionScope.apiContext}/chiso/viewChiSoPrint';
    var url_CreatePdf = '${sessionScope.apiContext}/chiso/createPdf';
    var url_Print = '${sessionScope.apiContext}/rp/downloads/'+SessionId;
    var url_ImportExcel = '${sessionScope.apiContext}/rp/importExcelQLN';
    var url_SaveThuTien = '${sessionScope.apiContext}/chiso/updateThanhToanTien';
    var url_lov_kh = 'lovKH?session='+SessionId;
    
    var listId="";
    var listIdTT = "";
   	var checkall="";
   	var editIndex = undefined;
   	var jsonObj=null;
   	
   	var url_dm_dv = '${sessionScope.apiContext}/util/dm/dichvu';
   	var url_dm_dv_chi_tiet = '${sessionScope.apiContext}/util/dm/dichvuChiTiet';
    var url_combo_tuyen = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen';
    var url_combo_kyThu= '${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change=';
    var url_combo_khuVuc = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom';
    var url_combo_dichVu = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmDv';
    var url_combo_dichVu_chitTiet = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=bangGia';
    var dmDichVu=null;
    var dmDichVuChiTiet=null;
   	var comboTuyen=null;
   	var comboKyThu=null;
   	var comboKhuVuc=null;
   	var comboDichVu=null;
   	var comboDichVuChiTiet=null;
   	var maSoGlobal = $('#maSoGlobal').val();

	$(function(){
    	if(dmDichVu==null)
   		{
    		submitFormAndReloadData(url_dm_dv, null, null, setDmDichVu);
   		}
    	if(dmDichVuChiTiet==null)
   		{
    		submitFormAndReloadData(url_dm_dv_chi_tiet, null, null, setDmDichVuChiTiet);
   		}
    	if(comboTuyen==null)
   		{
    		submitGetFormAndReloadData(url_combo_tuyen, null, null, setcomboTuyen);
   		}
    	if(comboKyThu==null)
   		{
    		submitGetFormAndReloadData(url_combo_kyThu, null, null, setcomboKyThu);
   		}
    	if(comboKhuVuc==null)
   		{
    		submitGetFormAndReloadData(url_combo_khuVuc, null, null, setcomboKhuVuc);
   		}
    	if(comboDichVu==null)
   		{
    		submitGetFormAndReloadData(url_combo_dichVu, null, null, setcomboDichVu);
   		}
    	if(comboDichVuChiTiet==null)
   		{
    		submitGetFormAndReloadData(url_combo_dichVu_chitTiet, null, null, setcomboDichVuChiTiet);
    		
   		}
	});
    function setDmDichVu(data)
    {
    	dmDichVu=data;
    	//alert(dmDichVu);
    }
    function setDmDichVuChiTiet(data)
    {
    	dmDichVuChiTiet=data;
    }
    function setcomboTuyen(data)
    {
    	comboTuyen=data;
    }
    function setcomboKyThu(data)
    {
    	comboKyThu=data; 
    }
    function setcomboKhuVuc(data)
    {
    	comboKhuVuc=data;
    }
    function setcomboDichVu(data)
    {
    	comboDichVu=data; 
    }
    function setcomboDichVuChiTiet(data)
    {
    	comboDichVuChiTiet=data; 
    	var bangGia = $("#bangGia");
		bangGia.combobox({data:comboDichVuChiTiet});
    }
    
    function refreshFormAndDataGrid(action){
    	var khuVucSearch = $('#khuVucSearch').combobox('getValue');
    	var idHdrSearch = $('#idHdrSearch').combobox('getValue');
    	var tuyenSearch = $('#tuyenSearch').combobox('getValue');
    	var kyThuSearch = $("#kyThuSearch").val();
    	var tenKhSearch = $("#tenKhSearch").val();
    	var url=url_ViewPhieuThu+"?khuVucSearch="+khuVucSearch+"&tenKhSearch="+tenKhSearch+"&idHdrSearch="+idHdrSearch;
    	url =url + "&soGhiSearch="+maSoGlobal+"&tuyenSearch="+tuyenSearch+"&kyThuSearch="+kyThuSearch;
    	if(action=='clean')
    		url=url+"&action=clean";	
    	else
    		url=url+"&action=search";
    	var queryParam =objectifyForm($('#formTk')); //JSON.stringify(objectifyForm($('#formTk')));
    	$('#dg').datagrid({
    	    queryParams: queryParam,
    	    soGhiSearch:maSoGlobal
    	});
    	dataGridLoader($('#dg'), url, 1611);
    }
    
   	function checkallKH()
   	{
		listId="";
		listIdTT="";
   		if ($('#checkall').is(':checked')) {
   			checkall="all";
   		}
   		else
 		{
   			checkall="";
 		}
   		checkedGrid($('#dg'));
   	}
   	
	function timkiem()
	{
		listId="";
		listIdTT="";
		refreshFormAndDataGrid();
	}
	
    function clearFormKH()
    {
    	refreshFormAndDataGrid("clean");
    }
    
    function saveDaThuTien(){
    	getListCheck($('#dg'));
    	var listTmp = listIdTT.replace(/~/g, ' ');
    	if(listTmp.length <=0){
    		warning("Bạn phải chọn bản ghi để cập nhật!");
   			return;
   		}
    	var url = url_SaveThuTien+"?arrId="+listIdTT+"&checkall=true";
    	submitProcessCallback(url, 1613, null, refreshFormAndDataGrid, true);
    }
    
    
    function printpdf(){
    	getListCheck($('#dg'));
    	var listTmp = listId.replace(/~/g, ' ');
    	if(listTmp.length <=0){
    		warning("Bạn phải chọn bản ghi!");
   			return;
   		}
       	downloadFile(listId);
       	progressStart();
    }
    
    function downloadFile(data){
    	var request = new XMLHttpRequest();
        request.open('POST', url_CreatePdf, true);
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
           		}, 1000);
          	}else{
          		$.messager.alert('Lỗi', response.error.description,'error');
          		progressStop();
          	}
        };

        request.send('arrId=' + data+"&checkall="+checkall);
    }
    
    function fire_ajax_submit() {
    	// Get form
        var form = $('#fileUploadForm')[0];
		
        var data = new FormData(form);
		
        data.append("CustomField", "This is some extra data, testing");
        var kyThang = $("#kyThang").val();
    	var kyNam = $("#kyNam").val();
		var url=url_ImportExcel+"?kyThu="+kyThang+"-"+kyNam;
		$('#import').window('close');
		progressStart();
    	$.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: url,
            data: data,
            //http://api.jquery.com/jQuery.ajax/
            //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
            processData: false, //prevent jQuery from automatically transforming the data into a query string
            contentType: false,
            cache: false,
            timeout: 600000,
            onProgress: function(percent) {
                $('#progressFile').progressbar({
                   value: percent
                });
             },
            success: function (response) {
            	progressStop();
            	refreshFormAndDataGrid();
            },
            error: function (e) {
            	progressStop();
                $("#btnSubmit").prop("disabled", false);
                warning("Phải chọn file excel!");

            }
        });

    }
    
    function getListCheck(dg) {
    	var selectedrow = dg.datagrid("getSelections");
    	var rows = dg.datagrid('getRows');
    	if(rows==null) return;
    	for( var i=0; i<rows.length; i++){
    		listId = listId.replace(rows[i]["maCs"]+"~", "");
    		listIdTT= listIdTT.replace(rows[i]["maTt"]+"~", "");
    	}
    	if(selectedrow!=null)
   		{
	    	for(var i=0; i<selectedrow.length; i++){
	    		listId=listId + selectedrow[i]["maCs"]+"~";
	    		listIdTT= listIdTT + selectedrow[i]["maTt"]+"~";
			}
   		}
    }
    
    function checkedGrid(dg){
    	var count=0;
    	var rows = dg.datagrid('getRows');
    	$('#dg').datagrid('unselectAll');
    	for(var i=0; i<rows.length; i++){
    		if(checkall=="all"){
    			dg.datagrid('checkRow', i);
    		}
    		else
    		{
	    		if(listId.indexOf(rows[i]["maCs"])>-1)
	   			{
	    			dg.datagrid('checkRow', i);
	    			count++;
	   			}
    		}
    	}
    	if (count==rows.length)
   		{
   			//check all
   		}

   		//$('#frPDF').attr('src', url_Print+"?arrId="+listId);
    }
    
    $('#dg').datagrid({
    	onBeforeLoad: function(x) {
    		getListCheck($('#dg'));
    		getListChanges($('#dg'));
      	},
    	  onLoadSuccess: function(){
    		  checkedGrid($('#dg'));
    		  setListChanges();
    		  //alert(listId);
    	  }
    });
    
    function progressStart(){
        var win = $.messager.progress({
            title:'Please waiting',
            msg:'Đang xử lý...'
        });
    }
    
    function progressStop(){
        $.messager.progress('close');
    }
    
    function getListChanges(){
    	if (editIndex != undefined)
		{
			$('#dg').datagrid('endEdit', editIndex);
       		editIndex = undefined;
		}
        //var rows = $('#dg').datagrid('getChanges');
        var jsonObjTmp = objecFromDataGridChange($('#dg'));
        if(jsonObjTmp!=null && jsonObjTmp.length>0)
       	{
	        if(jsonObj==null ||jsonObj.length==0)
	        	jsonObj = objecFromDataGridChange($('#dg'));
	        else
	        	for(var i=0;i<jsonObjTmp.length;i++)
	      			jsonObj.push(jsonObjTmp[i]);
       	}
    }
    function setListChanges(){
    	var rows = $('#dg').datagrid('getRows');
    	if(jsonObj=="" || rows.length==0) return;
    	for(var i=0; i<rows.length; i++){
    		var object=getObjects(jsonObj,"maCs",rows[i]["maCs"]);
    		if(object!=null && object.length>0)
   			{
    			$('#dg').datagrid('updateRow', {
        			index:i,
        			row: object[0]
        		});
   			}
    		
    		
    	}

    }
    var yearCbKy= (new Date()).getFullYear();
	function chonKyNamTruoc()
	{
		yearCbKy=yearCbKy-1;
		$('#kyThu').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
	}
	
	function chonKyNamNay()
	{
		yearCbKy=yearCbKy+1;
		$('#kyThu').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
	}
	
	var $beginDate = $('#tuNgay'), $endDate = $('#denNgay'),$ngayHD = $('#ngayHD');
	with(new Date){
    	var y = getFullYear();
    	var m = getMonth();
    	var d = getDate();
    	$beginDate.val((d<10?('0'+d):d) + '-' + (m<10?('0'+m):m) + '-' + y);
    	$endDate.val((d<10?('0'+d):d) + '-' + (m+1<10?('0'+(m+1)):(m+1)) + '-' + y);
    	$ngayHD.val((d<10?('0'+d):d) + '-' + (m+1<10?('0'+(m+1)):(m+1)) + '-' + y);
	}
	
	function refresh()
	{
		timkiem();
	}
	

    </script>
</body>
</html>