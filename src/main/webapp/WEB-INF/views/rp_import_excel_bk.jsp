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
	<div align="left">
		<div >
			<form id="fileUploadForm" method="post" enctype="multipart/form-data" style="float: left;width: 30%;margin-top: 1%;">
				<div  style="width:100%;;padding:5px 20px;">
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
				        </div>
			        </div>
			    </div>
		    </form>
		    <form id="formTk" method="post"  style="float: right;width: 60%;margin-top: 1%;">
		    	<div>
			    	<div style="width: 50%;float: left;">
				        <div style="margin-bottom:2px">
				            <input class="easyui-textbox" id="kyThu" name="kyThu" label="Kỳ thu:" labelPosition="left" data-options="prompt:'Nhập kỳ thu...'" style="width:80%;height:25px">
				        </div>
				        <div style="margin-bottom:2px">
				            <input class="easyui-textbox" id="tuyen" name="tuyen" label="Tuyến:" labelPosition="left" data-options="prompt:'Nhập tuyến...'" style="width:80%;height:25px">
				        </div>
				        <div style="margin-bottom:2px">
				            <input class="easyui-textbox" id="soPhieuThu" name="soPhieuThu" label="Số phiếu thu:" labelPosition="left" data-options="prompt:'Nhập số phiếu thu...'" style="width:80%;height:25px">
				        </div>
			        </div>
				    <div style="width: 50%;float: right;">
				        <div style="margin-bottom:2px">
				            <input class="easyui-textbox" id="khuVuc" name="khuVuc" label="Khu vực:" labelPosition="left" data-options="prompt:'Nhập khu vực...'" style="width:80%;height:25px">
				        </div>
				        <div style="margin-bottom:2px">
				            <input class="easyui-textbox" id="hoTen" name="hoTen" label="Tên KH:" labelPosition="left" data-options="prompt:'Nhập tên khách hàng...'" style="width:80%;height:25px">
				        </div>
			        </div>
		        </div>
		        
		        <div >
			        <div style="text-align: center;margin-bottom: 10px;">
			            <a onclick="timkiem()" class="easyui-linkbutton" iconCls="icon-search" style="width:20%;height:32px">Tìm kiếm</a>
		        	</div>
		        </div>
		    </form>
		</div>
		
		<div>
			<div style="margin:20px 0;"></div>
			<form id="form1" method="post">
				<table id="dgAll" style="width: 100%;">
				<tr>
				<td>
				<table id="dg" class="easyui-datagrid" style="width:100%;height:370px"
			            rownumbers="true" pagination="true" sortName="khuVuc" sortOrder=""
			            data-options="toolbar: '#tb',onClickCell: onClickCell,onEndEdit: onEndEdit">
			         <thead>
			            <tr>
			                <th field="id" width="100" align="center" hidden="hidden" />
			            	<th data-options="field:'ck1',checkbox:true"></th>
			                <th field="khuVuc" width="10%" sortable="true" align="left" editor="text">Khu vực</th>
							<th field="xiNghiep" width="10%" align="left" editor="text" >Xí nghiệp</th>
							<th field="tuyen" width="10%" align="left"  editor="text">Tuyến</th>
							<th field="soGhi" width="10%" align="left"  editor="text">Sổ ghi</th>
							<th field="khoiSD" width="10%" align="left"  editor="text">Khối sử dụng</th>
							<th field="kyThu" width="10%" align="right">Kỳ thu</th>
							<th field="stt" width="10%" align="left">STT</th>
							<th field="maKH" width="10%" align="left">Mã KH</th>
							<th field="maHD" width="10%" align="left"  >Mã HĐ</th>
							<th data-options="field:'ngayHD',width:100,align:'left',formatter:formatDate" >Ngày HĐ</th>
							<th field="hoTen" width="10%" align="left">Họ tên</th>
							<th field="diaChi" width="15%" align="left">Địa chỉ</th>
							<th field="maxSH" width="10%" align="left"  editor="text">MaxSH</th>
							<th field="maxHC" width="10%" align="left"  editor="text">MaxHC</th>
							<th field="maxSX" width="10%" align="left"  editor="text">MaxSX</th>
							<th field="maxDV" width="10%" align="left"  editor="text">MaxDV</th>
							<th field="dm1" width="10%" align="left" editor="text">ĐM1</th>
							<th field="dm2" width="10%" align="left" editor="text">ĐM2</th>
							<th field="dm3" width="10%" align="left" editor="text">ĐM3</th>
							<th field="maDH" width="10%" align="left">Mã ĐH</th>
							<th field="loaiDH" width="10%" align="left">Loại ĐH</th>
							<th data-options="field:'ngayLap',width:100,align:'left',formatter:formatDate">Ngày lắp</th>
							<th field="mst" width="10%" align="left">MS thuế</th>
							<th field="taiKhoan" width="10%" align="left">Tài khoản</th>
							<th field="noiTT" width="10%" align="left">Nơi TT</th>
							<th field="nguoiGhi" width="10%" align="left"  editor="text">Người ghi</th>
							<th field="nguoiThu" width="10%" align="left"  editor="text">Người thu</th>
							<th field="soDK" width="10%" align="left"  editor="text">Số ĐK</th>
							<th field="soCK" width="10%" align="left" editor="text">Số CK</th>
							<th field="sh1" width="10%" align="left" editor="text">SH1</th>
							<th field="sh2" width="10%" align="left" editor="text">SH2</th>
							<th field="sh3" width="10%" align="left" editor="text">SH3</th>
							<th field="sh4" width="10%" align="left" editor="text">SH4</th>
							<th field="hc" width="10%" align="left" editor="text">HC</th>
							<th field="sx" width="10%" align="left" editor="text">SX</th>
							<th field="dv" width="10%" align="left" editor="text">DV</th>
							<th field="m3" width="10%" align="left" editor="text">m3</th>
							<th field="thanhTien" width="10%" align="left" editor="text">Thành tiền</th>
							<th field="vat" width="10%" align="left" editor="text">VAT</th>
							<th field="phiNT" width="10%" align="left" editor="text">Phí NT</th>
							<th field="tongTien" width="10%" align="left" editor="text">Tổng tiền</th>
							<th field="soSeri" width="10%" align="left" editor="text">Số Sêri</th>
							<th field="ghiChuHS" width="10%" align="left" editor="text">Ghi chú(HS)</th>
							<th field="ghiChuSL" width="10%" align="left" editor="text">Ghi chú(SL)</th>
							<th field="nhapCS" width="10%" align="left" editor="text">Nhập CS</th>
							<th field="kiemTra" width="10%" align="left" editor="text">Kiểm tra</th>
							<th field="inHD" width="10%" align="left" editor="text">In HĐ</th>
							<th field="thuTien" width="10%" align="left" editor="text">Thu tiền</th>
			            </tr>
			        </thead>
			    </table>
			    </td>
			    </tr>
			    </table>
			     <div id="tb" style="height:auto">
			     	<span style="color: red;font-size: 14px; font-family: tahoma;margin-left: 7px">All:
						<input type="checkbox" id="checkall" value="all" onchange="checkallKH();">
					</span>
					<span style="color: blue;font-size: 14px; font-family: tahoma;margin-left: 30px">Bật sửa dữ liệu:
						<input type="checkbox" id="editKH" value="edit" onchange="checkEditKH();">
					</span> 
			    </div>
		    </form>
		</div>
		<div>
		<!-- <span style="color: red;font-size: 16px;">Chọn Tất cả: <input type="checkbox" id="checkall" value="all" onchange="checkallKH();"></span> -->
		</div>
		<div style="padding:5px 0;width: 30%;text-align: center;margin: auto;">
			<a href="#" id="saveData" onclick="save();" class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="width:22%">Save</a>
	        <a href="#" id="printData" onclick="printpdf();" class="easyui-linkbutton" data-options="iconCls:'icon-print'" style="width:22%">Print</a>
	        <a href="#" onclick="clearFormKH();" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:22%">Clean</a>
	    </div>
    </div>
     <div id="w" class="easyui-window" title="In hóa đơn" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:90%;height:90%;padding:10px;">
        <form id="formPdf">
		    <iframe id="frPDF" height="800" width="100%" src=""></iframe>
		</form>
    </div>
    <script type="text/javascript">
    var url_ViewExcel = '${sessionScope.apiContext}/rp/viewExcelQLN';
    var url_ImportExcel = '${sessionScope.apiContext}/rp/importExcelQLN';
    var url_SaveExcel = '${sessionScope.apiContext}/rp/saveExcelQLN';
    var url_CleanExcel = '${sessionScope.apiContext}/rp/cleanExcelQLN';
    var url_CreatePdf = '${sessionScope.apiContext}/rp/createPdf';
    var url_Print = '${sessionScope.apiContext}/rp/downloads/'+SessionId;
    var isImport =false;
    var listId="";
   	var checkall="";
   	var editDl="";
   	var editIndex = undefined;
   	var jsonObj=null;
   	function refreshFormAndDataGrid(action){
    	var khuvuc = $("#khuVuc").val();
    	var tenKH = $("#hoTen").val();
    	var url=url_ViewExcel+"?khuvuc="+khuvuc+"&tenKH="+tenKH;
    	if(action=='clean')
    		url=url+"&action=clean";
    	if(isImport)
    		url=url+"&action=import";	
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
   	function checkEditKH()
   	{
		if ($('#editKH').is(':checked')) {
   			editDl="edit";
   		}
   		else
 		{
   			editDl="";
   			if (editIndex != undefined)
   			{
   				$('#dg').datagrid('endEdit', editIndex);
            	editIndex = undefined;
   			}
 		}
   	}
	function timkiem()
	{
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
    function save()
    {
    	isImport=false;
    	//objecFromDataGrid($('#dg'));
    	//var json = objecFromDataGrid($('#dg'));
    	//console.log(json);
    	//alert(JSON.stringify(json));
    	var json=null;
    	if(jsonObj==null || jsonObj.length==0)
    		getListChanges();
    	if(jsonObj==null || jsonObj.length==0)
			json=objecFromDataGrid($('#dg'));
    	else
    		json=jsonObj;
    	submitProcessCallback(url_SaveExcel, 1613, json, refreshFormAndDataGrid, true);
    	jsonObj=null;
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
    	progressStart();
    	// Get form
        var form = $('#fileUploadForm')[0];
		
        var data = new FormData(form);
		
        data.append("CustomField", "This is some extra data, testing");
        var kyThang = $("#kyThang").val();
    	var kyNam = $("#kyNam").val();
		var url=url_ImportExcel+"?kyThu="+kyThang+"/"+kyNam;
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
        	    content: 'Đồng ý nhập dữ liệu cho kỳ thu tháng '+kyThang +'/'+kyNam,
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
    	onClickRow:function(){
			//alert("click");
		},
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
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dg').datagrid('validateRow', editIndex)){
            $('#dg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index, field){
    	if (editDl!="edit") return;
        if (editIndex != index){
            if (endEditing()){
                $('#dg').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    $('#dg').datagrid('selectRow', editIndex);
                },0);
            }
        }
    }
    function onEndEdit(index, row){
       /*  var ed = $(this).datagrid('getEditor', {
            index: index,
            field: 'id'
        });
        row.productname = $(ed.target).combobox('getText'); */
    }
    function append(){
        if (endEditing()){
            $('#dg').datagrid('appendRow',{status:'P'});
            editIndex = $('#dg').datagrid('getRows').length-1;
            $('#dg').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }
    function removeit(){
        if (editIndex == undefined){return}
        $('#dg').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }
    function accept(){
        if (endEditing()){
            $('#dg').datagrid('acceptChanges');
        }
    }
    function reject(){
        $('#dg').datagrid('rejectChanges');
        editIndex = undefined;
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
    </script>
</body>
</html>