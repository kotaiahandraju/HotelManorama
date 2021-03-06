<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<div class="container">


<h2>Room Tariff</h2>
         
         <ol class="breadcrumb">
         <li><a href="#">Rooms</a></li>
         <li>Room Tariff</li>
         
         
         </ol>        
         
       <div class="row">
    <div class="col-md-12">
    <div class="col" style="border:solid 1px; border-color:#CCCCCC; border-radius:5px;">
				<ul style="background-color:#F7F7F7; margin-top:5px; border:solid 1px; border-color:#CCCCCC; border-radius:5px;" id="myTab" class="nav nav-tabs" role="tablist">
					<li style="margin-left:3px; margin-top:5px;"  class="roomTypeHome"><a href="roomTypeHome" >Rooms Type</a></li>
					<li style="margin-top:5px;" role="presentation" class="roomcapacity"><a href="roomcapacity">Room Capacity</a></li>
					<li style="margin-top:5px;" role="presentation" class="occupation"><a href="occupation" >Room Occupation</a></li>
					<li style="margin-left:3px; margin-top:5px;" class="roomMasterHome"><a href="roomMasterHome" >Room Master</a></li>
					<li style="margin-top:5px;" role="presentation" class="roomPriceHome"><a href="roomPriceHome" >Room Tariff</a></li>
					<li style="margin-top:5px;" role="presentation" class="roomPhotosHome"><a href="roomPhotosHome" >Room Photos</a></li>
					<li style="margin-top:5px;" role="presentation" class="offerPriceForm"><a href="offerPriceForm" >Special Offer Price</a></li>
				</ul>
				<div id="myTabContent" class="tab-content"></div>
    
    </div> 
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Room Tariff List</h3>
          <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-down"></i></span>
        </div>
        <div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables" id="example">
							<thead>	<tr><th>Room Type</th><th>Room Capacity</th><th>Sunday</th><th>Monday</th><th>Tuesday</th><th>Wednesday</th><th>Thursday</th><th>Friday</th><th>Saturday</th><th>Status</th><th></th></tr></thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
    </div>
    </div></div>
<div class="clearfix"></div>
      <div class="row">
    <div class="col-md-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title" id="moveTo">Room Tariff</h3>
         
        </div>
        <form:form modelAttribute="roomPriceForm" action="roomPriceSave" class="form-horizontal" method="Post" >
        <div class="panel-body">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="roomTypeId" class="col-md-4 control-label">Room Type <span class="impColor">*</span></label>
									<div class="col-md-7">
									<form:select style='width: 196px;' path="roomTypeId" class="form-control validate" onfocus="removeBorder(this.id);" onchange="getRoomOcupation()">
									<form:option value="">-- Select Room Type --</form:option>
									<form:options items="${roomtype }"></form:options>
									</form:select>
									</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="capacityId" class="col-md-4 control-label">Room Capacity <span class="impColor">*</span></label>
                    				<div class="col-md-7">
                    				<form:select path="capacityId" class="form-control validate" onfocus="removeBorder(this.id);">
									<form:option value="">-- Select Room Capacity --</form:option>
<%-- 									<form:options items="${capacity }"></form:options> --%>
									</form:select>
                    				</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="sun" class="col-md-4 control-label">Sunday<span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input  path="sun" class="form-control numericOnly validate" maxlength="5" placeholder="Price(INR)"/>
								  	</div>
                    			</div>
                    			</div>
                    			<div class="clearfix"></div>
                    			<div class="col-md-4">
								<div class="form-group">
                    				<label for="mon" class="col-md-4 control-label">Monday<span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input  path="mon" class="form-control numericOnly validate" maxlength="5" placeholder="Price(INR)"/>
								  	</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="tue" class="col-md-4 control-label">Tuesday<span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input   style='width: 214px;' path="tue" class="form-control numericOnly validate" maxlength="5" placeholder="Price(INR)"/>
								  	</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="wed" class="col-md-4 control-label">Wednesday <span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input  path="wed" class="form-control numericOnly validate" maxlength="5" placeholder="Price(INR)"/>
								  	</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="thu" class="col-md-4 control-label">Thursday <span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input  path="thu" class="form-control  validate" maxlength="5" placeholder="Price(INR)"/>
								  	</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="fri" class="col-md-4 control-label">Friday <span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input  style='width: 214px;' path="fri" class="form-control numericOnly validate" maxlength="5" placeholder="Price(INR)"/>
								  	</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="sat" class="col-md-4 control-label">Saturday <span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input  path="sat" class="form-control numericOnly validate" maxlength="5" placeholder="Price(INR)"/>
								  	</div>
                    			</div>                    	
							</div>
						</div>
                    </div>                    
                    <div class="panel-footer">
                    <br>
				      	<div class="row">
				      		<div class="col-sm-12">
				      		<div class="col-sm-7">
				      			<div class="btn-toolbar text-center pull-right">
					      			<input class="btn-primary btn" type="submit" value="Submit" id="submit1"/>
					      			<input class="btn-danger btn cancel" type="reset" value="Reset" />
				      			</div>
				      			</div>
				      		</div>
				    	</div>
					</div></form:form>
    </div>
    </div></div></div>

<script type="text/javascript">
var listOrders1 =${allOrders1};

console.log(listOrders1);
if (listOrders1 != "") {
	showTableData(listOrders1);
}

var damageId = 0;
// var serviceUnitArray ={};
var data = {};


function showTableData(response){
	var table=$('#tableId').html('');
	serviceUnitArray = {};
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead>	<tr><th>Room Type</th><th>Room Capacity</th><th>Sunday</th><th>Monday</th><th>Tuesday</th><th>Wednesday</th><th>Thursday</th><th>Friday</th><th>Saturday</th><th>Status</th><th></th></tr></thead>'+
    	"<tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteRoomPrice("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteRoomPrice("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editRoom("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.roomTypeId+"'>" + orderObj.roomtypename + "</td>"
			+ "<td title='"+orderObj.capacityId+"'>" + orderObj.capacityname + "</td>"
			+ "<td title='"+orderObj.sun+"'>" + orderObj.sun + "</td>"
			+ "<td title='"+orderObj.mon+"'>" + orderObj.mon + "</td>"
			+ "<td title='"+orderObj.tue+"'>" + orderObj.tue + "</td>"
			+ "<td title='"+orderObj.wed+"'>" + orderObj.wed + "</td>"
			+ "<td title='"+orderObj.thu+"'>" + orderObj.thu + "</td>"
			+ "<td title='"+orderObj.fri+"'>" + orderObj.fri + "</td>"
			+ "<td title='"+orderObj.sat+"'>" + orderObj.sat + "</td>"
			+ "<td title='"+orderObj.roomPriceStatus+"'>" + orderObj.roomPriceStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editRoom(id){
	$("#id").val(id);
	$("#roomTypeId").val(serviceUnitArray[id].roomTypeId);
	$("#capacityId").val(serviceUnitArray[id].capacityId);
	$("#sun").val(serviceUnitArray[id].sun);
	$("#mon").val(serviceUnitArray[id].mon);
	$("#tue").val(serviceUnitArray[id].tue);
	$("#wed").val(serviceUnitArray[id].wed);
	$("#thu").val(serviceUnitArray[id].thu);
	$("#fri").val(serviceUnitArray[id].fri);
	$("#sat").val(serviceUnitArray[id].mon);
	
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteRoomPrice(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
		 $('#inActive').prop('checked', false);
	}
	if(checkstr == true){
		var formData = new FormData();
	    formData.append('id', id);
	    formData.append('status', status);
		$.fn.makeMultipartRequest('POST', 'roomPriceDelete', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			showTableData(alldata);
			 tooltip1();
		});
	}
}
function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActivePrice', false,
				formData, false, 'text', function(data) {
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			showTableData(alldata);
			 tooltip1();
		});
	
}
function dataClear(){
	$("#id").val("");
	$("#Name").val("");
	$("#s").val("");
	$("#location").val("");
}
function getRoomOcupation(){
	var roomTypeId = $("#roomTypeId").val();
	var formData = new FormData();
	formData.append('roomTypeId', roomTypeId);
	
	$.fn.makeMultipartRequest('POST', 'getRoomOcupation', false,formData, false, 'text', function(data) {
// 		alert(data);
$("#capacityId").html("");
		var optionsForClass = "";
		optionsForClass = $("#capacityId").empty();
optionsForClass.append(new Option("-- Select Room Capacity --", ""));
// $("#capacityId").html("");
		if(data != ""){
		var jsonobj = $.parseJSON(data);
		$("#capacityId").html("");
		var optionsForClass = "";
		optionsForClass = $("#capacityId").empty();
		optionsForClass.append(new Option("-- Select Room Capacity --", ""));
		
		$.each(jsonobj, function(i, tests) {
			var id=tests.id;
			var capacityname=tests.name;
			optionsForClass.append(new Option(capacityname, id));
		});
	}
	});
}
$("#pageName").text("Room Tariff");
$(".roomPriceHome").addClass("active"); 
</script>
