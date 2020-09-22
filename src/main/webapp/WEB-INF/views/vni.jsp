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
		<div title="Tra cứu thông tin hóa đơn" data-options="iconCls:'icon-search'" >
			<form id="formTk" method="post" >
			   <div class="row" style="margin-left:2rem;width: 90%;margin-bottom: .2rem">
					<div class="col-sm-12 col-md-6 col-water-3">
						<label for="khuvuc" >Khu vực:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-textbox" id="khuvuc" name="khuvuc">
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3">
						<label for="tenKhSearch" >Tên khách hàng:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-textbox" id="tenKH" name="tenKH">
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3">
						<label for="trangthai" >Trạng thái:</label>
			    		<div class="input-group-sm">
			    			<input class="easyui-combobox" id="trangthai" name="tranghai"
				            	data-options="
			                    url:'resources/trangthai.json',
			                    method:'get',
			                    valueField:'id',
			                    textField:'text',
			                    panelHeight:'auto'">
			    		</div>
					</div>
					<div class="col-sm-12 col-md-6 col-water-3" style="padding-top: 1.2rem;">
						<a onclick="timkiem()" class="easyui-linkbutton" iconCls="icon-search" >Tìm kiếm</a>
					</div>
				</div>	
		    </form>
		</div>
		</div>
		<div>
			<div style="margin:20px 0;"></div>
			<form id="form1" method="post">
			    <table id="dg" class="easyui-datagrid" title="Danh sách khách hàng" style="width:100%;height:420px"
			            rownumbers="true" pagination="true">
			        <thead>
			            <tr>
			            	<th field="id" width="100" align="center" hidden="hidden" />
			                <th field="trangthaiVni" width="100" align="center" hidden="hidden" />
			            	<th data-options="field:'ck1',checkbox:true"></th>
			                <th field="xiNghiep" width="10%" align="left">Xí nghiệp</th>
							<th field="khuVuc" width="10%" align="left">Khu vực</th>
							<th field="tuyen" width="10%" align="left">Tuyến</th>
							<th field="soGhi" width="10%" align="left">Sổ ghi</th>
							<th field="khoiSD" width="10%" align="left">Khối sử dụng</th>
							<th field="stt" width="10%" align="left">STT</th>
							<th field="maKH" width="10%" align="left">Mã KH</th>
							<th field="maHD" width="10%" align="left">Mã HĐ</th>
							<th data-options="field:'ngayHD',width:100,align:'left',formatter:formatDate">Ngày HĐ</th>
							<th field="hoTen" width="10%" align="left">Họ tên</th>
							<th field="diaChi" width="15%" align="left">Địa chỉ</th>
							<th field="maxSH" width="10%" align="left">MaxSH</th>
							<th field="maxHC" width="10%" align="left">MaxHC</th>
							<th field="maxSX" width="10%" align="left">MaxSX</th>
							<th field="maxDV" width="10%" align="left">MaxDV</th>
							<th field="dm1" width="10%" align="left">ĐM1</th>
							<th field="dm2" width="10%" align="left">ĐM2</th>
							<th field="dm3" width="10%" align="left">ĐM3</th>
							<th field="maDH" width="10%" align="left">Mã ĐH</th>
							<th field="loaiDH" width="10%" align="left">Loại ĐH</th>
							<th data-options="field:'ngayLap',width:100,align:'left',formatter:formatDate">Ngày lắp</th>
							<th field="mst" width="10%" align="left">MS thuế</th>
							<th field="taiKhoan" width="10%" align="left">Tài khoản</th>
							<th field="noiTT" width="10%" align="left">Nơi TT</th>
							<th field="nguoiGhi" width="10%" align="left">Người ghi</th>
							<th field="nguoiThu" width="10%" align="left">Người thu</th>
							<th field="soDK" width="10%" align="left">Số ĐK</th>
							<th field="soCK" width="10%" align="left">Số CK</th>
							<th field="sh1" width="10%" align="left">SH1</th>
							<th field="sh2" width="10%" align="left">SH2</th>
							<th field="sh3" width="10%" align="left">SH3</th>
							<th field="sh4" width="10%" align="left">SH4</th>
							<th field="hc" width="10%" align="left">HC</th>
							<th field="sx" width="10%" align="left">SX</th>
							<th field="dv" width="10%" align="left">DV</th>
							<th field="m3" width="10%" align="left">m3</th>
							<th field="thanhTien" width="10%" align="left">Thành tiền</th>
							<th field="vat" width="10%" align="left">VAT</th>
							<th field="phiNT" width="10%" align="left">Phí NT</th>
							<th field="tongTien" width="10%" align="left">Tổng tiền</th>
							<th field="soSeri" width="10%" align="left">Số Sêri</th>
							<th field="ghiChuHS" width="10%" align="left">Ghi chú(HS)</th>
							<th field="ghiChuSL" width="10%" align="left">Ghi chú(SL)</th>
							<th field="nhapCS" width="10%" align="left">Nhập CS</th>
							<th field="kiemTra" width="10%" align="left">Kiểm tra</th>
							<th field="inHD" width="10%" align="left">In HĐ</th>
							<th field="thuTien" width="10%" align="left">Thu tiền</th>
			            </tr>
			        </thead>
			    </table>
		    </form>
		</div>
		<div style="padding:5px 0;width: 30%;text-align: center;margin: auto;">
			<a href="#" id="sysVni" onclick="sysVni();" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:40%">Đồng bộ VNI</a>
	        <a href="#" onclick="clearForm();" class="easyui-linkbutton" data-options="iconCls:'icon-clean'" style="width:40%">Làm mới</a>
	    </div>
    </div>
    <script type="text/javascript">
    var url_view = '${sessionScope.apiContext}/vni/viewVni';
    var url_put = '${sessionScope.apiContext}/vni/putVni';
    var listId="";
    var isReput= false;
    var resetCheck=false;
    function refreshFormAndDataGrid(action){
    	var khuvuc = $("#khuvuc").val();
    	var tenKH = $("#tenKH").val();
    	var trangthai = $("#trangthai").val();
    	var url=url_view+"?khuvuc="+khuvuc+"&tenKH="+tenKH+"&trangthai="+trangthai;
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
			
		$('#dg').datagrid({
		    rowStyler:function(index,row){
		    	//alert("FFFF");
		        if (row.trangthaiVni=="1" && trangthai=="9"){
		            return 'background-color:#E6E6E6;color:#424242;font-weight:bold;';
		        }
		    },
		    
		});
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
    	var	url= url_put+"?arrId="+listId+"&putAll=0";
    	if(isReput)
   		{
    		$.messager.confirm({
        		title: 'Thông báo',
        	    content: 'Tồn tại bản ghi đã đồng bộ sang VNI.\nBạn muốn đồng bộ lại không?',
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
    		listId = listId.replace(rows[i]["id"]+"~", "");
    	}
    	if(selectedrow!=null)
   		{
	    	for(var i=0; i<selectedrow.length; i++){
	    		listId=listId + selectedrow[i]["id"]+"~";
	    		if(selectedrow[i]["trangthaiVni"]=="1")
	    			isReput=true;
			}
   		}
    }
    function checkedGrid(dg)
    {
    	var count=0;
    	var rows = dg.datagrid('getRows');
    	for(var i=0; i<rows.length; i++){
    		if(listId.indexOf(rows[i]["id"])>-1)
   			{
    			dg.datagrid('checkRow', i);
    			count++;
   			}
    	}
    	if (count==rows.length)
   		{
   			//check all
   		}

   		//$('#frPDF').attr('src', url_Print+"?arrId="+listId);
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
    </script>
</body>
</html>