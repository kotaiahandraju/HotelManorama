<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Filling station</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Filling Stations List</h4>
						<div class="options">
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
						<div class="table-responsive" id="tableId">
							<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
								<thead><tr><th>Station Number</th><th>Station Name</th><th>Opening Balance(in KG's)</th><th>UsedGas</th><th>Closing Balance(in KG's)</th><th>Filling Machines</th><th>Quantity</th><th>Total Capacity(in KG's)</th><th>Status</th><th></th></tr></thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		<a class="btn btn-info btn-lg"  onclick="PopupFillingStation();">Add Gas</a><br><br> -->
		<div class="row" id="moveTo">
			<div class="col-md-12 col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Add Filling Station</h4>
						<div class="pull-right">
							<a class="btn btn-danger" onclick="PopupFillingStation();">Add Gas</a>
						</div>
					</div>
					<form:form class="form-horizontal" 	modelAttribute="fillingStationForm" role="form" id="fillingstation-form" action="addfillingstation" method="post">
					<div class="panel-body">
						<div class="row">
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<form:hidden path="id"/>
									<label for="focusedinput" class="col-md-6 control-label">Station Number <span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:input path="unitpoint" class="form-control " placeholder="Station Number" />	
										<span class="hasError" id="unitpointError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Station Name <span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:input path="stationname" class="form-control validate onlyCharacters" placeholder="Station Name" />	
										<span class="hasError" id="stationnameError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Opening Balance (Gas in KG's) <span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:input path="gasavailability" class="form-control validate numericOnly" placeholder="Opening Balance (Gas in KG's)" />	
										<span class="hasError" id="gasavailabilityError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Number of Cylinders filled at a time<span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:input path="quantity" type="text" class="form-control validate numericOnly" placeholder="Number of Cylinders filled at a time" />	
										<span class="hasError" id="quantityError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Filling Station Total Capacity (Gas in KG's) <span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:input path="gascapacity" class="form-control validate numericOnly" placeholder="Total Capacity (Gas in KG's) " />	
										<span class="hasError" id="gascapacityError"></span>
								    </div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Filling Machines <span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:input path="numberoffillingmachines"	class="form-control validate numericOnly" placeholder="Filling Machines" />	
										<span class="hasError" id="numberoffillingmachinesError"></span>
								    </div>
                    			</div>
                    		</div>
                    	</div>
                    		
<!-- Modal Starts here-->
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Gas</h4>
        	</div>
        	<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
                    	<div class="form-group">
                    		<label for="focusedinput" class="col-md-4 control-label">Filling Station Name <span class="impColor">*</span></label>
                    		<div class="col-md-6">
								<form:select path="stationnames" class="form-control" onfocus="removeBorder(this.id)" >
									<form:option value="">-- Select Filling Station  --</form:option>
									<form:options items="${stationnames}"></form:options>
								</form:select>
							</div>
                    	</div>
                    </div>
					<div class="col-md-12">
                    	<div class="form-group">
                    		<label for="focusedinput" class="col-md-4 control-label">Adding Gas(in KG's) <span class="impColor">*</span></label>
                    		<div class="col-md-6">
								<input name="gasavail" id="gasavail" class="form-control numericOnly" placeholder="Adding Gas(in KG's)" onblur="removeBorder(this.id)"/>
							</div>
                    	</div>
                    </div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<div class="col-md-offset-4 col-md-6">
						      	<input type="button" value="Add" class="btn-primary btn" onclick="addGas();" />
						      	<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
							</div>
				      	</div>
					</div>
				</div>
			</div>
        	<!-- <div class="modal-footer">
          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	</div> -->
      	</div>
    </div>
</div>
<!-- Modal Ends here-->

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
	</div>
			<!-- container -->


</body>
<%-- <script type='text/javascript' src='${baseurl }/js/custemValidation.js'></script>  --%>
<script>
</script>
<script type="text/javascript">

/* $(document).ready(function() {
	 var table = $('#example').DataTable();
	  
	 $('#example tbody').on('click', 'tr', function () {
	     var data = table.row( this ).data();
	     alert( 'You clicked on '+data[0]+'\'s row' );
	 } );
}); */


var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Station Number</th><th>Station Name</th><th>Opening Balance(in KG\'s)</th><th>UsedGas(in KG\'s)</th><th>Closing Balance(in KG\'s)</th><th>Filling Machines</th><th>Quantity</th><th>Total Capacity(in KG\'s)</th><th>Status</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteCylinder("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteCylinder("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editCylinder("	+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr>"
			+ "<td title='"+orderObj.unitpoint+"'>"+ orderObj.unitpoint+ "</td>"
			+ "<td title='"+orderObj.stationname+"'>"+ orderObj.stationname + "</td>"
			+ "<td class='impFiled' title='"+orderObj.gasavailability+"'>"+ orderObj.gasavailability + "</td>"
			+ "<td title='"+orderObj.usedGas+"'>"+ orderObj.usedGas + "</td>" 
			+ "<td title='"+orderObj.closingBalanceGas+"'>"+ orderObj.closingBalanceGas+ "</td>"
			+ "<td title='"+orderObj.numberoffillingmachines+"'>"+ orderObj.numberoffillingmachines + "</td>"
			+ "<td title='"+orderObj.quantity+"'>"+ orderObj.quantity + "</td>"
			+ "<td title='"+orderObj.gascapacity+"'>"+ orderObj.gascapacity + "</td>" 
			+ "<td title='"+orderObj.fillingStatus+"'>"+ orderObj.fillingStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>" 
			+ "</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
	
}


function editCylinder(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#gasavailability").val(serviceUnitArray[id].gasavailability);
	$("#gasavailability").prop('readonly',true);
	$("#numberoffillingmachines").val(serviceUnitArray[id].numberoffillingmachines);
	$("#quantity").val(serviceUnitArray[id].quantity);
	$("#gascapacity").val(serviceUnitArray[id].gascapacity);
	$("#availablegas").val(serviceUnitArray[id].availablegas);
	
	$("#stationname").val(serviceUnitArray[id].stationname);
	$("#unitpoint").val(serviceUnitArray[id].unitpoint);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteCylinder(id,status){
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
		$.fn.makeMultipartRequest('POST', 'deletefillingstation', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			window.location.reload();
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
		});
	}
}
function PopupFillingStation() {
	$("#myModal").modal();
	
}

function addGas() {
	
	var stationId =$("#stationnames").val();
	var newGasavail=$("#gasavail").val();
	var oldBal =serviceUnitArray[stationId].closingBalanceGas;
	var closedgas= parseInt(oldBal)+parseInt(newGasavail);
 	//alert(closedgas);
	if((stationId == null || stationId == "" || stationId == "undefined" || newGasavail == null || newGasavail == "" || newGasavail == "undefined"))
	{
	 	if(stationId == null || stationId == "" || stationId == "undefined" ){
		 	$('#stationnames').css('border-color','#cc0000');
			$('#stationnames').css('color','#cc0000');
			$('#stationnames').addClass('placeholder-style your-class');
			return false;
	 	}else  if(newGasavail == null || newGasavail == ""){
	 		$('#gasavail').css('border-color','#cc0000');
	 		$('#gasavail').css('color','#cc0000');
	 		$('#gasavail').attr('placeholder','Please Enter Gas');
	 		$('#gasavail').addClass('placeholder-style your-class');
	 		return false;
	 	}
	}
	else{
		$.ajax({
			type : "POST",
			url : "updateGas.htm",
			data :"stationId="+stationId+"&newGasavail="+newGasavail+"&closedgas="+closedgas,
			beforeSend : function() {
            	$.blockUI({ message: 'Please wait' });
          	}, 
			success: function (response) {
				$.unblockUI();
             	if(response != null ){
            	//var resJson=JSON.parse(response);
            	//showTableData(resJson);
            	//alert("Delete Sucessfully");
            	//window.location.reload();
            	}
             	window.location.reload();
			},
         	error: function (e) { 
        	 	$.unblockUI();
				console.log(e);
         	}
		});
	}
}

function validate(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
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
		
		$.fn.makeMultipartRequest('POST', 'inActiveFillingStation', false,
				formData, false, 'text', function(data) {
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			displayTable(alldata);
			console.log(jsonobj.allOrders1);
				});
		
}
$("#pageName").text("Filling Station Master");
$(".fillingStation").addClass("active"); 
</script>