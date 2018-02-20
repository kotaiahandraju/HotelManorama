<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="#">Home</a></li>
		<li>Room Master</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Rooms List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables" id="example">
							<thead>	<tr><th>Room Type</th><th>Room/Adult</th><th>Max Child/Room</th><th>Room Number</th><th>Status</th><th></th></tr></thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				</div>
			</div>
		</div>
                    
		<div class="row" id="moveTo">
			<div class="col-md-12 col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Add Room</h4>
					</div>
					<form:form modelAttribute="roomForm" action="roomMasterSave" class="form-horizontal" method="Post" >
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="roomTypeId" class="col-md-4 control-label">Room Type <span class="impColor">*</span></label>
									<div class="col-md-7">
										<form:input path="roomTypeId" class="form-control validate" placeholder="room_type_id"/>
									</div>
                    			</div>
                    			<div class="form-group">
                    				<label for="capacityId" class="col-md-4 control-label">Room/Adult <span class="impColor">*</span></label>
                    				<div class="col-md-7">
	                    				<form:input path="capacityId" class="form-control validate" placeholder="capacity_id"/>
                    				</div>
                    			</div>
                    			<div class="form-group">
                    				<label for="maxChaild" class="col-md-4 control-label">Max Child/Room <span class="impColor">*</span></label>
                    				<div class="col-md-7">
		                            	<form:input  path="maxChaild" class="form-control numericOnly validate" placeholder="Max Child/Room"/>
								  	</div>
                    			</div>
								<div class="form-group">
                    				<label for="roomNumber" class="col-md-4 control-label">Room Number</label>
                    				<div class="col-md-7">
		                            	<form:input  path="roomNumber" class="form-control validate" placeholder="Room Number"/>
								  	</div>
                    			</div>
							</div>
						</div>
                    </div>
                    <div class="panel-footer">
				      	<div class="row">
				      		<div class="col-sm-12">
				      			<div class="btn-toolbar text-center">
					      			<input class="btn-primary btn" type="submit" value="Submit" id="submit1"/>
					      			<input class="btn-danger btn cancel" type="reset" value="Reset" />
				      			</div>
				      		</div>
				    	</div>
					</div>
         			</form:form>				    
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
    	'<thead>	<tr><th>Room Type</th><th>Room/Adult</th><th>Max Child/Room</th><th>Room Number</th><th>Status</th><th></th></tr></thead>'+
    	"<tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteItem("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteItem("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editItem("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.roomTypeId+"'>" + orderObj.roomTypeId + "</td>"
			+ "<td class='impFiled' title='"+orderObj.capacityId+"'>" + orderObj.capacityId + "</td>"
			+ "<td title='"+orderObj.maxChaild+"'>" + orderObj.maxChaild + "</td>"
			+ "<td title='"+orderObj.roomNumber+"'>" + orderObj.roomNumber + "</td>"
			+ "<td title='"+orderObj.roomStatus+"'>" + orderObj.roomStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editItem(id){
	$("#id").val(id);
	$("#roomTypeId").val(serviceUnitArray[id].roomTypeId);
	$("#capacityId").val(serviceUnitArray[id].capacityId);
	$("#maxChaild").val(serviceUnitArray[id].maxChaild);
	$("#roomNumber").val(serviceUnitArray[id].roomNumber);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteItem(id,status){
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
		$.fn.makeMultipartRequest('POST', 'roomDelete', false, formData, false, 'text', function(data){
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
		
		$.fn.makeMultipartRequest('POST', 'inActiveRoom', false,
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
$("#pageName").text("Room Master");
$(".rooms").addClass("active"); 
</script>