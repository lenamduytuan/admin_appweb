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
    <title>Quản lý người sử dụng</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
</head>
<body>
<script type="text/javascript">
	//alert()
</script>	
	<div align="center">
		<div style="height:10px"></div>
		<div class="easyui-panel" title="Cập nhật người sử dụng" style="width:100%;max-width:900px;padding:5px 5px;">
	        <form id="form1" method="post">
	            <div style="margin-bottom:10px;">
	            	<table style="width:100%;max-width:900px;" cellpadding="3" border="0" >
<!-- 	            		<tr> -->
<!-- 	            			<td> -->
<!-- 	            				<input type="hidden" id="id" name="id" /> -->
<!-- 	            				<input type="hidden" id="id" name="fullname" /> -->
<!-- 	                			<input class="easyui-textbox" id="surename" name="surename" style="width:100%;max-width:350px" data-options="label:'Họ:',labelWidth:100,prompt:'Nhập họ.'"> -->
<!-- 	            			</td> -->
<!-- 	            			<td> -->
<!-- 	                   			<input class="easyui-textbox" id="lastname" name="lastname" style="width:100%;max-width:350px" data-options="label:'Tên:',labelWidth:100,prompt:'Nhập tên.'"> -->
<!-- 	            			</td> -->
<!-- 	            		</tr> -->
	            		<tr>
	            			<td>
	            				<input type="hidden" id="id" name="id" />
	                			<input class="easyui-textbox" id="fullName" name="fullName" style="width:100%;max-width:350px" data-options="label:'Họ và tên',labelWidth:120,prompt:'Nhập họ và tên.'">
	            			</td>
	            			<td>
	                   			<input class="easyui-textbox" id="username" name="username" style="width:100%;max-width:350px" data-options="label:'Tên đăng nhập',labelWidth:120,prompt:'Nhập tên đăng nhập.'">
	            			</td>
	            		</tr>
	            		<tr>
	            			<td>
	            				<input class="easyui-passwordbox" id="password" name="password" iconWidth="28" style="width:100%;max-width:350px" data-options="label:'Mật khẩu',labelWidth:120,prompt:'Nhập mật khẩu nếu muốn thay đổi.'">
	            			</td>
	            			<td>
	                			<input class="easyui-textbox" id="description" name="description" multiline="true" style="width:100%;max-width:350px;height:auto;" data-options="label:'Ghi chú',labelWidth:120,prompt:'Nhập ghi chú.'">
	            			</td>	            			
	            		</tr>
	            	</table>
	            </div>
	        </form>
	        <div style="text-align:center;padding:3px 0">
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Lưu</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm($('#form1'))" style="width:80px">Tạo mới</a>
	            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="findAccount()" style="width:80px">Tìm kiếm</a>
	        </div>
	    </div>
	    <div style="margin:20px 0;"></div>
		<table id="dg" class="easyui-datagrid" style="width:900px;height:350px"
	            title="Tải dữ liệu" iconCls="icon-save" toolbar="#tb"
	            rownumbers="true" pagination="true">
	        <thead>
	            <tr>
	            	<th field="id" width="100" align="center" hidden="hidden" />
	            	<th data-options="field:'ck',checkbox:true"></th>
	            	<th field="fullName" width="240" align="left">Họ và tên</th>
	                <th field="username" width="200" align="left">Tên đăng nhập</th>
	                <th field="password" width="400" align="left">Mật khẩu</th>
	                <th field=description width="240" align="left">Ghi chú</th>
	            </tr>
	        </thead>
	    </table>
	    <div id="tb" style="padding:2px 5px;">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Xóa</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="getSelected()">
				Sửa (<i>Chọn 1 dòng rồi nhấn chuột tại đây để sửa dữ liệu.</i>)
			</a>
		</div> 
    </div>
    <script type="text/javascript">
    var url_ViewUser = '${sessionScope.apiContext}/user/viewUser';
	var url_AddUser = '${sessionScope.apiContext}/user/addUser';
	var url_DeleteUser = '${sessionScope.apiContext}/user/deleteUser';

    $(function(){	
    	dataGridLoader($('#dg'), url_ViewUser, 1111);
	});
    
    function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#form1').form('load',{
	        	id:row.id,
	        	fullName:row.fullName,
	        	username:row.username,
	        	description:row.description
            });
	    }
	}
    
    function removeit(){
    	var ids = '';
        var rows = $('#dg').datagrid('getSelections');
        for(var i=0; i<rows.length; i++){
            var row = rows[i];
            ids += "'" + row.id +"'";
            if(i < rows.length-1){
            	ids += ","; 
            }
        }        
        $.messager.confirm('Xác nhận', 'Bạn có chắc muốn xóa những bản ghi này?', function(r){
            if (r){
            	$("#id").val(ids);
            	var json = objectifyForm($("#form1"));
            	submitFormAndCallback(url_DeleteUser, 1113, json, refreshFormAndDataGrid, true);
            }
        });
    }
	
    function submitForm(){
    	if($("#username").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên đăng nhập" yêu cầu nhập.','warning');
    		$('#username').textbox('textbox').focus();
    		return;
    	}
    	if($("#password").val() == ""){
    		/* $.messager.alert('Cảnh báo', 'Trường "Mật khẩu" yêu cầu nhập.','warning');
    		$('#password').textbox('textbox').focus();
    		return; */
    	}
    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_AddUser, 1112, json, refreshFormAndDataGrid, true);
    }
    
    function refreshFormAndDataGrid(data){
    	$('#dg').datagrid('reload');
    	clearForm($('#form1'));
    }
    
    function findAccount(){
    	data={
    		fullName:$("#fullName").val(),
        	username:$("#username").val()
    	}
    	$('#dg').datagrid('load', data);    	
    }
    </script>
</body>
</html>