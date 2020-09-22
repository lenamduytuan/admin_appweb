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
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/datagrid-cellediting.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.hotkeys.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
</head>
<body>
	<div id="newKH" style="width:95%;height:95%;padding:10px;">
        <div>
        	<div>
        	<table id="dg" class="easyui-datagrid" style="width:100%;height:450px"
			            rownumbers="true" pagination="true" sortName="khuVuc" sortOrder=""
			            data-options="toolbar: '#tb',onClickCell: onClickCell,onEndEdit: onEndEdit">
			         <thead>
			            <tr>
			                <th field="id" width="100" align="center" hidden="hidden" />
			            	<th data-options="field:'ck1',checkbox:true"></th>
			                <th field="stt" width="5%" align="left">STT</th>
							<th field="khuVuc" width="10%" sortable="true" align="left" 
								data-options="editor:{
		                            type:'combobox',
		                            options:{
		                                valueField:'id',
		                                textField:'text'
		                            }
		                        }">Khu vực</th>
							<th field="maKH" width="10%" align="left" editor="text" >Mã KH</th>
							<th field="hoTen" width="10%" align="left">Họ tên</th>
							<th field="diaChi" width="15%" align="left">Địa chỉ</th>
							<th field="mst" width="10%" align="left">MS thuế</th>
							<th field="taiKhoan" width="10%" align="left">Tài khoản</th>
							<th field="khoiSD" width="10%" align="left"  >Khối sử dụng</th>
							<th field="loaiDv" width="10%" align="left"  
								data-options="editor:{
		                            type:'combobox',
		                            options:{
		                                valueField:'id',
		                                textField:'text'
		                            }
		                        }">Dịch vụ</th>
							<th field="xiNghiep" width="10%" align="left" editor="text" >Xí nghiệp</th>
							<th field="tuyen" width="10%" align="left"  
								data-options="editor:{
		                            type:'combobox',
		                            options:{
		                                valueField:'id',
		                                textField:'text'
		                            }
		                        }">Tuyến</th>
							<th field="soGhi" width="10%" align="left"  editor="text">Sổ ghi</th>
							<th field="kyThu" width="10%" align="right" 
							data-options="editor:{
		                            type:'combobox',
		                            options:{
		                                valueField:'id',
		                                textField:'text'
		                            }
		                        }">Kỳ thu</th>
							<th field="soDK" width="10%" align="left"  editor="{type:'numberbox',options:{precision:0}}">Số ĐK</th>
							<th field="soCK" width="10%" align="left" editor="{type:'numberbox',options:{precision:0}}">Số CK</th>
							<th field="m3" width="10%" align="left" >m3</th>
							<th field="thanhTien" width="10%" align="left" >Thành tiền</th>
							<th field="vat" width="10%" align="left" >VAT</th>
							<th field="phiNT" width="10%" align="left" >Phí NT</th>
							<th field="tongTien" width="10%" align="left" >Tổng tiền</th>
							<th field="maHD" width="10%" align="left"  >Mã HĐ</th>
							<th data-options="field:'ngayHD',width:100,align:'left'" >Ngày HĐ</th>
							<th field="maDH" width="10%" align="left">Mã ĐH</th>
							<th field="loaiDH" width="10%" align="left">Loại ĐH</th>
							<th data-options="field:'ngayLap',width:100,align:'left'">Ngày lắp</th>
							<th field="noiTT" width="10%" align="left" editor="text">Nơi TT</th>
							<th field="nguoiGhi" width="10%" align="left"  editor="text">Người ghi</th>
							<th field="nguoiThu" width="10%" align="left"  editor="text">Người thu</th>
							<th field="soSeri" width="10%" align="left" >Số Sêri</th>
							<th field="ghiChuHS" width="10%" align="left" editor="text">Ghi chú(HS)</th>
							<th field="ghiChuSL" width="10%" align="left" editor="text">Ghi chú(SL)</th>
							<th field="nhapCS" width="10%" align="left" editor="text">Nhập CS</th>
						</tr>
			        </thead>
			    </table>
        	</div>
        	<div id="ttTk_top_buttom" style="width: 100%;margin-top: 20px;text-align: center;">
				<a href="#" class="easyui-linkbutton" onclick="saveKH()" data-options="iconCls:'icon-save'" >LƯU</a>
				<a href="#" class="easyui-linkbutton" onclick="cleanKH()" data-options="iconCls:'icon-reload'" >NHẬP LẠI</a>
				<a href="#" class="easyui-linkbutton" onclick="closeKH()"  >ĐÓNG</a>
			</div>
			<div id="tb" style="height:auto">
				<span style="color: red;font-size: 14px; font-family: tahoma;margin-left: 7px">All:
					<input type="checkbox" id="checkall" value="all" onchange="checkallKH();">
				</span>
		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Thêm dòng mới</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Xóa dòng</a>
		    </div>
			
    </div>
    <script type="text/javascript">
    var url_show_kh = '${sessionScope.apiContext}/kh/showKH';
    var url_load_chiso = '${sessionScope.apiContext}/kh/loadChiSo';
    var url_lov_kh = 'lovKH';
    var url_save_kh = '${sessionScope.apiContext}/kh/saveKH';
    var url_dm_dv = '${sessionScope.apiContext}/util/dm/dichvu';
    var url_dm_dv_chi_tiet = '${sessionScope.apiContext}/util/dm/dichvuChiTiet';
    var url_combo_tuyen = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=tuyen';
    var url_combo_kyThu= '${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change=';
    var url_combo_khuVuc = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=nhom';
    var url_combo_dichVu = '${sessionScope.apiContext}/public/qln/combobox?form=qlnNhap&type=dmDv';
    var listId="";
   	var checkall="";
   	var editDl="";
   	var editIndex = undefined;
   	var jsonObj=null;
   	var indexRowEvent=0;
   	var dmDichVu=null;
   	var dmDichVuChiTiet=null;
   	var comboTuyen=null;
   	var comboKyThu=null;
   	var comboKhuVuc=null;
   	var comboDichVu=null;
    $(function(){
    	
    	SessionId = getQueryVariable("session");
    	$('#maKh').textbox({
    		  onChange: function(value){
    			  if(value==null || value.length==0 || value==""){
    				  cleanKH();
    			  }
    		  }
    		});
    	if(dmDichVu==null)
   		{
    		submitFormAndReloadData(url_dm_dv, null, null, setDmDichVu);
   		}
    	if(dmDichVuChiTiet==null)
   		{
    		submitFormAndReloadData(url_dm_dv_chi_tiet, null, null, setDmDichVuChiTiet);
   		}
    	if(comboTuyen==null)
   		{
    		submitGetFormAndReloadData(url_combo_tuyen, null, null, setcomboTuyen);
   		}
    	if(comboKyThu==null)
   		{
    		submitGetFormAndReloadData(url_combo_kyThu, null, null, setcomboKyThu);
   		}
    	if(comboKhuVuc==null)
   		{
    		submitGetFormAndReloadData(url_combo_khuVuc, null, null, setcomboKhuVuc);
   		}
    	if(comboDichVu==null)
   		{
    		submitGetFormAndReloadData(url_combo_dichVu, null, null, setcomboDichVu);
   		}
	});
    function setDmDichVu(data)
    {
    	dmDichVu=data;
    	//alert(dmDichVu);
    }
    function setDmDichVuChiTiet(data)
    {
    	dmDichVuChiTiet=data;
    }
    function setcomboTuyen(data)
    {
    	comboTuyen=data;
    }
    function setcomboKyThu(data)
    {
    	comboKyThu=data; 
    }
    function setcomboKhuVuc(data)
    {
    	comboKhuVuc=data;
    }
    function setcomboDichVu(data)
    {
    	comboDichVu=data; 
    }
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
	  /* $('#maKh').textbox('setValue',str_val[0]);
	  $('#tenKh').textbox('setValue',str_val[1]);
	  $('#diaChi').textbox('setValue',str_val[2]); */
	  if(indexRowEvent>=0){
		  var data = rowToOject($('#dg'),indexRowEvent);
		  data.maKH=str_val[0];
		  data.hoTen=str_val[1];
		  data.diaChi=str_val[2];
		  //alert(JSON.stringify(data));
		  $('#dg').datagrid('updateRow', {
  			index:indexRowEvent,
  			row: data
  		});
		  $('#dg').datagrid('selectRow', indexRowEvent)
	        .datagrid('beginEdit', indexRowEvent);
	   		editIndex = indexRowEvent;
	  }
	  //reloadChiSo();
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
	  //$('#formNewKH').form('load',data);
    }
	function saveKH()
	{
		var queryParam =objecFromDataGrid($('#dg'));
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
	function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dg').datagrid('validateRow', editIndex)){
            $('#dg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index, field){
    	if (editIndex != index){
    		if (endEditing()){
                $('#dg').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    $('#dg').datagrid('selectRow', editIndex);
                },0);
            }
        }

    }
    function onEndEdit(index, row){

       /*var ed = $(this).datagrid('getEditor', {
            index: index,
            field: 'maKH'
        });
       */
        //row.productname = $(ed.target).combobox('getText');
    }
    function append(){
        if (endEditing()){
            $('#dg').datagrid('appendRow',{status:'P'});
            editIndex = $('#dg').datagrid('getRows').length-1;
            $('#dg').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }
    function removeit(){
        if (editIndex == undefined){return}
        $('#dg').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }
    function accept(){
        if (endEditing()){
            $('#dg').datagrid('acceptChanges');
        }
    }
    function reject(){
        $('#dg').datagrid('rejectChanges');
        editIndex = undefined;
    }
    function getListChanges(){
    	if (editIndex != undefined)
		{
			$('#dg').datagrid('endEdit', editIndex);
       		editIndex = undefined;
		}
        //var rows = $('#dg').datagrid('getChanges');
        var jsonObjTmp = objecFromDataGridChange($('#dg'));
        if(jsonObjTmp!=null && jsonObjTmp.length>0)
       	{
	        if(jsonObj==null ||jsonObj.length==0)
	        	jsonObj = objecFromDataGridChange($('#dg'));
	        else
	        	for(var i=0;i<jsonObjTmp.length;i++)
	      			jsonObj.push(jsonObjTmp[i]);
       	}
    }
    function setListChanges(){
    	var rows = $('#dg').datagrid('getRows');
    	if(jsonObj=="" || rows.length==0) return;
    	for(var i=0; i<rows.length; i++){
    		var object=getObjects(jsonObj,"id",rows[i]["id"]);
    		if(object!=null && object.length>0)
   			{
    			$('#dg').datagrid('updateRow', {
        			index:i,
        			row: object[0]
        		});
   			}
    		
    		
    	}

    }
    var yearCbKy= (new Date()).getFullYear();
	function chonKyNamTruoc()
	{
		yearCbKy=yearCbKy-1;
		$('#kyThu').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
	}
	function chonKyNamNay()
	{
		yearCbKy=yearCbKy+1;
		$('#kyThu').combobox('reload','${sessionScope.apiContext}/public/qln/comboKyThu?form=qlnNhap&type=kyThangNam&change='+yearCbKy);
	}
	var $beginDate = $('#tuNgay'), $endDate = $('#denNgay'),$ngayHD = $('#ngayHD');
	with(new Date){
    	var y = getFullYear();
    	var m = getMonth();
    	var d = getDate();
    	$beginDate.val((d<10?('0'+d):d) + '-' + (m<10?('0'+m):m) + '-' + y);
    	$endDate.val((d<10?('0'+d):d) + '-' + (m+1<10?('0'+(m+1)):(m+1)) + '-' + y);
    	$ngayHD.val((d<10?('0'+d):d) + '-' + (m+1<10?('0'+(m+1)):(m+1)) + '-' + y);
	}
	function formatMaKH(value,row){
		return '<a href="#" onclick="selectKH();" class="easyui-linkbutton" style="height:20px">...</a>';
	}
	var lastIndex;
	$('#dg').datagrid({
		onClickRow:function(rowIndex){
	        if (lastIndex != rowIndex){
	            $(this).datagrid('endEdit', lastIndex);
	            $(this).datagrid('beginEdit', rowIndex);
	        }
	        lastIndex = rowIndex;
	    },
	    onBeginEdit:function(rowIndex,field){
        	indexRowEvent=rowIndex;
	        var editors = $('#dg').datagrid('getEditors', rowIndex);
	        var soCK,soDK,loaiDV,phiVAT,phiBVMT,tongTien,thanhTien;
	        for(var i=0;i<editors.length;i++)
        	{
	        	if(editors[i].field=="tuyen")
       			{
	        		var tuyen = $(editors[i].target);
	        		var value = tuyen.val();
	        		tuyen.combobox({data:comboTuyen});
	        		tuyen.combobox('setValue',value);
       			}
	        	if(editors[i].field=="kyThu")
       			{
	        		var kyThu = $(editors[i].target);
	        		var value = kyThu.val();
	        		kyThu.combobox({data:comboKyThu});
	        		kyThu.combobox('setValue',value);
       			}
	        	if(editors[i].field=="khuVuc")
       			{
	        		var khuVuc = $(editors[i].target);
	        		var value = khuVuc.val();
	        		khuVuc.combobox({data:comboKhuVuc});
	        		khuVuc.combobox('setValue',value);
       			}
	        	if(editors[i].field=="loaiDv")
       			{
	        		var loaiDv = $(editors[i].target);
	        		var value = loaiDv.val();
	        		loaiDv.combobox({data:comboDichVu});
	        		loaiDv.combobox('setValue',value);
       			}
	        	if(editors[i].field=="maKH")
       			{
        			var maKH = $(editors[i].target);
        			maKH.textbox({
        	            onChange:function(){
        	            	var url=url_lov_kh+"?session="+SessionId+"&maKh="+maKH.textbox('getValue')+"&tenKh=";
        	            	tinhChiso();
        	            	openWindow(url);
        	            }
        	        })
       			}
	        	if(editors[i].field=="soCK")
       			{
        			soCK = $(editors[i].target);
        	        
       			}
        		if(editors[i].field=="soDK")
       			{
        			soDK = $(editors[i].target);
        	        
       			}
        		if(editors[i].field=="loaiDv")
       			{
        			loaiDV = $(editors[i].target);
        	        
       			}
        		
        	}
	        soDK.add(soCK).numberbox({
	            onChange:function(){
	            	tinhChiso();
	            }
	        });
	    }
	});
	function tinhChiso()
	{
		if (editIndex != undefined)
		{
			$('#dg').datagrid('endEdit', editIndex);
       		editIndex = undefined;
		}
		var soCK,soDK,loaiDV,phiVAT,phiBVMT,tongTien,thanhTien;
		var floor = Math.floor;
		if(indexRowEvent>=0){
		  var data = rowToOject($('#dg'),indexRowEvent);
		  if(data!= null)
			{
			  	try{
			  		soCK=data.soCK;
			  		soDK=data.soDK;
			  		loaiDV=data.loaiDv;
				}
				catch (e) {
					
				}
				alert(soCK+" - "+soDK +" - " +loaiDV);
				if(soCK!=null && soDK!=null && loaiDV!=null && Number(soDK)>0 && Number(soCK)>Number(soDK))
				{
					//Lay loai dv
					var dv;
					for(var i=0;i<dmDichVu.length;i++)
					{
						if(dmDichVu[i].maDichVu==loaiDV)
						{
							dv=dmDichVu[i];
							break;
						}
					}
					if(dv!=null ){
						//data.loaiDv=loaiDV;
						data.soDK=Number(soDK);
						data.soCK=Number(soCK);
	        		 	data.m3=Number(soCK)-Number(soDK);
	        		 	var donGia=0;
						for(var i=0;i<dmDichVuChiTiet.length;i++)
						{
							if(dmDichVuChiTiet[i].maDichVu==loaiDV)
							{
								var dvCt=dmDichVuChiTiet[i];
								if(data.m3 > dvCt.slTu && data.m3  < dvCt.slDen)
								{
									donGia=dvCt.donGia;
									break;
								}
							}
						}
						if(donGia>0)
						{
		        		 	data.thanhTien=data.m3 * donGia;
							data.vat=(floor(dv.vat)* data.thanhTien)/100;
		        		 	data.phiNT=(floor(dv.phiBvmt)* data.thanhTien)/100;
		        		 	data.tongTien=data.thanhTien + data.vat + data.phiNT;
						}
						else
						{
							data.m3=0;
						}
					    //alert(JSON.stringify(data));
					}
				}
				try{
				    $('#dg').datagrid('updateRow', {
			  			index:indexRowEvent,
			  			row: data
			  		});
			    }
				catch (e) {
					
				}
			}
		}
		$('#dg').datagrid('selectRow', indexRowEvent)
        .datagrid('beginEdit', indexRowEvent);
   		editIndex = indexRowEvent;
   		
	}
    </script>
</body>
</html>