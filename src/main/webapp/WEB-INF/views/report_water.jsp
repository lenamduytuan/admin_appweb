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
    <title>Báo cáo</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
</head>
<body>
	<div align="center">
		<div class="row d-flex justify-content-center" style="margin-top: 5px;">
			<div class="col-md-9">
				<div class="card">
				  <div class="card-header d-flex justify-content-left" style="padding: .3rem 1.25rem;">
				    Kết xuất báo cáo
				  </div>
				  <div class="card-body">
				  	<div class="border">
				  	<div class="row" id="filterSl" style="display: none;">
				  		<div class="form-group col-sm-12 col-md-6 col-water-3" >
				  			<label for="khuVuc" class="d-flex justify-content-left">Khu vực:</label>
				  			<div class="input-group">
					    		<div class="form-inline" style="width:100%">
					    			<input class="easyui-combobox" id="khuVuc" name="khuVuc" style="height:auto"
							            		data-options="
							                    url:'',
							                    method:'get',
							                    valueField:'id',
							                    textField:'text',
							                    onChange: function(newValue,oldValue){onChangeKyBc(newValue);},
							                    panelHeight:'auto'">
					    		</div>
							</div>
						</div>
						<div class="form-group col-sm-12 col-md-6 col-water-3">
			                <label for="tuyenCb" class="d-flex justify-content-left">Tuyến:</label>
							<div class="input-group">
					    		<div class="form-inline" style="width:130px;">
					    			<input class="easyui-combobox" id="tuyenCb" name="tuyenCb" style="height:auto;"
							            data-options="
					                    url:'',
					                    method:'get',
					                    valueField:'id',
					                    textField:'text',
					                    panelMinHeight:100,
 											panelMaxHeight:200,
					                    panelHeight:'auto'">
					    		</div>
							</div>
						</div>
						<div class="form-group col-sm-12 col-md-6 col-water-3">
			                <label for="soGhiSearch" class="d-flex justify-content-left">Sổ ghi:</label>
							<div class="input-group">
					    		<div class="form-inline" style="width: 130px;">
					    			<input class="easyui-combobox" id="soGhiSearch" name="soGhiSearch" style="height:auto"
							            		data-options="
							                    url:'${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmSo',
							                    method:'get',
							                    valueField:'id',
							                    textField:'text',
							                    multiple:true,
							                    panelHeight:'auto'">
					    		</div>
							</div>
						</div>
				  	</div>
				  	<div class="row">
				  		<div class="form-group col-sm-12 col-md-6 col-water-3" id="selectKyBc">
				  			<label for="loaiKyBc" class="d-flex justify-content-left">Báo cáo theo:</label>
				  			<div class="input-group">
					    		<div class="form-inline" style="width:100%">
					    			<input class="easyui-combobox" id="loaiKyBc" name="loaiKyBc" style="height:auto"
							            		data-options="
							                    url:'${sessionScope.apiContext}/public/qln/combobox?form=baocao&type=loaikybc',
							                    method:'get',
							                    valueField:'id',
							                    textField:'text',
							                    onChange: function(newValue,oldValue){onChangeKyBc(newValue);},
							                    panelHeight:'auto'">
					    		</div>
							</div>
						</div>
						<div class="form-group col-sm-12 col-md-6 col-water-3">
							<div id="bcThang" style="display: block;">
					  			<label for="timeCheckIn" class="d-flex justify-content-left">Tháng báo cáo:</label>
				                <div class="input-group date">
				                	<input type="text" id="thangBc" name="thangBc" class="textbox datepicker-waters" style="text-align: center;width: 130px;" placeholder="MM-YYYY" />
								</div>
							</div>
							<div id="bcQuy" style="display: none;">
				                <label for="quyBc" class="d-flex justify-content-left">Quý báo cáo:</label>
								<water-combobox waterid="quyBc" watername="quyBc" prevfn="chonKyNamTruoc();" nextfn="chonKyNamNay();"/>
							</div>
							<div id="bcNam" style="display: none;">
				                <label for="namBc" class="d-flex justify-content-left">Năm báo cáo:</label>
								<div class="input-group">
						    		<div class="form-inline" style="width:100%">
											<input class="easyui-combobox" id="namBc" name="namBc" style="width:90px;height:auto;"
								            data-options="
						                    url:'',
						                    method:'get',
						                    valueField:'id',
						                    textField:'text',
						                    panelMinHeight:100,
  											panelMaxHeight:200,
						                    panelHeight:'auto'">
						    		</div>
								</div>
							</div>
						</div>
						<div id="ctiet_thop" class="form-group col-md-6 col-water-3" style="display: none;">
			                <label for="loaiCt_Th" class="d-flex justify-content-left">Loại báo cáo:</label>
							<div class="input-group">
					    		<div class="form-inline" style="width:100%">
					    			<input class="easyui-combobox" id="loaiCt_Th" name="loaiCt_Th" style="height:auto"
							            		data-options="
							                    url:'',
							                    method:'get',
							                    valueField:'id',
							                    textField:'text',
							                    panelHeight:'auto'">
					    		</div>
							</div>
						</div>
						<div class="form-group col-sm-12 col-md-6 col-water-3" id="sandbox-container">
							<div class="input-group" style="margin-top: 1.7rem;">
			                	<a href="javascript:;" id="" class="easyui-linkbutton " onclick="exportReport('pdf')" >Xem trước</a>
			                	<a href="javascript:;" id="" class="easyui-linkbutton " onclick="exportReport('excel')" >Kết xuất</a>
							</div>
			            </div>
				  	</div>
				  	</div>
				  	<div class="row border" style="margin-top: 0.2rem; padding-top: 0.8rem;display: none;" id="dataGridRp">
			            <div class="form-group col-md-12" id="dataKh">
			            	<table id="dg" class="easyui-datagrid" style="width:100%;height: 360px;"
						            title="Chọn khách hàng" pagination="true" 
						            data-options="pageSize:10,singleSelect:true">
						         <thead>
						            <tr>
						            	<th data-options="field:'ck1',checkbox:true"></th>
										<th field="idSoDoc" align="left" hidden="hidden" />
										<th field="maKh" align="left" hidden="hidden" />
										<th field="codeKh" width="15%" align="left"  data-options="sortable:true" >Mã KH</th>
										<th field="tenKh" width="30%" align="left"  data-options="sortable:true" editor="text">Tên KH</th>
										<th field="maSoDoc" width="10%" align="left" data-options="sortable:true" >Sổ ghi</th>
										<th field="khuVuc" width="10%" align="left" data-options="sortable:true">KV</th>
										<th field="diaChi" width="35%" align="left" editor="text" data-options="sortable:true">Địa chỉ</th>
						            </tr>
						        </thead>
						    </table>				  			
			            </div>
				  		<!-- <div class="form-group col-md-4" id="dataCb">
				  			<table id="dg1" class="easyui-datagrid" style="height:340px"
						            title="Chọn cán bộ" pagination="true" 
						            data-options="pageSize:10">
						        <thead>
						            <tr>
						            	<th field="maCb" width="100" align="center" hidden="hidden" />
						            	<th data-options="field:'ck',checkbox:true"></th>
						                <th field="tenCb" width="70%" align="left">Tên cán bộ</th>
						                <th field="phong" width="30%" align="left">Phòng</th>
						            </tr>
						        </thead>
						    </table>
			            </div> -->
				  	</div>
				  </div>
				  </div>
				</div>
			</div>
		<div> 
			<form id="formExportWater" name="formExportWater" >
				<input hidden="hidden" id="type" name="type">
				<input hidden="hidden" id="loaibc" name="loaibc">
				<input hidden="hidden" id="kyLap" name="kyLap">
				<input hidden="hidden" id="soGhi" name="soGhi">
				<input hidden="hidden" id="rp_listCb" name="rp_listCb">
				<input hidden="hidden" id="listIdKh" name="listIdKh">
				<input hidden="hidden" id="kv" name="kv">
				<input hidden="hidden" id="tuyen" name="tuyen">
				<input hidden="hidden" id="loaiCtTh" name="loaiCtTh">
				<input hidden="hidden" id="isPreview" name="isPreview">
				<iframe id="rp_data" name="rp_data" height="0" width="100%" src=""></iframe>
			</form>
		</div>
    </div>

<div id="w" class="easyui-window" title="In hóa đơn" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:90%;height:90%;padding:10px;">
	<form id="formPdf">
		<iframe id="frPDF" height="800" width="100%" src=""></iframe>
	</form>
</div>
<script type="text/javascript">
    var maSoGlobal = $('#maSoGlobal').val();
    var url_ViewListCanBo = '${sessionScope.apiContext}/dmcb/viewListCanBo';
    var url_view_kh = '${sessionScope.apiContext}/kh/viewDmKh';
    var url_combo_kyQuy = '${sessionScope.apiContext}/public/qln/combobox?form=baocao&type=quyBc';
    var url_combo_kyNam = '${sessionScope.apiContext}/public/qln/combobox?form=qlnExcell&type=namThu&change=';
    var url_combo_khuVuc = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom';
    var url_combo_tuyen = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen';
    var url_combo_loai_bc = '${sessionScope.apiContext}/public/qln/combobox?form=baocao&type=loaibc';
    var url_export = '${sessionScope.apiContext}/report/exportWater';
    var comboKyQuy=null;
   	var comboKyNam=null;
   	var comboKhuVuc=null;
   	var comboTuyen=null;
   	var comboLoaiBc=null;
   	/* if(comboKyQuy==null)
	{
		submitGetFormAndReloadData(url_combo_kyQuy, null, null, setcomboKyQuy);
	} */
	submitGetFormAndReloadData(url_combo_kyQuy, null, null, setcomboKyQuy);
   	function setcomboKyQuy(data)
    {
		comboKyQuy=data;
		submitGetFormAndReloadData(url_combo_kyNam, null, null, setcomboKyNam);
		/* if(comboKyNam==null)
		{
			submitGetFormAndReloadData(url_combo_kyNam, null, null, setcomboKyNam);
		} */
    }
	function setcomboKyNam(data)
    {
		comboKyNam=data;
		submitGetFormAndReloadData(url_combo_khuVuc, null, null, setcomboKhuVuc);
		/* if(comboKhuVuc==null)
		{
			submitGetFormAndReloadData(url_combo_khuVuc, null, null, setcomboKhuVuc);
		} */
    }
	function setcomboKhuVuc(data)
    {
		comboKhuVuc=data;
		var combo = $('#khuVuc');
    	combo.combobox({data:comboKhuVuc});
    	submitGetFormAndReloadData(url_combo_tuyen, null, null, setcomboTuyen);
    	/* if(comboTuyen==null)
    	{
    		submitGetFormAndReloadData(url_combo_tuyen, null, null, setcomboTuyen);
    	} */
    }
	function setcomboTuyen(data)
    {
		comboTuyen=data;
    	var combo = $('#tuyenCb');
    	combo.combobox({data:comboTuyen});
    	submitGetFormAndReloadData(url_combo_loai_bc, null, null, setcomboLoaiBc);
    }
	function setcomboLoaiBc(data)
    {
		comboLoaiBc=data;
    	var combo = $('#loaiCt_Th');
    	combo.combobox({data:comboLoaiBc});
    }
	$(function () {
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    	var type = cacheActionRp; // cacheActionRp dc truyen tu menu
        var checkin = $('#thangBc').datepicker({
        	format: "mm-yyyy",
        	viewMode: "months", 
            minViewMode: "months",
            changeMonth: true,
            changeYear: true,
            onRender: function (date) {
                return date.valueOf() > now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            checkin.hide();
        }).data('datepicker');
        var url_data_by_so = url_view_kh+"?maSoDocSearch="+maSoGlobal;
        if (type=="dtky"){
        	$('#leftKybc').show();
        	$('#selectKyBc').show();
        	$('#dataGridRp').show();
            dataGridLoader($('#dg'), url_data_by_so, 1631);
        }
        if (type=="sudung"){
        	$('#ctiet_thop').show();
        	var combo = $('#loaiCt_Th');
        	combo.combobox({data:comboLoaiBc});
        }
        
    	// tam thoi chua dung 
        //dataGridLoader($('#dg1'), url_ViewListCanBo, 1211);
    	if(type=="slky")
        {
        	$('#filterSl').show();
        }
    });
	
	var yearCbKy = (new Date()).getFullYear();
	function chonKyNamTruoc()
	{
		yearCbKy=yearCbKy - 1;
		$('#quyBc').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=baocao&type=quyBc&change='+yearCbKy);
		
	}
	function chonKyNamNay()
	{
		yearCbKy=yearCbKy+1;
		$('#quyBc').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=baocao&type=quyBc&change='+yearCbKy);
		
	}
	function exportReport(loai){		
		var type = cacheActionRp; // cacheActionRp dc truyen tu menu
		var listIdKh = getDgCheck($('#dg'),"maKh");
    	//var listIdCb = getDgCheck($('#dg1'),"maCb");
   		var loaiKyBc = $('#loaiKyBc').val();
   		var soGhi = $('#soGhiSearch').val();
   		var kyLap="";
   		if(loaiKyBc=="0"){
   			kyLap = $('#thangBc').val();
   			if(kyLap.length <=0){
	    		warning("Bạn phải nhập tháng báo cáo!");
	   			return;
	   		}
   		}
   		else if(loaiKyBc=="1"){
   			kyLap = $('#quyBc').val();
   			if(kyLap.length <=0){
	    		warning("Bạn phải nhập quý báo cáo!");
	   			return;
	   		
   			}
   		}else if(loaiKyBc=="2"){
   			kyLap = $('#namBc').val();
   			if(kyLap.length <=0){
	    		warning("Bạn phải nhập năm báo cáo!");
	   			return;
	   		
   			}
   		}
		if (type=="dtky"){
			var listTmp = listIdKh.replace(/~/g, ' ');
			if(listTmp.length <=0){
   	    		warning("Bạn phải chọn khách hàng!");
   	   			return;
   	   		}
        }
		//alert(kyLap);
		$('#type').val(type);
		$('#loaibc').val(loaiKyBc);
		$('#kyLap').val(kyLap);
		$('#soGhi').val(soGhi);
		//$('#rp_listCb').val(listIdCb);
		$('#listIdKh').val(listIdKh);
		$('#kv').val($('#khuVuc').val());
		$('#tuyen').val($('#tuyen').val());
		$('#loaiCtTh').val($('#loaiCt_Th').val());
		var kv = $('#khuVuc').val();
		var tuyen = $('#tuyenCb').val();
		var loaiCtTh = $('#loaiCt_Th').val();
		if (loai=='excel'){
	       	progressStart();
			var url_export = '${sessionScope.apiContext}/report/exportWater';
			$('#isPreview').val('0');
			formExportWater.action = url_export;
			formExportWater.target = "rp_data";
			formExportWater.submit();
			formExportWater.target = "";
       		progressStop();
		}
		else{
	       	progressStart();
			downloadFile(type, loaiKyBc, kyLap, soGhi, listIdKh, kv, tuyen, loaiCtTh, "1");
		}
	}
	
	function downloadFile(type, loaiKyBc, kyLap, soGhi, listIdKh, kv, tuyen, loaiCtTh, isPreview){
		var url_export = '${sessionScope.apiContext}/report/printWater';
    	var request = new XMLHttpRequest();
        request.open('POST', url_export, true);
        request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
        request.setRequestHeader('Authorization', SessionId);
        request.responseType = 'blob';

        request.onload = function() {
          	// Only handle status code 200
			if(request.status === 200) {
				// Try to find out the filename from the content disposition `filename` value
           	 	var disposition = request.getResponseHeader('content-disposition');
            	// The actual download
            	var blob = new Blob([request.response], { type: 'application/pdf' });
            	$('#frPDF').attr('src', window.URL.createObjectURL(blob));
            	setTimeout(function(){
               		progressStop();
               		var iframe = document.frames ? window.frames.frames["frPDF"] : document.getElementById("frPDF");
                	var ifWin = iframe.contentWindow || iframe;
                	try {
                    	ifWin.focus();
                    	ifWin.print();
                	}
                	catch (e) {
                    	window.print(false);
                	}
           		}, 6000);
          	}else{
          		$.messager.alert('Lỗi', response.error.description,'error');
          		progressStop();
          	}
        };
        request.send('type=' +type +"&loaibc="+loaiKyBc +"&kyLap="+kyLap +"&soGhi="+soGhi +"&listIdKh="+listIdKh 
        		+"&kv="+kv +"&tuyen="+tuyen+"&loaiCtTh="+ loaiCtTh +"&isPreview="+ isPreview);
    }
	
	function onChangeKyBc(newvalue) {
		//alert(newvalue);
        switch (newvalue) {
            case '0':
            	$('#bcThang').show();
            	$('#bcQuy').hide();
            	$('#bcNam').hide();
            	$('#bcThang').val("");
                break
            case '1':
            	$('#bcThang').hide();
            	$('#bcQuy').show();
            	$('#bcNam').hide();
            	var combo = $('#quyBc');
            	combo.combobox({data:comboKyQuy});
                break;
            case '2':
            	$('#bcThang').hide();
            	$('#bcQuy').hide();
            	$('#bcNam').show();
            	var combo = $('#namBc');
            	combo.combobox({data:comboKyNam});
                break;
            default:
            	$('#bcThang').show();
	        	$('#bcQuy').hide();
	        	$('#bcNam').hide();
	        	break;
        }        
    }

	</script>
</body>
</html>