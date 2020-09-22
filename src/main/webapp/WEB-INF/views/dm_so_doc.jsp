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
    <title>Danh mục sổ</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
</head>
<body>
	<div align="center">
		<div style="height:10px"></div>
		<div class="easyui-panel" title="Cập nhật thông tin sổ" style="width:100%;max-width:700px;padding:10px 60px;">
	        <form id="form1" method="post">
	            <div style="margin-bottom:20px">
	                <table style="width:100%;max-width:900px;" cellpadding="3" border="0" >
	            		<tr>
	            			<td width="45%">
	            				<input type="hidden" id="id" name="id" />
	                			<input class="easyui-textbox" id="maSoDoc" name="maSoDoc" style="width:100%;max-width:350px" data-options="label:'Mã sổ:',labelWidth:50,prompt:'Nhập mã sổ.'" >
	            			</td>
	            			<td width="5%"><span style="color: red;">(*)</span></td>
	            			<td width="45%">
	                			<input class="easyui-textbox" id="tenSoDoc" name="tenSoDoc" style="width:100%;max-width:350px" data-options="label:'Tên sổ:',labelWidth:55,prompt:'Nhập tên sổ.'" >
	            			</td>
	            			<td width="5%"><span style="color: red;">(*)</span></td>
	            		</tr>
	            		<tr>
	            			<td width="45%">
	                			<input class="easyui-combobox" id="maCanBo" name="maCanBo" 
						           		data-options="
						                method:'get',
						                valueField:'maCb',
						                textField:'tenCb',
						                label:'Cán bộ quản lý:',
						                labelWidth:110,
						                editable:false,
						                panelHeight:'auto'" style="width:100%;height:auto;max-height:50px;">
	            			</td>
	            			<td width="5%"><span style="color: red;">(*)</span></td>
	            			<td width="45%">
	            				<input class="easyui-textbox" id="moTa" name="moTa" style="width:100%;max-width:350px;height:50px" data-options="label:'Mô tả:',labelWidth:55,prompt:'Nhập mô tả.'" >
	            			</td>
	            			<td width="5%"></td>
	            		</tr>
	            	</table>
	            </div>
	        </form>
	        <div style="text-align:center;padding:3px 0">
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Cập nhật</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm($('#form1'))" style="width:80px">Nhập mới</a>
	        </div>
	    </div>
	    <div style="margin:20px 0;"></div>
        <table id="dg" class="easyui-datagrid" style="width:700px;height:320px"
	            title="Tải dữ liệu" iconCls="icon-save" toolbar="#tb"
	            rownumbers="true" pagination="true">
	        <thead>
	            <tr>
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th field="maSoDoc" width="100" align="left">Mã sổ</th>
	                <th field="tenSoDoc" width="300" align="left">Tên sổ</th>
	                <th field="tenSoDoc" width="300" align="left">Mô tả</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="tb" style="padding:2px 5px;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="getSelected()">
				(<i>Chọn 1 dòng rồi nhấn chuột tại đây để sửa dữ liệu.</i>)
			</a>
		</div>
    </div>
    <script type="text/javascript">
   	var url_ViewListDmSo = '${sessionScope.apiContext}/dmso/viewListDmSo';
   	var url_UpdateSo = '${sessionScope.apiContext}/dmso/updateDmSo';
    var url_loadCanBo = '${sessionScope.apiContext}/dmcb/loadCbBoxDmCanBo';
    $(function(){	
    	dataGridLoader($('#dg'), url_ViewListDmSo, 1261);
    	comboboxLoader($('#maCanBo'), url_loadCanBo, 1261);
	});
	
	function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#form1').form('load',{
	        	id:row.id,
	        	maSoDoc:row.maSoDoc,
	        	tenSoDoc:row.tenSoDoc,
	        	maCanBo:row.maCanBo,
	        	moTa:row.Mota
            });
	    }
        $('#maSoDoc').textbox('readonly',true);
	}
	
    function submitForm(){
    	if($("#maSoDoc").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Mã sổ" yêu cầu nhập.','warning');
    		$('#maSoDoc').textbox('textbox').focus();
    		return;
    	}
    	if($("#tenSoDoc").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên sổ" yêu cầu nhập.','warning');
    		$('#tenSoDoc').textbox('textbox').focus();
    		return;
    	}
    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_UpdateSo, 1262, json, refreshFormAndDataGrid, true);
    }
    
    function refreshFormAndDataGrid(){
    	$('#dg').datagrid('reload');
    	clearForm($('#form1'));
    	$('#maSoDoc').textbox('readonly',false);
    }
    </script>
</body>
</html>