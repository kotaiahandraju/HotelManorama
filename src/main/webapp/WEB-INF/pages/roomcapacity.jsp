<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="container">


<h2>Room Capacity</h2>
         
         <ol class="breadcrumb">
         <li><a href="#">Rooms</a></li>
         <li>Room Capacity</li>
         
         
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
          <h3 class="panel-title">Room Capacity List</h3>
          <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-down"></i></span>
        </div>
        <div class="panel-body">
        
        <div class="col-md-12"><input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
</div><br>
      <div class="col-md-12">
        <div id="tableId">
        <table class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr>
									<th>Room Capacity</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
        </div>
        </div>
      </div>
    </div>
    </div></div>
<div class="clearfix"></div>
      <div class="row">
    <div class="col-md-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title" id="moveTo">Room Capacity</h3>
         
        </div>
        <div class="panel-body">
       <form:form modelAttribute="roomTypeForm" action="addroomcapacity" class="form-horizontal" method="Post" >
      <div class="col-md-12">
     <div class="col-md-6">
								<div class="form-group">
									<input id="id" name="id" type="hidden" value="0">
									<span for="roomTypeId" class="col-md-4 control-label">Room Capacity <span class="impColor">*</span></span>
									<div class="col-md-7">
									<input id="name" name="name" placeholder="Room Capacity" class="form-control validate " maxlength="10" type="text" value="" >
									</div>
                    			</div>
                    			
							</div>
        </div><br><br><br>
        <div class="col-sm-12">
        <div class="col-sm-7">
        
				      			<div class="btn-toolbar" 
         style="float:right;">
					      			<input class="btn-primary btn" type="submit" value="Submit" id="submit1">
					      			<input class="btn-danger btn cancel" type="reset" value="Reset">
				      			</div>
				      		</div></div></form:form>
      </div>
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
    	'<thead><tr><th>Room Capacity </th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
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
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.roomcapacitystatus+"'>" + orderObj.roomcapacitystatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editItem(id){
	$("#id").val(id);
	$("#name").val(serviceUnitArray[id].name);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteItem(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
		 $('#inActive').prop('checked', false);
	}
	if(checkstr == true){
		$.ajax({
			type : "POST",
			url : "deleteroomcapacity.htm",
			data :"id="+id+"&status="+status,
			beforeSend : function() {
				$.blockUI({ message: 'Please wait' });
			},
			success: function (response) {
				if(response != null ){
					$.unblockUI();
		        	var resJson=JSON.parse(response);
		            showTableData(resJson.allOrders1);
		            tooltip1();  
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
		
		$.fn.makeMultipartRequest('POST', 'inactiveroomcapacity', false,
				formData, false, 'text', function(data) {
			if(data != ''){
				var resJson=JSON.parse(data);
	            showTableData(resJson);
						console.log(resJson);
						 tooltip1();
			}else{
				//alert('Inactive Data Empty...! ');
				showTableData(data);
			}
			
				});
	
}

$("#pageName").text("Room Type");
$(".roomcapacity").addClass("active"); 
</script>