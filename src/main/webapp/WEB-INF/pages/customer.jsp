<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="#">Home</a></li>
               <li>Customer Master</li>
            </ol>
            <div class="clearfix"></div>
        <div class="container">
            <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Customers List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="panel-body collapse in">
                        <input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
                        <div class="table-responsive" id="tableId" >
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                                <thead>
                                	<tr><th>Customer ID</th><th>Customer Name</th><th>Supplier name</th><th>Mobile</th><th>Land Line</th><th>Authorized person</th><th>Contact person</th><th>Customer Type</th><th>Status</th><th>Action</th></tr>
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
                        <h4>Add Customers</h4>
                        <div class="options">
                        </div>
                    </div>
	                <form:form modelAttribute="customerForm" action="customerSave" class="form-horizontal" method="Post" >
	                <div class="panel-body">
	                	<form:hidden path="id"/>
                    	<div class="row">
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Customer Name<span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="customername" class="form-control validate" placeholder="Customer Name"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Mobile<span class="impColor">*</span></label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="mobile" class="form-control validate numericOnly" placeholder="Mobile"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Land Line</label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="landline" class="form-control  numericOnly" placeholder="Land Line"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Authorized Person<span class="impColor">*</span></label>
                    				<div class="col-md-6">
		                            	<form:input type="text" path="authorizedperson" class="form-control validate" placeholder="Authorized Person"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label">Contact Person<span class="impColor">*</span></label>
                    				<div class="col-md-6">
								      	<form:input type="text" path="contactperson" class="form-control validate" placeholder="Contact Person"/>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-4 control-label ">Customer Type <span class="impColor">*</span> </label>
                    				<div class="col-md-6">
		                            	<form:select path="customertype" class="form-control validate">
		                            		<form:option value="">-- Customer Type --</form:option>
									  		<form:option value="COMMERCIAL">COMMERCIAL</form:option>
									  		<form:option value="DOMESTIC">DOMESTIC</form:option>
									  		<form:option value="INDUSTIAL">INDUSTRIAL</form:option>
								  		</form:select>
								  	</div>
                    			</div>
                    		</div>
                    		<div class="col-md-12">
                    			<div class="form-group">
                    				<label for="focusedinput" class="col-md-2 control-label">Customer Address<span class="impColor">*</span></label>
                    				<div class="col-md-9">
		                            	<form:textarea type="text" path="customeraddress" class="form-control validate" placeholder="Customer Address" rows="5"></form:textarea>
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
var listOrders1 =${allObjects};

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
    	'<thead><tr><th>Customer ID</th><th>Customer Name</th><th>Customer Address</th><th>Mobile</th><th>Land Line</th><th>Authorized person</th><th>Contact person</th><th>Customer Type</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='customerDelete("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='customerDelete("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editCustomer("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td class='impFiled' title='"+orderObj.id+"'>" + orderObj.customerid + "</td>"
			+ "<td title='"+orderObj.customername+"'>" + orderObj.customername + "</td>"
			+ "<td title='"+orderObj.customeraddress+"'>" + orderObj.customeraddress + "</td>"
			+ "<td title='"+orderObj.mobile+"'>" + orderObj.mobile + "</td>"
			+ "<td title='"+orderObj.landline+"'>" + orderObj.landline + "</td>"
			+ "<td title='"+orderObj.authorizedperson+"'>" + orderObj.authorizedperson + "</td>"
			+ "<td title='"+orderObj.contactperson+"'>" + orderObj.contactperson + "</td>"
			+ "<td title='"+orderObj.customertype+"'>" + orderObj.customertype + "</td>"
			+ "<td title='"+orderObj.custStatus+"'>" + orderObj.custStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editCustomer(id) {
	$("#id").val(id);
	$("#customerid").val(serviceUnitArray[id].customerid);
	$("#customername").val(serviceUnitArray[id].customername);
	$("#customeraddress").val(serviceUnitArray[id].customeraddress);
	$("#mobile").val(serviceUnitArray[id].mobile);
	$("#landline").val(serviceUnitArray[id].landline);
	$("#authorizedperson").val(serviceUnitArray[id].authorizedperson);
	$("#contactperson").val(serviceUnitArray[id].contactperson);
	$("#customertype").val(serviceUnitArray[id].customertype);
	$("#status").val(serviceUnitArray[id].status);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function customerDelete(id,status) {
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
	}
	
	if(checkstr == true){
		$.ajax({
					type : "POST",
					url : "customerDelete.htm",
					data :"id="+id+"&status="+status,
					beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          }, 
					success: function (response) {
						 $.unblockUI();
		                	var resJson=JSON.parse(response);
		                	showTableData(resJson);
		                	//alert("Delete Sucessfully");
		                	//window.location.reload();
		                 window.location.reload();
		                 },
		                 
		             error: function (e) { 
		            	 	$.unblockUI();
							console.log(e);
		             }
				});
		$("#loadAjax").hide();
	}
}

function dataClear(){
	$("#id").val("");
	$("#customerid").val("");
	$("#customername").val();
	$("#customeraddress").val("");
	$("#mobile").val("");
	$("#landline").val("");
	$("#authorizedperson").val("");
	$("#contactperson").val("");
	$("#customertype").val("");
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
		
		$.fn.makeMultipartRequest('POST', 'inActiveCustomer', false,
				formData, false, 'text', function(data) {
			var resJson=JSON.parse(data);
            showTableData(resJson);
					console.log(resJson);
				});
		
}
$("#pageName").text("Customer Master");
$(".customer").addClass("active"); 

</script>