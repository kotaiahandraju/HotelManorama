<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

	<div class="clearfix"></div>
	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Cylinder Move to Filling Station</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<form:form commandName="fillingStationForm">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="panel panel-primary">
					
					<div class="panel-body">
						<div class="row">
						  	<div class="col-md-4">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Store <span class="impColor">*</span></label>
									<div class="col-md-8">
						        		<form:select path="store" class="form-control validate" onchange="onChangeStoreAndCylinderType();" onfocus="removeBorder(this.id)">
						        			<form:option value="">-- Select Store --</form:option>
						        			<form:options items="${stores}"></form:options>
						        		</form:select>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Cylinder Type <span class="impColor">*</span></label>
									<div class="col-md-8">
						        		<form:select path="cylinderType" class="form-control " onchange="onChangeStoreAndCylinderType();" onfocus="removeBorder(this.id)">
						        			<form:options items="${cylinderTypes}"></form:options>
						        		</form:select>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label numericOnly">Quantity <span class="impColor">*</span></label>
									<div class="col-md-8">
						        		<form:input type="text" path="quantity" class="form-control " placeholder="Quantity"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
				      	<div class="row">
				      		<div class="col-sm-12">
				      			<div class="btn-toolbar pull-right">
					      			<input type="button" class="btn btn-primary" value="Search" onclick="searchData();">
					      			<button type="button" onclick="window.location.reload()" class="btn btn-danger">Reset</button>
				      			</div>
				      		</div>
				    	</div>
					</div>
				</div>
				<!-- <div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-6">
				        		<p><input type="checkbox" id="parent" style="cursor: pointer;"/> <label for="parent" style="cursor: pointer;font-weight: bolder;">Check/Uncheck All</label></p>
							</div>
						</div>
					</div>
				</div> -->
				<div class="row">
					<div class="col-md-8">
						<div class="panel panel-primary">
							<div class="panel-heading">
		                    	<h4>Cylinders List</h4>
								<div class="options">   
									<a href="javascript:void(0);" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
								</div>
							</div>
							<div class="panel-body collapse in">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<div class="col-md-6">
								        		<p><input type="checkbox" id="parent" style="cursor: pointer;"/> <label for="parent" style="cursor: pointer;font-weight: bolder;">Check/Uncheck All</label></p>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive" id="tableId">
									<table class="table table-striped table-bordered datatables" id="example">
										<thead>
											<tr><th>Cylinder ID</th>
											<th>Store</th>
											<th>Size</th></tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>&nbsp;</h4>
							</div>
							<div class="panel-body">
								<div class="row">
<!-- 									<div class="col-md-12"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label for="focusedinput" class="col-md-3 control-label">Cylinders <span class="impColor">*</span></label> -->
<!-- 											<div class="col-md-6"> -->
<!-- 								        		<div id="displayCylinders"></div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									<div class="col-md-12">
										<div class="form-group">
											<label for="focusedinput" class="col-md-6 control-label">Select Filling Station <span class="impColor">*</span></label>
											<div class="col-md-6">
								        		<form:select path="stationname" class="form-control validate" onfocus="removeBorder(this.id)">
								        			<form:options items="${fillingstation}"></form:options>
								        		</form:select>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel-footer">
						      	<div class="row">
						      		<div class="col-md-12">
						      			<div class="btn-toolbar pull-right">
							      			<input type="button" class="btn btn-primary" value="Move To Filling Station" onclick="movetofillingStation()">
<!-- 							      			<button type="button" onclick="window.location.reload()" class="btn btn-danger">Reset</button> -->
						      			</div>
						      		</div>
						    	</div>
							</div>
						</div>
					</div>
				</div>
         	</div>
		</div>
		</form:form>
	</div> <!-- container -->
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
			+ '<thead><tr><th>Cylinder ID</th><th>Store</th><th>Size</th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
				+ "<td title='"+orderObj.cylinderid+"'><input class='child' name='chkbox' type='checkbox' style='width: 21px;' value='"+orderObj.id+"' >"+ orderObj.cylinderid + "</td>"
				+ "<td title='"+orderObj.storename+"'>"+ orderObj.storename + "</td>"
				+ "<td title='"+orderObj.name+"'>"+ orderObj.name + "</td>"
				+ "</tr >";
		$(tblRow).appendTo("#tableId table tbody");
					
		 $('.child').click(function() {
			var cylenderId = [];
			$('#tableId :checkbox:checked').each(function(i){
				cylenderId[i] = $(this).val();
			}); 
			$("#displayCylinders").text(cylenderId);
//			alert(cylenderId);
			if ($('.child:checked').length == $('.child').length) {
				$('#parent').prop('checked', true);
			} else {
				$('#parent').prop('checked', false);
			}
		});
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function movetofillingStation(){
	 var cylenderId = [];
     $('#tableId :checkbox:checked').each(function(i){
    	 cylenderId[i] = $(this).val();
     }); 
     if(cylenderId.length == 0){
    	 alert("Please Select Cylinder");
    	 return false;
     }
     var stationname = $("#stationname").val();
     if(stationname == null || stationname == "undefined" || stationname ==""){
    	 alert("Please Select Filling Station");
    	 return false;
     }
     //alert(cylenderId);
     var formData = new FormData();
     formData.append("fillingStation",stationname);
     formData.append("cylindetId",cylenderId);
     formData.append("cylinderStatus",2);
     $.fn.makeMultipartRequest('POST', 'updateCylinderStatus', false,
 			formData, false, 'text', function(data){
    	 var jsonobj = $.parseJSON(data);
 		alert(jsonobj.msg);
 		window.location.reload();
 	});
     
}

function deleteCylinder(id){
	var checkstr =  confirm('Are you sure you want to delete this?');
	if(checkstr == true){
	var formData = new FormData();
     formData.append('id', id);
	$.fn.makeMultipartRequest('POST', 'deleteCylinder', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		alert(jsonobj.message);
		var alldata = jsonobj.allOrders1;
		console.log(jsonobj.allOrders1);
		displayTable(alldata);
	});
	}
	
}

function searchData(){
	var store=$("#store").val();
	var quantity=$("#quantity").val();
	var cylinderType=$("#cylinderType").val();
	 var formData = new FormData();
	 
	 if(store == null || store == "undefined" || store ==""){
    	 alert("Please Select  Store");
    	 return false;
     }
	 
	 if(quantity == null || quantity == "undefined" || quantity ==""){
    	 alert("Please Select Quantity");
    	 return false;
     }
	 
	 if(cylinderType == null || cylinderType == "undefined" || cylinderType ==""){
    	 alert("Please Select cylinderType");
    	 return false;
     }
	
	$.ajax({
		type : "POST",
		url : "searchCylinderMoveToFilling.htm",
		data :"store="+store+"&quantity="+quantity+"&cylinderType="+cylinderType,
		 beforeSend : function() {
             $.blockUI({ message: 'Please wait' });
          },
		success: function (response) {
            	 $.unblockUI();
             if(response != null ){
            	 var resJson=JSON.parse(response);
            	 displayTable(resJson);
            	
            	}
             //window.location.reload();
             },
         error: function (e) { 
        	 $.unblockUI();
				console.log(e);
         }
	});
	
}

function onChangeStoreAndCylinderType(){
	var store=$("#store").val();
	var quantity=$("#quantity").val();
	var size=$("#cylinderType").val();
	 var formData = new FormData();
	 
	 if(store == null || store == "undefined" || store ==""){
    	// alert("Please Select  Store");
    	 return false;
     }
	 
	 if(size == null || size == "undefined" || size ==""){
    	// alert("Please Select cylinderType");
    	 return false;
     }
	
	$.ajax({
		type : "POST",
		url : "onChangeStoreAndCylinderType.htm",
		data :"store="+store+"&size="+size,
		 beforeSend : function() {
             $.blockUI({ message: 'Please wait' });
          },
		success: function (response) {
            	 $.unblockUI();
             if(response != null ){
            	// var resJson=JSON.parse(response);
            	 $("#quantity").val(response);
            	 //displayTable(resJson);
            	
            	}
             //window.location.reload();
             },
         error: function (e) { 
        	 $.unblockUI();
				console.log(e);
         }
	});
	
}



$("#pageName").text("Cylinder Move to Filling Station");
// $(".transactions").addClass("open");
$(".cylinderMovetofillingStation").addClass("active");




// + '<c:if test="${(cacheGuest.roleId == 6)}">'
// + insert_str
// + '</c:if>	

</script>