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
    <title>Quản lý nhóm</title>
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
		<div class="easyui-panel" title="Cập nhật nhóm" style="width:100%;max-width:700px;padding:10px 60px;">
	        <form id="form1" method="post">
	            <div style="margin-bottom:20px">
	                <input type="hidden" id="id" name="id" />
	                <input type="hidden" id="ids" name="ids" />
	                <input class="easyui-textbox" id="code" name="code" style="width:100%;max-width:400px" data-options="label:'Mã nhóm:',labelWidth:100,prompt:'Nhập mã nhóm.'">
	            </div>
	            <div style="margin-bottom:20px">
	                <input class="easyui-textbox" id="name" name="name" style="width:100%;max-width:400px" data-options="label:'Tên nhóm:',labelWidth:100,prompt:'Nhập tên nhóm.'">
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
	            	<th field="id" width="100" align="center" hidden="hidden" />	            	
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th field="code" width="100" align="center">Mã nhóm</th>
	                <th field="name" width="300" align="left">Tên nhóm</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="tb" style="padding:2px 5px;">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Xóa</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="getSelected()">
				(<i>Chọn 1 dòng rồi nhấn chuột tại đây để sửa dữ liệu.</i>)
			</a>
		</div>
    </div>
    <script type="text/javascript">
   	var url_ViewRole = '${sessionScope.apiContext}/role/viewRole';
   	var url_AddRole = '${sessionScope.apiContext}/role/addRole';
   	var url_DeleteRole = '${sessionScope.apiContext}/role/deleteRole';
    
    $(function(){	
    	dataGridLoader($('#dg'), url_ViewRole, 1121);
	});
	
	function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#form1').form('load',{
	        	id:row.id,
	        	code:row.code,
	        	name:row.name
            });
	    }
	}
	
	function removeit(){
    	var ids = '';
        var rows = $('#dg').datagrid('getSelections');
        for(var i=0; i<rows.length; i++){
            var row = rows[i];
            //ids += "'" + row.id +"'";
            ids += row.id;
            if(i < rows.length-1){
            	ids += ","; 
            }
        }        
        $.messager.confirm('Xác nhận', 'Bạn có chắc muốn xóa những bản ghi này?', function(r){
            if (r){
            	$("#ids").val(ids);
            	var json = objectifyForm($("#form1"));
            	submitFormAndCallback(url_DeleteRole, 1123, json, refreshFormAndDataGrid, true);
            }
        });
    }
	
    function submitForm(){
    	if($("#code").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Mã nhóm" yêu cầu nhập.','warning');
    		$('#code').textbox('textbox').focus();
    		return;
    	}
    	if($("#name").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên nhóm" yêu cầu nhập.','warning');
    		$('#name').textbox('textbox').focus();
    		return;
    	}

    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_AddRole, 1122, json, refreshFormAndDataGrid, true);
    }
    
    function refreshFormAndDataGrid(data){
    	$('#dg').datagrid('reload');
    	clearForm($('#form1'));
    }
    </script>
</body>
</html>