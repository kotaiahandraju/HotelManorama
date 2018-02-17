<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Expense Tracker</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Expense Tracker Details</h4>
						<div class="options">
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
						<div class="table-responsive" id="tableId">
							<table class="table table-striped table-bordered datatables" id="example">
								<thead>
									<tr>
										<th>Account Head</th><th>Expense Amount (AED)</<th>Date of Expense</th><th>Item description</th>
										<th>Payment Type</th><th>Remarks</th><th></th>
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
						<h4>Expense Tracker </h4>
					</div>
					<form:form class="form-horizontal" modelAttribute="expensiveTrackerForm" role="form" id="expensiveTrackerForm-form" action="expenseTrackerSave" method="post">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<form:hidden path="id" />
									<label class="col-sm-4 control-label required">Account Head <span class="impColor">*</span></label>
									<div class="col-sm-6">
<%-- 										<form:input path="accountHead" class="form-control validate" autocomplete="off" placeholder="Account Head" required="required" /> --%>
										<form:select path="accountHead" class="form-control  validate" onfocus="removeBorder(this.id)">
											<form:option value="" selected="selected" disabled="disabled">-- Select Account Head --</form:option>
											<form:option value="Miscellaneous" >Miscellaneous</form:option>
											<form:option value="Operating" >Operating</form:option>
											<form:option value="Workshop" >Workshop</form:option>
											<form:option value="Recovery" >Recovery</form:option>
										</form:select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-sm-4 control-label required"> Expense Amount (AED) <span class="impColor">*</span></label>
									<div class="col-sm-6">
										<form:input path="amount" class="form-control validate numericOnly" autocomplete="off" placeholder="Expense  Amount (AED)" />
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Date of Expense <span class="impColor">*</span></label>
									<div class="col-sm-6">
										<form:input path="dateOfExpense" class="form-control validate" autocomplete="off" placeholder="Date of Expense" required="required" readonly="true"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Item Description <span class="impColor">*</span></label>
									<div class="col-sm-6">
										<form:input path="itemDescription" class="form-control onlyCharacters validate" autocomplete="off" placeholder="Item Description" required="required" />
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Payment Type <span class="impColor">*</span></label>
									<div class="col-sm-6">
										<form:select path="paymentType" class="form-control  validate" onfocus="removeBorder(this.id)">
											<form:option value="" selected="selected" disabled="disabled">-- Select Payment Type --</form:option>
											<form:option value="Check" >Check</form:option>
											<form:option value="Cash" >Cash</form:option>
											<form:option value="Credit Card" >Credit Card</form:option>
											<form:option value="Others" >Others</form:option>
										</form:select>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="col-sm-2 control-label required">Remarks</label>
									<div class="col-sm-9">
										<form:textarea path="paymentRemarks" rows="5" class="form-control" placeholder="Remarks"></form:textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-12">
								<div class="btn-toolbar text-center">
									<input type="submit" value="Submit" id="submit1" class="btn-primary btn" />
									<input type="reset" value="Reset" class="btn-danger btn cancel"  />
								</div>
							</div>
						</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
		
<script type="text/javascript">
$(function() {
	$("#dateOfExpense").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
});

var listOrders1 = ${allObjects};
if (listOrders1 != "") {
	displayTable(listOrders1);
}

function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Account Head</th><th>Expense Amount (AED)</th><th>Date of Expense</th><th>Item description</th><th>Payment Type</th><th>Remarks</th><th>Status</th><th></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders, function(i, orderObj){
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='trckerDelete("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='trckerDelete("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editExpensiveTracker("+ orderObj.id + ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
			+ "<td class='impFiled' title='"+orderObj.accountHead+"'>" + orderObj.accountHead + "</td>"
			+ "<td class='impFiled' title='"+orderObj.amount+"'>" + orderObj.amount + "</td>"
			
			+ "<td title='"+orderObj.dateOfExpense+"'>" + orderObj.dateOfExpense + "</td>"
			+ "<td title='"+orderObj.itemDescription+"'>" + orderObj.itemDescription + "</td>"
			+ "<td title='"+orderObj.paymentType+"'>" + orderObj.paymentType + "</td>"
			+ "<td title='"+orderObj.paymentRemarks+"'>" + orderObj.paymentRemarks + "</td>"
			+ "<td title='"+orderObj.trackrstatus+"'>" + orderObj.trackrstatus + "</td>"
			+ "<td style='text-align: center;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+ "</tr >";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editExpensiveTracker(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#accountHead").val(serviceUnitArray[id].accountHead);
	$("#amount").val(serviceUnitArray[id].amount);
	$("#dateOfExpense").val(serviceUnitArray[id].dateOfExpense);
	$("#dateOfExpense").val(serviceUnitArray[id].dateOfExpense);
	$("#itemDescription").val(serviceUnitArray[id].itemDescription);
	$("#paymentType").val(serviceUnitArray[id].paymentType);
	$("#paymentRemarks").val(serviceUnitArray[id].paymentRemarks);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function trckerDelete(id,status) {
	var checkstr=null;
	if(status == 0){
		checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		checkstr = confirm('Are you sure you want to Activate?');
	}
	if (checkstr == true) {
		var formData = new FormData();
		formData.append('id', id);
		formData.append('status', status);
		$.fn.makeMultipartRequest('POST', 'trckerDelete', false, formData, false, 'text', function(data) {
			var resJson=JSON.parse(data);
			displayTable(resJson);
			window.location.reload();
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
		
		$.fn.makeMultipartRequest('POST', 'inActiveExpense', false,
				formData, false, 'text', function(data) {
			var resJson=JSON.parse(data);
			displayTable(resJson);
					console.log(resJson);
				});
		
	/* }else{
		alert("previous data....");
	} */
}
$("#pageName").text("Expense Tracker");
$(".expenseTracker").addClass("active"); 
</script>