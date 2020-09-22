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
    <title>Danh mục bảng giá nước</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
</head>
<body>
	<div align="center">
	    <div style="margin:20px 0 10px 0;"></div>
	    <div class="easyui-tabs" style="width:900px;height:550px">
	        <div title="Bảng giá cố định" style="padding:10px">
			        <form id="form1" method="post">
			            <div style="margin-bottom:20px">
			                <table style="width:100%;max-width:900px;" cellpadding="3" border="0" >
			            		<tr>
			            			<td width="45%">
			                			<input class="easyui-textbox" id="tenDichVu" name="tenDichVu" style="width:100%;max-width:350px" data-options="label:'Tên bảng giá:',labelWidth:100,prompt:'Nhập tên bảng giá.'" >
			                			<span style="color: red;">(*)</span>
			            			</td>
			            			<td width="45%">
			            				<input type="hidden" id="id" name="id" />
			                			<input class="easyui-textbox" id="maDichVu" name="maDichVu" style="width:100%;max-width:350px" data-options="label:'Tên viết tắc:',labelWidth:100,prompt:'Nhập mã.'" >
			                			<span style="color: red;">(*)</span>
			            			</td>
			            			<td width="10%"/>
			            		</tr>
			            		<tr>
			            			<td width="40%">
			                			<input class="easyui-numberbox" id="vat" name="vat" precision="2" min="0" max="100" style="width:100%;max-width:350px" data-options="label:'Thuế VAT (%):',labelWidth:100,prompt:'Nhập mức thuế VAT.'" >
			            			</td>
			            			<td width="50%">
			                			<input class="easyui-textbox" id="ghiChu" name="ghiChu" style="width:100%;height:60px;max-width:350px" multiline="true" data-options="label:'Ghi chú:',labelWidth:100,prompt:'Nhập ghi chú.'" >
			            			</td>
			            			<td width="10%"/>
			            		</tr>
			            	</table>
			            </div>
			        </form>
			        <div style="text-align:center;padding:3px 0">
			            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Cập nhật</a>
			            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm($('#form1'))" style="width:80px">Nhập mới</a>
			        </div>
<!-- 		    </div> -->
		    <div style="margin:20px 0;"></div>
	        <table id="dg" class="easyui-datagrid" style="width:900px;height:320px"
		            title="Tải dữ liệu" iconCls="icon-save" toolbar="#tb"
		            rownumbers="true" pagination="true" >
		        <thead>
		            <tr>
		            	<th data-options="field:'ck',checkbox:true"></th>
		                <th field="maDichVu" width="150" align="left">Tên viết tắt (mã)</th>
		                <th field="tenDichVu" width="300" align="left">Tên bảng giá</th>
<!-- 		                <th field="donGia" width="150" align="left">Đơn giá (VNĐ/m3)</th> -->
		                <th field="vat" width="100" align="left">Thuế VAT(%)</th>
		                <th field="ghiChu" width="300" align="left">Ghi chú</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="tb" style="padding:2px 5px;">
		    	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeData()">Xóa</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="getSelected()">
					(<i>Chọn 1 dòng rồi nhấn chuột tại đây để sửa dữ liệu.</i>)
				</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="editDMBangGiaNuocNhieuMuc()">
					(<i>Chọn 1 danh mục bảng giá nhiều mức để cập nhật</i>)
				</a>
			</div>
		</div>

    </div>

	<div id="dlg" class="easyui-dialog" style="width:650px;height:350px;" closed="true" buttons="#dlg-buttons">
        <form id="fmDetail" method="post" novalidate style="margin:0;padding:5px 5px">
        	<input type="hidden" id="idDichVuHdrHidden" name="idDichVuHdrHidden" />
            <table id="dgDM" class="easyui-datagrid" title="Bảng giá hiện tại" pagination="true" style="width:620px;height:auto;"
		            data-options="
		                iconCls: 'icon-edit',
		                singleSelect: true,
		                toolbar: '#tbDM',
		                method: 'post',
		                onClickCell: onClickCell,
		                onEndEdit: onEndEdit
		            ">
		        <thead>
		            <tr>
		            	<th data-options="field:'idDichVuHdr',width:0,align:'right'" hidden="hidden"></th>
		                <th data-options="field:'slTu',width:100,align:'right'">Từ số</th>
		                <th data-options="field:'slDen',width:100,align:'right',editor:{type:'numberbox',}">Đến số</th>
		            	<th data-options="field:'donGia',width:100,align:'right',
		            		editor:
		            		{
		            			type:'numberbox',
		            			options:
		            				{
		            					required:true,
		            					prompt:'Bắt buộc nhập.'
		            				}
		            		}" class="easyui-validatebox tb">Đơn giá</th>

		                <th data-options="field:'moTa',width:300,align:'left',editor:{type:'textbox'}">Mô tả</th>
		            </tr>
		        </thead>
		    </table>
		 
		    <div id="tbDM" style="height:auto">
		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Thêm dòng mới</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Xóa dòng</a>
<!-- 		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">Lưu dữ liệu</a> -->
<!-- 		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a> -->
<!-- 		        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a> -->
		    </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveDmBGNChiTiet()" style="width:90px">Lưu lại</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Hủy bỏ</a>
    </div>

<script type="text/javascript">
   	var url_viewListBangGiaNuoc = '${sessionScope.apiContext}/dmnuoc/viewListBangGiaNuoc';
   	var url_updateBangGiaNuoc = '${sessionScope.apiContext}/dmnuoc/updateBangGiaNuoc';
   	var url_deleteBangGiaNuoc = '${sessionScope.apiContext}/dmnuoc/deleteBangGiaNuoc';
   	var url_viewListBangGiaNuocNhieuMuc = '${sessionScope.apiContext}/dmnuoc/viewListBangGiaNuocNhieuMuc';
   	var url_updateBangGiaNuocNhieuMuc = '${sessionScope.apiContext}/dmnuoc/updateBangGiaNuocNhieuMuc';
   	var url_deleteBangGiaNuocNhieuMuc = '${sessionScope.apiContext}/dmnuoc/deleteBangGiaNuocNhieuMuc';
    $(function(){	
    	dataGridLoader($('#dg'), url_viewListBangGiaNuoc, 1241);
    	dataGridLoader($('#dgDM'), url_viewListBangGiaNuocNhieuMuc, 1244);
	});
	
	function getSelected(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	        $('#form1').form('load',{
	        	id:row.id,
	        	maDichVu:row.maDichVu,
	        	tenDichVu:row.tenDichVu,
	        	donGia:row.donGia,
	        	ghiChu:row.ghiChu,
	        	vat:row.vat
            });
// 	        $('#fmDetail').form('load',{
// 	        	id:row.id,
//             });
	    }
        $('#maDichVu').textbox('readonly',true);
	}
	
    function submitForm(){
    	if($("#maDichVu").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên viết tắt (mã)" yêu cầu nhập.','warning');
    		$('#maDichVu').textbox('textbox').focus();
    		return;
    	}
    	if($("#tenDichVu").val() == ""){
    		$.messager.alert('Cảnh báo', 'Trường "Tên bảng giá" yêu cầu nhập.','warning');
    		$('#tenDichVu').textbox('textbox').focus();
    		return;
    	}
    	
    	var json = objectifyForm($("#form1"));
    	submitFormAndCallback(url_updateBangGiaNuoc, 1242, json, refreshFormAndDataGrid, true);
    }
    
    function refreshFormAndDataGrid(){
    	$('#dg').datagrid('reload');
    	clearForm($('#form1'));
    	$('#maTuyen').textbox('readonly',false);
    }
    
    function removeData(){
    	var ids = '';
        var rows = $('#dg').datagrid('getSelections');
        for(var i=0; i<rows.length; i++){
            var row = rows[i];
            ids += "'" + row.id +"'";
            if(i < rows.length-1){
            	ids += ","; 
            }
        }  
        $.messager.confirm('Xác nhận', 'Bạn có chắc muốn xóa những bản ghi này ?', function(r){
            if (r){
            	$("#id").val(ids);
            	var json = objectifyForm($("#form1"));
            	submitFormAndCallback(url_deleteBangGiaNuoc, 1243, json, refreshFormAndDataGrid, true);
            }
        });
    }
	//Xử lý danh mục bảng nước nhiều giá
    var maDichVu = '';
	var tenDichVu = '';
	function editDMBangGiaNuocNhieuMuc(){
	    var row = $('#dg').datagrid('getSelected');
	    if (row){
	    	id = row.id;
	    	maDichVu = row.maDichVu;
	    	tenDichVu = row.tenDichVu;
	    	$('#dgDM').datagrid({
           	    onBeforeLoad:function(param){
           	        param.idDichVuHdr= id;
           	    }
	    	});
	    	$("#idDichVuHdrHidden").val(id);
	        $('#dlg').dialog('open').dialog('center').dialog('setTitle','Cập nhật danh mục bảng giá nước : ' + tenDichVu);

	    }else{
	    	
	    }
	}
	
	//Event on danh mục nước nhiều mức giá
	var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dgDM').datagrid('validateRow', editIndex)){
            $('#dgDM').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index, field){
        if (editIndex != index){
            if (endEditing()){
                $('#dgDM').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    $('#dgDM').datagrid('selectRow', editIndex);
                },0);
            }
        }
    }
    function onEndEdit(index, row){
        var ed = $(this).datagrid('getEditor', {
            index: index,
            field: 'donGia'
        });
        row.donGia = $(ed.target).textbox('getText');
    }
    
    function append(){
    	var idDichVuHdrHidden = $("#idDichVuHdrHidden").val();
        if (endEditing()){
        	editIndex = $('#dgDM').datagrid('getRows').length-1;
        	if(editIndex==-1){
        		$('#dgDM').datagrid('appendRow',{slTu:1,vat:0,idDichVuHdr:idDichVuHdrHidden});
        	}else{
        		var row = $('#dgDM').datagrid('getRows')[editIndex];
        		if(row){
        			var slDenValue = row.slDen - 2 + 3;
        		}
        		$('#dgDM').datagrid('appendRow',{slTu:slDenValue,vat:0,idDichVuHdr:idDichVuHdrHidden});
                $('#dgDM').datagrid('selectRow', editIndex).datagrid('beginEdit', editIndex);
        	}
        }
    }
    
    function removeit(){
        if (editIndex == undefined){return}
        $('#dgDM').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }
    
    function accept(){
        if (endEditing()){
            $('#dgDM').datagrid('acceptChanges');
        }
    }
    
    function saveDmBGNChiTiet(){
    	accept();
    	var json=objecFromDataGrid($('#dgDM'));
    	submitProcessCallback(url_updateBangGiaNuocNhieuMuc, 1245, json, refreshFormAndDataGrid, true);
    }
    
    </script>
</body>
</html>