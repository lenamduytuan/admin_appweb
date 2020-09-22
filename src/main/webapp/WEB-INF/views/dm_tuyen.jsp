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
		<div class="easyui-panel" title="Cập nhật thông tin tuyến" style="width:100%;max-width:700px;padding:10px 60px;">
	        <form id="form1" method="post">
	            <div style="margin-bottom:20px">
	                <table style="width:100%;max-width:900px;" cellpadding="3" border="0" >
	            		<tr>
	            			<td width="30%">
	            				<input type="hidden" id="maTuyenHienTai" name="maTuyenHienTai" />
	                			<input class="easyui-textbox" id="maTuyen" name="maTuyen" style="width:100%;max-width:350px" data-options="label:'Mã tuyến:',labelWidth:100,prompt:'Nhập mã tuyến.'" >
	                			<span style="color: red;">(*)</span>
	            			</td>
	            		</tr>
	            		<tr>
	            			<td width="60%">
	                			<input class="easyui-textbox" id="tenTuyen" name="tenTuyen" style="width:100%;max-width:350px" data-options="label:'Tên tuyến:',labelWidth:100,prompt:'Nhập tên tuyến.'" >
	                			<span style="color: red;">(*)</span>
	            			</td>
	            			<td width="10%"/>
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
	                <th field="maTuyen" width="100" align="left">Mã tuyến</th>
	                <th field="tenTuyen" width="600" align="left">Tên tuyến</th>
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
   	var url_ViewListTuyen = '${sessionScope.apiContext}/dmtuyen/viewListTuyen';
   	var url_UpdateTuyen = '${sessionScope.apiContext}/dmtuyen/updateDmTuyen';
    
    $(function(){	
    	dataGridLoader($('#dg'), url_ViewListTuyen, 1231);
	});
	
	function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#form1').form('load',{
	        	maTuyenHienTai:row.maTuyen,
	        	maTuyen:row.maTuyen,
	        	tenTuyen:row.tenTuyen
            });
	    }
        $('#maTuyen').textbox('readonly',true);
	}
	
    function submitForm(){
    	if($("#maTuyen").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Mã tuyến" yêu cầu nhập.','warning');
    		$('#maTuyen').textbox('textbox').focus();
    		return;
    	}
    	if($("#tenTuyen").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên tuyến" yêu cầu chọn.','warning');
    		$('#tenTuyen').textbox('textbox').focus();
    		return;
    	}
    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_UpdateTuyen, 1232, json, refreshFormAndDataGrid, true);
    }
    
    function refreshFormAndDataGrid(){
    	$('#dg').datagrid('reload');
    	clearForm($('#form1'));
    	$('#maTuyen').textbox('readonly',false);
    }
    </script>
</body>
</html>