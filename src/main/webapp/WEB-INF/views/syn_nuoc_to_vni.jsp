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
		<div class="easyui-accordion" style="width:100%;height:auto;" data-options="multiple:true">
		    <div title="Tra cứu thông tin khách hàng" data-options="iconCls:'icon-search'" >
				<div class="row" style="margin-left:2rem;width: 90%;margin-bottom: .2rem">
					<div class="col-sm-12 col-md-6 col-water-3">
						<label for="khuVucSearch" >Khu vực:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-combobox" id="khuVucSearch" name="khuVucSearch"
			            		data-options="
			                    method:'get',
			                    valueField:'id',
			                    textField:'text',
			                    panelHeight:'auto'">
			    		</div>
			    		<label for="tenKhSearch" >Trạng thái:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-combobox" id="trangthai" name="trangthai" style="height:25px"
					            data-options="
			                    url:'resources/trangthai.json',
			                    method:'get',
			                    valueField:'id',
			                    textField:'text',
			                    panelHeight:'auto'">
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3">
					<label for="tuyenSearch" >Tuyến:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-combobox" id="tuyenSearch" name="tuyenSearch"
			            		data-options="
			                    method:'get',
			                    valueField:'id',
			                    textField:'text',
			                    panelHeight:'auto'">
			    		</div>
			    		<label for="kyThuSearch" >Tháng:</label>
			    		<div class="input-group-sm">
<%-- 			    			<water-combobox waterid="kyThuSearch" watername="kyThuSearch" prevfn="chonKyNamTruoc();" nextfn="chonKyNamNay();" waterurl="${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change="/> --%>
							<water-combobox waterid="kyThuSearch" watername="kyThuSearch" prevfn="chonKyNam(0);" nextfn="chonKyNam(1);" />
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3">
						<label for="tenKhSearch" >Tên KH:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-textbox" id="tenKhSearch" name="tenKhSearch" style="height:auto">
			    		</div>
					</div>
					<div class="col-sm-8 col-md-6 col-water-3" style="padding-top: 1.2rem;">
						<a href="#" class="easyui-linkbutton" onclick="timkiem()" data-options="iconCls:'icon-search'" style="width:45%;">Tra cứu</a>
						<a href="#" class="easyui-linkbutton" onclick="getFromVni();" data-options="iconCls:'icon-get-data'" style="width:45%;">Cập nhật</a>
						<a href="#" class="easyui-linkbutton" onclick="sysVni();" data-options="iconCls:'icon-put-data'" style="width:92%;margin-top: .5rem;">Đồng bộ VNI</a>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div style="padding:3px;"></div>
			<form id="form1" method="post">
			    <table id="dg" class="easyui-datagrid" title="Danh sách dữ liệu đồng bộ" style="width:100%;height:420px"
			            rownumbers="true" pagination="true">
			        <thead frozen="true">
			        	<th field="maTt" width="100" align="center" hidden="hidden" />
			            	<th field="maKh" width="100" align="center" hidden="hidden" />
			                <th field="isSendVni" width="100" align="center" hidden="hidden" />
			            	<th data-options="field:'ck1',checkbox:true"></th>
			                <th field="codeKh" width="10%" align="left">Mã KH</th>
							<th field="tenKh" width="15%" align="left">Tên khách hàng</th>
			        </thead>    
			        <thead>
			            <tr>
							<th field="tuyen" width="6%" align="left">Tuyến</th>
							<th field="khuVuc" width="6%" align="left">Khu vực</th>
							<th field="maSo" width="6%" align="left">Sổ ghi</th>
							<th field="maHd" width="10%" align="right">Mã HĐ</th>
							<th field="diaChi" width="15%" align="left">Địa chỉ</th>
							<th field="maSoThue" width="10%" align="right">MS thuế</th>
							<th field="csTu" width="10%" align="right" data-options="formatter:formatInt">Số ĐK</th>
							<th field="csDen" width="10%" align="right" data-options="formatter:formatInt">Số CK</th>
							<th field="soM3" width="10%" align="right" data-options="formatter:formatInt">Khối sử dụng</th>
							<th field="soTien" width="10%" align="right" data-options="formatter:formatdecimal">Thành tiền</th>
							<th field="tienThueVat" width="10%" align="right" data-options="formatter:formatdecimal">VAT</th>
							<th field="phi" width="10%" align="right" data-options="formatter:formatdecimal">Phí MT</th>
							<th field="tongTien" width="10%" align="right" data-options="formatter:formatdecimal">Tổng tiền</th>
							<th field="maPhieuThu" width="10%" align="right">Mã phiếu thu</th>
							<th field="ngayThanhToan" width="10%" align="center">Ngày thanh toán</th>
							<th field="nguoiGhi" width="10%" align="left">Người ghi</th>
							<th field="nguoiThu" width="10%" align="left">Người thu</th>
			            </tr>
			        </thead>
			    </table>
		    </form>
		</div>
</div>

<script type="text/javascript">
    var url_view = '${sessionScope.apiContext}/syn/viewToVni';
    var url_put = '${sessionScope.apiContext}/syn/pushToVni';
    var url_get = '${sessionScope.apiContext}/syn/getFromVni';
    var listId="";
    var isReput= false;
    var resetCheck=false;
    var maSoGlobal = $('#maSoGlobal').val();
    var url_combo_tuyen = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen';
    var url_combo_kyThu= '${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change=';
    var url_combo_khuVuc = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom';
    var url_combo_dichVu = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmDv';
    var url_combo_dichVu_chitTiet = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=bangGia';
    var url_signature = 'http://localhost:7080/esb/api/signQlnXml';
    $(function(){
		kyThuSearch
		comboboxLoader($('#kyThuSearch'), url_combo_kyThu, 1244);
		comboboxLoader($('#tuyenSearch'), url_combo_tuyen, 1244);
		comboboxLoader($('#khuVucSearch'), url_combo_khuVuc, 1244);
		comboboxLoader($('#idHdrSearch'), url_combo_dichVu, 1244);
   	});
    
    
    function refreshFormAndDataGrid(action){
    	var khuVucSearch = $('#khuVucSearch').combobox('getValue');
    	var soGhiSearch = $('#maSoGlobal').val();
    	var tuyenSearch = $('#tuyenSearch').combobox('getValue');
    	var kyThuSearch = $("#kyThuSearch").val();
    	var tenKhSearch = $("#tenKhSearch").val();
    	var trangthai = $('#trangthai').combobox('getValue');
    	var url=url_view+"?khuVucSearch="+khuVucSearch+"&tenKhSearch="+tenKhSearch+"&idHdrSearch="+"";
    	url =url + "&soGhiSearch="+soGhiSearch+"&tuyenSearch="+tuyenSearch+"&kyThuSearch="+kyThuSearch+"&trangthai="+trangthai;
    	if(action=='clean')
    		url=url+"&action=clean";
    	if(action=='import')
    		url=url+"&action=import";	
    	else
    		url=url+"&action=search";

    	if(resetCheck)
    	{
    		listId="";
    		$('#dg').datagrid('unselectAll');
    	}
    	dataGridLoader($('#dg'), url, 181);
    }
    
    $('#dg').datagrid({
    	rowStyler: function(index,row){
			var isSendVni = row.isSendVni;
            if (isSendVni == 1){
                return 'background-color:#EAF2F8;color:green;font-weight:bold;';
            }
        }
	    
	});
    
 // Create the XHR object.
    function createCORSRequest(method, url) {
      var xhr = new XMLHttpRequest();
      if ("withCredentials" in xhr) {
        // XHR for Chrome/Firefox/Opera/Safari.
        xhr.open(method, url, true);
        xhr.setRequestHeader("Content-type", "application/json");
        xhr.timeout = 6000;
      } else if (typeof XDomainRequest != "undefined") {
        // XDomainRequest for IE.
        xhr = new XDomainRequest();
        xhr.open(method, url);
      } else {
        // CORS not supported.
        xhr = null;
      }
      return xhr;
    }

    // Helper method to parse the title tag from the response.
    function getTitle(text) {
      return text.match('<title>(.*)?</title>')[1];
    }

    // Make the actual CORS request.
    function makeCorsRequest() {
      // This is a sample server that supports CORS.
      var url = 'http://html5rocks-cors.s3-website-us-east-1.amazonaws.com/index.html';

      var xhr = createCORSRequest('GET', url);
      if (!xhr) {
        alert('CORS not supported');
        return;
      }

      // Response handlers.
      xhr.onload = function() {
        var text = xhr.responseText;
        var title = getTitle(text);
        alert('Response from CORS request to ' + url + ': ' + title);
      };

      xhr.onerror = function() {
        alert('Woops, there was an error making the request.');
      };

      xhr.send();
    }
    
    function SendAjaxPOST(data) {  
    	   //url = "http://127.0.0.1:8080/";
    	   url = url_signature;
    	   var xmlHttp;  
    	   //Let us create the XML http object  
    	   xmlHttp = null;  
    	   
    	   if (window.XMLHttpRequest) {  
    	    //for new browsers  
    	    xmlHttp = new XMLHttpRequest();  
    	   }  
    	   else if (window.ActiveXObject) {  
    	    var strName = "Msxml2.XMLHTTP"  
    	    if (navigator.appVersion.indexOf("MSIE 5.5") >= 0) {  
    	     strName = "Microsoft.XMLHTTP"  
    	    }  
    	    try {  
    	     xmlHttp = new ActiveXObject(strName);  
    	    }  
    	    catch (e) {  
    	     alert("Error. Scripting for ActiveX might be disabled")  
    	     return false;  
    	    }  
    	   }  
    	   
    	   if (xmlHttp != null) {  
    	    //Handle the response of this async request we just made(subscribe to callback)  
    	    //xmlHttp.onreadystatechange = state_Change;  
    	    var userName = "manasm";  
    	   
    	    xmlHttp.onreadystatechange = function () {  
    	     //alert(xmlHttp.readyState + "=" + xmlHttp.status);  
    	     if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {  
    	      //alert(xmlHttp.responseText);  
    	      //alert("Test OK");
    	      //$("#text3").val(xmlHttp.responseText);
    	     }  
    	    }  
    	    //Pass the value to a web page on server as query string using XMLHttpObject.  
    	    //xmlHttp.open("POST", url + ((/\?/).test(url) ? "&" : "?") + (new Date()).getTime(), true);
    	    xmlHttp.open("POST", url , true);
    	    //xmlHttp.open("POST", encodeURI(url), true);    
    	    //xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	    xmlHttp.setRequestHeader("Content-type", "application/json");
    	    //xmlHttp.setRequestHeader('X-PINGOTHER', 'pingpong');
    	    //xmlHttp.setRequestHeader('Content-Type', 'application/xml');
    	    //xmlHttp.send(encodeURI($("#text2").val()));
    	    
    	    xmlHttp.send(data);
    	   }  
    	  }
    
    function sysVni()
    {
    	getListCheck($('#dg'));
    	var listTmp = listId.replace(/~/g, ' ');
    	if(listTmp.length <=0)
   		{
    		warning("Bạn phải chọn bản ghi!");
   			return;
   		}
    	
    	var isSignXml = false;
    	var jsonData = "{\"receiptData\": {";
    	jsonData = jsonData.concat("\"numberOfReceipts\": \"{totalRecords}\",");
    	jsonData = jsonData.concat("\"expReceipts\": {");
    	jsonData = jsonData.concat("\"expReceipt\": [");
    	jsonData = jsonData.concat("{DetailRecords}");
    	jsonData = jsonData.concat("]}}}");

    	var selectedrow = $('#dg').datagrid("getSelections");
    	if(selectedrow!=null){
    		var total = selectedrow.length;
    		jsonData = jsonData.replace("{totalRecords}", total);
    		var detailRecords = "";
    		for(var i=0; i<selectedrow.length; i++){
    			selectedrow[i]["maTt"]
    			detailRecords = detailRecords.concat("{");
    			detailRecords = detailRecords.concat("\"indexCode\": \""+selectedrow[i]["maTt"]+"\",");
    			detailRecords = detailRecords.concat("\"receiptCode\": \""+selectedrow[i]["maPhieuThu"]+"\",");
    			detailRecords = detailRecords.concat("\"receiptIssuedDate\": \""+selectedrow[i]["ngayThanhToan"]+"\"");
    			detailRecords = detailRecords.concat("},");
    		}
    		detailRecords = detailRecords.substring(0, detailRecords.length - 1);
    		jsonData = jsonData.replace("{DetailRecords}", detailRecords);
    	}
    	//alert(jsonData);
    	var	url= url_put+"?arrId="+listId+"&putAll=0";
    	//SendAjaxPOST(jsonData);
		var xhr = createCORSRequest('POST', url_signature);
		xhr.send(jsonData);
		// Response handlers.
		xhr.onload = function() {
			var text = xhr.responseText;
			submitProcessCallback(url, 1622, null, refreshFormAndDataGrid, true);
		};
		xhr.onerror = function() {
	        submitProcessCallback(url, 1622, null, refreshFormAndDataGrid, true);
		};
    }
    
    function getFromVni(){
    	getListCheck($('#dg'));
    	var listTmp = listId.replace(/~/g, ' ');
    	if(listTmp.length <=0)
   		{
    		warning("Bạn phải chọn bản ghi!");
   			return;
   		}
    	var	url= url_get+"?arrId="+listId+"&putAll=0";
    	if(isReput)
   		{
    		$.messager.confirm({
        		title: 'Thông báo',
        	    content: 'Tồn tại bản ghi đã lấy dữ liệu về từ phần mềm hóa đơn.\nBạn muốn đồng bộ lại không?',
        	    ok:'Đồng ý',
        	    cancel:'Hủy bỏ',
        	    modal:true,
        	    shadow:false,
        	    fn:function(r){
        	    	if(r)
        	    	{
	        			isReput=false;
	        			resetCheck=true;
	        			submitProcessCallback(url, 1622, null, refreshFormAndDataGrid, true);
        	    	}
        	    }
        	});
   		}
    	else{
    		resetCheck=true;
    		submitProcessCallback(url, 1622, null, refreshFormAndDataGrid, true);
    	}
    }
    
    function clearForm()
    {
    	resetCheck=true;
    	refreshFormAndDataGrid("clean");
    }
    
    function timkiem()
    {
    	resetCheck=true;
    	refreshFormAndDataGrid('search');
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
    
    function checkedGrid(dg)
    {
    	var count=0;
    	var rows = dg.datagrid('getRows');
    	for(var i=0; i<rows.length; i++){
    		if(listId.indexOf(rows[i]["maTt"])>-1)
   			{
    			dg.datagrid('checkRow', i);
    			count++;
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
	function chonKyNam(isNam)
	{
		if(isNam == 0)
			yearCbKy=yearCbKy-1;
		else
			yearCbKy=yearCbKy+1;
		$('#kyThuSearch').combobox({
    	    onBeforeLoad:function(param){
    	        param.change= yearCbKy;
    	    }
    	}); 
	}
	
	
	/**
	 * Number.prototype.format(n, x, s, c) * 
	 * @param integer n: length of decimal
	 * @param integer x: length of whole part
	 * @param mixed   s: sections delimiter
	 * @param mixed   c: decimal delimiter
	 */
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
			var urlOpen = url_open_chart+"&idKh="+idKh;
			openWindow(urlOpen,1200,600,'minimizable=no,scrollbars=no,resizable=no,titlebar=no,location=no');
		}
    </script>
</body>
</html>