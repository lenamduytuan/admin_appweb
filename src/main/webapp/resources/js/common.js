var SessionId;
var cacheActionRp="";
var timeW= (new Date()).getTime();
function dataGridLoader(dgrid, url, funcId){
	dgrid.datagrid({
		loader: function(param, success, error){
			var opts = $(this).datagrid('options');
			//if (!opts.url) return false;
			$.ajax({
				type: opts.method,
				beforeSend : function( xhr ) {
			        xhr.setRequestHeader( "Authorization", SessionId ),
			        xhr.setRequestHeader( "FunctionId", funcId )
			    },
				url: url,
				data: param,
				dataType: 'json',
				success: function(data){
					success(data);
				},
				error: function(xhr, status, error){
					//var err = eval("(" + xhr.responseText + ")");
					//alert(err.message);
					error.apply(this, arguments);
				}
			});
		}
	});
}

function treeLoader(tree, url, funcId){
	tree.tree({
		loader: function(param, success, error){
			var opts = $(this).tree('options');
			$.ajax({
				type: opts.method,
				beforeSend : function( xhr ) {
			        xhr.setRequestHeader( "Authorization", SessionId ),
			        xhr.setRequestHeader( "FunctionId", funcId ) 
			    },
				url: url,
				data: param,
				dataType: 'json',
				success: function(data){
					success(data);
				},
				error: function(xhr, status, error){
					var err = eval("(" + xhr.responseText + ")");
					alert(err.message);
					error.apply(this, arguments);

				}
			});
		}
	});
}

function comboboxLoader(cb, url, funcId){
	cb.combobox({
		loader: function(param, success, error){
			var opts = $(this).combobox('options');
			//if (!opts.url) return false;
			$.ajax({
				type: 'GET',
				beforeSend : function( xhr ) {
			        xhr.setRequestHeader( "Authorization", SessionId ),
			        xhr.setRequestHeader( "FunctionId", funcId )
			    },
				url: url,
				data: param,
				dataType: 'json',
				success: function(data){
					success(data);
				},
				error: function(xhr, status, error){
					//var err = eval("(" + xhr.responseText + ")");
					//alert(err.message);
					error.apply(this, arguments);
				}
			});
		}
	});
}
	    
function loadDataInGrid(dgrid, url){
	/*$.post( url, {page:1, rows:10}, function(data, status) {
		//$('#dg').datagrid('loadData', data ).datagrid('clientPaging'); 
		$('#dg').datagrid('loadData', data );
 	}, 'json');*/
	dgrid.datagrid('load', {page:1,rows:10,url:url});
	
}

function clearForm(form){
	form.form('clear');
}

function submitFormAndCallback(url, funcId, data, refreshCallback, showMessage){
 	$.ajax({
        type: "POST",
        headers: {
        	"Accept-Language" : "vi-VN",
  		   	"Content-Type": "application/json; charset=UTF-8",
   			"Authorization":SessionId,
   			"FunctionId":funcId
		},
        url: url, 	            
        data: JSON.stringify(data),
        dataType: "json",
        beforeSend: function(x) {
            if (x && x.overrideMimeType) {
              x.overrideMimeType("application/j-son; charset=UTF-8");
            }
      	},
        success: function(response) {   
         	if(response.data != null){
         		if(refreshCallback != null){
         			refreshCallback(response.data.message);
         		}
         		if(showMessage){
         			$.messager.show({
    	                title:'Thông tin',
    	                msg:response.data.message,
    	                showType:'show'
    	            });
         		}         			 
        	}else{
        		$.messager.alert('Lỗi', response.error.description,'error');
        	}
        }            
    }) 
}

function submitProcessCallback(url, funcId, data, refreshCallback, showMessage){
	progressStart();
	$.ajax({
        type: "POST",
        headers: { 
  		   	"Content-Type": "application/json; charset=UTF-8",
   			"Authorization":SessionId,
   			"FunctionId":funcId
		},
        url: url, 	            
        data: JSON.stringify(data),
        dataType: "json",
        timeout: 600000,
        beforeSend: function(x) {
            if (x && x.overrideMimeType) {
              x.overrideMimeType("application/j-son; charset=UTF-8");
            }
      	},
        success: function(response) {   
        	progressStop();
         	if(response.data != null){
         		if(refreshCallback != null){
         			refreshCallback(response.data.message);
         		}
         		if(showMessage){
         			$.messager.show({
    	                title:'Thông tin',
    	                msg:response.data.message,
    	                showType:'show'
    	            });
         		}         			 
        	}else{
        		$.messager.alert('Lỗi', response.error.description,'error');
        	}
        },
        error: function (e) {
        	progressStop();
        }
    }) 
}

function submitFileAndCallback(url, funcId, data, refreshCallback, showMessage){
	$.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: url,
        data: data,
        //http://api.jquery.com/jQuery.ajax/
        //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
        processData: false, //prevent jQuery from automatically transforming the data into a query string
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function(response) {   
         	if(response.data != null){
         		if(refreshCallback != null){
         			refreshCallback(response.data.message);
         		}
         		if(showMessage){
         			$.messager.show({
    	                title:'Thông tin',
    	                msg:response.data.message,
    	                showType:'show'
    	            });
         		}         			 
        	}else{
        		$.messager.alert('Lỗi', response.error.description,'error');
        	}
        }
    }); 
}

function submitFormLogin(url, data, refreshCallback){
 	$.ajax({
        type: "POST",
        headers: { 
  		   	"Content-Type": "application/json; charset=UTF-8",
		},
        url: url, 	            
        data: JSON.stringify(data),
        dataType: "json",
        beforeSend: function(x) {
            if (x && x.overrideMimeType) {
              x.overrideMimeType("application/j-son; charset=UTF-8");
            }
      	},
        success: function(response) {
        	if(response.data != null){
        		if(refreshCallback != null){
         			refreshCallback(response.data.message);
         		}
        	}else{
        		$.messager.alert('Lỗi', response.error.description,'error');
        	}
        }
    }) 
}

function objectifyForm(form) {//serialize data function
	var formArray = form.serializeArray();
	var returnArray = {};
  	for (var i = 0; i < formArray.length; i++){  		
    	returnArray[formArray[i]['name']] = formArray[i]['value'];
  	}
  	return returnArray;
}

/*TVTAN: ham lay ra list object cua 1 datagridView
 * parammater: datagridView
 */
function objecFromDataGrid(dg) {
	var fruits= [];
	var rows = dg.datagrid('getRows');
	for(var i=0; i<rows.length; i++){
		var returnArray = getObjectFromRow(rows[i]);
		if(returnArray!=null)
			fruits.push(returnArray);
	}
	return fruits;
}
function getObjectFromRow(row) {
	var returnArray = {};
	for(var name in row){
		if(row[name]!=null)
		{
			var value=row[name].toString();
			if(value.indexOf('\-')>1 && value.length==10)
			{
				returnArray[name] = parserDate(value);
			}
			else
				returnArray[name] = row[name];
		}
		else
			returnArray[name] = row[name];
    }
	return returnArray;
}
function rowToOject(dg, index) {
	var row = dg.datagrid('getRows')[index];
	var returnArray = getObjectFromRow(row);
	return returnArray;
}
function objecFromDataGridChange(dg) {
	var fruits= [];
	var rows = $('#dg').datagrid('getChanges');
	for(var i=0; i<rows.length; i++){
		var returnArray = getObjectFromRow(rows[i]);
		if(returnArray!=null)
			fruits.push(returnArray);
	}
	return fruits;
}
function genParamater(value,row,index){
    var col = "";
    for(var name in row){
        col = "";
        var value = row[name];
        if(value === val){
            col = name; 
            break;
        }
    }
    return col;
}
function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
    }
    else {
        return false;
    }
}

function formatDate(val,row){		
	return formattedDate(val);	
 } 

function formattedDate(date) {
	if(date==null) return ;
	var value=date.toString();
	var d;
	if(value.indexOf('\-')>1 && value.length==10)
	{
		//d = parserDate(value);
		var ss = (value.split('-'));
		var n = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var y = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(n)){
			d= new Date(y,m-1,n);
		}
	}
	else
	{
		 d = new Date(date);
	}
	if(!d) return ;
	var month = '' + (d.getMonth() + 1),
	day = '' + d.getDate(),
	year = d.getFullYear();

	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;

	return [day, month, year].join('-');
}
function confirm(mess){
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
function warning(mess){
    $.messager.alert('Thông báo',mess,'warning');
}
function progressStart(){
    var win = $.messager.progress({
        title:'Vui lòng đợi',
        msg:'Đang xử lý...'
    });
}
function progressStop(){
    $.messager.progress('close');
}
function getObjects(obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getObjects(obj[i], key, val));
        } else if (i == key && obj[key] == val) {
            objects.push(obj);
        }
    }
    return objects;
}
function parserDate(s){
	if(s==null ) return ;
	if (!s) return ;
	if(s.toString().indexOf('-')>0)
	{
		var ss = (s.split('-'));
		var d = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var y = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return ;
		}
	}
	else
	{
		alert(new Date(s));
		return new Date(s);
		
	}
}
function encodeURL(url)
{ 
  if (url.indexOf("%3F")!=-1 || url.indexOf("%3D")!=-1 || url.indexOf("%2F")!=-1 ) 
  {
    return url;
  }
  url=encodeURIComponent(url);
  url=url.replace(/%2F/g,"/");
  url=url.replace(/%3D/g,"=");
  url=url.replace(/%3F/g,"?");
  url=url.replace(/%26/g,"&");
  url=url.replace(/%3A/g,":");
  return url;
}
function isEmpty(val){return(val==null||val=="");}
function openWindow(url,w,h,features)
{
  ww=(isEmpty(w))?900:w;
  hh=(isEmpty(h))?600:h;
  url = encodeURL(url);
  if (!features)
    win=window.open(url,"",'height='+hh+',width='+ww+',top='+(screen.height-hh)/2+',left='+(screen.width-ww)/2+',status=1,scrollbars=0,resizable=1');
  else
    win=window.open(url,"",'height='+hh+',width='+ww+',top='+(screen.height-hh)/2+',left='+(screen.width-ww)/2+','+features);
  win.window.focus();
  return win;
}
function getQueryVariable(variable) {
  var query = window.location.search.substring(1);
  var vars = query.split("&");
  for (var i=0;i<vars.length;i++) {
    var pair = vars[i].split("=");
    if (pair[0] == variable) {
      return pair[1];
    }
  } 
}
function submitFormAndReloadData(url, funcId, data, refreshCallback){
 	$.ajax({
        type: "POST",
        headers: { 
  		   	"Content-Type": "application/json; charset=UTF-8",
   			"Authorization":SessionId,
   			"FunctionId":funcId
		},
        url: url, 	            
        data: JSON.stringify(data),
        dataType: "json",
        beforeSend: function(x) {
            if (x && x.overrideMimeType) {
              x.overrideMimeType("application/j-son; charset=UTF-8");
            }
      	},
        success: function(response) {   
         	if(response != null){
         		if(refreshCallback != null){
         			refreshCallback(response);
         		}    			 
        	}else{
        		
        	}
        }            
    }) 
}
function submitGetFormAndReloadData(url, funcId, data, refreshCallback){
 	$.ajax({
        type: "GET",
        headers: { 
  		   	"Content-Type": "application/json; charset=UTF-8",
   			"Authorization":SessionId,
   			"FunctionId":funcId
		},
        url: url, 	            
        data: JSON.stringify(data),
        dataType: "json",
        beforeSend: function(x) {
            if (x && x.overrideMimeType) {
              x.overrideMimeType("application/j-son; charset=UTF-8");
            }
      	},
        success: function(response) {   
         	if(response != null){
         		if(refreshCallback != null){
         			refreshCallback(response);
         		}    			 
        	}else{
        		
        	}
        }            
    }) 
}
function getTimeWorking(time) {
    var d = new Date();
    var n = d.getTime();
    var timeTmp=n-time;
    var date = new Date(timeTmp);
    var hh = date.getUTCHours();
    var mm = date.getUTCMinutes();
    var ss = date.getSeconds();
    var result =checkTime(hh) +":" + checkTime(mm) + ":" +checkTime(ss);
    return result;
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
//Set index 0 for Combobox value default
//$.fn.combobox.defaults.onLoadSuccess = function(items){
//	if (items.length){
//		var opts = $(this).combobox('options');
//		$(this).combobox('select', items[0][opts.valueField]);
//	}
//}

function getDgCheck(dg, property) {
	var list = "";
	var selectedrow = dg.datagrid("getSelections");
	var rows = dg.datagrid('getRows');
	if(rows==null) return "";
	for( var i=0; i<rows.length; i++){
		list = list.replace("'" + rows[i][property]+"'~", "");
	}
	if(selectedrow!=null){
    	for(var i=0; i<selectedrow.length; i++){
    		list=list + "'" + selectedrow[i][property]+"'~";
		}
	}
	return list;
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
	

    function resizeElement(){
    	try{
	    	var allListElements = $( ".size-auto-min" );
	    	if (allListElements.length >0){
		    	var width=400;
		    	var height=100;
	    		for(var i=0; i<allListElements.length; i++)
	    		{
	    			if( width > allListElements[i].offsetWidth)
	    				width = allListElements[i].offsetWidth;
	    			if( height > allListElements[i].offsetHeight)
	    				height = allListElements[i].offsetHeight;
	    		}
	    		
	    		for(var i=0; i<allListElements.length; i++)
	    		{
	    			allListElements[i].style.width = width +"px";
	    			allListElements[i].style.height = height +"px";
	    		}
	    	}
	    	else{
	    		var allListElements = $( ".size-auto-max" );
		    	if (allListElements.length >0){
			    	var width=0;
		    		for(var i=0; i<allListElements.length; i++)
		    		{
		    			if( width < allListElements[i].offsetWidth)
		    				width = allListElements[i].offsetWidth;
		    			if( height < allListElements[i].offsetHeight)
		    				height = allListElements[i].offsetHeight;
		    		}
		    		
		    		for(var i=0; i<allListElements.length; i++)
		    		{
		    			allListElements[i].style.width = width +"px";
		    			allListElements[i].style.height = height +"px";
		    		}
		    	}
	    	}
    	}
    	catch(err){
    		
    	}
    }