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
		<table>
			<tr>
				<td></td>
				<td></td>
				<td>
					<form id="form1" method="post">
			            <input type="hidden" id="idUser" name="idUser" />
			            <!-- <input type="hidden" id="idRole" name="idRole" /> -->
						<div class="easyui-panel" style="width:100%;max-width:350px;padding:1px 1px;">
					        <div style="margin-bottom:1px">
					            <input id="role" class="easyui-combobox" name="role" style="width:100%;" data-options="
					                    valueField: 'id',
					                    textField: 'name',
					                    label: 'Nhóm NSD:',
					                    labelPosition: 'left'">
					        </div>
					    </div>
			        </form>
				</td>
			</tr>
			<tr>
				<td>
					<table id="dg" class="easyui-datagrid" style="width:350px;height:450px"
				            title="Tải dữ liệu" iconCls="icon-save" rownumbers="true" pagination="true">
				        <thead>
				            <tr>
				            	<th field="id" width="100" align="center" hidden="hidden" />
				            	<th data-options="field:'ck',checkbox:true"></th>
				                <th field="username" width="200" align="center">Người sử dụng</th>
				            </tr>
				        </thead>
				    </table>
				</td>
				<td>
					<table>
						<tr>
							<td>
								<a href="javascript:void(0)" class="easyui-linkbutton" onclick="decentralize('>');" style="width:80px">></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="javascript:void(0)" class="easyui-linkbutton" onclick="decentralize('<');" style="width:80px"><</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table id="dg1" class="easyui-datagrid" style="width:350px;height:450px"
				            title="Tải dữ liệu" iconCls="icon-save" rownumbers="true" pagination="true">
				        <thead>
				            <tr>
				            	<th field="id" width="100" align="center" hidden="hidden" />
				                <th data-options="field:'ck',checkbox:true"></th>
				                <th field="username" width="200" align="center">Người sử dụng</th>
				            </tr>
				        </thead>
				    </table>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
    var url_ViewRoleNoPagination = '${sessionScope.apiContext}/role/viewRoleNoPagination';
   	var url_ViewUserNotInRole = '${sessionScope.apiContext}/userRole/viewUserNotInRole';   	
   	var url_ViewUserInRole = '${sessionScope.apiContext}/userRole/viewUserInRole';
   	var url_AddUserToRole = '${sessionScope.apiContext}/userRole/addUserToRole';
   	var url_MoveUserFromRole = '${sessionScope.apiContext}/userRole/moveUserFromRole';
    
    $(function(){	
    	comboboxLoader($('#role'), url_ViewRoleNoPagination, 1122);
    	dataGridLoader($('#dg'), url_ViewUserNotInRole, 1131);
    	dataGridLoader($('#dg1'), url_ViewUserInRole, 1132);
    	
    	$('#role').combobox({
            onSelect: function(rec){
            	$('#dg').datagrid({
            	    onBeforeLoad:function(param){
            	        param.idRole= rec.id;
            	    }
            	}); 
            	$('#dg1').datagrid({
            	    onBeforeLoad:function(param){
            	        param.idRole= rec.id;
            	    }
            	});
            }
        });
	});
    
    function decentralize(key){
    	if(key == ">"){
	    	if($('#role').val() == ""){
	    		$.messager.alert('Cảnh báo', 'Phải chọn 1 nhóm NSD.','warning');
	    		$('#role').textbox('textbox').focus();
	    		return;
	    	}
	    	var ids = getSelectionIds($('#dg'), false);
	    	$("#idUser").val(ids);
	    	var json = objectifyForm($("#form1"));
	    	submitFormAndCallback(url_AddUserToRole, 1133, json, refreshDataGrid, true);
    	}else if(key == "<"){
    		var ids = getSelectionIds($('#dg1'), true);
	    	$("#idUser").val(ids);
	    	var json = objectifyForm($("#form1"));
	    	submitFormAndCallback(url_MoveUserFromRole, 1134, json, refreshDataGrid, true);
    	}
    }
    
    function getSelectionIds(dgrid, single_quote){
    	var ids = '';
        var rows = dgrid.datagrid('getSelections');
        for(var i=0; i<rows.length; i++){
            var row = rows[i];
            if(single_quote == true)
            	ids += "'" + row.id +"'";
            else
            	ids += row.id;
            if(i < rows.length-1){
            	ids += ","; 
            }
        }
        return ids;
    }
    
    function refreshDataGrid(data){
    	$('#dg').datagrid('load',{idRole:$('#role').val()}, url_ViewUserNotInRole);
    	$('#dg1').datagrid('load',{idRole:$('#role').val()},url_ViewUserInRole);
    }
	
    </script>
</body>
</html>