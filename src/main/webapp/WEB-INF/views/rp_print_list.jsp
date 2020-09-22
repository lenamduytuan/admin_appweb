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
		<div id="hearderForm" style="padding:5px;">
			<div id="ttTk" style="width: 80%; float: left;">
				<fieldset style="border: #CCCCFF 1px solid;">
				<legend>Tra cứu thông tin</legend>
				<form id="formTk" method="post" >		  				
				<div id="ttTk_top" style="width: 100%;">
					<div id="ttTk_top_nhap" style="width: 70%;float: left;">
						<table>
							<tr>
								<td width="10%">Tháng</td>
								<td>
									<a href="#" class="easyui-linkbutton" data-options="iconCls:'pagination-prev'" onclick="chonKyNamTruoc();" style="width:15%;height:20px"></a>
									<input class="easyui-combobox" id="kyThu" name="kyThu" style="width:35%;height:auto;"
						            data-options="
				                    url:'${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change=',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
									<a href="#" class="easyui-linkbutton" data-options="iconCls:'pagination-next'" onclick="chonKyNamNay();" style="width:15%;height:20px"></a>
								</td>
								<td></td>
								<td >Sổ ghi</td>
								<td>
									<input class="easyui-combobox" id="soGhi" name="soGhi" style="height:auto"
				            		data-options="
				                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmTo',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
								</td>
							</tr>
							<tr>
								<td>Khu vực</td>
								<td>
									<input class="easyui-combobox" id="khuVuc" name="khuVuc" style="width:80%;height:auto"
				            		data-options="
				                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
								</td>
								<td></td>
								<td >Tuyến</td>
								<td>
									<input class="easyui-combobox" id="tuyen" name="tuyen" style="height:auto"
				            		data-options="
				                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
								</td>
							</tr>
							<tr>
								<td>Bảng giá</td>
								<td >
									<input class="easyui-combobox" id="bangGia" name="bangGia" style="width:80%; height:auto"
					            		data-options="
					            		url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmDv',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    panelHeight:'auto'">
								</td>
								<td></td>
								<td style="text-align: right;">Tên KH</td>
								<td>
									<input class="easyui-textbox" id="hoTen" name="hoTen" style="height:auto">
								</td>
							</tr>
						</table>						
					</div>
					<div id="ttTk_top_buttom" style="width: 28%;float: right;">
						<a href="#" class="easyui-linkbutton" onclick="timkiem()" data-options="iconCls:'icon-search'" style="width:100%;height: 47.5px">Tra cứu</a>
					</div>
				</div>
				</form>
			</fieldset>
			</div>
			<div id="thongtinKy" style="width: 20%; float:right;">
	  			<div >
					<div style="width: 100%;">
						<fieldset style="border: #CCCCFF 1px solid;">
			  				<legend>In thông thường</legend>
			  				<div style="text-align: center;width: 100%;">
				  				<a href="#" class="easyui-linkbutton" onclick="printpdf();" data-options="iconCls:'icon-print'" style="width:100%;height: 80px;" >In phiếu thu</a>
			  				</div>
			  			</fieldset>
	  				</div>
				</div>
			</div>
		<div>
			<div style="margin:20px 0;"></div>
			<form id="form1" method="post">
				<table id="dgAll" style="width: 100%;">
				<tr>
				<td>
				<table id="dg" class="easyui-datagrid" style="width:100%;height:370px"
			            rownumbers="true" pagination="true" sortName="khuVuc" sortOrder=""
			            data-options="toolbar: '#tb' ">
			         <thead>
			            <tr>
			                <th field="id" width="100" align="center" hidden="hidden" />
			                <th data-options="field:'ck1',checkbox:true"></th>
						    <th field="maKH" width="10%" sortable="true" align="left">Mã KH</th>
							<th field="hoTen" width="13%" sortable="true" align="left">Họ tên</th>
							<th field="soGhi" width="7%" align="left">Sổ ghi</th>
							<th field="tuyen" width="5%" align="left">Tuyến</th>
							<th field="khuVuc" width="7%" sortable="true" align="left" height="auto">Khu vực</th>
							<th field="mst" width="10%" align="left">MS thuế</th>
							<th field="loaiDv" width="10%" align="left">Dịch vụ</th>
							<th field="soDK" width="10%" align="left" >Số ĐK</th>
							<th field="soCK" width="10%" align="left" >Số CK</th>
							<th field="m3" width="10%" align="left" >m3</th>
							<th field="thanhTien" width="10%" align="left" >Thành tiền</th>
							<th field="vat" width="10%" align="left" >Thuế VAT</th>
							<th field="phiNT" width="10%" align="left" >Phí NT</th>
							<th field="tongTien" width="10%" align="left" >Tổng tiền</th>
							<th field="diaChi" width="15%" align="left">Địa chỉ</th>
			            </tr>
			        </thead>
			    </table>
			    </td>
			    </tr>
			    </table>
			     <div id="tb" style="height:auto;">
			     	<span style="color: red;font-size: 14px; font-family: tahoma;margin-left: 7px">Chọn:
						<input type="checkbox" id="checkall" value="all" onchange="checkallKH();"> để in phiếu thu
					</span>
			    </div>
		    </form>
		</div>
		<div>
		<!-- <span style="color: red;font-size: 16px;">Chọn Tất cả: <input type="checkbox" id="checkall" value="all" onchange="checkallKH();"></span> -->
		</div>

    </div>
     <div id="w" class="easyui-window" title="In hóa đơn" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:90%;height:90%;padding:10px;">
        <form id="formPdf">
		    <iframe id="frPDF" height="800" width="100%" src=""></iframe>
		</form>
    </div>
    <div id="import" class="easyui-window" title="Nhập từ Excel" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:40%;height:30%;padding:10px;">
        <form id="fileUploadForm" method="post" enctype="multipart/form-data" style="float: left;width: 100%;margin-top: 1%;">
				<div  style="width:80%;padding:5px 20px;">
			        <div style="margin-bottom:10px">
			            File:<input id="choseFile" name="file" class="easyui-filebox" data-options="buttonText: 'Chọn file...'" data-options="prompt:'Choose a file...'" style="width:80%;margin-left: 10px;" >
			        </div>
			        <div style="margin-bottom:5px">
			        	Tháng:<input class="easyui-combobox" id="kyThang" name="kyThang" style="width:32%;height:25px;margin-left: 10px;"
				            data-options="
				                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnExcell&type=thangThu',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
				        Năm:<input class="easyui-combobox" id="kyNam" name="kyNam" style="width:32%;height:25px"
				            data-options="
				                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnExcell&type=namThu',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
					</div>
			        <div>
				        <div style="width: 100%;float: right; text-align: center;">
				            <a id="btnSubmit" href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" style="width:40%;" >Import</a>
				            <a id="btnHuy" href="#" class="easyui-linkbutton" onclick="$('#import').window('close')"  style="width:40%;" >Hủy</a>
				        </div>
			        </div>
			    </div>
		    </form>
    </div>
     
    <script type="text/javascript">
    var url_ViewExcel = '${sessionScope.apiContext}/rp/viewExcelQLN';
    var url_ImportExcel = '${sessionScope.apiContext}/rp/importExcelQLN';
    var url_SaveExcel = '${sessionScope.apiContext}/rp/saveExcelQLN';
    var url_CleanExcel = '${sessionScope.apiContext}/rp/cleanExcelQLN';
    var url_CreatePdf = '${sessionScope.apiContext}/rp/createPdf';
    
    var url_Print = '${sessionScope.apiContext}/rp/downloads/'+SessionId;
    var url_lov_kh = 'lovKH?session='+SessionId;
    
    var isImport =false;
    var listId="";
   	var checkall="";
   	var editDl="";
   	var editIndex = undefined;
   	var jsonObj=null;
   	var isLuyKe=false;
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
    	var khuvuc = $("#khuVuc").val();
    	var tenKH = $("#hoTen").val();
    	var url=url_ViewExcel+"?khuvuc="+khuvuc+"&tenKH="+tenKH;
    	if(action=='clean')
    		url=url+"&action=clean";
    	else if(isImport)
    		url=url+"&action=import";	
    	else if(isLuyKe)
    		url=url+"&action=search&isLuyKe=1";
    	else
    		url=url+"&action=search";
    	var queryParam =objectifyForm($('#formTk')); //JSON.stringify(objectifyForm($('#formTk')));
    	$('#dg').datagrid({
    	    queryParams: queryParam
    	});
    	dataGridLoader($('#dg'), url, 1611);
    }
    
   	function checkallKH()
   	{
		listId="";
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
		isLuyKe=false;
		if(isImport)
		{
			$.messager.confirm({
        		title: 'Thông báo',
        	    content: 'Dữ liệu nhập vào chưa được lưu.\nBạn có muốn tiếp tục không?',
        	    ok:'Đồng ý',
        	    cancel:'Hủy bỏ',
        	    modal:true,
        	    shadow:false,
        	    fn:function(r){
        	    	if(r)
        	    	{
        	    		listId="";
        				isImport=false;
        				refreshFormAndDataGrid();
        	    	}
        	    }
        	});
		}
		else
		{
			listId="";
			refreshFormAndDataGrid();
		}
	}
	
    function clearFormKH()
    {
    	editDl="";
    	isImport=false;
    	refreshFormAndDataGrid("clean");
    	
    }
    
    function printpdf(){
    	if(isImport ==true){
    		warning("Phải lưu dữ liệu import trước khi in hóa đơn!");
   			return;
   		}
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
    
    $(document).ready(function () {

        $("#btnSubmit").click(function (event) {
        	event.preventDefault();
        	var kyThang = $("#kyThang").val();
        	var kyNam = $("#kyNam").val();
        	$.messager.confirm({
        		title: 'Thông báo',
        	    content: 'Đồng ý nhập dữ liệu cho kỳ thu tháng '+kyThang +'-'+kyNam,
        	    ok:'Đồng ý',
        	    cancel:'Hủy bỏ',
        	    modal:true,
        	    shadow:false,
        	    fn:function(r){
        	    	if(r)
        	    	{
        	    		isImport=true;
        	            fire_ajax_submit();
        	    	}
        	    }
        	});
            
        });
    });
    
    function getListCheck(dg) {
    	var selectedrow = dg.datagrid("getSelections");
    	var rows = dg.datagrid('getRows');
    	if(rows==null) return;
    	for( var i=0; i<rows.length; i++){
    		listId = listId.replace(rows[i]["id"]+"~", "");
    	}
    	if(selectedrow!=null)
   		{
	    	for(var i=0; i<selectedrow.length; i++){
	    		listId=listId + selectedrow[i]["id"]+"~";
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
	    		if(listId.indexOf(rows[i]["id"])>-1)
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
    
    var keyStr = "ABCDEFGHIJKLMNOP" +
    "QRSTUVWXYZabcdef" +
    "ghijklmnopqrstuv" +
    "wxyz0123456789+/" +
    "=";
    
    function encode64(input) {
        input = escape(input);
        var output = "";
        var chr1, chr2, chr3 = "";
        var enc1, enc2, enc3, enc4 = "";
        var i = 0;

        do {
           chr1 = input.charCodeAt(i++);
           chr2 = input.charCodeAt(i++);
           chr3 = input.charCodeAt(i++);

           enc1 = chr1 >> 2;
           enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
           enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
           enc4 = chr3 & 63;

           if (isNaN(chr2)) {
              enc3 = enc4 = 64;
           } else if (isNaN(chr3)) {
              enc4 = 64;
           }

           output = output +
              keyStr.charAt(enc1) +
              keyStr.charAt(enc2) +
              keyStr.charAt(enc3) +
              keyStr.charAt(enc4);
           chr1 = chr2 = chr3 = "";
           enc1 = enc2 = enc3 = enc4 = "";
        } while (i < input.length);

        return output;
    }

    function decode64(input) {
        var output = "";
        var chr1, chr2, chr3 = "";
        var enc1, enc2, enc3, enc4 = "";
        var i = 0;

        // remove all characters that are not A-Z, a-z, 0-9, +, /, or =
        var base64test = /[^A-Za-z0-9\+\/\=]/g;
        if (base64test.exec(input)) {
           alert("There were invalid base64 characters in the input text.\n" +
                 "Valid base64 characters are A-Z, a-z, 0-9, '+', '/',and '='\n" +
                 "Expect errors in decoding.");
        }
        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

        do {
           enc1 = keyStr.indexOf(input.charAt(i++));
           enc2 = keyStr.indexOf(input.charAt(i++));
           enc3 = keyStr.indexOf(input.charAt(i++));
           enc4 = keyStr.indexOf(input.charAt(i++));

           chr1 = (enc1 << 2) | (enc2 >> 4);
           chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
           chr3 = ((enc3 & 3) << 6) | enc4;

           output = output + String.fromCharCode(chr1);

           if (enc3 != 64) {
              output = output + String.fromCharCode(chr2);
           }
           if (enc4 != 64) {
              output = output + String.fromCharCode(chr3);
           }

           chr1 = chr2 = chr3 = "";
           enc1 = enc2 = enc3 = enc4 = "";

        } while (i < input.length);

        return unescape(output);
    }
    
    function _base64ToArrayBuffer(base64) {
        var binary_string =  window.atob(base64);
        var len = binary_string.length;
        var bytes = new Uint8Array( len );
        for (var i = 0; i < len; i++)        {
            bytes[i] = binary_string.charCodeAt(i);
        }
        return bytes.buffer;
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
    		var object=getObjects(jsonObj,"id",rows[i]["id"]);
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