<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  


  

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
    
  
    
      <script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>
    
  
    
      <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css">
    
    <script type='text/javascript'>//<![CDATA[
// $(window).load(function(){
// // $('#outDate').datetimepicker();
// $('#outDate').datetimepicker({
// 		 format:"d-MMM-YYYY"
// });
// });//]]> 

$(function () {

	 $('#outDate').datetimepicker({        

	    useCurrent: false,
	    minDate: new Date(),
	    format: 'DD-MMM-YYYY hh:mm A',
	    showTodayButton: true,
	    sideBySide: true,
	    showClose: true,
	    showClear: true,
	    toolbarPlacement: 'top'

	  });
	});
</script>
<!-- Body starts heare -->
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="#">Home</a></li>
               <li>Truck Tracking</li>
            </ol>
            <div class="clearfix"></div>
        <div class="container">
            
            <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Truck Tracking List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
				<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input"
						onclick="inactiveData();" id="inActive"> <label
						class="form-check-label">Show Inactive</label>
					<div class="table-responsive" id="tableId">
						<table cellpadding="0" cellspacing="0" border="0"
							class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr>
									<th>Truck Number</th>
									<th>Driver Name</th>
									<th>In Date</th>
									<th>Location</th>
									<th>Reading (KM)</th>
									<th>Petrol Level</th>
									<th>Status</th>
									<th style="text-align: center;"></th>
								</tr>
							</thead>
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
                        <h4></h4>
                        <div class="options"></div>
                    </div>
                    <form:form class="form-horizontal" modelAttribute="TruckTrackingForm"  role="form" id="cylider-form" action="addTruckTrackCommingtoFactory" method="post">
                    <div class="panel-body">
                    <form:hidden path="id"/>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Truck Number <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:select path="truckId" class="form-control cylinderSize validate" onfocus="removeBorder(this.id)" onchange="getLpoNumber();">
								    	<form:option value="">-- Select Truck Number --</form:option>
								    	<form:options items="${trucks }"></form:options>
								    	</form:select>
								      <span class="hasError" id="sizeError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Driver Name<span class="impColor">*</span></label>
								    <div class="col-md-6">

								    	<form:input path="driverName" class="form-control validate"  placeholder="Driver Name"  onchange="removeBorder(this.id)"/>
								      	<span class="hasError" id="expirydateError"></span>
								    </div>
                    			</div>
                    		</div>
                    		
                    		<%-- <div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Truck Status <span class="impColor">*</span></label>
								    <div class="col-md-6">
								   	   <form:select path="truckStatus"  class="form-control validate" onfocus="removeBorder(this.id)" >
								    	<form:option value="">-- Select Truck Status --</form:option>
								    	<form:option value="Going Out From Factory">Going Out From Factory</form:option>
								    	<form:option value="Coming Into Factory">Coming Into Factory</form:option>
								    	</form:select>
								      	<span class="hasError" id="storeError"></span>
								    	<form:input path="location" value="" class="form-control validate onlyCharacters" placeholder="Location" />
								      	<span class="hasError" id="locationError"></span>
								    </div>
                    			</div>
                    		</div> --%>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">In Date<span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="outDate"  class="form-control validate "  placeholder="Out Date/In Date"  />
								      	<span class="hasError" id="lponumberError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Location <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	<form:input path="location" value="" class="form-control validate onlyCharacters" placeholder="Location" />
								      	<span class="hasError" id="ownercompanyError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Reading (KM) <span class="impColor">*</span></label>
								    <div class="col-md-6">
										<form:input path="ReadingKM" value="" class="form-control validate numericOnly" placeholder="Reading (KM)" />			                                
								      	<span class="hasError" id="colorError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Petrol Level <span class="impColor">*</span></label>
								    <div class="col-md-6">
								    	 <form:select path="PetrolLevel"  class="form-control validate" onfocus="removeBorder(this.id)" >
								    	<form:option value="">-- Select Petrol Level --</form:option>
								    	<form:option value="FULL">FULL</form:option>
								    	<form:option value="7/8">7/8</form:option>
								    	<form:option value="5/8">5/8</form:option>
								    	<form:option value="3/8">3/8</form:option>
								    	<form:option value="1/4">1/4</form:option>
								    	<form:option value="1/8">1/8</form:option>
								    	<form:option value="NIL">NIL</form:option>
								    </form:select>
								      	<span class="hasError" id="madeinError"></span>
								    </div>
                    			</div>
                    		</div>
                    		
                    		
                    	</div>	 
	                    <div class="panel-footer">
					      	<div class="row">
					      		<div class="col-sm-12">
					      			<div class="btn-toolbar text-center">
						      			<input type="submit" id="submit1" value="Submit" class="btn-primary btn"/>
						      			<input type="reset" value="Reset" class="btn-danger btn cancel"/>
					      			</div>
					      		</div>
					      	</div>
					      </div>
					</form:form>
					</div>
				      
			</div>
                    
                </div>
        
        </div> <!-- container -->

<script type='text/javascript' src='${baseurl }/js/jquery-ui.min.js'></script> 

<script type="text/javascript">

var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Truck Number</th><th>Driver Name</th><th>In Date</th><th>Location</th><th>Reading (KM)</th><th>Petrol Level</th><th>Status</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteTruckTracking("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteTruckTracking("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editTruckTracking("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
				+ "<td title='"+orderObj.trucknumber+"'>"+ orderObj.trucknumber + "</td>"
				+ "<td title='"+orderObj.driverName+"'>"+orderObj.driverName+ "</td>"
				+ "<td title='"+orderObj.outDate+"'>"+ orderObj.outDate + "</td>"
				+ "<td title='"+orderObj.location+"'>"+ orderObj.location + "</td>"
				+ "<td title='"+orderObj.readingKM+"'>"+ orderObj.readingKM+ "</td>"
				+ "<td title='"+orderObj.petrolLevel+"'>"+ orderObj.petrolLevel + "</td>"
				+ "<td title='"+orderObj.truckTrackingStatus+"'>"+ orderObj.truckTrackingStatus + "</td>"
				+ '<c:if test="${(cacheUserBean.roleId == 1)}">'
				+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>" 
				+ '</c:if>'
				+ "</tr >";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

var lpo = "";
function editTruckTracking(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#truckId").val(serviceUnitArray[id].truckId);
	$("#truckStatus").val(serviceUnitArray[id].truckStatus);
	$("#location").val(serviceUnitArray[id].location);
	$("#outDate").val(serviceUnitArray[id].outDate);
	$("#ReadingKM").val(serviceUnitArray[id].readingKM);
	$("#PetrolLevel").val(serviceUnitArray[id].petrolLevel);
	$("#driverName").val(serviceUnitArray[id].driverName);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteTruckTracking(id,status){
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
	    formData.append('truckStatus', "In");
		$.fn.makeMultipartRequest('POST', 'deleteTruckTracking', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
			window.location.reload();
		});
	}
}


$(function() {
// 	$("#outDate").appendDtpicker();
// 		dateFormat : "dd-M-yy",
// 		changeDate : true,
// 		changeMonth : true,
// 		changeYear : true
// 		format: 'Y/m/d H:i',
// 		formatTime: 'H:i',
// 		formatDate: 'Y/m/d'
// 	});
});
	

function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		
		var formData = new FormData();
		formData.append('status', status);
		 formData.append('truckStatus', "Coming into Factory");
		$.fn.makeMultipartRequest('POST', 'inActiveTruckTracking', false,
				formData, false, 'text', function(data) {
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
				});
}
 $("#pageName").text("Truck Coming into Factory ");
 $(".truckTracking1").addClass("active"); 
 
</script>