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
    <title>Quản lý chức năng</title>
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
		<h2>Quản lý chức năng</h2>
		<div class="easyui-panel" title="Cập nhật chức năng" style="width:100%;max-width:900px;padding:10px 30px;">
	        <form id="form1" method="post">
	            <div style="margin-bottom:20px;">
	            	<table style="width:100%;max-width:900px;" cellpadding="5" border="0" >
	            		<tr>
	            			<td>
	            				Chức năng gốc: <input type="checkbox" id="isRoot" name="isRoot" onchange="checkRoot();" />
	                			<input class="easyui-textbox" id="id" name="id" style="width:100%;max-width:230px" data-options="label:'Mã chức năng:',labelWidth:100,prompt:'Nhập mã chức năng.'">
	            			</td>
	            			<td>	            				
	                   			<input id="parentId" class="easyui-combobox" name="parentId" style="width:100%;max-width:350px" data-options="
					                    valueField: 'parentId',
					                    textField: 'note',
					                    label: 'Chức năng:',
					                    labelPosition: 'left',
					                    labelWidth:100">
	            			</td>
	            		</tr>
	            		<tr>
	            			<td>
	                			<input class="easyui-textbox" id="action" name="action" style="width:100%;max-width:350px" data-options="label:'Tên chức năng:',labelWidth:100,prompt:'Nhập tên chức năng.'">
	            			</td>
	            			<td>
	                   			<input class="easyui-textbox" id="note" name="note" style="width:100%;max-width:350px" data-options="label:'Ghi chú:',labelWidth:100,prompt:'Nhập ghi chú.'">
	            			</td>
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
		<table id="dg" class="easyui-datagrid" style="width:900px;height:280px"
	            title="Tải dữ liệu" iconCls="icon-save" toolbar="#tb"
	            rownumbers="true" pagination="true">
	        <thead>
	            <tr>
	            	<th field="id" width="100" align="center" hidden="hidden" />
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th field="username" width="200" align="left">Tên đăng nhập</th>
	                <th field="password" width="200" align="left">Mật khẩu</th>
	                <th field="surename" width="200" align="left">Họ</th>
	                <th field="lastname" width="200" align="left">Tên</th>
	                <th field="email" width="200" align="left">E-Mail</th>
	                <th field="phone" width="200" align="left">Điện thoại</th>
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
    var url_ViewFunctionR = '${sessionScope.apiContext}/ht/viewFunctionR?';
	var url_ViewFunction = '${sessionScope.apiContext}/ht/viewFunction';
	var url_DeleteUser = '${sessionScope.apiContext}/ht/deleteUser';
    
   	$(function(){	    
   		//configueCombobox($('#parentId'), url_ViewRoleNoPagination);
   		$('#parentId').combobox({
		    url:url_ViewFunctionR,
		    onBeforeLoad:function(param){
    	        param.parentId= $(this).combobox('getValue');
    	    }
		});
   		$('#form1').form({
            onLoadSuccess:function(){
               $('#parentId').combobox('reload');
            }
         }).form('load',{
        	 parentId:0
         });
    	configueDataGrid($('#dg'), url_ViewFunction);    	
	});
	
	/* $(document).ready(function() {
		checkRoot();
	}); */

    function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	    	is_root.form('load',{
	        	id:row.id,
	        	username:row.username,
	        	//password:row.password,
	        	surename:row.surename,
	        	lastname:row.lastname,
	        	email:row.email,
	        	phone:row.phone
            });
	    }
	}
    
    function checkRoot(){
    	try{
	    	checkbox = $('#isRoot');    	
	    	if(checkbox.is(":checked")){
	    		//$('#isRoot')._propAttr('checked',true);
	    		$('#isRoot').val(1);
	    		//$('#parentId').combobox('enable');
	    	}else{
	    		$('#isRoot').val(0);
	    		//$('#parentId').combobox('disable');
	    	}
    	}catch(e){
    		alert(e);
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
                submitFormAndShowDataInGrid($('#form1'), url_DeleteUser, json, $('#dg'));
            }
        });
    }
	
    function submitForm(){
	        //$('#form1').form('submit');
    	if($("#username").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên đăng nhập" yêu cầu nhập.','warning');
    		$('#username').textbox('textbox').focus();
    		return;
    	}
    	if($("#password").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Mật khẩu" yêu cầu nhập.','warning');
    		$('#password').textbox('textbox').focus();
    		return;
    	}
    	if($("#email").val() != ""){
    		var sEmail = $("#email").val();
    		if (!validateEmail(sEmail)) {
    			$.messager.alert('Cảnh báo', 'Trường "E-Mail" sai định dạng.','warning');
        		$('#email').textbox('textbox').focus();
        		return;
            }
    	}
	
    	var json = objectifyForm($("#form1"));
    	submitFormAndShowDataInGrid($('#form1'), url_AddUser, json, $('#dg'));
    }
    
    
    </script>
</body>
</html>