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
    <title>Tra cứu lịch sử sử dụng</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/bootstrap/bootstrap.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/bootstrap/datepicker.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/themes/icon.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/jquery-easyui/css/demo.css" />">
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/jquery.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/popper.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery-easyui/bootstrap.min.js" />"></script>
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
    <style type="text/css">
		#container {
			min-width: 310px;
			max-width: 1000px;
			height: 400px;
			margin: 0 auto
		}
	</style>
</head>
<body>
	<!-- <div class="card col-sm-6 col-md-4">
	  <div class="card-header d-flex justify-content-left" style="padding: .3rem 1.25rem;">
	    Tháng tra cứu
	  </div>
	  <div class="card-body">
	  	<div class="border">
			<div class="row" style="margin-bottom: 0.5rem;">
				<div class="col-sm-12 col-md-6">
					<div id="tuThang" style="display: block;">
			  			<label for="timeCheckIn" class="d-flex justify-content-left">Từ tháng:</label>
		                <div class="input-group date">
		                	<input type="text" id="tuThang" name="tuThang" class="textbox datepicker-waters" style="text-align: center;width: 130px;" placeholder="MM-YYYY" />
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6">
					<div id="denThang" style="display: block;">
			  			<label for="timeCheckIn" class="d-flex justify-content-left">Đến tháng:</label>
		                <div class="input-group date">
		                	<input type="text" id="denThang" name="denThang" class="textbox datepicker-waters" style="text-align: center;width: 130px;" placeholder="MM-YYYY" />
						</div>
					</div>
				</div>
			</div>
		</div>
	  </div>
	</div> -->
	<div id="container"></div>
    <script type="text/javascript">
    var url_view_kh = '${sessionScope.apiContext}/chiso/lichsu';
    	$(function () {
	    SessionId = getQueryVariable("session");
		var idKh = getQueryVariable("idKh");
		submitFormAndReloadData(url_view_kh+"?idKh=" + idKh, null, null, setDataChart);
		/*var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    	var type = cacheActionRp; // cacheActionRp dc truyen tu menu
         var checkin = $('#tuThang').datepicker({
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
        }).data('datepicker'); */

	});
   	function setDataChart(data)
      {
      	Highcharts.setOptions({
      		colors: ['#058DC7', '#50B432', '#FF9655', '#DDDF00', '#24CBE5', '#64E572', '#ED561B', '#FFF263', '#6AF9C4']
          });
          Highcharts.chart('container', {

              title: {
                  text: 'Lịch sử sử dụng nước từ 10-2017 đến 04-2018'
              },

              subtitle: {
                  text: data.tenKh
              },
              xAxis: {
                  categories: ['10-2017', '11-2017', '12-2017', '01-2018', '02-2018', '03-2018', '04-2018', '08-2018']
              },
              yAxis: {
                  title: {
                      text: 'Giá trị'
                  }
              },
              legend: {
                  layout: 'vertical',
                  align: 'right',
                  verticalAlign: 'middle'
              },
      /* 
              plotOptions: {
                  series: {
                      label: {
                          connectorAllowed: false
                      },
                      pointStart: "01-2018"
                  }
              }, */

              series: [{
                  name: 'Số đã sử dụng',
                  data: [43, 52, 57, 69, 97, 111, 68, 41]
              }, {
                  name: 'Số tiền thanh toán',
                  data: [24916, 24064, 29742, 29851, 32490, 30280, 38121, 40434]
              }],

              responsive: {
                  rules: [{
                      condition: {
                          maxWidth: 500
                      },
                      chartOptions: {
                          legend: {
                              layout: 'horizontal',
                              align: 'center',
                              verticalAlign: 'bottom'
                          }
                      }
                  }]
              }

          });
       }
    </script>
</body>
</html>