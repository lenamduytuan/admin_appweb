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
    <title>Danh sách khách hàng</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.hotkeys.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
</head>
<body>
	<div>
		<div id="hearderForm">
		<fieldset style="border: #CCCCFF 1px solid;">	
  			<legend>Nhập thông tin tìm kiếm</legend>
			<form id="formTk" method="post">
				<table>
					<tr>
						<td >Tuyến</td>
						<td>
							<input class="easyui-combobox" id="tuyen" name="tuyen" style="height:20px"
		            		data-options="
		                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen',
		                    method:'get',
		                    valueField:'id',
		                    textField:'text',
		                    panelHeight:'auto'">
						</td>
						<td></td>
						<td width="10%"></td>
						<td >Khu vực</td>
						<td>
							<input class="easyui-combobox" id="khuVuc" name="khuVuc" style="height:20px"
		            		data-options="
		                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom',
		                    method:'get',
		                    valueField:'id',
		                    textField:'text',
		                    panelHeight:'auto'">
						</td>
					</tr>
					<tr>
						<td >Tên KH</td>
						<td>
							<input class="easyui-textbox" id="tenKh" name="tenKh" style="height:20px">
						</td>
						<td></td>
						<td width="10%"></td>
						<td >Mã KH</td>
						<td>
							<input class="easyui-textbox" id="maKh" name="maKh" style="height:20px">
						</td>
					</tr>
					<tr>
						<td >SĐT</td>
						<td>
							<input class="easyui-textbox" id="tel" name="tel" style="height:20px">
						</td>
						<td></td>
						<td width="10%"></td>
						<td ></td>
						<td></td>
					</tr>
				</table>
			</form>
		</fieldset>
		</div>
		<div id="ttTk_top_buttom" style="width: 28%;float: right;">
			<a href="#" class="easyui-linkbutton" onclick="timkiem()" data-options="iconCls:'icon-search'" >TÌM KIẾM</a>
		</div>
		<div id="mainForm">
			<table id="dg" class="easyui-datagrid" style="width:100%;height:350px"
			            singleSelect=true rownumbers="true" pagination="true" sortName="khuVuc" sortOrder="" 
			            data-options="onClickCell: onClickCell">
			         <thead>
			            <tr>
							<th field="maKh" width="18%" align="left"  >Mã khách hàng</th>
							<th field="tenKh" width="15%" align="left"  >Tên khách hàng</th>
							<th field="diaChi" width="20%" align="right">Địa chỉ</th>
							<th field="ngaySinh" width="10%" align="left"  data-options="formatter:formatDate">Ngày sinh</th>
							<th field=tel width="10%" align="left" >Số điện thoại</th>
							<th field="email" width="10%" align="left"  >Email</th>
							<th field="tuyen" width="10%" align="left"  >Tuyến</th>
							<th field="khuVuc" width="10%" align="left" >Khu vục</th>
							<th field="maXa" width="10%" align="left" >Mã xã</th>
			            </tr>
			        </thead>
			    </table>
		</div>
    </div>
    <script type="text/javascript">
    var url_view_kh = '${sessionScope.apiContext}/kh/viewKH';
    $(function(){
    	SessionId = getQueryVariable("session");
    	var tenKH= getQueryVariable("tenKh");
    	var maKH= getQueryVariable("maKh");

    	$('#maKh').textbox('setValue',maKH);
  	    $('#tenKh').textbox('setValue',tenKH);
    	url=url_view_kh+"?maKh="+maKH+"&tenKh="+tenKH;
    	var queryParam =objectifyForm($('#formTk')); //JSON.stringify(objectifyForm($('#formTk')));
    	$('#dg').datagrid({
    	    queryParams: queryParam
    	});
    	dataGridLoader($('#dg'), url, null);
    	setTimeout(function(){
	    	var rows=$('#dg').datagrid('getRows');
	    	if(rows.length==1)
	   		{
	    		row=$('#dg').datagrid('getRows')[0];
	        	var data=row.maKh+"~"+row.tenKh+"~"+row.diaChi;
	        	setData(data);
	   		}
    	}, 500);
	});
    function timkiem()
	{
    	refreshFormAndDataGrid();
	}
    function refreshFormAndDataGrid(action){
    	var queryParam =objectifyForm($('#formTk')); //JSON.stringify(objectifyForm($('#formTk')));
    	$('#dg').datagrid({
    	    queryParams: queryParam
    	});
    	dataGridLoader($('#dg'), url_view_kh, null);
    	setTimeout(function(){
	    	var rows=$('#dg').datagrid('getRows');
	    	if(rows.length==1)
	   		{
	    		row=$('#dg').datagrid('getRows')[0];
	        	var data=row.maKh+"~"+row.tenKh+"~"+row.diaChi;
	        	setData(data);
	   		}
    	}, 500);
    }
    function onClickCell(index, field){
    	var row=$('#dg').datagrid('getRows')[index];
    	var data=row.maKh+"~"+row.tenKh+"~"+row.diaChi;
    	setData(data);
    	
    }
    function setData(data_val)
    {
    	opener.setData(data_val);
    	window.close();
    }
    </script>
</body>
</html>