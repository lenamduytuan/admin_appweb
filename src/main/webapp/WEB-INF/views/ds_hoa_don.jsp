<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="description"
	content="easyui help you build your web page easily!">
<title>Dữ liệu hóa đơn</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
<script type="text/javascript"
	src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/jquery-easyui/jquery.hotkeys.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/common.js" />"></script>
</head>
<body>
	<div id="hearderForm" style="padding: 2px;">
		<div class="easyui-accordion" style="width: 100%; height: auto;"
			data-options="multiple:true">
			<div title="Tra cứu thông tin hóa đơn"
				data-options="iconCls:'icon-search'" style="padding: 3px;">
				<form id="formTk" method="post">
					<table>
						<tr>
							<td style="width: 10%; padding: 2px;">Tên KH</td>
							<td style="width: 25%; height: auto"><input
								class="easyui-textbox" id="tenKhSearch" name="tenKhSearch">
							</td>
							<td style="width: 10%; padding: 2px;"></td>
							<td style="width: 25%; height: auto"><input
								class="easyui-combobox" id="maSoDocSearch" name="maSoDocSearch"
								type="hidden"
								data-options="
										url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmSo',
					                    method:'get',
						                valueField:'id',
						                textField:'text',
						                panelHeight:'auto'" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="mainForm" style="padding: 2px;">
		<table id="dg" class="easyui-datagrid"
			style="width: 100%; height: 440px; max-height: 520px;"
			rownumbers="true" pagination="true"
			data-options="pageSize:10,toolbar: '#tbHoaDon'">
			<thead>
				<tr>
					<th data-options="field:'ck1',checkbox:true"></th>
					<th field="codeKh" width="10%" align="left"
						data-options="sortable:true">Mã KH</th>
					<th field="tenKh" width="15%" align="left"
						data-options="sortable:true" editor="text">Tên KH</th>
					<th field="idSoDoc" width="10%" align="left" hidden="hidden" />
					<th field="maSoDoc" width="10%" align="left"
						data-options="sortable:true">Sổ ghi</th>
					<th field="maXa" width="10%" align="left"
						data-options="sortable:true">Mã xã</th>
					<th field="khuVuc" width="10%" align="left"
						data-options="sortable:true">Khu vục</th>
					<th field="tuyen" width="10%" align="left"
						data-options="sortable:true">Tuyến</th>
					<th field="maHopDong" width="10%" align="left" editor="text"
						data-options="sortable:true">Mã HĐ</th>
					<th field="maDongHo" width="10%" align="left" editor="text"
						data-options="sortable:true">Mã đồng hồ</th>
					<th field="loaiDongHo" width="10%" align="left" editor="text"
						data-options="sortable:true">Loại đồng hồ</th>
					<th field="nguoiLienHe" width="10%" align="left" editor="text"
						data-options="sortable:true">Người liên hệ</th>
					<th field="tel" width="10%" align="left" editor="text"
						data-options="sortable:true">Điện thoại</th>
					<th field="diaChi" width="20%" align="left" editor="text"
						data-options="sortable:true">Địa chỉ</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="tbHoaDon" style="height: auto; padding: 2px;">
		<span> <
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-export-excel',plain:true" onclick="exportExcel()">Kết xuất Excel</a>
		</span>
	</div>

	<div id="w" class="easyui-window" title="In hóa đơn"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width: 90%; height: 90%; padding: 10px;">
		<form id="formPdf" name="formPdf">
			<input hidden="hidden" id="arrId" name="arrId">
			<iframe id="frPDF" name="frPDF" height="800" width="100%" src=""></iframe>
		</form>
		<script type="text/javascript">
			var url_view_kh = '${sessionScope.apiContext}/kh/viewDmKh';
			var url_save_kh = '${sessionScope.apiContext}/kh/saveDmKh';
			var url_save_kh_info = '${sessionScope.apiContext}/kh/saveKh';
			var url_delete_kh = '${sessionScope.apiContext}/kh/deleteDmKh';
			var url_add_kh = 'addDmKh?session=' + SessionId;
			var url_combo_tuyen = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen';
			var url_combo_khuVuc = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom';
			var listId = "";
			var checkall = "";
			var editDl = "";
			var editIndex = undefined;
			var jsonObj = null;
			var comboTuyen = null;
			var comboKhuVuc = null;
			var isNewKH = false;
			var ngaySinhCache;
			var isLoader = false
			var maSoGlobal = $('#maSoGlobal').val();
			$('#maSoDocSearch').val(maSoGlobal);
			$(function() {
				var url_data_by_so = url_view_kh + "?maSoDocSearch="
						+ maSoGlobal;
				dataGridLoader($('#dg'), url_data_by_so, 1631);

				if (comboTuyen == null) {
					submitGetFormAndReloadData(url_combo_tuyen, null, null,
							setcomboTuyen);
				}
				if (comboKhuVuc == null) {
					submitGetFormAndReloadData(url_combo_khuVuc, null, null,
							setcomboKhuVuc);
				}
			});

			function timkiem() {
				isNewKH = false;
				refreshFormAndDataGrid();
			}

			function refreshFormAndDataGrid(action) {
				var queryParam = objectifyForm($('#formTk')); //JSON.stringify(objectifyForm($('#formTk')));
				$('#dg').datagrid({
					queryParams : queryParam
				});
				//     	dataGridLoader($('#dg'), url_view_kh, null);
				$('#dg').datagrid('reload');
			}

			function getListCheck(dg) {
				var selectedrow = dg.datagrid("getSelections");
				var rows = dg.datagrid('getRows');
				if (rows == null)
					return;
				for (var i = 0; i < rows.length; i++) {
					listId = listId.replace(rows[i]["maHoaDon"] + "~", "");
				}
				if (selectedrow != null) {
					for (var i = 0; i < selectedrow.length; i++) {
						listId = listId + selectedrow[i]["maHoaDon"] + "~";
					}
				}
			}

			function exportExcel() {

				getListCheck($('#dg'));
				var listTmp = listId.replace(/~/g, ' ');
				if (listTmp.length <= 0) {
					warning("Bạn phải chọn bản ghi!");
					return;
				}
				$('#arrId').val(listId)
				var url_export_excel = '${sessionScope.apiContext}/hoaDon/exportExcelHoaDon';
				//alert(url_export_excel);
				formPdf.action = url_export_excel;
				formPdf.target = "frPDF";
				formPdf.submit();
				formPdf.target = "";
			}

			
		</script>
</body>
</html>