<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<div class="container">


<h2 style="margin-top:0px;">Room Occupation</h2>
         
         <ol class="breadcrumb">
         <li><a href="dashboard.html">Dashboard</a></li>
         <li><a href="#">Rooms</a></li>
         <li>Room Occupation</li>
         
         
         </ol>        
         
       <div class="row">
    <div class="col-md-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Room Occupation List</h3>
          <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-down"></i></span>
        </div>
        <div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr>
									<th>Name </th>
									<th>Number of Adult</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
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
          <h3 class="panel-title">Room Occupation</h3>
         
        </div>
        <form:form modelAttribute="capacityForm" action="addCapacity" class="form-horizontal" method="Post" >
        <div class="panel-body">
        
       
      <div class="col-md-12">
      <div class="col-md-6">
								<div class="form-group">
									<input id="id" name="id" type="hidden" value="0">
									<span for="name" class="col-md-4 control-label">Room Capacity Title<span class="impColor">*</span></span>
									<div class="col-md-7">
										<input id="name" name="name" placeholder="Room Capacity Title" class="form-control validate" type="text" value="">
									</div>
                    			</div>
							</div>
     <div class="col-md-6">
								<div class="form-group">
									<input id="id" name="id" type="hidden" value="0">
									<span for="numberOfAdult" class="col-md-4 control-label">Number of Adult<span class="impColor">*</span></span>
									<div class="col-md-7">
										<input id="numberOfAdult" name="numberOfAdult" placeholder="Number of Adult" class="form-control numericOnly validate" type="text" value="">
									</div>
                    			</div>
							</div>
        </div><br><br><br>
        <div class="col-sm-12">
				      			<div class="btn-toolbar" 
         style="float:right;">
					      			<input class="btn-primary btn" type="submit" value="Submit" id="submit1">
					      			<input class="btn-danger btn cancel" type="reset" value="Reset">
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
    	'<thead><tr><th>Room Capacity Title </th><th>Number of Adult</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteRoomCapacity("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteRoomCapacity("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editRoomCapacity("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.numberOfAdult+"'>" + orderObj.numberOfAdult + "</td>"
			+ "<td title='"+orderObj.Status+"'>" + orderObj.capacitystatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editRoomCapacity(id){
	$("#id").val(id);
	$("#name").val(serviceUnitArray[id].name);
	$("#numberOfAdult").val(serviceUnitArray[id].numberOfAdult);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteRoomCapacity(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
	}
	if(checkstr == true){
		$.ajax({
			type : "POST",
			url : "deleteCapacity.htm",
			data :"id="+id+"&status="+status,
			beforeSend : function() {
				$.blockUI({ message: 'Please wait' });
			},
			success: function (response) {
				if(response != null ){
					$.unblockUI();
		        	var resJson=JSON.parse(response);
		        	 $('.activate').attr('data-toggle','tooltip');
						$('.activate').attr('data-original-title','Activate');
						$('.deactivate').attr('data-toggle','tooltip');
						$('.deactivate').attr('data-original-title','Deactivate');
		            showTableData(resJson.allOrders1);
		           
		            //window.location.reload();
				}
		       // window.location.reload();
			},
			error: function (e) { 
		    	$.unblockUI();
				console.log(e);
			}
		});
	}
}
function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
		$('#inActive').prop('checked', false);
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveCapacity', false,
				formData, false, 'text', function(data) {
			if(data != null && data != ''){
				var resJson=JSON.parse(data);
	            showTableData(resJson);
						console.log(resJson);
			}else{
				showTableData(data);
			}
			$('.activate').attr('data-toggle','tooltip');
			$('.activate').attr('data-original-title','Activate');
			$('.deactivate').attr('data-toggle','tooltip');
			$('.deactivate').attr('data-original-title','Deactivate');
				});
		
	
}
function dataClear(){
	$("#id").val("");
	$("#Name").val("");
	$("#s").val("");
	$("#location").val("");
}
$("#pageName").text("Room Capacity");
$(".roomCapacity").addClass("active"); 
</script>