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
    <title>Danh mục tài khoản</title>
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
		<div class="easyui-panel" title="Cập nhật tài khoản" style="width:100%;max-width:700px;padding:10px 60px;">
	        <form id="form1" method="post">
	        	<div class="row justify-content-center">
	        		<div class="col-md-6" style="text-align: right;">
	        			<label for="maTk" >Mã tài khoản:</label>
	        		</div>
	        		<div class="col-md-6">
	        			<input class="easyui-textbox" id="maTk" name="maTk" style="margin-left: 0.5rem;" data-options="prompt:'Nhập mã tài khoản.'">
	        		</div>
	        	</div>
	        	<div class="row justify-content-center" style="margin-top: 0.5rem;">
	        		<div class="col-md-6" style="text-align: right;">
	        			<label for="tenTk" >Tên tài khoản:</label>
	        		</div>
	        		<div class="col-md-6">
	        			<input class="easyui-textbox" id="tenTk" name="tenTk" style="margin-left: 0.5rem;" data-options="prompt:'Nhập tên tài khoản.'">
	        		</div>
	        	</div>
	        	<div class="row d-flex justify-content-center" style="margin-top: 0.5rem;">
	        		<div class="col-md-1">
	        		</div>
	        		<div class="col-md-4 d-flex justify-content-center">
	        			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Cập nhật</a>
	            		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm($('#form1'))" style="width:80px;margin-left: 0.5rem;">Nhập mới</a>
	        		</div>
	        	</div>
	            
	        </form>
	    </div>
	    <div style="margin:20px 0;"></div>
		<table id="dg" class="easyui-datagrid" style="width:700px;height:380px"
	            <%-- url="${sessionScope.apiContext}/dmtk/viewDmTk" --%>
	            title="Tải dữ liệu" iconCls="icon-save" toolbar="#tb" 
	            data-options="
                rownumbers:true,
                singleSelect:true,
                autoRowHeight:false,
                pagination:true,
                pageSize:10">
	        <thead>
	            <tr>
	            	<th field="id" width="100" align="center" hidden="hidden" />
	                <th field="maTk" width="100" align="center">Mã tài khoản</th>
	                <th field="tenTk" width="300" align="left">Tên tài khoản</th>
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
   	var url_ViewDmTk = '${sessionScope.apiContext}/dmtk/viewDmTk';
   	var url_AddDmTK = '${sessionScope.apiContext}/dmtk/addDmTK';
    
    $(function(){	
    	dataGridLoader($('#dg'), url_ViewDmTk, 1211);
	});
	
    function reloadDataInGridAfterUpdate(){
    	var opts = $('#dg').datagrid('options');
    	var pageNumber = opts.pageNumber;
   		var pageSize = opts.pageSize;
   		alert(pageNumber+"-"+pageSize);
    	$.post( url_ViewDmTk, {page:pageNumber, rows:pageSize}, function(data, status) {
    		$('#dg').datagrid('loadData', data );
	 	}, 'json');
    }
    
	function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#form1').form('load',{
	        	id:row.id,
	        	maTk:row.maTk,
	        	tenTk:row.tenTk
            });
	    }
	}
	
    function submitForm(){
	        //$('#form1').form('submit');
    	if($("#maTk").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Mã tài khoản" yêu cầu nhập.','warning');
    		$('#maTk').textbox('textbox').focus();
    		return;
    	}
    	if($("#tenTk").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên tài khoản" yêu cầu nhập.','warning');
    		$('#tenTk').textbox('textbox').focus();
    		return;
    	}

    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_AddDmTK, 1212, json, refreshFormAndDataGrid, true);
    }
    
    function refreshFormAndDataGrid(){
    	$('#dg').datagrid('reload');
    	clearForm($('#form1'));
    }
    </script>
</body>
</html>