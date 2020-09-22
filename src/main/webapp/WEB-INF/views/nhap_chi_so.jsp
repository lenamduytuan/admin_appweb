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
    <script>
    	var httt = "[{\"id\":1,\"text\":\"Tiền mặt\"},{\"id\":2,\"text\":\"Chưa gửi\"}]";
    </script>
</head>
<body>
<div class="easyui-accordion" style="width:100%;">
	<div title="Tra cứu thông tin khách hàng" data-options="iconCls:'icon-search'" style="width:100%;">
		 <form id="formTk" method="post" style="padding-left: 2%;padding-bottom: 10px;">	
		    <div class="row" style="width:99%">
		    	<div class="col-sm-12 col-md-6 col-water-3">
		    		<label for="kyThuSearch" >Tháng:</label></br>
		    		<div class="form-inline" style="width:100%">	
						<water-combobox waterclass="size-auto-min" waterid="kyThuSearch" watername="kyThuSearch" prevfn="chonKyNam(0)" nextfn="chonKyNam(1);" />
		    		</div>
		    	</div>
		    	<div class="col-sm-12 col-md-6 col-water-3">
		            <label for="khuVucSearch" >Khu vực:</label>
		            <div class="input-group-sm">
		                <input class="easyui-combobox size-auto-min" id="khuVucSearch" name="khuVucSearch"
													           		data-options="
													                method:'get',
													                valueField:'id',
													                textField:'text',
													                editable:false,
													                panelHeight:'auto'">
                     </div>
		    	</div>
		    	<div class="col-sm-12 col-md-6 col-water-3">
		    		<label for="tuyenSearch" >Tuyến:</label>
		    		<div class="input-group-sm">
							<input class="easyui-combobox size-auto-min" id="tuyenSearch" name="tuyenSearch"
													           		data-options="
													                method:'get',
													                valueField:'id',
													                textField:'text',
													                editable:false,
													                panelHeight:'auto'">
                    </div>
		    	</div>
		    	<div class="col-sm-12 col-md-6 col-water-3">
		    		<label for="idHdrSearch" >Bảng giá:</label>
		    		<div class="input-group-sm">
						<input class="easyui-combobox size-auto-min" id="idHdrSearch" name="idHdrSearch"
													           		data-options="
													                method:'get',
													                valueField:'id',
													                textField:'text',
													                editable:false,
													                panelHeight:'auto'">
                    </div>
		    	</div>
		    </div>
		    <div class="row" style="width:99%">
		    	<div class="col-sm-6 col-md-6 col-water-3">
		    		<label for="tenKhSearch" >Tên KH:</label>
		    		<div class="input-group-sm">
		    			<input class="easyui-textbox size-auto-min" id="tenKhSearch" name="tenKhSearch" style="height:auto;width: 100%;">
		    		</div>
		    	</div>
		    	<div class="col-sm-12 col-md-6 col-water-3">
		    		<label for="nguoiGhiSearch" >Người ghi:</label>
		    		<div class="input-group-sm">
		    			<input class="easyui-textbox size-auto-min" id="nguoiGhiSearch" name="nguoiGhiSearch" style="height:auto;width: 100%;">
		    		</div>
		    	</div>
		    	<div class="col-sm-12 col-md-6 col-water-3">
		    		<label for="nguoiThuSearch" >Người thu:</label>
		    		<div class="input-group-sm">
		    			<input class="easyui-textbox size-auto-min" id="nguoiThuSearch" name="nguoiThuSearch" style="height:auto;width: 100%;">
		    		</div>
		    	</div>
                <div class="col-sm-12 col-md-6 col-water-3" style="padding-top: 1.3rem;">
		         	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="timkiem()">Tra cứu</a>
		        </div>
		    </div>
		</form>
	</div>
</div>
<div style="width: 100%;">
	<form id="form1" method="post" style="width: 100%;">
				<table id="dgAll" style="width: 100%;height:auto;max-height:900px;">
					<tr>
						<td>
							<table id="dg" class="easyui-datagrid" style="width:100%;height:470px;max-height:800px;"
						            rownumbers="true" pagination="true" sortName="khuVuc" sortOrder=""
						            data-options="toolbar: '#tb'">
						         <thead frozen="true">
						         	<th data-options="field:'ck1',checkbox:true"></th>
									<th field="codeKh" width="10%" sortable="true" align="left">Mã KH</th>
									<th field="tenKh" width="13%" sortable="true" align="left">Họ tên</th>
						         </thead>
						         <thead>
						            <tr>
							            <th field="isChange" width="100" align="center" hidden="hidden" />
							            <th field="isTt" width="100" align="center" hidden="hidden" />
							        	<th field="isSendVni" width="100" align="center" hidden="hidden" />
							        	<th field="maTt" width="100" align="center" hidden="hidden" />
							        	<th field="maKh" width="100" align="center" hidden="hidden" />
							        	<th field="maHd" width="7%" align="left">Mã HĐ</th>
										<th field="maSo" width="7%" align="left">Sổ ghi</th>
										<th field="tuyen" width="5%" align="left">Tuyến</th>
										<th field="khuVuc" width="7%" sortable="true" align="left" height="auto">Khu vực</th>
										<th field="maSoThue" width="10%" align="left">MS thuế</th>
										<th field="idDichVu" width="10%" align="left">Dịch vụ</th>
										<th field="csTu" width="10%" align="right" data-options="formatter:formatInt">Số ĐK</th>
										<th data-options="field:'csDen',width:80,align:'right', editor:{type:'numberbox',options:{precision:0,groupSeparator:','}}">Số CK</th>
										<th field="soM3" width="10%" align="right" data-options="formatter:formatInt">M3</th>
										<th field="soTien" data-options="formatter:formatdecimal" width="10%" align="right" >Thành tiền</th>
										<th field="tienThueVat" width="10%" align="right" data-options="formatter:formatdecimal">Thuế VAT</th>
										<th field="phi" width="10%" align="right" data-options="formatter:formatdecimal">Phí MT</th>
										<th field="tongTien" width="10%" align="right" data-options="formatter:formatdecimal">Tổng tiền</th>
										<th field="maPhieuThu" width="10%" align="right">Mã phiếu thu</th>
										<th field="ngayThanhToan" width="10%" align="center">Ngày thanh toán</th>
										<th field="diaChi" width="15%" align="left">Địa chỉ</th>
										<th field="nguoiGhi" width="10%" align="left">Người ghi</th>
										<th field="nguoiThu" width="10%" align="left">Người thu</th>
										<th data-options="field:'htThanhToan',width:150,
						                        editor:{
						                            type:'combobox',
						                            options:{
						                                valueField:'id',
						                                textField:'text',
						                                method:'get',
						                                data:[{
																id: 'TM',
																text: 'Tiền mặt'
															},{
																id: 'CK',
																text: 'Chuyển khoản'
															}],
														panelHeight:'auto'
						                            }
						                        }">Hình thức thanh toán</th>
						            </tr>
						        </thead>
						    </table>
						    <div id="tb" style="height:auto;">
<!-- 						    	<input type="checkbox" id="editKH" value="edit" onchange="checkEditKH();"> -->
<!-- 			     				<span style="color: blue;font-size: 14px; font-family: tahoma;margin-left:5px">Bật sửa dữ liệu -->
		 						</span>
			 					<a href="#" id="saveData" onclick="save();" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" style="width:10%;position:right;">Lưu dữ liệu</a>

								<a href="#" id="saveData" onclick="saveDaThuTien();" class="easyui-linkbutton" data-options="iconCls:'icon-dollar',plain:true" style="width:10%;position:right;">Đã thu tiền</a>
		        				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-export-excel',plain:true" onclick="toExcel()">Kết xuất Excel</a>
		        				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true" onclick="printpdf()">In thông báo</a>
		        				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-import-excel',plain:true" onclick="$('#import').window('open')">Nhập Excel</a>
		        				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-import-luyke',plain:true" onclick="nhapluyke();">Nhập lũy kế</a>
		        				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="viewDetail()">Chi tiết thanh toán</a>
			    			</div>
			    		</td>
			    	</tr>
			    </table>
		    </form>
		</div>
<div></div>
<div id="import" class="easyui-window" title="Nhập từ Excel" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:40%;height:30%;padding:10px;" >
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
				            <a id="btnSubmit" href="#" class="easyui-linkbutton" iconCls="icon-add" style="width:40%;" >Đồng ý</a>
				            <a id="btnHuy" href="#" class="easyui-linkbutton" onclick="$('#import').window('close')"  style="width:40%;" >Hủy</a>
				        </div>
			        </div>
			    </div>
		    </form>
    </div>
<div id="w" class="easyui-window" title="In hóa đơn" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:90%;height:90%;padding:10px;">
	<form id="formPdf">
		<iframe id="frPDF" height="800" width="100%" src=""></iframe>
	</form>
</div>
<div id="dlgTtDtl" class="easyui-dialog" style="width:650px;height:auto;" closed="true" buttons="#dlg-buttons">
        <form id="fmTtDtl" method="post" novalidate style="margin:0;padding:5px 5px">
        	<input type="hidden" id="idTt" name="idTt" />
<!--         	<div> -->
<!--         		<label for="tenKhSearch" >Thuế VAT:</label> -->
<!--         		<input class="easyui-textbox" id="thueTt" name="thueTt" style="height:auto"> -->
<!--         		<label for="tenKhSearch" >Phí:</label> -->
<!--         		<input class="easyui-textbox" id="phiTt" name="phiTt" style="height:auto"><br /> -->
<!--         		<label for="tenKhSearch" >Tổng tiền:</label> -->
<!--         		<input class="easyui-textbox" id="tongTienTt" name="tongTienTt" style="height:auto"> -->
<!--         	</div> -->
            <table id="dgDtl" class="easyui-datagrid" title="Chi tiết phần thanh toán tiền" pagination="true" style="width:600px;height:auto;"
		            data-options="
		                iconCls: 'icon-edit',
		                singleSelect: true,
		                toolbar: '#tbDtl',
		                showFooter: true,
		                method: 'post',
		                onClickCell: onClickCellDtl,
		                onEndEdit: onEndEditDtl,
		                endEditing:endEditingDtl
		            ">
		        <thead>
		            <tr>
		            	<th data-options="field:'idDtl',width:0,align:'right'" hidden="hidden"></th>
		            	<th data-options="field:'maTtDtl',width:0,align:'right'" hidden="hidden"></th>
		            	<th data-options="field:'moTaDtl',width:100,align:'left'" >Mô tả</th>
		                <th data-options="field:'csTuDtl',width:100,align:'right'" >Từ số</th>
		                <th data-options="field:'csDenDtl',width:80,align:'right'">Đến số</th>
		                <th data-options="field:'soLuongDtl',width:100,align:'right',
		                	editor:
		                	{
		                		type:'numberbox',
		                		precision:0,
		            			groupSeparator:','
		                	}">Số khối nước</th>
		            	<th data-options="field:'donGiaDtl',width:100,align:'right',
		            		editor:
		            		{
		            			type:'numberbox',
		            			options:
		            				{
		            					required:true,
		            					prompt:'Bắt buộc nhập.',
		            					precision:0,
		            					groupSeparator:','
		            				}
		            		}" class="easyui-validatebox tb">Đơn giá</th>
		            	<th data-options="field:'vatDtl',width:0,align:'right'" hidden="hidden"></th>
		            	<th data-options="field:'phiDtl',width:0,align:'right'" hidden="hidden"></th>
<!-- 						<th data-options="field:'vatDtl',width:100,align:'right', -->
<!-- 		            		editor: -->
<!-- 		            		{ -->
<!-- 		            			type:'numberbox', -->
<!-- 		            			options: -->
<!-- 		            				{ -->
<!-- 		            					required:true, -->
<!-- 		            					prompt:'Bắt buộc nhập.' -->
<!-- 		            				} -->
<!-- 		            		}" class="easyui-validatebox tb">Thuế</th> -->
<!-- 		            	<th data-options="field:'phiDtl',width:100,align:'right', -->
<!-- 		            		editor: -->
<!-- 		            		{ -->
<!-- 		            			type:'numberbox', -->
<!-- 		            			options: -->
<!-- 		            				{ -->
<!-- 		            					required:true, -->
<!-- 		            					prompt:'Bắt buộc nhập.' -->
<!-- 		            				} -->
<!-- 		            		}" class="easyui-validatebox tb">Phí</th> -->
		            	<th data-options="field:'soTienDtl',width:100,align:'right',
		            		editor:
		            		{
		            			type:'numberbox',
		            			options:
		            				{
		            					required:true,
		            					prompt:'Bắt buộc nhập.',
		            					precision:0,
		            					groupSeparator:','
		            				}
		            		}" class="easyui-validatebox tb">Thành tiền</th>
		            </tr>
		        </thead>
		    </table>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveThanhToanDtl()" style="width:90px">Lưu lại</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlgTtDtl').dialog('close')" style="width:90px">Hủy bỏ</a>
    </div>
<script type="text/javascript">
    var url_ViewExcel = '${sessionScope.apiContext}/chiso/viewChiSoKh';
    var url_ImportExcel = '${sessionScope.apiContext}/chiso/importExcelChiSo';
    var url_SaveExcel = '${sessionScope.apiContext}/chiso/saveChiSoKh';
    var url_CleanExcel = '${sessionScope.apiContext}/chiso/cleanExcelQLN';
    var url_CreatePdf = '${sessionScope.apiContext}/chiso/createPdf';
    var url_SaveThuTien = '${sessionScope.apiContext}/chiso/updateThanhToanTien';
    var url_viewDetailThanhToan = '${sessionScope.apiContext}/thanhtoan/viewDetailThanhToan';
    var url_updateThanhToanDtl = '${sessionScope.apiContext}/thanhtoan/updateThanhToanDtl';
    var url_Delete = '${sessionScope.apiContext}/chiso/deleteExcelQLN';
    var url_Print = '${sessionScope.apiContext}/chiso/downloads/'+SessionId;
    var url_lov_kh = 'lovKH?session='+SessionId;
    var url_add_kh = 'addKH?session='+SessionId;
    var isImport =false;
    var listId="";
    var listIdTt="";
   	var checkall="";
   	var editDl="edit";
   	var editDlDtl="edit";
   	var editIndex = undefined;
   	var editIndexDtl = undefined;
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
   	var maSoGlobal = $('#maSoGlobal').val();
   	var url_open_chart = 'lichsu?session='+SessionId;
	
	$(function(){
		resizeElement();
		comboboxLoader($('#kyThuSearch'), url_combo_kyThu, 1244);
		comboboxLoader($('#tuyenSearch'), url_combo_tuyen, 1244);
		comboboxLoader($('#khuVucSearch'), url_combo_khuVuc, 1244);
		comboboxLoader($('#idHdrSearch'), url_combo_dichVu, 1244);
   		dataGridLoader($('#dgDtl'), url_viewDetailThanhToan, 1244);
   	});
    
    function refreshFormAndDataGrid(action){
    	var khuVucSearch = $('#khuVucSearch').combobox('getValue');
    	var idHdrSearch = $('#idHdrSearch').combobox('getValue');
    	var soGhiSearch = $('#maSoGlobal').val();
    	var tuyenSearch = $('#tuyenSearch').combobox('getValue');
    	var kyThuSearch = $("#kyThuSearch").val();
    	var tenKhSearch = $("#tenKhSearch").val();
    	var nguoiGhi = $("#nguoiGhiSearch").val();
    	var nguoiThu = $("#nguoiThuSearch").val();
    	var url=url_ViewExcel+"?khuVucSearch="+khuVucSearch+"&tenKhSearch="+tenKhSearch+"&idHdrSearch="+idHdrSearch;
    	url =url + "&soGhiSearch="+soGhiSearch+"&tuyenSearch="+tuyenSearch+"&kyThuSearch="+kyThuSearch+"&nguoiGhiSearch="+nguoiGhi;
    	url =url + "&nguoiThuSearch="+nguoiThu;
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
    
    function refreshFormAndDataGridDetail(){
    	//$('#dgDgl').datagrid('reload')
     	$('#dg').datagrid('reload')
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
        	    		listIdTt="";
        				isImport=false;
        				refreshFormAndDataGrid();
        	    	}
        	    }
        	});
		}
		else
		{
			listId="";
    		listIdTt="";
    		isImport=false;
			refreshFormAndDataGrid();
		}
	}
	
	function nhapluyke()
	{
		isLuyKe=true;
		listId="";
		refreshFormAndDataGrid();
	}
	
    function clearFormKH()
    {
    	//editDl="";
    	isImport=false;
    	refreshFormAndDataGrid("clean");
    }
    
    function save()
    {
    	isImport=false;
    	accept();
    	//isLuyKe=false;
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
    		listId = listId.replace("'" + rows[i]["codeKh"]+"'~", "");
    		listIdTt = listIdTt.replace("'" + rows[i]["maTt"]+"'~", "");
    	}
    	if(selectedrow!=null)
   		{
	    	for(var i=0; i<selectedrow.length; i++){
	    		listId=listId + "'" + selectedrow[i]["codeKh"]+"'~";
	    		listIdTt=listIdTt + "'" + selectedrow[i]["maTt"]+"'~";
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
	    		if(listId.indexOf(rows[i]["codeKh"])>-1)
	   			{
	    			dg.datagrid('checkRow', i);
	    			count++;
	   			}
    		}
    	}
    }
    
    $('#dg').datagrid({
    	onClickRow:function(){
		},
    	onBeforeLoad: function(x) {
    		getListCheck($('#dg'));
    		getListChanges($('#dg'));
      	},
    	  onLoadSuccess: function(){
    		  checkedGrid($('#dg'));
    		  setListChanges();
    	  },
		rowStyler: function(index,row){
			var isTt = row.isTt;
            if (isTt == 1){
                return 'background-color:##EAF2F8;color:blue;font-weight:bold;';
            }
        }
    });
    
    function progressStart(){
        var win = $.messager.progress({
            title:'Tiến trình thực hiện',
            msg:'Yêu cầu đang xử lý...'
        });
    }
    
    function progressStop(){
        $.messager.progress('close');
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
    var yearCbKy= (new Date()).getFullYear();
	function chonKyNamTruoc()
	{
		yearCbKy=yearCbKy-1;
		$('#kyThuSearch').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
	}
	function chonKyNam(isNam)
	{
		if(isNam == 0)
			yearCbKy=yearCbKy-1;
		else
			yearCbKy=yearCbKy+1;
		$('#kyThuSearch').combobox({
    	    onBeforeLoad:function(param){
    	        param.change= yearCbKy;
    	    }
    	}); 
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
	function addKH()
	{
		//$('#newKH').window('open');
		openWindow(url_add_kh,1200,600,'minimizable=no,scrollbars=no,resizable=no,titlebar=no,location=no');
	}
	function refresh()
	{
		timkiem();
	}
	
	var lastIndex;
	$('#dg').datagrid({
		onClickRow:function(rowIndex){
	        if (lastIndex != rowIndex){
	        	if (editDl!="edit") return;
	            $(this).datagrid('endEdit', lastIndex);
	            $(this).datagrid('beginEdit', rowIndex);
	        }
	        lastIndex = rowIndex;
	    },
	    onBeginEdit:function(rowIndex,field){
        	indexRowEvent=rowIndex;
	        var editors = $('#dg').datagrid('getEditors', rowIndex);
	        var soCK,soDK;
	        for(var i=0;i<editors.length;i++)
        	{
	        	if(editors[i].field=="csDen")
       			{
        			soCK = $(editors[i].target);
       			}
        		if(editors[i].field=="csTu")
       			{
        			soDK = $(editors[i].target);
       			}
        	}
	    },
	    onEndEdit:function(index, row){
		    var ed = $(this).datagrid('getEditor', {
		        index: index,
		    	field: 'csDen'
		    });
		    var valueTu = row.csTu;
		    var valueDen = row.csDen;
		    var isTt = row.isTt;
		    if(valueDen >= valueTu && isTt == 0){
		    	row.csDen = valueDen;
		    	row.soM3 = valueDen - valueTu;
		    	row.isChange = '1';
		    }
		},
		onDblClickRow:function(index,row){
	          //alert(row.maKh);
	          openChart(row.maKh);
	        }
	});
	
	function downloadExcel(url, funcId, data, refreshCallback, showMessage){
		progressStart();
		$.ajax({
	        type: "GET",
	        headers: { 
	  		   	"Content-Type": "application/json; charset=UTF-8",
	   			"Authorization":SessionId,
	   			"FunctionId":funcId
			},
	        url: url, 	            
	        data: JSON.stringify(data),
	        dataType: "json",
	        timeout: 600000,
	        beforeSend: function(x) {
	            if (x && x.overrideMimeType) {
	              x.overrideMimeType("application/j-son; charset=UTF-8");
	            }
	      	},
	        success: function(response) {   
	        	progressStop();
	         	if(response.data != null){
	         		if(refreshCallback != null){
	         			refreshCallback(response.data.message);
	         		}
	         		if(showMessage){
	         			$.messager.show({
	    	                title:'Thông tin',
	    	                msg:response.data.message,
	    	                showType:'show'
	    	            });
	         		}         			 
	        	}else{
	        		$.messager.alert('Lỗi', response.error.description,'error');
	        	}
	        },
	        error: function (e) {
	        	progressStop();
	        }
	    }) 
	}
	
	function toExcel(){ 
		getListCheck($('#dg'));
    	var listTmp = listId.replace(/~/g, ' ');
    	if(listTmp.length <=0){
    		warning("Bạn phải chọn bản ghi!");
   			return;
   		}
    	var kyLap = $('#kyThuSearch').val();
    	//alert(kyLap);
    	$('#arrId').val(listId);
    	$('#kyLap').val(kyLap);
    	$('#maSo').val($('#maSoGlobal').combobox('getText'));
		var url_export_excel = '${sessionScope.apiContext}/chiso/exportExcelChiSo';
		formExportExcel.action = url_export_excel;
		formExportExcel.target = "frExcel";
		formExportExcel.submit();
		formExportExcel.target = "";
	}	
	function saveDaThuTien(){
    	getListCheck($('#dg'));
    	var listTmp = listIdTt.replace(/~/g, ' ');
    	if(listTmp.length <=0){
    		warning("Bạn phải chọn bản ghi để cập nhật!");
   			return;
   		}
    	var url = url_SaveThuTien+"?arrId="+listIdTt+"&checkall=true";
    	submitProcessCallback(url, 1613, null, refreshFormAndDataGrid, true);
    }
	
	function printpdf(){
    	getListCheck($('#dg'));
    	var listTmp = listIdTt.replace(/~/g, ' ');
    	if(listTmp.length <=0){
    		warning("Bạn phải chọn bản ghi!");
   			return;
   		}
       	downloadFile(listIdTt);
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
	
// 	function cellStyler(row, index){
// 		var csTu = row.csTu;
// 		var csDen = row.csDen;
//         if (csDen < csDau){
//             return 'background-color:#ffee00;color:red;';
//         }
//         var isTt = row.isTt;
//         if (isTt == 1){
//             return 'background-color:#ffee00;color:red;';
//         }
//     }
	
	//Cac su kien tren thanh toan Detail
	
	function viewDetail(){
		var row = $('#dg').datagrid('getSelected');
	    if (row){
	    	idTt = row.maTt;
	    	soTien = row.soTien;
	    	tenKh = row.tenKh;
	    	thue = row.tienThueVat;
	    	phi = row.phi;
	    	tongTien = row.tongTien;
	    	
	    	if(idTt=="" || soTien <= 0){
	    		warning("Dữ liệu chưa được thanh toán!");
	   			return;	
	    	}
	    	else{
	    		$('#dgDtl').datagrid({
	           	    onBeforeLoad:function(param){
	           	        param.idTt= idTt;
	           	    }
		    	});
	    		$("#idTt").val(idTt);
	    		$("#thueTt").val(thue);
	    		$("#phiTt").val(phi);
	    		$("#tongTienTt").val(tongTien);
		        $('#dlgTtDtl').dialog('open').dialog('center').dialog('setTitle','Chi tiết thanh toán khách hàng: ' + tenKh );
// 		        $('#dgDtl').datagrid('reloadFooter', [{donGiaDtl:'Thuế VAT',soTienDtl:'111'},{donGiaDtl:'Phí',soTienDtl:'222'},{donGiaDtl:'Tổng cộng:',soTienDtl:'333'}]);
	    	}
	    }else{
	    	warning("Bạn phải chọn bản ghi để xem chi tiết!");
   			return;
	    }
	}
	
	function endEditingDtl(){
        if (editIndexDtl == undefined){return true}
        if ($('#dgDtl').datagrid('validateRow', editIndexDtl)){
            $('#dgDtl').datagrid('endEdit', editIndexDtl);
            editIndexDtl = undefined;
            return true;
        } else {
            return false;
        }
    }

	function onClickCellDtl(index, field){
        if (editIndexDtl != index){
            if (endEditingDtl()){
                $('#dgDtl').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                var ed = $('#dgDtl').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndexDtl = index;
            } else {
                setTimeout(function(){
                    $('#dgDtl').datagrid('selectRow', editIndexDtl);
                },0);
            }
        }
    }
	
	var lastIndexDtl;
	$('#dgDtl').datagrid({
		onClickRow:function(rowIndex){
	        if (lastIndexDtl != rowIndex){
	        	if (editDlDtl!="edit") return;
	            $(this).datagrid('endEdit', lastIndexDtl);
	            $(this).datagrid('beginEdit', rowIndex);
	        }
	        lastIndexDtl = rowIndex;
	    },
	    onBeginEdit:function(rowIndex,field){
        	indexRowEvent=rowIndex;
	        var editors = $('#dgDtl').datagrid('getEditors', rowIndex);
	    },
	    onEndEdit:function(index, row){
		    var ed = $(this).datagrid('getEditor', {
		        index: index,
		    	field: 'csDenDtl'
		    });
		}
	});
	
	
	function onEndEditDtl(index, row){
        var ed = $(this).datagrid('getEditor', {
            index: index,
            field: 'donGiaDtl'
        });
        row.donGiaDtl = $(ed.target).textbox('getText');
    }
    
    function saveThanhToanDtl(){
    	accept();
    	var selectedrow = $('#dg').datagrid("getSelections");
    	if(selectedrow!=null){
    		var detailRecords = "";
    		for(var i=0; i<selectedrow.length; i++){
    			selectedrow[i]["maTt"]
    		}
    		detailRecords = detailRecords.substring(0, detailRecords.length - 1);
    		jsonData = jsonData.replace("{DetailRecords}", detailRecords);
    	}
    	
    	var json=objecFromDataGrid($('#dgDtl'));
    	submitProcessCallback(url_updateThanhToanDtl, 1245, json, refreshFormAndDataGridDetail, true);
    }
	
	/**
	 * Number.prototype.format(n, x, s, c) * 
	 * @param integer n: length of decimal
	 * @param integer x: length of whole part
	 * @param mixed   s: sections delimiter
	 * @param mixed   c: decimal delimiter
	 */
	Number.prototype.format = function(n, x, s, c) {
		  var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
		  num = this.toFixed(Math.max(0, ~~n));
		  return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
		};
		function formatdecimal(num){
			return num.format(2, 3, ',', '.');																	
		}
		function formatInt(num){
			return num.format(0, 3, ',', '.');																	
		}
		function openChart(idKh)
		{
			var urlOpen = url_open_chart+"&idKh="+idKh;
			openWindow(urlOpen,1200,600,'minimizable=no,scrollbars=no,resizable=no,titlebar=no,location=no');
		}
    </script>
</body>
</html>