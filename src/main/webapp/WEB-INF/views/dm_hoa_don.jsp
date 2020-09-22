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
    <title>Đồng bộ VNI</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
</head>
<body>
	<div align="left">
		<div class="easyui-accordion" style="width:80%%;height:auto;" data-options="multiple:true">
			<form id="formTk" method="post" style="padding-left: 2%;padding-bottom: 10px;">
		    <div title="Tra cứu thông tin khách hàng" data-options="iconCls:'icon-search'" >
				<div class="row" style="margin-left:2rem;width: 90%;margin-bottom: .2rem">
					<div class="col-sm-12 col-md-6 col-water-3">
						<label for="khuVucSearch" >Khu vực:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-combobox" id="khuVucSearch" name="khuVucSearch"
			            		data-options="
			                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom',
			                    method:'get',
			                    valueField:'id',
			                    textField:'text',
			                    panelHeight:'auto'">
			    		</div>
						<label for="tuyenSearch" >Tuyến:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-combobox" id="tuyenSearch" name="tuyenSearch"
			            		data-options="
			                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen',
			                    method:'get',
			                    valueField:'id',
			                    textField:'text',
			                    panelHeight:'auto'">
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3">
<!-- 						<label for="soGhiSearch" >Sổ ghi:</label> -->
<!-- 			    		<div class="input-group-sm"> -->
<!-- 			    			<input class="easyui-combobox" id="soGhiSearch" name="soGhiSearch" -->
<%-- 			            		data-options=" --%>
<%-- 			                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmSo', --%>
<!-- 			                    method:'get', -->
<!-- 			                    valueField:'id', -->
<!-- 			                    textField:'text', -->
<%-- 			                    panelHeight:'auto'"> --%>
<!-- 			    		</div> -->
			    		<label for="kyThuSearch" >Tháng:</label>
			    		<div class="input-group-sm">
			    			<water-combobox waterid="kyThuSearch" watername="kyThuSearch" prevfn="chonKyNamTruoc();" nextfn="chonKyNamNay();" waterurl="${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change="/>
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3">
						<label for="tenKhSearch" >Tên KH:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-textbox" id="tenKhSearch" name="tenKhSearch" style="height:auto">
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3" style="padding-top: 1.2rem;">
						<a href="#" class="easyui-linkbutton" onclick="timkiem()" data-options="iconCls:'icon-search'" style="width:45%;">Tra cứu</a>
					</div>
				</div>
			</div>
			</form>
		</div>
		<div>
			<div style="padding:3px;"></div>
			<form id="form1" method="post">
			    <table id="dg" class="easyui-datagrid" title="Danh sách hóa đơn" style="width:100%;height:420px"
			            rownumbers="true" pagination="true">
			        <thead data-options="frozen:true">
	            		<tr>
	            			<th field="maCs" width="100" align="center" hidden="hidden" />
			            	<th field="maTt" width="100" align="center" hidden="hidden" />
			            	<th field="maKh" width="100" align="center" hidden="hidden" />
			            	<th data-options="field:'ck1',checkbox:true"></th>
			                <th field="codeKh" width="10%" align="left">Mã KH</th>
							<th field="tenKh" width="10%" align="left">Tên KH</th>
	            		</tr>
            		</thead>
			        <thead>
			            <tr>
							<th field="tuyen" width="5%" align="left">Tuyến</th>
							<th field="khuVuc" width="5%" align="left">Khu vực</th>
							<th field="maSo" width="5%" align="left">Sổ ghi</th>
							<th field="maHd" width="10%" align="left">Mã HĐ</th>
							<th field="diaChi" width="15%" align="left">Địa chỉ</th>
							<th field="maSoThue" width="10%" align="right">MS thuế</th>
							<th field="nguoiGhi" width="10%" align="left">Người ghi</th>
							<th field="nguoiThu" width="10%" align="left">Người thu</th>
							<th field="csTu" width="10%" align="right" data-options="formatter:formatInt">Số ĐK</th>
							<th field="csDen" width="10%" align="right" data-options="formatter:formatInt">Số CK</th>
							<th field="soM3" width="10%" align="right" data-options="formatter:formatInt" >Khối sử dụng</th>
							<th field="soTien" width="10%" align="right" data-options="formatter:formatdecimal">Thành tiền</th>
							<th field="tienThueVat" width="10%" align="right" data-options="formatter:formatdecimal" >VAT</th>
							<th field="phi" width="10%" align="right" data-options="formatter:formatdecimal" >Phí MT</th>
							<th field="tongTien" width="10%" align="right" data-options="formatter:formatdecimal" >Tổng tiền</th>
							<th field="soHoaDon" width="10%" align="right">Số hóa đơn</th>
							<th field="ngayHoaDon" width="15%" align="center">Ngày hóa đơn</th>
			            </tr>
			        </thead>
			    </table>
		    </form>
		</div>
</div>

<script type="text/javascript">
    var url_view = '${sessionScope.apiContext}/hoadon/viewDsHoaDon';
    var listId="";
    var isReput= false;
    var resetCheck=false;
    var maSoGlobal = $('#maSoGlobal').val();
    
    function refreshFormAndDataGrid(){
    	var khuVucSearch = $('#khuVucSearch').combobox('getValue');
//     	var idHdrSearch = $('#idHdrSearch').combobox('getValue');
    	var soGhiSearch =$('#maSoGlobal').val();
    	var tuyenSearch = $('#tuyenSearch').combobox('getValue');
    	var kyThuSearch = $("#kyThuSearch").val();
    	var tenKhSearch = $("#tenKhSearch").val();
    	var url=url_view+"?khuVucSearch="+khuVucSearch+"&tenKhSearch="+tenKhSearch+"&idHdrSearch="+"";
    	url =url + "&soGhiSearch="+soGhiSearch+"&tuyenSearch="+tuyenSearch+"&kyThuSearch="+kyThuSearch;
    	var queryParam =objectifyForm($('#formTk'));
    	$('#dg').datagrid({
    	    queryParams: queryParam
    	});
    	dataGridLoader($('#dg'), url, 1631);
    }
    
    function clearForm()
    {
    	resetCheck=true;
    	refreshFormAndDataGrid("clean");
    }
    
    function timkiem()
    {
    	resetCheck=true;
    	refreshFormAndDataGrid();
    }
    
    function getListCheck(dg) {
    	isReput=false;
    	resetCheck=false;
    	var selectedrow = dg.datagrid("getSelections");
    	var rows = dg.datagrid('getRows');
    	if(rows==null) return;
    	for( var i=0; i<rows.length; i++){
    		listId = listId.replace("'" + rows[i]["maTt"]+"'~", "");
    	}
    	if(selectedrow!=null)
   		{
	    	for(var i=0; i<selectedrow.length; i++){
	    		listId=listId + "'" + selectedrow[i]["maTt"]+"'~";
	    		//alert(listId);
	    		if(selectedrow[i]["trangthai"]=="1")
	    			isReput=true;
			}
   		}
    }

    
    $('#dg').datagrid({
    	onClickRow:function(){
			//alert("click");
		},
    	onBeforeLoad: function(x) {
    		getListCheck($('#dg'));
      	},
    	  onLoadSuccess: function(){
    		  checkedGrid($('#dg'));
    		  //alert(listId);
    	  }
    });
    
    function confirmYesNo(mess){
        /*$.messager.confirm('Thông báo', mess, function(r){
            return r;
        });*/
    	$.messager.confirm({
    		title:'Thông báo',
    	    content:mess,
    	    ok:'Đồng ý',
    	    cancel:'Hủy bỏ',
    	    modal:true,
    	    shadow:false,
    	    fn:function(r){

    	    }
    	});
    }
    var yearCbKy= (new Date()).getFullYear();
	function chonKyNamTruoc()
	{
		yearCbKy=yearCbKy-1;
		$('#kyThuSearch').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
	}
	function chonKyNamNay()
	{
		yearCbKy=yearCbKy+1;
		$('#kyThuSearch').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
	}
	
	Number.prototype.format = function(n, x, s, c) {
		  var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
		  num = this.toFixed(Math.max(0, ~~n));
		  return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
		};
		function formatdecimal(num){
			return num.format(2, 3, ',', '.');																	
		}
		function formatInt(num){
			return num.format(0, 3, ',', '.');																	
		}
		function openChart(idKh)
		{
			//alert(idKh);
			var urlOpen = url_open_chart+"&idKh="+idKh;
			openWindow(urlOpen,1200,600,'minimizable=no,scrollbars=no,resizable=no,titlebar=no,location=no');
		}
    </script>
</body>
</html>