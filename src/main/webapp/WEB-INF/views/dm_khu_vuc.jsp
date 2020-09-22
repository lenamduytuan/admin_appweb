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
    <title>Danh mục tuyến</title>
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
		<div class="easyui-panel" title="Cập nhật danh mục khu vực" style="width:100%;max-width:700px;padding:10px 60px;">
	        <form id="form1" method="post">
	        	<div class="row d-flex justify-content-center">
	        		<div class="col-md-8 d-flex justify-content-center">
	        			<table style="width:100%;" cellpadding="3">
		            		<tr>
		            			<td width="50%">
		            				<input type="hidden" id="maKhuVucHienTai" name="maKhuVucHienTai" />
		                			<input class="easyui-textbox" id="maKhuVuc" name="maKhuVuc" maxlength="10" style="width:100%;max-width:350px" data-options="label:'Mã khu vực:',labelWidth:100,prompt:'Nhập mã khu vực.'" >
		            			</td>
		            			<td width="5%"><span style="color: red;">(*)</span></td>
		            		</tr>
		            		<tr>
		            			<td width="50%">
		                			<input class="easyui-textbox" id="tenKhuVuc" name="tenKhuVuc" maxlength="75"  style="width:100%;max-width:350px" data-options="label:'Tên khu vực:',labelWidth:100,prompt:'Nhập tên khu vực.'" >
		            			</td>
		            			<td width="5%"><span style="color: red;">(*)</span></td>
		            		</tr>
		            		<tr>
		            			<td width="50%">
		                			<input class="easyui-textbox" id="moTa" name="moTa" maxlength="150" style="width:100%;max-width:350px" data-options="label:'Mô tả:',labelWidth:100,prompt:'Nhập mô tả.'" >
		            			</td>
		            			<td width="5%"></td>
		            		</tr>
		            	</table>
	        		</div>
	        	</div>
	        	<div class="row d-flex justify-content-center" style="margin-top: 0.5rem;">
	        		<div class="col-md-8 d-flex justify-content-center">
	        			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Cập nhật</a>
	            		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm($('#form1'))" style="width:80px;margin-left: 0.5rem;">Nhập mới</a>
	        		</div>
	        	</div>
	        </form>
	    </div>
	    <div style="margin:20px 0;"></div>
        <table id="dg" class="easyui-datagrid" style="width:700px;height:320px"
	            title="Tải dữ liệu" iconCls="icon-save" toolbar="#tb"
	            rownumbers="true" pagination="true">
	        <thead>
	            <tr>
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th field="maKhuVuc" width="100" align="left">Mã khu vực</th>
	                <th field="tenKhuVuc" width="200" align="left">Tên khu vực</th>
	                <th field="moTa" width="400" align="left">Mô tả</th>
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
   	var url_ViewListKhuVuc = '${sessionScope.apiContext}/dmkv/viewListKhuVuc';
   	var url_UpdateKhuVuc = '${sessionScope.apiContext}/dmkv/updateDmKhuVuc';
    
    $(function(){	
    	dataGridLoader($('#dg'), url_ViewListKhuVuc, 1251);
	});
	
	function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#form1').form('load',{
	        	maKhuVucHienTai:row.maKhuVuc,
	        	maKhuVuc:row.maKhuVuc,
	        	tenKhuVuc:row.tenKhuVuc,
	        	moTa:row.moTa
            });
	    }
        $('#maKhuVuc').textbox('readonly',true);
	}
	
    function submitForm(){
    	if($("#maKhuVuc").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Mã khu vực" yêu cầu nhập.','warning');
    		$('#maKhuVuc').textbox('textbox').focus();
    		return;
    	}
    	if($("#tenKhuVuc").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên khu vực" yêu cầu chọn.','warning');
    		$('#tenKhuVuc').textbox('textbox').focus();
    		return;
    	}
    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_UpdateKhuVuc, 1252, json, refreshFormAndDataGrid, true);
    }
    
    function refreshFormAndDataGrid(){
    	$('#dg').datagrid('reload');
    	clearForm($('#form1'));
    	$('#maKhuVuc').textbox('readonly',false);
    }
    </script>
</body>
</html>