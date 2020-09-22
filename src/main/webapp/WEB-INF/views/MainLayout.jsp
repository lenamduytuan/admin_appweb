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
    <meta name="keywords" content="esb, quản lý người dùng">
    <meta name="description" content="esb, quản lý người dùng">
    <title>Hệ thống quản lý người dùng</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/bootstrap/bootstrap.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/bootstrap/datepicker.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/popper.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/bootstrap.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/bootstrap-datepicker.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/all.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.hotkeys.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/datagrid-cellediting.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/datagrid-filter.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/highcharts.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/modules/series-label.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/modules/exporting.js" />"></script>
    <link rel="import" href="<c:url value="/resources/template/water_component.html" />">
</head>
<body style="background-color:#eeeded;">	
	<c:url var="indexAction" value="/index" ></c:url>
	<c:url var="homeAction" value="/home" ></c:url>
	<c:url var="viewUserAction" value="/ht/viewUser" ></c:url>
	<c:url var="viewRoleAction" value="/ht/viewRole" ></c:url>
	<c:url var="viewUserRoleAction" value="/ht/viewUserRole" ></c:url>
	<c:url var="viewMenuFuncAction" value="/ht/viewMenuFunc" ></c:url>

    <!-- <div style="margin:20px 0;"></div> -->
    <!-- <div class="easyui-layout" style="width:1324px;height:630px;"> -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" role="navigation" style="height: 25px;">
	    <div class="container">
	        <div class="collapse navbar-collapse" id="exCollapsingNavbar">
	        	<span style="color: #E6E6FA;">CÔNG TY TNHH ESB GIẢI PHÁP ĐIỆN TỬ DOANH NGHIỆP</span>
	            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
	            	<span style="color: white; padding-top: 6px;" class="time-work" id="timeWork"></span>&nbsp;&nbsp;&nbsp;&nbsp;
	        		<span style="color: white; padding-top: 6px;">Xin chào&nbsp;</span>
	                <li class="dropdown order-1">
	                    <button type="button" id="dropdownMenu1" data-toggle="dropdown" class="btn btn-outline-secondary dropdown-toggle"><span class="caret" id="fullname" style="font-size: 13px;">ESB</span></button>
	                    <!-- <ul class="dropdown-menu dropdown-menu-right mt-2">
	                       <li class="px-3 py-2">
	                       		<div class="text-left">
	                                <small><a href="#" data-toggle="modal" onclick="logout()"><i class="fa fa-power-off"></i> Đăng xuất</a></small>
	                            </div>
	                            <div class="text-left">
	                                <small><a href="#" data-toggle="modal" ><i class="fa fa-cog fa-spin"></i> Đổi mật khẩu</a></small>
	                            </div>
	                        </li>
	                    </ul> -->
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>
    <div class="easyui-layout" style="width:100%;height:630px; margin-top: 26px;">
        <div data-options="region:'north'"  style="height:40px;padding-top:1px;padding-left:1px;background-color:#E6EFFF">
			<table style="width:100%;padding:3px;" border="0">
				<tr>					
					<td style="width:30%" align="left">
						<!-- <font style="font-weight: bold;" color="navy">
							<label>Chọn sổ: </label>
						</font>
        				<input class="easyui-combobox" id="maSoGlobal" name="maSoGlobal"
						           		data-options="
						                method:'get',
						                valueField:'id',
						                textField:'maSoDoc',
						                editable:false,
						                panelHeight:'auto'"> -->
					</td>
					<td width="40%" align="center">
						<!-- <marquee scrollamount="3" > -->
			        		<font size="3" style="font-weight: bold;" color="navy">HỆ THỐNG QUẢN LÝ NGƯỜI DÙNG</font>
			        	<!-- </marquee> -->
					</td>
					<td width="18%" align="right">
						<font style="font-weight: bold; vertical-align: middle;" color="navy">
							Hỗ trợ:
						</font>						
						<!-- <img alt="ESB" src="./resources/images/icons8-user-24.png" height="21px" width="21px"></img> -->
					</td>
					<td width="12%">
					 <font size="3" style="font-weight: bold; vertical-align: middle;" color="red"> 0981.920.920</font>
						<!-- <font style="font-weight: bold; vertical-align: text-top;" color="navy">							
							<label>Tài khoản đăng nhập: </label>
							: <label id="userId"></label>							
						</font> -->
					</td>
				</tr>
			</table>
        </div>
        <div data-options="region:'west',split:true,hideCollapsedContent:false,collapsed:false" title="Chức năng" style="width:270px;">
        	<%-- <ul id="tMenu" class="easyui-tree" data-options="url:'${menuAction}',method:'get',animate:true,lines:true, --%>
        	<ul id="tMenu" class="easyui-tree" data-options="method:'get',animate:true,lines:true,
        		onClick: function(node){
                    selectMenu(node);
                }"></ul>
        </div>
        <div id="pMain" data-options="region:'center',title:'Màn hình chính',tools:'#tb2'">

        </div>
        <div id="tb1" style="padding:2px 5px;">
        	<a href="javascript:void(0)" class="icon-undo" onclick="logout()" title="Đăng xuất"></a>
	    </div>
	    <div id="tb2" style="padding:2px 5px;">
        	<a href="javascript:void(0)" class="icon-home" onclick="home()" title="Trang chủ"></a>
	    </div>
    </div>
    <div>
		<form id="formExportExcel" name="formExportExcel" >
			<input hidden="hidden" id="arrId" name="arrId">
			<input hidden="hidden" id="arrId1" name="arrId1">
			<input hidden="hidden" id="kyLap" name="kyLap">
			<input hidden="hidden" id="maSo" name="maSo">
			<iframe id="frExcel" name="frExcel" height="0" width="100%" src=""></iframe>
		</form>
	</div>
	<div class="row" id="footer">
		<div class="col-md-4 text-left">
			<span style="text-align:left;">@2018: CÔNG TY TNHH ESB GIẢI PHÁP ĐIỆN TỬ DOANH NGHIỆP</span></br>
		</div>
		<div class="col-md-4"></div>
		<div class="col-md-4 text-right">			
			<span >Phiên bản ứng dụng: 1.0</span>
		</div>
	</div>
    <script type="text/javascript">  
    	var url_ViewMenu = '${sessionScope.apiContext}/menu/mnuApp';
    	var url_Logout = '${sessionScope.apiContext}/ht/logout';
    	var url_loadFullName = '${sessionScope.apiContext}/ht/getFullName';
    	var url_Login = 'index';
    	var timeWork=timeW;
    	$(function(){
			SessionId = '${sessionScope.SessionId}';			
			treeLoader($('#tMenu'), url_ViewMenu, null); 
			getFullName();
	    });
    	
        function selectMenu(node){
            //var node = $('#tMenu').tree('getSelected');            
            if (node){
                var s = node.text;
                var id = node.id;
                /* if (node.attributes){
                    s += ","+node.attributes.p1+","+node.attributes.p2;
                } */
                //alert("id: "+id);
                /* var check = false;
                if(id=='16' || id=='161' || id=='162' || id=='163' || id=='127' ){
                	check = true;
                }else{
                	check = false;
                } */
                //alert("check: "+check);
                /* var maSoGlobal = $('#maSoGlobal').val();
                if(maSoGlobal.length == 0 && check==true){
                	$.messager.alert('Cảnh báo', 'Vui lòng chọn sổ trước khi thao tác!','warning');
                	return;
                } */
                
                if(id==111){
                	$('#pMain').panel('setTitle', 'Quản lý người sử dụng');
                	$('#pMain').panel('refresh', '${viewUserAction}');
                }else if(id==112){
                	$('#pMain').panel('setTitle', 'Quản lý nhóm');
                	$('#pMain').panel('refresh', '${viewRoleAction}');
                }else if(id==113){
                	$('#pMain').panel('setTitle', 'Quản lý nhóm người sử dụng');
                	$('#pMain').panel('refresh', '${viewUserRoleAction}');
                }else if(id==114){
                	$('#pMain').panel('setTitle', 'Quản lý nhóm chức năng');
                	$('#pMain').panel('refresh', '${viewMenuFuncAction}');
                }
        	}
            return;
        }
        
        function home(){
        	$('#pMain').panel('setTitle', 'Màn hình chính');
        	$('#pMain').panel('refresh', '${homeAction}');
        }
        
        function logout(){
        	submitFormAndCallback(url_Logout, null, null, forwardIndex, false);        	
        }
        
        function forwardIndex(data){
        	location.replace(url_Login);
        }
        
        function getFullName(){
        	submitFormAndCallback(url_loadFullName, null, null, setFullName, false);
        }
        
        function setFullName(data){
        	if(data!=null && data!=undefined && data!=''){
            	$('#fullname').text(data.split("@@")[0]);
            	//timeWork = data.split("@@")[1];
        		//getTimeW();
        	}
        }
        
        function getTimeW() {	
        	$('#timeWork').text(getTimeWorking(timeWork));
            setTimeout(getTimeW, 500);
        }
    </script>
</body>
</html>