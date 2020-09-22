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
		<table border="0">
			<tr>
				<td>
					<div class="easyui-panel" style="padding:5px;width:500px;;height:500px;" >
			        	<ul id="tMenuFunc" class="easyui-tree" data-options="method:'get',animate:true,checkbox:true"></ul>
			    	</div>
				</td>
				<td valign="top" style="height:30px;padding-left:5px">
					<form id="form1" method="post">
			            <input type="hidden" id="idFunc" name="idFunc" />
						<div class="easyui-panel" style="width:100%;max-width:350px;padding:10px 10px;">
					        <div style="margin-bottom:1px">
					            <input id="idRole" class="easyui-combobox" name="idRole" style="width:100%;" data-options="
					                    valueField: 'id',
					                    textField: 'name',
					                    label: 'Nhóm NSD:',
					                    labelPosition: 'left'">
					        </div>
					        <div style="text-align:right;padding-top:10px">
					            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Cập nhật</a>
					        </div>
					    </div>
			        </form>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
    var url_ViewMenuFunc = '${sessionScope.apiContext}/funcRole/viewMenuFunc';
    var url_ViewRoleNoPagination = '${sessionScope.apiContext}/role/viewRoleNoPagination';  	
   	var url_ViewListFuncDecentralized = '${sessionScope.apiContext}/funcRole/viewListFuncDecentralized';
   	var url_UpdateFuncRole = '${sessionScope.apiContext}/funcRole/updateFuncRole';
    
    $(function(){	
    	comboboxLoader($('#idRole'), url_ViewRoleNoPagination, 1122);
    	treeLoader($('#tMenuFunc'), url_ViewMenuFunc, 1141);
    	
    	$('#idRole').combobox({
            onSelect: function(rec){
            	var json = {"idRole":rec.id};
            	submitFormAndCallback(url_ViewListFuncDecentralized, 1142, json, refreshTree, false);
            }
        });
	});
    
    function refreshTree(data){
    	var node = $('#tMenuFunc').tree('find', 1);
		if(node != null){
			$('#tMenuFunc').tree('uncheck', node.target);
		}
    	if(data != ""){    		
    		var res = data.split(";");
     		for(i=0; i<res.length; i++){
     			node = $('#tMenuFunc').tree('find', res[i]);
     			var nodeChild = $('#tMenuFunc').tree('getChildren', node.target);
     			if(nodeChild==null || nodeChild=='undefined' || nodeChild==''){
     				$('#tMenuFunc').tree('check', node.target);
     			}
     		}
    	}
    }
    
    function getChecked(){
        var nodes = $('#tMenuFunc').tree('getChecked');
        var s = '';
        var arr = [];
        for(var i=0; i<nodes.length; i++){
            if (s != '') s += ';';
            var val = arr[nodes[i].id];
            if(val==null || val=='undefined'){
            	arr[nodes[i].id] = nodes[i].id;
            	s += nodes[i].id+":"+nodes[i].url;
            }            
            var node = $('#tMenuFunc').tree('getParent', nodes[i].target);
            s += getParentChecked(node, arr);
        }
        $("#idFunc").val(s);
        //alert('idFunc: '+s);
    }
    
    function getParentChecked(node, arr){
    	var s = '';
    	if(node!=null && node!='undefined'){
    		var val = arr[node.id];
    		if(val==null || val=='undefined'){
    			arr[node.id] = node.id
            	s += ";" + node.id+":"+node.url;
            }
    		var parent = $('#tMenuFunc').tree('getParent', node.target);
    		if(parent!=null && parent!='undefined'){
    			s += getParentChecked(parent, arr);
    		}
    	}
    	return s;
    }
    
    function submitForm(){
    	getChecked();
    	if($("#idRole").val() == ""){
    		$.messager.alert('Cảnh báo', 'Phải chọn 1 nhóm NSD.','warning');
    		$('#idRole').combobox('combobox').focus();
    		return;
    	}
    	if($("#idFunc").val() == ""){
    		$.messager.alert('Cảnh báo', 'Phải chọn ít nhất 1 chức năng.','warning');
    		return;
    	}
    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_UpdateFuncRole, 1143, json, null, true);
    }
    
    </script>
</body>
</html>