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
    <title>Danh mục cán bộ</title>
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
	    <div style="margin:20px 0;"></div>
        <table id="dg" class="easyui-datagrid" style="width:700px;height:320px"
	            title="Tải dữ liệu" iconCls="icon-save" toolbar="#tb"
	            rownumbers="true" pagination="true" >
	        <thead>
	            <tr>
	            	<th field="maCb" width="100" align="center" hidden="hidden" />
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th field="tenCb" width="300" align="left">Tên cán bộ</th>
	                <th field="gioiTinh" width="100" align="center">Giới tính</th>
	                <th field="phong" width="300" align="left">Phòng</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="tb" style="padding:2px 5px;">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="openFormEditCanBo()">Thêm mới</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="getSelected()">
				(<i>Chọn 1 dòng rồi nhấn chuột tại đây để sửa dữ liệu.</i>)
			</a>
		</div>
    </div>
    
    <div id="dlgCanBo" class="easyui-dialog" style="width:600px;height:auto;" closed="true" 
    	buttons="#dlg-buttons" title="Cập nhật thông tin cán bộ">
        <form id="fmCanBo" method="post" novalidate style="margin:0;padding:5px 5px" >
			<div style="margin-bottom:20px">
	                <table style="width:100%;max-width:600px;" cellpadding="3" border="0" >
	            		<tr>
	            			<td width="45%">
	            				<input type="hidden" id="maCb" name="maCb" />
	                			<input class="easyui-textbox" id="tenCb" name="tenCb" style="width:100%;max-width:350px" data-options="label:'Tên cán bộ:',labelWidth:100,prompt:'Nhập tên cán bộ.'">
	            			</td>
	            			<td width="5%"><span style="color: red;">(*)</span></td>
	            			<td width="45%">
	                   			<select class="easyui-combobox" id="gioiTinh" name="gioiTinh" label="Giới tính:" 
	                   			labelPosition="left" labelWidth="80" style="width:100%;height:auto" >
					                <option value="0">Nam</option>
					                <option value="1">Nữ</option>
					            </select>
	            			</td>
	            			<td width="5%"><span style="color: red;">(*)</span></td>
	            		</tr>
	            		<tr>
	            			<td width="45%">
	            				<input class="easyui-combobox" id="userId" name="userId" 
						           		data-options="
						                url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmAcc',
						                method:'get',
						                valueField:'id',
						                textField:'text',
						                label:'Chọn tài khoản:',
						                labelWidth:140,
						                panelHeight:'auto'" style="width:100%;height:auto;">						   		
	            			</td>
	            			<td width="5%"><span style="color: red;">(*)</span></td>
	            			<td width="45%%">
	                			<input class="easyui-textbox" id="phong" name="phong" style="width:100%;max-width:350px" data-options="label:'Phòng:',labelWidth:100,prompt:'Nhập tên phòng.'">
	            			</td>
	            			<td width="5%"><span style="color: red;">(*)</span></td>
	            		</tr>
	            	</table>
	            </div>
		</form>
	</div>
	<div id="dlg-buttons">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="submitForm()" style="width:130px">Cập nhật</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlgCanBo').dialog('close')" style="width:80px">Hủy bỏ</a>
	</div>
	    
<script type="text/javascript">
   	var url_ViewListCanBo = '${sessionScope.apiContext}/dmcb/viewListCanBo';
   	var url_UpdateCanBo = '${sessionScope.apiContext}/dmcb/updateCanBo';
    
    $(function(){	
    	dataGridLoader($('#dg'), url_ViewListCanBo, 1211);
	});
	
	function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#fmCanBo').form('load',{
	        	maCb:row.maCb,
	        	tenCb:row.tenCb,
	        	gioiTinh:row.gioiTinh,
	        	userId:row.userId,
	        	phong:row.phong
            });
	        $('#dlgCanBo').dialog('open').dialog('center');
	    }
	}
	
    function submitForm(){
    	var multipleValues = $("#dmSoTemp").val() || [];
    	$('#dmSoQuanLy').val(multipleValues);
    	//alert($('#dmSoQuanLy').val());
    	if($("#tenCb").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên cán bộ" yêu cầu nhập.','warning');
    		$('#tenCb').textbox('textbox').focus();
    		return;
    	}
    	if($("#gioiTinh").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Giới tính" yêu cầu chọn.','warning');
    		$('#gioiTinh').textbox('textbox').focus();
    		return;
    	}
    	if($("#phong").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Phòng" yêu cầu nhập.','warning');
    		$('#phong').textbox('textbox').focus();
    		return;
    	}
    	var json = objectifyForm($("#fmCanBo"));
    	submitFormAndCallback(url_UpdateCanBo, 1212, json, refreshFormAndDataGrid, true);
    	$('#dlgCanBo').dialog('close');
    }
    
    function refreshFormAndDataGrid(){
    	$('#dg').datagrid('reload');
    	clearForm($('#fmCanBo'));
    }
    
    function openFormEditCanBo(){
    	clearForm($('#fmCanBo'));
		$('#dlgCanBo').dialog('open').dialog('center');
    }
  
    </script>
</body>
</html>