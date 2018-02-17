<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<style>

.dataTables_filter {
display: none; 
}
</style>
 <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<!--  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"> -->
	<div class="clearfix"></div>
	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Cylinder Move to Truck</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
			<form:form commandName="fillingStationForm">
				<div class="row">
				
				<div class="panel panel-primary">
				<div class="panel-body">
				
				  	<div class="col-md-4">
						<div class="form-group">
							<label for="focusedinput" class="col-md-5 control-label">Filling Station <span class="impColor">*</span></label>
							<div class="col-md-7">
				        		<form:select path="stationname" class="form-control " onchange="onChangeCylinderMovetoTruck();" onfocus="removeBorder(this.id)">
				        			<form:option value="">-- Select Filling Station --</form:option>
				        			<form:options items="${fillingstation}"></form:options>
				        		</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="focusedinput" class="col-md-5 control-label">Cylinder Type <span class="impColor">*</span></label>
							<div class="col-md-7">
				        		<form:select path="cylinderType" class="form-control " onchange="onChangeCylinderMovetoTruck();" onfocus="removeBorder(this.id)">
				        			<form:options items="${cylinderTypes}"></form:options>
				        		</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="focusedinput" class="col-md-4 control-label">Quantity <span class="impColor">*</span></label>
							<div class="col-md-7">
				        		<form:input type="text" path="quantity" class="form-control numericOnly" placeholder="Quantity"/>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<div class="col-md-12">
				        		<input type="button" class="btn btn-primary" value="Search" onclick="searchData();">
							</div>
						</div>
					</div>
					
					
					
					
					</div>
					</div>
				</div>
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		<div class="row">
					<div class="col-md-8">
						
						<div class="panel panel-primary">
							<div class="panel-heading">
		                    	<h4>Cylinders List</h4>
								<div class="options">   
									<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
								</div>
							</div>
							<div class="panel-body collapse in">
							<p><input type="checkbox" id="parent" style="cursor: pointer;"/> <label for="parent" style="cursor: pointer;">Select All/UnSelect All</label></p>
								<div class="table-responsive" id="tableId">
									<table class="table table-striped table-bordered datatables" id="example">
										<thead>
											<tr><th>Cylinder ID</th><th>Store</th><th>Size</th></tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div>
						
						<div class="panel panel-primary">
							<div class="panel-heading">
		                    	<h4>Select Truck</h4>
								<div class="options">   
									<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
								</div>
							
							</div>
							
							<div class="panel-body">
						
						
							<div class="col-md-12">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Select Truck <span class="impColor">*</span></label>
									<div class="col-md-8">
						        		<form:select path="truckId" class="form-control validate" onfocus="removeBorder(this.id)">
						        			<form:options items="${trucks}"></form:options>
						        		</form:select>
									</div>
								</div>
							</div>
						
							</div>
							
							<div class="panel-footer" style="text-align:right;">
							<input type="button" class="btn btn-primary" value="Move Truck" onclick="movetoTruck()">
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<div class="col-md-offset-3 col-md-6" style="padding-top: 6px;">
						        		
									</div>
								</div>
							</div>
							
							</div></div>
						</div>
					</div>
				</div>
				</form:form>
         	</div>
		</div>
	</div> <!-- container -->
<div id="chart-3"></div> 
 <script type='text/javascript' src="${baseurl }/js/jqBarGraph.1.1.js"></script>

<script type="text/javascript">


$(document).ready(function() {
	  $("#parent").click(function() {
	    $(".child").prop("checked", this.checked);
	    var cylenderId = [];
        $('#tableId :checkbox:checked').each(function(i){
       	 cylenderId[i] = $(this).val();
        }); 
        $("#displayCylinders").text(cylenderId);
//         alert(cylenderId);
	    $('.child').click(function() {
	    	 var cylenderId = [];
	         $('#tableId :checkbox:checked').each(function(i){
	        	 cylenderId[i] = $(this).val();
	         }); 
	         $("#displayCylinders").text(cylenderId);
// 	         alert(cylenderId);
	        if ($('.child:checked').length == $('.child').length) {
	          $('#parent').prop('checked', true);
	        } else {
	          $('#parent').prop('checked', false);
	        }
	      });
	  });
});
/* var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
} */
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Cylinder ID</th><th>stationname</th><th>Size</th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
					serviceUnitArray[orderObj.id] = orderObj;
					var tblRow = "<tr >"
							+ "<td title='"+orderObj.cylinderid+"'><input class='child' name='chkbox' type='checkbox' style='width: 21px;' value='"+orderObj.id+"' >"+ orderObj.cylinderid + "</td>"
							+ "<td title='"+orderObj.stationname+"'>"+ orderObj.stationname + "</td>"
							+ "<td title='"+orderObj.name+"'>"+ orderObj.name + "</td>"
							+ "</tr >";
					$(tblRow).appendTo("#tableId table tbody");
					
					 $('.child').click(function() {
				    	 var cylenderId = [];
				         $('#tableId :checkbox:checked').each(function(i){
				        	 cylenderId[i] = $(this).val();
				         }); 
				         $("#displayCylinders").text(cylenderId);
//			 	         alert(cylenderId);
				        if ($('.child:checked').length == $('.child').length) {
				          $('#parent').prop('checked', true);
				        } else {
				          $('#parent').prop('checked', false);
				        }
				      });
					});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function movetoTruck(){
	 
	var cylenderId = [];
		$('#tableId :checkbox:checked').each(function(i) {
			cylenderId[i] = $(this).val();
		});
		if (cylenderId.length == 0) {
			alert("Please Select Cylinder");
			return false;
		}
		var truckId = $("#truckId").val();
		if (truckId == null || truckId == "undefined" || truckId == "") {
			alert("Please Select truckId");
			return false;
		}
		// alert(cylenderId);
		var formData = new FormData();
		formData.append("truckId", truckId);
		formData.append("CylindetId", cylenderId);
		formData.append("cylinderStatus", 5);
		$.fn.makeMultipartRequest('POST', 'updateCylinderStatus3', false,
				formData, false, 'text', function(data) {
					var jsonobj = $.parseJSON(data);
					alert(jsonobj.msg);
					window.location.reload();
				});

	}

	function deleteCylinder(id) {
		var checkstr = confirm('Are you sure you want to delete this?');
		if (checkstr == true) {
			var formData = new FormData();
			formData.append('id', id);
			$.fn.makeMultipartRequest('POST', 'deleteCylinder', false,
					formData, false, 'text', function(data) {
						var jsonobj = $.parseJSON(data);
						alert(jsonobj.message);
						var alldata = jsonobj.allOrders1;
						console.log(jsonobj.allOrders1);
						displayTable(alldata);
					});
		}

	}

	function searchData() {
		var stationname = $("#stationname").val();
		var quantity = $("#quantity").val();
		var cylinderType = $("#cylinderType").val();
		if (stationname == null || stationname == "undefined" || stationname == "") {
			alert("Please Select Stationname");
			return false;
		}
		if (quantity == null || quantity == "undefined" || quantity == "") {
			alert("Please Enter Quantity");
			return false;
		}
		if (cylinderType == null || cylinderType == "undefined" || cylinderType == "") {
			alert("Please Select CylinderType");
			return false;
		}
		var formData = new FormData();
		formData.append('stationname', stationname);
		formData.append('quantity', quantity);
		formData.append('cylinderType', cylinderType);
		$.fn.makeMultipartRequest('POST', 'searchTruckStatus', false, formData,
				false, 'text', function(data) {
					var jsonobj = $.parseJSON(data);
					var alldata = jsonobj.allOrders1;
					console.log(jsonobj.allOrders1);
					displayTable(alldata);
				});
	}
	function onChangeCylinderMovetoTruck() {
		var stationname = $("#stationname").val();
		var size = $("#cylinderType").val();
		var formData = new FormData();
		formData.append('stationname', stationname);
		formData.append('size', size);
		$.fn.makeMultipartRequest('POST', 'onChangeCylinderMovetoTruck', false,
				formData, false, 'text', function(data) {
					$("#quantity").val(data);
				});
	}

	$("#pageName").text("Cylinder Move to Truck");
	// $(".transactions").addClass("open");
	$(".cylinderMovetoTruck").addClass("active");
	
	
			/* var data=[];
			var sss;
	$(function(){
		var listOrders1 = [{"x":10,"y":8,"z":15,"label":"January 2018"},{"x":15,"y":18,"z":10,"label":"Febuary 2018"}];
		var arra=[];
		$.each(listOrders1, function(v,k){
			var axsis=[];
			data=[k.x,k.y,k.z];
			data='[['+data+'],'+k.label+']';
// 			console.log(data);
			arra.push(data);
		});
		 sss=arra.join(',');
		console.log(arra.join(','));
	});
	
	arrayOfData1 = new Array(
			sss
			);
	$('#chart-3').jqBarGraph({data: arrayOfData1,
		colors: ['#3D0017','#6B0E1D','#AB2522'],
		legends: ['800x600','1024x768','Higher'],
		legend: true,
		width: 500,
		color: '#ffffff',
		type: 'multi',
		postfix: '%',
		title: '<h3>Browser Display Statistics <br /><small>multi bar graph</small></h3>'
	}); */
</script>