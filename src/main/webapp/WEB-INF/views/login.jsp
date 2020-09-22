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
    <title>Quản lý thông tin khách hàng nước</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/default/easyui.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.easyui.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.hotkeys.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/common.js" />"></script>
</head>
<style>
	#mydiv {
	    position: fixed;
        width: 20%; /* Set your desired with */
        z-index: 2; /* Make sure its above other items. */
        top: 45%;
        left: 10%;
        margin-top: -10%; /* Changes with height. */
        margin-left: -10%; /* Your width divided by 2. */
	}
	#footer {
	    position: fixed;
        width: 50%; /* Set your desired with */
        z-index: 2; /* Make sure its above other items. */
        top: 60%;
        left: 45%;
        margin-top: 10%; /* Changes with height. */
        margin-left: -22%; /* Your width divided by 2. */
	}
</style>
<body style="background-color:#eeeded;">
<script type="text/javascript">
	//alert()
</script>	
	<div id="mydiv" style="width:100%" align="center">
		<table border="0" style="width:100%">
			<tr>
				<td align="center">
					<img alt="ESB" src="./resources/images/esb2.png"></img>
					<h2>QUẢN LÝ THÔNG TIN KHÁCH HÀNG NƯỚC</h2>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div class="easyui-panel" title="Đăng nhập" style="width:350px;padding:10px;" align="center">
				        <form id="form1" action="wellcome" method="post" >
				            <table border="0">
				                <tr>
				                    <td>
				                    	<input type="hidden" id="SessionID" name="SessionID" />
				                    	<input type="hidden" id="FunctionIds" name="FunctionIds" />
				                    	<input class="easyui-textbox" id="username" name="username" style="width:100%;max-width:350px" data-options="label:'Tài khoản:',labelWidth:100,prompt:'Nhập tên đăng nhập.'">
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                    	<input class="easyui-passwordbox" id="password" name="password" iconWidth="28" style="width:100%;max-width:350px" data-options="label:'Mật khẩu:',labelWidth:100,prompt:'Nhập mật khẩu.'">
				                    </td>
				                </tr>
				                 <tr>
				                    <td></td>
				                    <td><!-- <input type="submit" value="Submit"></input> --></td>
				                </tr>
				            </table>
				        </form>
				        <div style="text-align:center;padding:3px 0">
				            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Đăng nhập</a>
				            <!-- <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm($('#form1'))" style="width:80px">Nhập mới</a> -->
				        </div>
        			</div>
				</td>
			</tr>
		</table>
    </div>
    <div id="footer" style="text-align:center;font-weight: bold;">Công ty TNHH Xây dựng và Thương Mại Thành Nam
    	<div>
	    	Địa chỉ: SN 135 đường Nguyễn Huệ, P.Ninh Bình, TP.Ninh Bình, T.Ninh Bình.
	    </div>
	    <div>
	    	MST: 2700334065
	    </div>
	    <div>
	    	Tel: (02293)510.588
	    </div>     
    </div>
    <script type="text/javascript">
    	var url_Login = '${sessionScope.apiContext}/ht/login';
    	var url_Wellcome = 'wellcome';

        function submitForm(){
	    	if($("#username").val() == ""){
	    		$.messager.alert('Cảnh báo', 'Trường "Tên đăng nhập" yêu cầu nhập.','warning');
	    		$('#username').textbox('textbox').focus();
	    		return;
	    	}
	    	if($("#password").val() == ""){
	    		$.messager.alert('Cảnh báo', 'Trường "Mật khẩu" yêu cầu nhập.','warning');
	    		$('#password').textbox('textbox').focus();
	    		return;
	    	}
	    	var json = objectifyForm($("#form1"));
	    	submitFormLogin(url_Login, json, forwardWellcome);
	    }

        function forwardWellcome(data){
        	var url = url_Wellcome + "?SessionId=" + data;
        	location.replace(url);
        }
        
        function bindEnterEvent(event){
        	if(event.which==13){
        		submitForm();
        	}
        }
        
        $(function(){	
        	$(document).bind('keydown',  bindEnterEvent);
    	});
     </script>
</body>
</html>
