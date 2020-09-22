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
	<div id="newKH" style="width:95%;height:95%;padding:10px;">
        <div>
        	<form id="formNewKH" method="post">
		    <fieldset style="border: #CCCCFF 1px solid;width: 70%;">
		  	<legend>Thông tin chung</legend>
		  	<table>
			    <tr>
			    	<td >Mã KH</td>
					<td>
						<input class="easyui-textbox" id="maKh" name="maKh" style="height:20px" >
					</td>
					
					<td ><a href="#" onclick="selectKH();" class="easyui-linkbutton" style="height:20px">...</a></td>
					<td colspan="3" width="20%;"></td>
					<td width="15%">Tháng</td>
					<td>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'pagination-prev'" onclick="chonKyNamTruoc();" style="width:15%;height:20px"></a>
						<input class="easyui-combobox" id="kyThu" name="kyThu" style="width:50%;height:20px;" onchange="reloadChiSo();"
			            data-options="
	                    url:'${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change=',
	                    method:'get',
	                    valueField:'id',
	                    textField:'text',
	                    panelHeight:'auto'">
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'pagination-next'" onclick="chonKyNamNay();" style="width:15%;height:20px"></a>
					</td>
				</tr>
				<tr>
					<td width="10%">Tên KH</td>
					<td>
						<input class="easyui-textbox" id="tenKh" name="tenKh" style="height:20px">
					</td>
					
					<td colspan="4"></td>
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
				</tr>
				<tr>
					<td >Địa chỉ KH</td>
					<td>
						<input class="easyui-textbox" id="diaChi" name="diaChi" style="height:20px">
					</td>
					<td ></td>
					<td colspan="3"></td>
					<td >Nhóm</td>
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
			</table>
			</fieldset>
			<fieldset style="border: #CCCCFF 1px solid;width: 70%;">
		  	<legend>Chỉ số</legend>
		    <table>
		    	<tr>
					<td width="10%">Số đầu kỳ</td>
					<td>
						<input class="easyui-textbox" id="soDK" name="soDK" style="height:20px">
					</td>
					<td ></td>
					<td colspan="3" width="20%;"></td>
					<td width="15%">Thành tiền</td>
					<td>
						<input class="easyui-textbox" id="thanhTien" name="thanhTien" style="height:20px;" >
					</td>
				</tr>
				<tr>
					<td width="10%">Số cuối kỳ</td>
					<td>
						<input class="easyui-textbox" id="soCK" name="soCK" style="height:20px">
					</td>
					<td ></td>
					<td colspan="3"></td>
					<td >VAT</td>
					<td>
						<input class="easyui-textbox" id="vat" name="vat" style="height:20px;" >
					</td>
				</tr>
				<tr>
					<td >Bảng giá</td>
					<td>
						<input class="easyui-combobox" id="bangGia" name="bangGia" style="height:20px"
		            		data-options="
		                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=bangGia',
		                    method:'get',
		                    valueField:'id',
		                    textField:'text',
		                    panelHeight:'auto'">
					</td>
					<td ></td>
					<td colspan="3"></td>
					<td >Phí MT</td>
					<td>
						<input class="easyui-textbox" id="phiNT" name="phiNT" style="height:20px;" >
					</td>
				</tr>
				<tr>
					<td ></td>
					<td></td>
					<td ></td>
					<td colspan="3"></td>
					<td >Tổng tiền</td>
					<td>
						<input class="easyui-textbox" id="tongTien" name="tongTien" style="height:20px;" >
					</td>
				</tr>
		    </table>
		    </fieldset>
		    </form>
			</div>
			<div id="ttTk_top_buttom" style="width: 28%;margin-top: 20px;">
				<a href="#" class="easyui-linkbutton" onclick="saveKH()" data-options="iconCls:'icon-save'" >LƯU</a>
				<a href="#" class="easyui-linkbutton" onclick="cleanKH()" data-options="iconCls:'icon-reload'" >NHẬP LẠI</a>
				<a href="#" class="easyui-linkbutton" onclick="closeKH()"  >ĐÓNG</a>
			</div>
			<div id="mainForm">
			</div>
    </div>
    <script type="text/javascript">
    var url_show_kh = '${sessionScope.apiContext}/kh/showKH';
    var url_load_chiso = '${sessionScope.apiContext}/kh/loadChiSo';
    var url_lov_kh = 'lovKH';
    var url_save_kh = '${sessionScope.apiContext}/kh/saveKH';
    $(function(){
    	
    	SessionId = getQueryVariable("session");
    	$('#maKh').textbox({
    		  onChange: function(value){
    			  if(value==null || value.length==0 || value==""){
    				  cleanKH();
    			  }
    		  }
    		});
	});
    
    function selectKH()
	{
		var tenKH = $("#tenKh").val();
		var maKH = $("#maKh").val();
		var url=url_lov_kh+"?session="+SessionId+"&maKh="+maKH+"&tenKh="+tenKH;
		openWindow(url); 
	}
	function setData(values)
	{
	  var str_val= values.split("~"); 
	  $('#maKh').textbox('setValue',str_val[0]);
	  $('#tenKh').textbox('setValue',str_val[1]);
	  $('#diaChi').textbox('setValue',str_val[2]);
	  reloadChiSo();
	}
	var yearCbKy= (new Date()).getFullYear();
	function chonKyNamTruoc()
	{
		yearCbKy=yearCbKy-1;
		$('#kyThu').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
		reloadChiSo();
	}
	function chonKyNamNay()
	{
		yearCbKy=yearCbKy+1;
		$('#kyThu').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
		reloadChiSo();
	}
	function reloadChiSo()
	{
		
		var queryParam =objectifyForm($('#formNewKH'));
		//alert(JSON.stringify(queryParam));
		submitFormAndReloadData(url_load_chiso, null, queryParam, refreshForm);
	}
	function refreshForm(data){
	  $('#formNewKH').form('load',data);
    }
	function saveKH()
	{
		var queryParam =objectifyForm($('#formNewKH'));
		//alert(JSON.stringify(queryParam));
		submitProcessCallback(url_save_kh, null, queryParam, refreshForm,true);
	}
	function cleanKH()
	{
		var kyThu = $("#kyThu").val();
		$('#formNewKH').form('reset');
		$('#kyThu').textbox('setValue',kyThu);
	}
	function closeKH()
	{
		opener.refresh();
    	window.close();
	}
	
    </script>
</body>
</html>