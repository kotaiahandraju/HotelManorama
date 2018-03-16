<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="#">Home</a></li>
		<li>Room Tariff</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Room Tariff List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables" id="example">
							<thead><tr><th>Name</th><th>Mobile Number</th><th>Email</th><th>City</th><th>Address</th><th>Country</th><th>CheckIn</th><th>checkOut</th><th>Room Type</th><th>Capacity</th><th>Number Of Rooms</th><th>Room Price</th><th>Status</th><th></th></tr></thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				</div>
			</div>
		</div>
                    
		
	</div> <!-- container -->

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
    	'<thead><tr><th>Name</th><th>Mobile Number</th><th>Email</th><th>City</th><th>Address</th><th>Country</th><th>CheckIn</th><th>checkOut</th><th>Room Type</th><th>Capacity</th><th>Number Of Rooms</th><th>Room Price</th><th>Status</th><th></th></tr></thead>'+
    	"<tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteRoomPrice("+ orderObj.userDetailsId+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteRoomPrice("+ orderObj.userDetailsId+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editRoom("+ orderObj.userDetailsId+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.userDetailsId] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.mobileNumber+"'>" + orderObj.mobileNumber + "</td>"
			+ "<td title='"+orderObj.email+"'>" + orderObj.email + "</td>"
			+ "<td title='"+orderObj.city+"'>" + orderObj.city + "</td>"
			+ "<td title='"+orderObj.address+"'>" + orderObj.address + "</td>"
			+ "<td title='"+orderObj.country+"'>" + orderObj.country + "</td>"
			+ "<td title='"+orderObj.checkIn+"'>" + orderObj.checkIn + "</td>"
			+ "<td title='"+orderObj.checkOut+"'>" + orderObj.checkOut + "</td>"
			+ "<td title='"+orderObj.roomTypeId+"'>" + orderObj.roomTypeId + "</td>"
			+ "<td title='"+orderObj.capacityId+"'>" + orderObj.capacityId + "</td>"
			+ "<td title='"+orderObj.noOfRooms+"'>" + orderObj.noOfRooms + "</td>"
			+ "<td title='"+orderObj.roomPrice+"'>" + orderObj.roomPrice + "</td>"
			+ "<td title='"+orderObj.bookingStatus+"'>" + orderObj.bookingStatus + "</td>"
			/* + "<td title='"+orderObj.capacityId+"'>" + orderObj.capacityId + "</td>"
			+ "<td title='"+orderObj.capacityId+"'>" + orderObj.capacityId + "</td>"
			+ "<td title='"+orderObj.capacityId+"'>" + orderObj.capacityId + "</td>" */
			
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editRoom(userDetailsId){
	$("#id").val(userDetailsId);
	$("#roomTypeId").val(serviceUnitArray[id].name);
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
		});
	
}
function dataClear(){
	$("#id").val("");
	$("#Name").val("");
	$("#s").val("");
	$("#location").val("");
}
$("#pageName").text("Room Tariff");
$(".roomsTariff").addClass("active"); 
</script>