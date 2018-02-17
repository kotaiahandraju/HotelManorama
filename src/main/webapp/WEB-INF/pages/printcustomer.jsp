<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<style>
table #dependent_table {
	/* 	width: 100%; */
	counter-reset: rowNumber;
}
table tbody tr.rowInc {
	counter-increment: rowNumber;
}
 table#dependent_table tbody tr td:first-child::before {
 content: counter(rowNumber);
/* 	min-width: 1em; */
/* 	margin-right: 0.5em; */
}
.addItemButton {
	cursor: pointer;
	font-size: small;
	background: green;
	color: white;
	padding: 3px 10px 3px 10px;
}
#ui-datepicker-div {
/* 	width: auto !important; */
}
.printTable table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}
.printTable table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}
.printTable table tr {
  background: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}
.printTable table th,
.printTable table td {
  padding: .165em;
  text-align: left;
}
.printTable table th {
  font-size:12.5px;
  letter-spacing: .1em;
  text-transform: uppercase;
}
@media screen and (max-width: 600px) {
  .printTable table {
    border: 0;
  }
 .printTable  table caption {
    font-size: 1.3em;
  }
 .printTable  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
 .printTable  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  .printTable table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
 .printTable  table td:before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
 .printTable  table td:last-child {
    border-bottom: 0;
  }
}
.printTable table {
width:47%;
float:left;
margin:3px;
}
.printTable tr{
	width:100%;
	margin-left:10px;}
.printTable th {
	
	float:left;
	
	}
	.det {
	width:100%;
	float:left;
	padding:0px;
	}

	.printTable td {
		
		float:left;
		margin-left:2px;}
		.custom {
			border-top-right-radius: 1px;
    border-top-left-radius: 1px;
  
			background:#4f8edc !important;
			color:#fff !important;
			Padding:2px !important;
			font-size:18px !important;
			}
			.deliver {
				width:95%;
			}
	label {
	margin-bottom:0px;	
	font-size: 13px;
	}
#wrap > .container {
    padding: 5px;
}
		@media print {
body {-webkit-print-color-adjust: exact;}
}
.sno {
width:26px;
float:left;
}
.ite {
width:60px;
float:left;
}
.quant {
width:60px;
float:left;
}
.pri {
width:60px;
float:left;
}
.tot {
width:140px;
float:left;
}
.dis {
width:90px;
float:left;
}
.net {
width:100px;
float:left;
}
</style>
<ol class="breadcrumb">
  <li><a href="#">Home</a></li>
  <li>Cylinder Delivered</li>
</ol>
<div class="clearfix"></div>
<div class="container">
<div class="col-md-6">
<img height="50" src="../img/khaibarlogo.png"/><div class="clearfix"></div>
 <table class="table-responsive printTable" id="printTable">
    <tr><td class="det"><div class="custom">Customer Details</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
    <tr><td ><label for="focusedinput"  >Customer Name </label></td><td></td></tr>
                          
              <tr><td ><label for="focusedinput"  >Customer Type</label></td><td><label for="focusedinput"  >Customer Name </label></td></tr>
              <tr><td ><label for="focusedinput"  >Customer Address </label></td><td></td></tr>
              <tr><td ><label for="focusedinput"  >Mobile </label></td><td></td></tr>       
                          
                          </tbody>
    
    </table>
     <table class="table-responsive">
    <tr><td class="det"><div class="custom">Returned Cylinders</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
     <tr><td ><label for="focusedinput"  >Cylinders </label></td><td></td></tr>
              <tr><td ><label for="focusedinput"  >Cylinder Return Truck </label></td><td></td></tr>
              <tr><td ><label for="focusedinput"  >Provision Due Amount </label></td><td></td></tr> <tr><td><label for="focusedinput"  > </label></td> </tr>
 </tbody>   </table>
  <table class="table-responsive deliver ">
    <tr><td class="det" width="100%"><div class="custom">Deliver Cylinders</div></td></tr>
    <tbody style="padding:10px;
			border:1px solid lightgray;">
			<tr class="default" style="background:#EBEBEB">
                      
            <tr><th scope="col">Sno</th><th scope="col">Items</th><th scope="col">Quantity</th><th scope="col">Price(AED)</th><th scope="col">Total Amount (AED)</th><th scope="col">Discount (%)</th><th scope="col">Net Amount (AED)
</th></tr>    
                      <tr><th scope="col"><span class="sno">1</span></th>
                      <th scope="col"><span class="ite">items</span></th>
                      <th scope="col"><span class="quant">0.0</span></th>
                      <th scope="col"><span class="pri">0.0</span></th>
                      <th scope="col"><span class="tot">0.0</span></th>
              <th scope="col"><span class="dis" >00</span></th>
              <th scope="col"><span class="net">00</span></th></tr>    
<tr><th scope="col"><span class="sno">2</span></th>
                      <th scope="col"><span class="ite">item1</span></th>
                      <th scope="col"><span class="quant">0.0</span></th>
                      <th scope="col"><span class="pri">0.0</span></th>
                      <th scope="col"><span class="tot">0.0</span></th>
              <th scope="col"><span class="dis" >00</span></th>
              <th scope="col"><span class="net">00</span></th></tr>   
              <tr><th scope="col"><span class="sno">3</span></th>
                      <th scope="col"><span class="ite">item2</span></th>
                      <th scope="col"><span class="quant">0.0</span></th>
                      <th scope="col"><span class="pri">0.0</span></th>
                      <th scope="col"><span class="tot">0.0</span></th>
              <th scope="col"><span class="dis" >00</span></th>
              <th scope="col"><span class="net">00</span></th></tr>   
                  
 <tr><th width="350"></th><th width="150">Total Amount (AED)</th><th><span id="netAmount1">0000000</span></th></tr>       
         <tr><th width="350"></th><th width="150">Vat Amount (AED) </th><th><span id="netAmount1">  0</span></th></tr>       
         <tr><th width="350"></th><th width="150">Paid Amount(AED) </th><th><span id="netAmount1"> 0</span></th></tr>       
         <tr><th width="350"></th><th width="150" >Due Amount(AED)  </th><th><span id="netAmount1"> 0000000</span></th></tr>       
                  
                          </tbody>
    
    </table></div>
    <div class="col-md-6">
    <img height="50" src="../img/khaibarlogo.png"/><div class="clearfix"></div>
 <table class="table-responsive">
    <tr><td class="det"><div class="custom">Customer Details</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
    <tr><td ><label for="focusedinput"  >Customer Name </label></td><td></td></tr>
                          
              <tr><td ><label for="focusedinput"  >Customer Type</label></td><td><label for="focusedinput"  >Customer Name </label></td></tr>
              <tr><td ><label for="focusedinput"  >Customer Address </label></td><td></td></tr>
              <tr><td ><label for="focusedinput"  >Mobile </label></td><td></td></tr>       
                          
                          </tbody>
    
    </table>
     <table class="table-responsive">
    <tr><td class="det"><div class="custom">Returned Cylinders</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
     <tr><td ><label for="focusedinput"  >Cylinders </label></td><td></td></tr>
              <tr><td ><label for="focusedinput"  >Cylinder Return Truck </label></td><td></td></tr>
              <tr><td ><label for="focusedinput"  >Provision Due Amount </label></td><td></td></tr> <tr><td><label for="focusedinput"  > </label></td> </tr>
 </tbody>   </table>
  <table class="table-responsive deliver ">
    <tr><td class="det" width="100%"><div class="custom">Deliver Cylinders</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;"><tr class="default" style="background:#EBEBEB">
                      
            <tr><th scope="col">Sno</th><th scope="col">Items</th><th scope="col">Quantity</th><th scope="col">Price(AED)</th><th scope="col">Total Amount (AED)</th><th scope="col">Discount (%)</th><th scope="col">Net Amount (AED)
</th></tr>   

                      <tr><th scope="col"><span class="sno">1</span></th>
                      <th scope="col"><span class="ite">items</span></th>
                      <th scope="col"><span class="quant">0.0</span></th>
                      <th scope="col"><span class="pri">0.0</span></th>
                      <th scope="col"><span class="tot">0.0</span></th>
              <th scope="col"><span class="dis" >00</span></th>
              <th scope="col"><span class="net">00</span></th></tr>    
<tr><th scope="col"><span class="sno">2</span></th>
                      <th scope="col"><span class="ite">item1</span></th>
                      <th scope="col"><span class="quant">0.0</span></th>
                      <th scope="col"><span class="pri">0.0</span></th>
                      <th scope="col"><span class="tot">0.0</span></th>
              <th scope="col"><span class="dis" >00</span></th>
              <th scope="col"><span class="net">00</span></th></tr>   
              <tr><th scope="col"><span class="sno">3</span></th>
                      <th scope="col"><span class="ite">item2</span></th>
                      <th scope="col"><span class="quant">0.0</span></th>
                      <th scope="col"><span class="pri">0.0</span></th>
                      <th scope="col"><span class="tot">0.0</span></th>
              <th scope="col"><span class="dis" >00</span></th>
              <th scope="col"><span class="net">00</span></th></tr>   
                   <tr><th width="350"></th><th width="150">Total Amount (AED)</th><th><span id="netAmount1">0000000</span></th></tr>       
         <tr><th width="350"></th><th width="150">Vat Amount (AED) </th><th><span id="netAmount1">  0</span></th></tr>       
         <tr><th width="350"></th><th width="150">Paid Amount(AED) </th><th><span id="netAmount1"> 0</span></th></tr>       
         <tr><th width="350"></th><th width="150" >Due Amount(AED)  </th><th><span id="netAmount1"> 0000000</span></th></tr>    
                          
                          </tbody>
    
    </table></div>
  
</div>
<!-- container -->
<div id="dial1"></div>
<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script> -->
<script type="text/javascript">



$(function() {
// 	var listOrders=JSON.parse(lstOrders);
	
	var dummyItems = $("#item1").html();
	$("#1item").empty();
	$(dummyItems).appendTo("#1item");
	
	$("#1expirydate").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	$("#1manufacturingdate").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
});
var damageId = 0;
// var serviceUnitArray ={};
// var serviceUnitArray1 ={};
var data = {};


function showTableData(response){
	serviceUnitArray ={};
	serviceUnitArray1 ={};
	var table=$('#tableId').html('');
	
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>LPO Number</th><th>Supplier name</th><th>Supplier Contact no</th><th>Supplier Email</th><th>Supplier Address</th><th>Total Amount</th><th>Paid Amount</th><th>Due Amount</th><th>Remarks</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='lpoDelete("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='lpoDelete("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
// 		alert(orderObj.lponumber);
		
		var edit = "<a class='edit editIt' id='edit"+orderObj.lponumber+"' onclick=viewDetails(this.id,1)><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		serviceUnitArray1[orderObj.lponumber] = orderObj;
		var tblRow ="<tr>"
			+ "<td id='"+orderObj.lponumber+"' style='text-align: center;cursor: pointer;color: red;text-decoration: underline;' onclick=viewDetails(this.id,0) title='"+orderObj.lponumber+"'>" + orderObj.lponumber + "</td>"
			+ "<td title='"+orderObj.suppliername+"'>" + orderObj.suppliername + "</td>"
			+ "<td title='"+orderObj.suppliercontactno+"'>" + orderObj.suppliercontactno + "</td>"
			+ "<td title='"+orderObj.supplieremail+"'>" + orderObj.supplieremail+ "</td>"
			+ "<td title='"+orderObj.supplieraddress+"'>" + orderObj.supplieraddress + "</td>"
			+ "<td title='"+orderObj.amount+"'>" + orderObj.amount + "</td>"
			+ "<td title='"+orderObj.paidamount+"'>" + orderObj.paidamount + "</td>"
			+ "<td title='"+orderObj.dueamount+"'>" + orderObj.dueamount + "</td>"
			+ "<td title='"+orderObj.remarks+"'>" + orderObj.remarks + "</td>"
			+ "<td title='"+orderObj.lpoStatus+"'>" + orderObj.lpoStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}
function editLpo(id) {
	var inputs = $('input[type="text"]');
    inputs.removeAttr('placeholder');
    inputs.css('border','');
    inputs.addClass('default-class');
    inputs.css('color','black ');
	
	$("#id").val(id);
	$("#lponumber").val(serviceUnitArray[id].lponumber);
	$("#supplieraddress").val(serviceUnitArray[id].supplieraddress);
	$("#suppliercontactno").val(serviceUnitArray[id].suppliercontactno);
	$("#item").val(serviceUnitArray[id].item);
	$("#remarks").val(serviceUnitArray[id].remarks);
	$("#amount").val(serviceUnitArray[id].amount);
	$("#suppliername").val(serviceUnitArray[id].suppliername);
	$("#amount").val(serviceUnitArray[id].amount);
	$("#supplieremail").val(serviceUnitArray[id].supplieremail);
	$("#status").val(serviceUnitArray[id].status);
	$("#paidamount").val(serviceUnitArray[id].paidamount);
	$("#dueamount").val(serviceUnitArray[id].dueamount);
	
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function lpoDelete(id,status) {
	var checkstr=null;
	if(status == 0){
		 checkstr =  confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr =  confirm('Are you sure you want to Activate?');
	}
	if(checkstr == true){
		$.ajax({
					type : "POST",
					url : "lpoDelete.htm",
					data :"id="+id+"&status="+status,
					 beforeSend : function() {
			             $.blockUI({ message: 'Please wait' });
			          },
					success: function (response) {
		                	 $.unblockUI();
		                 if(response != null ){
		                	 var resJson=JSON.parse(response);
		                	showTableData(resJson);
		                	//alert("Delete Sucessfully");
		                	//window.location.reload();
		                	}
		                 //window.location.reload();
		                 },
		             error: function (e) { 
		            	 $.unblockUI();
							console.log(e);
		             }
				});
	}
}

function dataClear(){
	
	
	$("#id").val('');
	$("#lponumber").val('');
	$("#item").val('');
	$("#remarks").val('');
	$("#amount").val('');
	$("#suppliername").val("");
	$("#suplieraddress").val("");
	$("#supliercontactno").val("");
	$("#amount").val("");
}
$(function() {
	$("#expiryDate1").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
});
function showexpiryDate(value){
	if(value=="1"){
		 $('#exporydatediv').show();
	}else{
		$('#exporydatediv').hide();
	}
}





var dependentRowCount = 1;
var validates = true;
var rowvalidate = false;

function addMoreRowsForDependent() {
	rowvalidate =false;
	var rowid =$('#dependent_table tbody tr:last').attr('id');
	console.log(rowid);
	    var number = parseInt(rowid.match(/[0-9]+/)[0], 10);
	    var item = $('#' + number + 'item').val();
		var qty = $('#'+number+'unit').val();
		var rate =  $('#' + number + 'rate').val();
	    
		 if(item == "" || item == null || item == "undefined" )
		{
			if(item == "" || item == null || item == "undefined")
			{
				$('#'+number+'item').css('color','red');
				$('#'+number+'item').css("border-color","#e73d4a");
				$('#'+number+'item').attr("placeholder","Enter Product Description");
				$('#'+number+'item').addClass('your-class');
// 				$('#'+number+'item').focus();
				return false;
			}
			
		} 
	dependentRowCount++;
	var dependentRow1 = '<tr class="rowInc" role="row" id="'+dependentRowCount+'">'
			+ '<td class="labelCss"></td>'
			+ '<td class="inputCss"><select title="Select Item" name="item1" style="width: 100%;font-size: small;" id="'
			+ dependentRowCount
			+ 'item" class="form-control validate" onchange="removeBorder(this.id),getTarrifPrice(this.value,this.id)"><option>Select</option></select></td>'
			+ '<td class="inputCss"><input title="Unit" name="unit" id="'
			+ dependentRowCount
			+ 'unit" type="text" value="1" class="form-control numericOnly" onkeyup="allcalculate(this.id)" onkeydown="removeBorder(this.id);"/></td>'
			+ '<td class="inputCss"><input name="rate" id="'
			+ dependentRowCount
			+ 'rate" type="text" value="0.0" class="form-control numericOnly" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)" readonly="readonly"/></td>'
// 			+ '<td class="inputCss"><select title="Select Rate" name="rate" style="width: 100%;font-size: small;" id="'
// 			+ dependentRowCount
// 			+ 'rate" class="form-control" onchange="removeBorder(this.id);"></select></td>'
			+ '<td class="labelCss"><input title="Total Value" name="totalvalue" id="'
			+ dependentRowCount
			+ 'totalvalue" value="0.00" type="text"  class="form-control" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ '<td class="inputCss"><input title="Discount" name="discount" id="'
			+ dependentRowCount
			+ 'discount" value="0" type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" onkeyup="discountCheck(this.id,this.value)" /></td>'
			+ '<td class="labelCss"><input title="Taxable Value" name="taxable" id="'
			+ dependentRowCount
			+ 'taxable" value="0.00" type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
// 			+ '<td class="labelCss" ><input placeholder="Manufacturing Date" name="manufacturingdate" id="'
// 			+ dependentRowCount
// 			+ 'manufacturingdate"  type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
// 			+ '<td class="labelCss" ><input placeholder="Expiry Date" name="expirydate" id="'
// 			+ dependentRowCount
// 			+ 'expirydate"  type="text" class="form-control numericOnly" onkeydown="removeBorder(this.id);" readonly="readonly"/></td>'
			+ "<th class='labelCss notPrintMe hideme' style='width: 10px;'><span><a href='javascript:void(0);' style='color: red;' onclick='removeDependentRow("
			+ dependentRowCount + ");'><i class='fa fa-trash' style='color: red;text-decoration: none;cursor: pointer;'></i></a></span></th>" +
			 + "</tr>";
	$(dependentRow1).appendTo("#dependent_table tbody");
	$("#"+dependentRowCount+"manufacturingdate").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	$("#"+dependentRowCount+"expirydate").datepicker({
		dateFormat : "dd-MM-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	var dummyItem1 = $('#item1').html();
	$('#'+dependentRowCount+'item').empty();
	$(dummyItem1).appendTo('#'+dependentRowCount+'item');
	
}

function removeDependentRow(dependentRowCount) {
	jQuery('#' + dependentRowCount).remove();
	priceCalculator();
	
	
}
function allcalculate(id){
	     var unit=0.00;
	     var rate=0.00;
	     var total1 =0.00;
	     var discount=0.00;

	
	var number = parseInt(id.match(/[0-9]+/)[0], 10);
	unit = $('#'+ number+'unit').val();
	rate = $('#' + number + 'rate').val();
	total1 =  unit * rate;

	taxable = $('#' + number + 'taxable').val();
	
	$('#' + number + 'totalvalue').val(total1.toFixed(2));
	
	total = $('#' + number + 'totalvalue').val();
	discount = $('#' + number + 'discount').val();
	if(discount =="" ){
		discount =0;
	}
	var result = parseFloat(total)*(100- parseFloat(discount))/100;
	$('#' + number + 'taxable').val(result.toFixed(2));
	
	
	
	priceCalculator();
}
var grandTotal = 0.00;
var finalAmount = 0.00;
var lastDueAmount1 = 0.00;
function priceCalculator(){
	 var globelTotalValue = 0.00;
		var globalDiscount = 0.00;
		var globalTaxable = 0.00;
		var vatAmount =0.00;
		
		
		var vat = $("#vat").val();
	var array = $.makeArray($('tbody tr[id]').map(function() {
		  return this.id;
		}));
		console.log(array);
	 for(var i=0;i<array.length;i++){
		 var discount = 0.00;
			var total = 0.00;
			var taxable = 0.00;
			
			
			
		total = $('#' + array[i] + 'totalvalue').val();
		globelTotalValue = globelTotalValue + parseFloat(total);
		
		 discount = $('#' + array[i] + 'discount').val();
		 if(discount == ""){
			 discount = 0.00;
		 }
		globalDiscount = globalDiscount + parseFloat(discount);
		
		taxable = $('#' + array[i] + 'taxable').val();
		globalTaxable = globalTaxable+parseFloat(taxable);
		
		
		
		$(".totalInvoiceValue").text(globelTotalValue.toFixed(2));
		$(".totalDiscounts").text(globalDiscount.toFixed(2));
		$(".totalTaxableValue").text(globalTaxable.toFixed(2));
		
		
	 }
	 var lstdue = $("#lastDueAmount").text();
	 
	 grandTotal = globalTaxable;
	 vatAmount = parseFloat((grandTotal)*(vat/100));
	 finalAmount = parseFloat((grandTotal))*(100+parseFloat(vat))/100;
	if(lstdue !="" && lstdue != null && lstdue != "undefined" ){
		finalAmount = parseFloat(finalAmount)+parseFloat(lstdue);
	 }	
	$("#dueAmount").val(Math.round(finalAmount));
	$("#netAmount").val(finalAmount);
	 $("#netAmount1").text(grandTotal);
	 $("#vatAmount").text(Math.round(vatAmount));
	 $("#grandTotal").text(Math.round(finalAmount));
// 	 var paidamount =$("#paidamount").val();
// 	 if(paidamount.trim().length == 0){
// 		 $("#dueamount").val(grandTotal);
// 	 }else{
// 		 $("#dueamount").val(parseInt(grandTotal)-parseInt(paidamount));
// 	 }
// 	 alert(grandTotal);
// 	 $(".grandTotal").text(grandTotal.toFixed(2));
// 	 $(".roundOff").text(Math.round(grandTotal).toFixed(2));
}

function viewDetails(id,value){
	id = id.replace("edit", "");
$("#dependent_table tbody").find("tr:gt(0)").remove();
dependentRowCount = 1;
	var LpoId = serviceUnitArray1[id].id;
	editLpo(LpoId);
	$('#dial1').html('');
	var formData = new FormData();
    formData.append('lponumber', id);
	$.fn.makeMultipartRequest('POST', 'viewLPOdetails', false,
			formData, false, 'text', function(data){
		var lponumbertitle=null;
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		
			var j=1;
		$.each(alldata,	function(i, orderObj) {
			if(j == 1){
				
				$("#1item").val(orderObj.itemid);
				$("#1unit").val(orderObj.quantity);
				$("#1rate").val(orderObj.price);
				$("#1totalvalue").val(orderObj.totalprice); 
				$("#1discount").val(orderObj.discount);
				$("#1taxable").val(orderObj.grandtotal);
				$("#1manufacturingdate").val(orderObj.manufacturingdate);
				$("#1expirydate").val(orderObj.expirydate);
				if(value=="0"){
					$("#id").val(0);
					$(".hideme").hide();
				}else{
					$(".hideme").show();
				}
			}else{
				addMoreRowsForDependent();
				$("#"+j+"item").val(orderObj.itemid);
				$("#"+j+"unit").val(orderObj.quantity);

				$("#"+j+"rate").val(orderObj.price);
				$("#"+j+"totalvalue").val(orderObj.totalprice); 
				$("#"+j+"discount").val(orderObj.discount);
				$("#"+j+"taxable").val(orderObj.grandtotal);
				$("#"+j+"manufacturingdate").val(orderObj.manufacturingdate);
				$("#"+j+"expirydate").val(orderObj.expirydate);
				if(value=="0"){
					$(".hideme").hide();
				}else{
					$(".hideme").show();
				}
			}
			j++;
			
		});
		priceCalculator();
	});
}

function PaidCalculation(value){
	var amount = $("#amount").val();
	if(amount !="" && value !=""){
		$("#dueamount").val(parseInt(amount)-parseInt(value));
	}
}
function getCustomerIds(value){
	var formData = new FormData();
    formData.append('customertype', value);
	$.fn.makeMultipartRequest('POST', 'getCustomerIds', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		
		var html = "<option value=''>-- Select Customer Id --</option>";
		$.each(alldata,function(i, catObj) {
			
			 html = html + '<option value="'
				+ catObj.id + '">'
				+ catObj.customerid + '</option>';
		});
		$('#customerId').empty().append(html);
		$("#customerId").trigger("chosen:updated");
		
		
		
	});
}
function getCustomerDetails(value){
	var formData = new FormData();
    formData.append('customerid', value);
	$.fn.makeMultipartRequest('POST', 'getCustomerIds', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		$("#cylinders").text("");
		$.each(alldata,function(i, catObj) {
			$("#customername").text(catObj.customername);
			$("#mobile").text(catObj.mobile);
			$("#customeraddress").text(catObj.customeraddress);
			$("#landline").text(catObj.landline);
			$("#lastDueAmount").text(catObj.dueAmount);
			$("#previousDueAmount").val(catObj.dueAmount);
			priceCalculator();
			if(catObj.cylinderreturn=='0'){
			var varcheckBox = "<input name='cylinderId' type='checkbox' value='"+catObj.cylinderId1 +"' />"+catObj.name+" <select  id='"+i+"company' name='company' class='company' ><option value=''>Select Company</option></select> <br>"; 
			$("#cylinders").append(varcheckBox);
			var dummyCompany = $("#ownercompany").html();
			$("#"+i+"company").empty();
			$(dummyCompany).appendTo("#"+i+"company");
			$("#"+i+"company").val(catObj.ownercompany);
			}
		
	});
	
});
}
/* function getTruckCylindersCount(id){
	var formData = new FormData();
    formData.append('truckId', id);
	$.fn.makeMultipartRequest('POST', 'getTruckCylinders', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		serviceUnitArray2 ={};
		var html = "<option value=''>-- Select Customer Id --</option>";
		$.each(alldata,function(i, catObj) {
			serviceUnitArray2[catObj.id] = catObj;
			 html = html + '<option value="'
				+ catObj.id + '">'
				+ catObj.cylinderid + '</option>';
		});
		$('#cylindetId').empty().append(html);
	});
} */
var map = new Object(); // or var map = {};
function getTarrifPrice(value,id){
	var truckId = $("#cylinderDeliverTruck").val();
	if(truckId==""){
		alert("Please Select Truck");
		return false;
	}
	var number = parseInt(id.match(/[0-9]+/)[0], 10);
	
	var formData = new FormData();
    formData.append('itemId', value);
	$.fn.makeMultipartRequest('POST', 'getTariffPrice', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.rate;
		map[number+"discount"] = jsonobj.discount;
		$("#"+number+"rate").val(jsonobj.rate);
		allcalculate(number+"rate");
	});
}
function payedAmountCal(value){
	var dueAmount =  Math.round(finalAmount-value);
	$("#dueAmount").val(dueAmount);
}
function discountCheck(id,value){
// 	alert(map[id]);
	if(value>map[id]){
		alert("Please Enter Discount Maximum : "+map[id] );
		$("#"+id).val("0");
		allcalculate(id);
		return false;
	}
	allcalculate(id);
}
function getTruckInCylinderCount(id,value){
	
	
}
$("#pageName").text("Cylinder Deliver To Customer");
$(".cylinderDeliver").addClass("active");
</script>
