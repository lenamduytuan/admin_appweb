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
    <title>Danh sách khách hàng</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.hotkeys.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
</head>
<body>
<div align="center">
	<div id="hearderForm" style="padding: 2px;">
		<div class="easyui-accordion" style="width:100%;height:auto;" data-options="multiple:true">
        	<div title="Tra cứu thông tin khách hàng" data-options="iconCls:'icon-search'" style="padding:3px;">
				<form id="formTk" method="post">
					<div class="row" style="margin-left:2rem;width: 90%;margin-bottom: .2rem">
						<div class="col-sm-12 col-md-6 col-water-3">
							<label for="khuVucSearch" >Khu vực:</label>
				    		<div class="input-group-sm">
				    			<input class="easyui-combobox" id="khuVucSearch" name="khuVucSearch" 
				            		data-options="
				                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
				    		</div>
						</div>
						<div class="col-sm-12 col-md-6 col-water-3">
							<label for="tuyenSearch" >Tuyến:</label>
				    		<div class="input-group-sm">
				    			<input class="easyui-combobox" id="tuyenSearch" name="tuyenSearch"
				            		data-options="
		 		                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen',
				                    method:'get',
				                    valueField:'id',
				                    textField:'text',
				                    panelHeight:'auto'">
				    		</div>
						</div>
						<div class="col-sm-12 col-md-6 col-water-3">
							<label for="tenKhSearch" >Tên khách hàng:</label>
				    		<div class="input-group-sm">
				    			<input class="easyui-textbox" id="tenKhSearch" name="tenKhSearch">
				    		</div>
						</div>
						<div class="col-sm-12 col-md-6 col-water-3" style="display: none;">
							<label for="maSoDocSearch" >Sổ:</label>
				    		<div class="input-group-sm">
				    			<input class="easyui-combobox" id="maSoDocSearch" name="maSoDocSearch"
										data-options="
										url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmSo',
					                    method:'get',
						                valueField:'id',
						                textField:'text',
						                panelHeight:'auto'" />
				    		</div>
						</div>
						<div class="col-sm-12 col-md-6 col-water-3" style="padding-top: 1.2rem;">
							<a href="#" class="easyui-linkbutton" onclick="timkiem()" data-options="iconCls:'icon-search'" >TÌM KIẾM</a>
						</div>
					</div>
				</form>
		</div>
	</div>
</div>	
		<div id="mainForm" style="padding:2px;">
			<table id="dg" class="easyui-datagrid" style="width:100%;height:490px;max-height:460px;"
			            rownumbers="true" pagination="true" 
			            data-options="pageSize:20,toolbar: '#tbKhachHang'">
			        <thead frozen="true">
			        	<th data-options="field:'ck1',checkbox:true"></th>
			        	<th field="maKh" width="10%" align="left" hidden="hidden" />
						<th field="codeKh" width="10%" align="left"  data-options="sortable:true" >Mã KH</th>
					    <th field="tenKh" width="15%" align="left"  data-options="sortable:true" editor="text">Tên KH</th>
					</thead>
			        <thead>
			            <tr>
			            	<th field="idDichVu" width="10%" align="left" hidden="hidden" />
			            	<th field="idSoDoc" width="10%" align="left" hidden="hidden" />
			            	<th field="mst" width="10%" align="left" hidden="hidden" />
			            	<th field="phiNt" width="10%" align="left" hidden="hidden" />
							<th field=maSo width="7%" align="left" data-options="sortable:true" >Sổ ghi</th>
							<th field="maXa" width="7%" align="left" data-options="sortable:true" >Mã xã</th>
							<th field="khuVuc" width="7%" align="left" data-options="sortable:true">Khu vực</th>
		                    <th field="tuyen" width="5%" align="left" data-options="sortable:true" >Tuyến</th>
							<th field="maHd" width="7%" align="left" editor="text" data-options="sortable:true">Mã HĐ</th>
							<th field="maDongHo" width="8%" align="left" editor="text" data-options="sortable:true">Mã đồng hồ</th>
							<th field="loaiDongHo" width="10%" align="left" editor="text" data-options="sortable:true">Loại đồng hồ</th>
							<th field="nguoiLienHe" width="10%" align="left" editor="text" data-options="sortable:true">Người liên hệ</th>
							<th field="tel" width="10%" align="left" editor="text" data-options="sortable:true">Điện thoại</th>
							<th field="diaChi" width="15%" align="left" editor="text" data-options="sortable:true">Địa chỉ</th>
							<th field="nguoiGhi" width="15%" align="left" editor="text" data-options="sortable:true">Người ghi</th>
							<th field="nguoiThu" width="15%" align="left" editor="text" data-options="sortable:true">Người thu</th>
			            </tr>
			        </thead>
			    </table>
		</div>
		<div id="tbKhachHang" style="height:auto;padding:2px;">
<!-- 	     	<span style="color: red;font-size: 14px; font-family: tahoma;margin-left: 7px">All: -->
<!-- 				<input type="checkbox" id="checkall" value="all" onchange="checkallKH();"> -->
<!-- 			</span> -->
<!-- 			<span style="color: blue;font-size: 14px; font-family: tahoma;margin-left: 30px">Bật sửa dữ liệu: -->
<!-- 				<input type="checkbox" id="editKH" value="edit" onchange="checkEditKH();"> -->
<!-- 			</span> -->
<!-- 			<span   style="float: right;margin-right: 5px;margin-bottom: 10px;"> -->
			<span>
<!-- 				 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addKH()">Thêm mới</a> -->
				 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addInfoKh()">Thêm mới</a>
				 <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfoKh()">
					(<i>Cập nhật thông tin KH).</i>)
				</a>
<!-- 				 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="save()">Lưu</a> -->
		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteKH()">Xóa</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-export-excel',plain:true" onclick="exportExcel()">Kết xuất Excel</a>
		        
			</span>	
	    </div>

    
    <div id="dlgKhachHang" class="easyui-dialog" style="width:900px;height:auto;" closed="true" buttons="#dlg-buttons" title="Cập nhật thông tin khách hàng" align="center">
        <form id="fmDetail" method="post" novalidate style="margin:0;padding:5px 5px">
        	<div id="pnGeneral" class="easyui-panel" title="Thông tin chung" style="width:850px;height:auto;padding:10px;">
        		<table style="width:100%;max-width:800px;" cellpadding="3" border="0" >
	            	<tr>
	            		<td>
	            			<input type="hidden" id="maKh" name="maKh" />
	            			<input type="hidden" id="loaiKh" name="loaiKh" value="1"/>
	                		<input class="easyui-textbox" id="codeKh" name="codeKh" maxlength="10" style="width:100%;max-width:350px" data-options="label:'Mã khách hàng :',labelWidth:130,prompt:'Nhập mã khách hàng.'">
	                		<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	            			<input class="easyui-textbox" id="tenKh" name="tenKh" style="width:100%;max-width:350px" data-options="label:'Tên khách hàng :',labelWidth:130,prompt:'Nhập tên khách hàng.'">
	            			<span style="color: red;">(*)</span>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	                   		<input class="easyui-combobox" id="maXa" name="maXa" style="width:100%;max-width:350px;"
					            		data-options="
					                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmXa',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    panelHeight:'200px',
					                    label: 'Thuộc xã:',
					                    labelWidth:100,
                    					labelPosition: 'left'">
                    		<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	                		<input class="easyui-textbox" id="diaChi" name="diaChi" style="width:100%;max-width:350px" data-options="label:'Địa chỉ:',labelWidth:100,prompt:'Nhập địa chỉ.'">
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	            			<input class="easyui-combobox" id="idSoDoc" name="idSoDoc" style="width:100%;max-width:350px;"
					            		data-options="
					                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmSo',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    editable:false,
					                    panelHeight:'auto',
					                    label: 'Sổ ghi:',
					                    labelWidth:100,
                    					labelPosition: 'left'">
                    		<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	            			<input class="easyui-combobox" id="idDichVu" name="idDichVu" style="width:100%;max-width:350px;"
					            		data-options="
					                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmDv',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    editable:false,
					                    panelHeight:'auto',
					                    label: 'Bảng giá nước áp dụng:',
					                    labelWidth:150,
                    					labelPosition: 'left'">
                    		<span style="color: red;">(*)</span>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	            			<input class="easyui-textbox" id="nguoiGhi" name="nguoiGhi" style="width:100%;max-width:350px" data-options="label:'Người ghi :',labelWidth:100,prompt:'Nhập tên người ghi chỉ số.'">
	            			<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	            			<input class="easyui-textbox" id="nguoiThu" name="nguoiThu" style="width:100%;max-width:350px" data-options="label:'Người thu :',labelWidth:100,prompt:'Nhập tên người thu tiền.'">
	            			<span style="color: red;">(*)</span>
	            		</td>
	            	</tr>
	            </table>
        	</div>
        	<div id="pnTba" class="easyui-panel" title="Thông tin TBA và công tơ sử dụng hiện tại" style="width:850px;height:auto;padding:10px;">
        		<table style="width:100%;max-width:800px;" cellpadding="3" border="0" >
	            	<tr>
	            		<td>
	                		<input class="easyui-combobox" id="tuyen" name="tuyen" style="width:100%;max-width:350px;"
					            		data-options="
					                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    editable:false,
					                    panelHeight:'auto',
					                    label: 'Thuộc tuyến:',
					                    labelWidth:100,
                    					labelPosition: 'left'">
                    		<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	                   		<input class="easyui-combobox" id="khuVuc" name=khuVuc style="width:100%;max-width:350px;"
					            		data-options="
					                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    editable:false,
					                    panelHeight:'auto',
					                    label: 'Khu vực:',
					                    labelWidth:100,
                    					labelPosition: 'left'">
                    		<span style="color: red;">(*)</span>
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	                		<input class="easyui-textbox" id="maDongHo" name="maDongHo" style="width:100%;max-width:350px" data-options="label:'Mã đồng hồ:',labelWidth:100,prompt:'Nhập mã đồng hồ.'">
	            		</td>
	            		<td></td>
	            	</tr>
	            	<tr>
	            		<td>
	                   		<input class="easyui-textbox" id="loaiDongHo" name="loaiDongHo" style="width:100%;max-width:350px" data-options="label:'Loại đồng hồ:',labelWidth:100,prompt:'Nhập loại đồng hồ.'">
	            		</td>
	            		<td>
	                   		<input class="easyui-textbox" id="kichCo" name="kichCo" style="width:100%;max-width:350px" data-options="label:'Kích cỡ:',labelWidth:100,prompt:'Nhập kích cỡ đồng hồ.'">
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	                   		<input class="easyui-numberbox" id="soHo" name="soHo" style="width:100%;max-width:350px" data-options="label:'Số hộ dùng chung:',labelWidth:130,prompt:'Nhập số hộ dùng chung.'">
	            		</td>
	            		<td>
	                   		<input class="easyui-numberbox" id="heSo" name="heSo" precision="2" min="0" max="100" style="width:100%;max-width:350px" data-options="label:'Hệ số TI:',labelWidth:100,prompt:'Nhập hệ số TI.'">
	            		</td>
	            	</tr>
	            </table>
        	</div>
        	<div id="pnExtra" class="easyui-panel" title="Thông tin khác" style="width:850px;height:auto;padding:10px;">
        		<table style="width:100%;max-width:800px;" cellpadding="3" border="0" >
	            	<tr>
	            		<td>
	                		<input class="easyui-textbox" id="maHopDong" name="maHopDong" style="width:100%;max-width:350px" data-options="label:'Số hợp đồng:',labelWidth:100,prompt:'Nhập mã hợp đồng.'">
	            			<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	                   		<input class="easyui-textbox" id="mst" name="mst" style="width:100%;max-width:350px" data-options="label:'Mã số thuế:',labelWidth:100,prompt:'Nhập mã số thuế khách hàng'">
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	                   		<input class="easyui-textbox" id="nguoiLienHe" name="nguoiLienHe" iconWidth="28" style="width:100%;max-width:350px" data-options="label:'Người liên hệ:',labelWidth:100,prompt:'Nhập tên người liên hệ.'">
	            			<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	                		<input class="easyui-textbox" id="tel" name="tel" style="width:100%;max-width:350px" data-options="label:'Điện thoại:',labelWidth:100,prompt:'Nhập điện thoại.'">
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	                		<input class="easyui-numberbox" id="phiNt" name="phiNt" precision="2" min="0" max="100" style="width:100%;max-width:350px" data-options="label:'Phí (%):',labelWidth:100,prompt:'Nhập phí.'">
	                		<span style="color: red;">(*)</span>
	            		</td>
	            		<td>
	            		</td>
	            	</tr>
	            </table>
        	</div>
<!--         	<div style="margin-bottom:10px;"> -->
<!--             </div> -->
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveInfoKh(0)" style="width:150px">Lưu lại và đóng</a>
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-reload" onclick="saveInfoKh(1)" style="width:150px">Lưu lại và nhập tiếp</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlgKhachHang').dialog('close')" style="width:90px">Hủy bỏ</a>
    </div>
</div>

<script type="text/javascript">
    var url_view_kh = '${sessionScope.apiContext}/kh/viewDmKh';
    var url_save_kh = '${sessionScope.apiContext}/kh/saveDmKh';
    var url_save_kh_info = '${sessionScope.apiContext}/kh/saveKh';
    var url_delete_kh = '${sessionScope.apiContext}/kh/deleteDmKh';
    var url_add_kh = 'addDmKh?session='+SessionId;
    var url_combo_tuyen = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen';
    var url_combo_khuVuc = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom';
    var listId="";
    var checkall="";
   	var editDl="";
   	var editIndex = undefined;
   	var jsonObj=null;
   	var comboTuyen=null;
   	var comboKhuVuc=null;
   	var isNewKH = false;
   	var ngaySinhCache;
   	var isLoader=false
   	var maSoGlobal = $('#maSoGlobal').val();
   	$('#maSoDocSearch').val(maSoGlobal);
   	$(function(){
    	/* var queryParam =objectifyForm($('#formTk')); //JSON.stringify(objectifyForm($('#formTk')));
    	$('#dg').datagrid({
    	    queryParams: queryParam
    	});
    	alert(queryParam); */
    	var url_data_by_so = url_view_kh+"?maSoDocSearch="+maSoGlobal;
    	dataGridLoader($('#dg'), url_data_by_so, 1631);
    	
    	if(comboTuyen==null)
   		{
    		submitGetFormAndReloadData(url_combo_tuyen, null, null, setcomboTuyen);
   		}
    	if(comboKhuVuc==null)
   		{
    		submitGetFormAndReloadData(url_combo_khuVuc, null, null, setcomboKhuVuc);
   		}
	});
   	
   	function addInfoKh()
   	{
   		clearForm($('#fmDetail'));
		$('#dlgKhachHang').dialog('open').dialog('center');
   	}
   	
   	
   	function setcomboTuyen(data)
    {
    	comboTuyen=data;
    }
    function setcomboKhuVuc(data)
    {
    	comboKhuVuc=data;
    }
    function timkiem()
	{
    	isNewKH = false;
    	refreshFormAndDataGrid();
	}
    
    function refreshFormAndDataGrid(action){
    	var queryParam =objectifyForm($('#formTk')); //JSON.stringify(objectifyForm($('#formTk')));
    	$('#dg').datagrid({
    	    queryParams: queryParam
    	});
//     	dataGridLoader($('#dg'), url_view_kh, null);
     	$('#dg').datagrid('reload');
    }
    
    function editInfoKh(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#fmDetail').form('load',{
	        	maKh:row.maKh,
	        	loaiKh:1,
	        	codeKh:row.codeKh,
	        	tenKh:row.tenKh,
	        	diaChi:row.diaChi,
	        	idSoDoc:row.idSoDoc,
	        	maSoDoc:row.idSoDoc,
	        	maXa:row.maXa,
	        	idDichVu:row.idDichVu,
	        	tuyen:row.tuyen,
	        	khuVuc:row.khuVuc,
	        	maDongHo:row.maDongHo,
	        	loaiDongHo:row.loaiDongHo,
	        	kichCo:row.kichCo,
	        	soHo:row.soHo,
	        	heSo:row.heSo,
	        	maHopDong:row.maHd,
	        	maDongHo:row.maDongHo,
	        	loaiDongHo:row.loaiDongHo,
	        	kichCo:row.kichCo,
	        	soHo:row.soHo,
	        	heSo:row.heSo,
	        	mst:row.mst,
	        	nguoiLienHe:row.nguoiLienHe,
	        	tel:row.tel,
	        	phiNt:row.phiNt,
	        	nguoiGhi:row.nguoiGhi,
	        	nguoiThu:row.nguoiThu
            });
	    }
//         $('#codeKh').textbox('readonly',true);
        $('#dlgKhachHang').dialog('open').dialog('center');
	}

   	function deleteKH()
    {
    	getListCheck($('#dg'));
    	var listTmp = listId.replace(/~/g, ' ');
    	if(listTmp.length <=0){
    		warning("Bạn phải chọn bản ghi!");
   			return;
   		}
    	$.messager.confirm({
    		title: 'Thông báo',
    	    content: 'Bạn có muốn xóa không.?',
    	    ok:'Đồng ý',
    	    cancel:'Hủy bỏ',
    	    modal:true,
    	    shadow:false,
    	    fn:function(r){
    	    	if(r)
    	    	{
    	        	var url=url_delete_kh+"?arrId="+listId+"&checkall="+checkall;
    	        	submitProcessCallback(url, 1632, null, refreshFormAndDataGrid, true);
    	    	}
    	    }
    	});
    }
   	
   	function getListCheck(dg) {
    	var selectedrow = dg.datagrid("getSelections");
    	var rows = dg.datagrid('getRows');
    	if(rows==null) return;
    	for( var i=0; i<rows.length; i++){
    		listId = listId.replace(rows[i]["maKh"]+"~", "");
    	}
    	if(selectedrow!=null)
   		{
	    	for(var i=0; i<selectedrow.length; i++){
	    		listId=listId + selectedrow[i]["maKh"]+"~";
			}
   		}
    }
   	
   	function exportExcel(){   		
   			getListCheck($('#dg'));
   	    	var listTmp = listId.replace(/~/g, ' ');
   	    	if(listTmp.length <=0){
   	    		warning("Bạn phải chọn bản ghi!");
   	   			return;
   	   		}
   	    	$('#arrId').val(listId)
   			var url_export_excel = '${sessionScope.apiContext}/kh/exportExcelKhachHang';
   			formExportExcel.action = url_export_excel;
   			formExportExcel.target = "frExcel";
   			formExportExcel.submit();
   			formExportExcel.target = "";
   	}

    
   	
	/* Process Dialog save info khachhang*/
	function saveInfoKh(number)
	{
		if($("#codeKh").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Mã khách hàng" yêu cầu nhập.','warning');
    		$("#codeKh").textbox('textbox').focus();
    		return;
    	}
    	if($("#tenKh").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên khách hàng" yêu cầu nhập.','warning');
    		$('#tenKh').textbox('textbox').focus();
    		return;
    	}
    	var maXa = $('#maXa').combobox('getValue');
    	if(maXa == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Xã" yêu cầu nhập.','warning');
    		$('#maXa').combobox('getValue').focus();
    		return;
    	}
    	if($("#diaChi").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Địa chỉ" yêu cầu nhập.','warning');
    		$('#diaChi').textbox('textbox').focus();
    		return;
    	}
    	var idSoDoc = $('#idSoDoc').combobox('getValue');
    	if(idSoDoc == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Sổ ghi" yêu cầu nhập.','warning');
    		$('#idSoDoc').combobox('getValue').focus();
    		return;
    	}
    	var idDichVuHdr = $('#idDichVu').combobox('getValue');
    	if(idDichVuHdr == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Bảng giá nước" yêu cầu nhập.','warning');
    		$('#idDichVu').combobox('getValue').focus();
    		return;
    	}
    	if($("#nguoiGhi").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Người ghi" yêu cầu nhập.','warning');
    		$('#nguoiGhi').textbox('textbox').focus();
    		return;
    	}
    	if($("#nguoiThu").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Người thu" yêu cầu nhập.','warning');
    		$('#nguoiGhi').textbox('textbox').focus();
    		return;
    	}
    	var tuyen = $('#tuyen').combobox('getValue');
    	if(tuyen == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tuyến" yêu cầu nhập.','warning');
    		$('#tuyen').combobox('getValue').focus();
    		return;
    	}
    	var khuVuc = $('#khuVuc').combobox('getValue');
    	if(khuVuc == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Khu vực" yêu cầu nhập.','warning');
    		$('#khuVuc').combobox('getValue').focus();
    		return;
    	}
    	if($("#maHopDong").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Số hợp đồng" yêu cầu nhập.','warning');
    		$('#maHopDong').textbox('textbox').focus();
    		return;
    	}
    	if($("#phiNt").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Phí" yêu cầu nhập.','warning');
    		$('#phiNt').textbox('textbox').focus();
    		return;
    	}
    	
    	var json = objectifyForm($("#fmDetail"));
    	submitFormAndCallback(url_save_kh_info, 1632, json, refreshFormAndDataGrid, true);
    	if(number==0)
    	{
    		clearForm($('#fmDetail'));
    		$('#dlgKhachHang').dialog('close');
    	}else{
    		clearForm($('#fmDetail'));
    	}
	}

    </script>
</body>
</html>