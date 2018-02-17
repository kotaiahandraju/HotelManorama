<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href='${baseurl }/assets/css/cylinderdeliverPrint1.css' />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.1.135/jspdf.min.js"></script>
<script type="text/javascript" src="http://cdn.uriit.ru/jsPDF/libs/adler32cs.js/adler32cs.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2014-11-29/FileSaver.min.js"></script>
<!-- <script type="text/javascript" src="libs/Blob.js/BlobBuilder.js"></script> -->
<script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.addimage.js"></script>
<script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.standard_fonts_metrics.js"></script>
<script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.split_text_to_size.js"></script>
<script type="text/javascript" src="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.from_html.js"></script>
<!-- <script type="text/javascript" src="js/basic.js"></script> -->

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

</style>
<ol class="breadcrumb">
  <li><a href="#">Home</a></li>
  <li>Cylinder Delivered</li>
</ol>
<div class="clearfix"></div>
<div class="container" id="cylinderdataId">
  <form:form modelAttribute="lpoForm" id="cylinderDeliverForm" action="cylinderDeliverSave" class="form-horizontal" method="post">
    <table width="100%">
      <tr> 
        <td><div class="row">    
            <div class="col-md-6">
              <div class="panel panel-primary">
                <div class="panel-heading">
                  <h4>Customer Details</h4>
                </div>
                <form:hidden path="netAmount"/>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="focusedinput" class="col-md-6 control-label">Truck <span class="impColor">*</span></label>
                        <div class="col-md-6">
                          <form:select path="cylinderDeliverTruck" class="form-control  validate" onfocus="removeBorder(this.id);" onchange="selectReturnTruck(this.value);" >
                            <form:option value="">--Select Truck--</form:option>
                            <form:options items="${trucks}"></form:options>
                          </form:select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="focusedinput" class="col-md-6 control-label">Customer Type <span class="impColor">*</span></label>
                        <div class="col-md-6">
                          <form:select path="customertype" class="form-control   validate"  onfocus="removeBorder(this.id);" onchange="getCustomerIds(this.value)">
                            <form:option value="">-- Customer Type --</form:option>
                            <form:option value="COMMERCIAL">COMMERCIAL</form:option>
                            <form:option value="DOMESTIC">DOMESTIC</form:option>
                            <form:option value="INDUSTIAL">INDUSTIAL</form:option>
                          </form:select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="focusedinput" class="col-md-6 control-label">Customer Id <span class="impColor">*</span></label>
                        <div class="col-md-6">
                          <form:select path="customerId" class="form-control  validate" onfocus="removeBorder(this.id);" onchange="getCustomerDetails(this.value)">
                            <form:option value="">-- Select Customer Id --</form:option>
                          </form:select>
                        </div>
                      </div>
                    </div>
<!--                     vat amount -->
				<input type="hidden" name="vatamount" id="vatamount1" >
				<input type="hidden" name="grossamount" id="grossamount">  
				<input type="hidden" name ="totalNetamount" id ="totalNetamount"/>
                    <div class="col-md-6">
                      <div class="form-group" style="margin-bottom:0;">
                        <label for="focusedinput" class="col-md-6 control-label" style="padding-top:4px;">Customer Name: </label>
                        <div class="col-md-6"> <span id="customername" class="form-control" style="border:none;"></span> </div>
                      </div>
                      <div class="form-group" style="margin-bottom:0;">
                        <label for="focusedinput" class="col-md-6 control-label" style="padding-top:4px;">Customer Address: </label>
                        <div class="col-md-6"> <span id="customeraddress" class="form-control"  style="border:none;"></span> </div>
                      </div>
                      <div class="form-group" style="margin-bottom:0;">
                        <label for="focusedinput" class="col-md-6 control-label" style="padding-top:4px;">Mobile: </label>
                        <div class="col-md-6"> <span id="mobile" class="form-control"  style="border:none;"></span> </div>
                      </div>
                      <div class="form-group" style="margin-bottom:0;">
                        <label for="focusedinput" class="col-md-6 control-label" style="padding-top:4px;">Land Line: </label>
                        <div class="col-md-6"> <span id="landline" class="form-control"  style="border:none;"></span> </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="panel panel-primary">
                <div class="panel-heading">
                  <h4>Returned Cylinders</h4>
                </div>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="focusedinput" class="col-md-5 control-label" style="margin-top:0; padding-top:0; vertical-align:text-top;">Cylinders </label>
                        <div class="col-md-7"> <span id="cylinders"></span> </div>
                      </div>
                    </div>
                  
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="focusedinput" class="col-md-5 control-label">Cylinder Return Truck</label>
                        <div class="col-md-7">
                          <form:select path="cylinderReturnTruck" class="form-control " onfocus="removeBorder(this.id);" >
                            <form:option value="">--Select Truck--</form:option>
                            <form:options items="${trucks}"></form:options>
                          </form:select>
                        </div>
                      </div>
                    </div>
                    
                    
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="focusedinput" class="col-md-5 control-label">previous Due Amount (AED)</label>
                        <div class="col-md-5" style="padding-top:5px; color:#C00;">
                        <span id="lastDueAmount" style="padding-top:5px; color:#C00"><strong>0</strong></span>
                        </div>
                      </div>
                    <br />

                    </div>

                    <br />
                    
                    
                    
               
               
               
                   <input type="hidden" id="previousDueAmount" name="previousDueAmount" value="0">
                  
                    
                    <div  style="display:none" >
                      <form:select path="ownercompany" class="form-control chzn-select " onfocus="removeBorder(this.id);" >
                        <form:option value="">--Select company--</form:option>
                        <form:options items="${companys}"></form:options>
                      </form:select>
                    </div>
                    
                    
                
                
                
                
                
                    
                  </div>
                </div>
              </div>
            </div>
		
        
        
        
        
        
        
        
        
        
        <div class="row"> 
                    <div class="col-md-12">
                    
               <div class="panel panel-primary">
                <div class="panel-heading">
                <h4>Deliver Cylinders</h4>
                 <table class="options notPrintMe">
                  <tr>
                    <td class="hideme"><span class="addItemButton btn-danger" onclick="addMoreRowsForDependent(this.form);">Add Item</span></td>
                  </tr>
                </table>
                
                </div>
                   
                    
                    
                    
                    
            <div class="panel-body">         
         
            <form:select path="item" id="item1" style="display:none;font-size: small;">
              <form:option value="" selected="selected" disabled="disabled">-- Select Item --</form:option>
              <form:options items="${items}"></form:options>
            </form:select>
            <c:if test="${not empty vat}">
              <form:hidden path="vat" value="${vat}"/>
            </c:if>
            <c:if test="${empty vat}">
              <form:hidden path="vat" value="0"/>
            </c:if>
            <!-- </div>
		<div class="row"> -->
            <div >
              <div class="form-group">
                <table class="table table-bordered" id="dependent_table">
                  <thead >
                    <tr class="default" style="background:#EBEBEB">
                      <th><span>Sno</span></th>
                      <th><span>Items</span></th>
                      <th><span>Quantity</span></th>
                      <th><span>Price(AED)</span></th>
                      <th><span>Total Amount (AED)</span></th>
                      <th><span>Discount (%)</span></th>
                      <th><span>Net Amount (AED)</span></th>
                      <!-- 								<th style="width: 200px"><span>VAT (5%)</span></th> -->
                      <!-- 								<th style="width: 200px"><span>Net Amount</span></th> -->
                    </tr>
                  </thead>
                  <tbody>
                    <tr id="1" class="rowInc">
                      <td></td>
                      <td><select name="item1" class="form-control " id="1item" style="width: 100%;font-size: small;" title="Select Product" onfocus="removeBorder(this.id)" onchange="getTarrifPrice(this.value,this.id),getTruckInCylinderCount(this.id,this.value)">
                        <option value="" selected="selected" disabled="disabled">-- Select Item --</option>
                        </select> </td>
                      <td><input name="unit" value="1" id="1unit" type="text" title="Unit" onkeydown="removeBorder(this.id);" class="form-control numericOnly" onkeyup="allcalculate(this.id)"/></td>
                      <td><input name="rate" value="0.0" id="1rate" type="text" onkeydown="removeBorder(this.id);" onkeyup="allcalculate(this.id)" class="form-control numericOnly" readonly="readonly"/></td>
                      <td><input name="totalvalue" value="0.00" title="Total Value" id="1totalvalue" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
                      <td><input name="discount" value="0" title="Discount" id="1discount" type="text" onkeydown="removeBorder(this.id);" onkeyup="discountCheck(this.id,this.value)" class="form-control" /></td>
                      <td><input name="taxable" value="0.00" title="Taxable Value" id="1taxable" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td>
                      <!-- 								<td><input name="vat" placeholder="Vat" id="1vat" value="5" type="text" onkeydown="removeBorder(this.id);" class="form-control" /></td> -->
                      <!-- 								<td><input name="netAmount" placeholder="Net Amount"  id="1netAmount" type="text" onkeydown="removeBorder(this.id);" class="form-control" readonly="readonly"/></td> -->
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr>
                      <th colspan="4"><h3 align="right"></h3></th>
                      <th><span class="totalInvoiceValue"></span></th>
                      <th><span class="totalDiscounts"></span></th>
                      <th><span class="totalTaxableValue"></span></th>
                    </tr>
                    <tr>
                      <th colspan="6" style="text-align: right;"> Total Net Amount (AED)</th>
                      <th> <span id="netAmount1">0</span></th>
                    </tr>
                    <tr>
                      <th colspan="6" style="text-align: right;">
                        Vat Amount ( ${vat }%) (AED)</th>
                      <th> <span id="vatAmount">0</span></th>
                    </tr>
                    
                    <tr>
                      <th colspan="6" style="text-align: right;"> Paid Amount(AED)</th>
                      <th> <input type="text" id="payedAmount" name="payedAmount" placeholder="Paid Amount(AED)" onkeyup="payedAmountCal(this.value)" class="form-control numericOnly"/></th>
                    </tr>
                    <tr>
                      <th colspan="6" style="text-align: right;"> Due Amount(AED)</th>
                      <th> <input type="text"  id="dueAmount" name="dueAmount" class="form-control numericOnly" placeholder="Due Amount(AED)" /></th>
                    </tr>
                    <tr>
                      <th colspan="6" style="text-align: right;">
                        Gross Amount (AED)</th>
                      <th> <span id="grandTotal">0</span></th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="panel-footer hideme">
              <div class="row">
                <div class="col-sm-12">
                  <div class="btn-toolbar pull-right">
                    <input class="btn-primary btn" type="submit" id="submit11" value="Submit" />
                    <input class="btn-danger btn cancel" type="reset" id="clearData" value="Reset" />
                  </div>
                </div>
              </div>
            </div>
          </div></td>
      </tr>
    </table>
  </form:form>
</div>
<!-- container -->



<!-- print table -->


<div class="container" id="printCylinder" style="display: none;font-size: 20px !important;">
<div class="col-md-12 printTable">
<button class="printbtn btn-primary" onclick="PrintElem('#printCylinder');">Print</button>
<img height="50" src="../img/khaibarlogo.png"/><div class="clearfix"></div>
 <table class="table-responsive " >
    <tr><td class="det"><div class="custom">Customer Details</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
    <tr><td ><label for="focusedinput "  >Customer Name :</label></td><td><span class="customerNameId"></span></td></tr>
                          
              <tr><td ><label for="focusedinput "  >Customer Type :</label></td><td><span class="customerTypeId"></span></td></tr>
              <tr><td ><label for="focusedinput "  >Customer Address :</label></td><td><span class="customerAddress"></span></td></tr>
              <tr><td ><label for="focusedinput mobile"  >Mobile :</label></td><td><span class="mobile"></span></td></tr>       
                          
                          </tbody>
    
    </table>
     <table class="table-responsive">
    <tr><td class="det"><div class="custom">Returned Cylinders</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
     <tr><td ><label for="focusedinput"  >Cylinders :: </label></td><td><span class="retunCylinders"></span></td></tr>
              <tr><td ><label for="focusedinput"  >Cylinder Return Truck :</label></td><td><span class="retunCylinders"></span></td></tr>
              <tr><td ><label for="focusedinput "  >Previous Due Amount :</label></td><td><span class="previousdueamount"> </span></td></tr> <tr><td><label for="focusedinput"  > </label></td> </tr>
 </tbody>   </table>
  <table class="table-responsive deliverCylinders" style="width:96%" >
    <thead style="padding:10px;	border:1px solid lightgray;">
    <tr><td class="det" width="100%"><div class="custom">Deliver Cylinders</div></td></tr>    
			<tr class="default" style="background:#EBEBEB">
            <tr><th scope="col">Sno</th><th width="150px;"  scope="col">Items</th><th scope="col">Quantity</th><th scope="col">Price(AED)</th><th scope="col">Total Amount (AED)</th><th scope="col">Discount (%)</th><th scope="col">Net Amount (AED)
			</th></tr> </thead>
			<tbody>   
			 </tbody>       
						  
                  <tfoot>
 		<tr><td width="400"></td><td width="200">Total Amount (AED)</td><td> :</td><td><span class="totalAmount" id="netAmount1">0</span></td></tr>       
         <tr><td width="400"></td><td width="200">Vat Amount (AED)</td><td> :</td><td><span class="vat" id="netAmount1">  0</span></td></tr>       
         <tr><td width="400"></td><td width="200">Paid Amount(AED)</td><td> :</td><td><span  class="paidAmount" id="netAmount1"> 0</span></td></tr>       
         <tr><td width="400"></td><td width="200" >Due Amount(AED)</td><td>  :</td><td><span   class="dueAmount" id="netAmount1"> 0</span></td></tr>      
          <tr><td width="400"></td><td width="200" >Gross Amount (AED)</td><td>  :</td><td><span   class="grassAmount" id="netAmount1"> 0</span></td></tr> 
                  
</tfoot>
    
    </table>
    </div>
    <div class="clearfix"></div>
    <br><br><br>
    <div class="col-md-12 printTable">
<img height="50" src="../img/khaibarlogo.png"/><div class="clearfix"></div>
 <table class="table-responsive " >
    <tr><td class="det"><div class="custom">Customer Details</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
    <tr><td ><label for="focusedinput "  >Customer Name :</label></td><td><span class="customerNameId"></span></td></tr>
                          
              <tr><td ><label for="focusedinput "  >Customer Type :</label></td><td><span class="customerTypeId"></span></td></tr>
              <tr><td ><label for="focusedinput "  >Customer Address :</label></td><td><span class="customerAddress"></span></td></tr>
              <tr><td ><label for="focusedinput mobile"  >Mobile :</label></td><td><span class="mobile"></span></td></tr>       
                          
                          </tbody>
    
    </table>
     <table class="table-responsive">
    <tr><td class="det"><div class="custom">Returned Cylinders</div></td></tr><tbody style="padding:10px;
			border:1px solid lightgray;">
     <tr><td ><label for="focusedinput"  >Cylinders :: </label></td><td><span class="retunCylinders"></span></td></tr>
              <tr><td ><label for="focusedinput"  >Cylinder Return Truck :</label></td><td><span class="returnTruck"></span></td></tr>
              <tr><td ><label for="focusedinput "  >Previous Due Amount :</label></td><td><span class="previousdueamount"> </span></td></tr> <tr><td><label for="focusedinput"  > </label></td> </tr>
 </tbody>   </table>
  <table class="table-responsive deliverCylinders" style="width:96%" >
    <thead style="padding:10px;	border:1px solid lightgray;">
    <tr><td class="det" width="100%"><div class="custom">Deliver Cylinders</div></td></tr>    
			<tr class="default" style="background:#EBEBEB">
            <tr><th scope="col">Sno</th><th width="150px" scope="col">Items</th><th  scope="col">Quantity</th><th scope="col">Price(AED)</th><th scope="col">Total Amount (AED)</th><th scope="col">Discount (%)</th><th scope="col">Net Amount (AED)
			</th></tr> </thead>
			<tbody>   
			 </tbody>       
						  
                  <tfoot >
 		<tr><td class="tfoot1" width="400"></td><td width="200">Total Amount (AED)</td><td> :</td><td><span class="totalAmount" id="netAmount1">0</span></td></tr>       
         <tr><td width="400"></td><td width="200">Vat Amount (AED)</td><td> :</td><td><span class="vat" id="netAmount1">  0</span></td></tr>       
         <tr><td width="400"></td><td width="200">Paid Amount(AED) </td><td>:</td><td><span  class="paidAmount" id="netAmount1"> 0</span></td></tr>       
         <tr><td width="400"></td><td width="200" >Due Amount(AED) </td><td> :</td><td><span   class="dueAmount" id="netAmount1"> 0</span></td></tr>      
          <tr><td width="400"></td><td width="200" >Gross Amount (AED)</td><td>  :</td><td><span   class="grassAmount" id="netAmount1"> 0</span></td></tr> 
                  
</tfoot>
    
    </table>
    </div>
  <div id="editor"></div>
</div>


<c:choose>
<c:when test="${empty param.invoiceId}">
   <script> var invoiceId = "";</script>
</c:when>
<c:otherwise>
   <script> var invoiceId = "${param.invoiceId}";</script>
</c:otherwise>
</c:choose>


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
			+ 'item" class="form-control validate" onchange="removeBorder(this.id),getTarrifPrice(this.value,this.id),getTruckInCylinderCount(this.id,this.value)"><option>Select</option></select></td>'
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
	 $("#totalNetamount").val(grandTotal);
	 $("#vatAmount").text(Math.round(vatAmount));
	 $("#vatamount1").val(Math.round(vatAmount));
	 $("#grandTotal").text(Math.round(finalAmount));
	 $("#grossamount").val(Math.round(finalAmount));
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
		$("#"+id).val("");
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
var cylinderAvailable=true;
function getTruckInCylinderCount(id,value){
	
	
	var truckId = $("#cylinderDeliverTruck").val();
	if(truckId==""){
		$("#"+id).val("");
		return false;
	}
	
	var array = $.makeArray($('tbody tr[id]').map(function() {
		  return this.id;
		}));
		var item ="";
		var unit="";
		var myarray = []; 
		var myarray1 = []; 
	 for(var i=0;i<array.length;i++){
		 item = $('#' + array[i] + 'item').val();
		 unit = $('#' + array[i] + 'unit').val();
		 myarray.push(item);
		 myarray1.push(unit);
	 }
	 var existingItems = {};

	 myarray.forEach(function(value, index) {
	     existingItems[value] = index;
	 });
	 
	 var formData = new FormData();
	    formData.append('myarray', myarray);
	    formData.append('myarray1', myarray1);
	    formData.append('truckId', truckId);
		$.fn.makeMultipartRequest('POST', 'getTruckInCylinderCount', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.msg;
		if(msg!="ok"){
			alert(msg);
			cylinderAvailable = false;
		}else{
			cylinderAvailable = true;
		}
		});
	 
}

function selectReturnTruck(value){
	$("#cylinderReturnTruck").val(value);
}
$('#submit11').click(function(event) {
	validation = true;
	$.each(idArray, function(i, val) {
		var value = $("#" + idArray[i]).val();
		var placeholder = $("#" + idArray[i]).attr('placeholder');
		if (value == null || value == "" || value == "undefined") {
			$('style').append(styleBlock);
			$("#" + idArray[i] ).attr("placeholder", placeholder);
			$("#" + idArray[i] ).css('border-color','#e73d4a');
			$("#" + idArray[i] ).css('color','#e73d4a');
			$("#" + idArray[i] ).addClass('placeholder-style your-class');
			 var id11 = $("#" + idArray[i]+"_chosen").length;
			if ($("#" + idArray[i]+"_chosen").length)
			{
				$("#" + idArray[i]+"_chosen").children('a').css('border-color','#e73d4a');
			}
//			$("#" + idArray[i] + "Error").text("Please " + placeholder);
			validation = false;
		} 
		
	});
	if(!cylinderAvailable){
		alert("cylinders not available");
		return false;
		event.preventDefault();
	}
	if(validation) {
		$("#submit11").attr("disabled",true);
		$("#submit11").val("Please wait...");
		$("form").submit();											
		event.preventDefault();
	}else {
		return false;
		event.preventDefault();
	}
	
});

function PrintElem(elem)
{
	$(".noPrint").hide();
	$(".printbtn").hide();
	 $("#cylinderdataId").hide();
	 $("#printCylinder").show();
	 
	 var options = {
			 pagesplit: false,
			 useOverflow:true,
			 background:"#fff",
			 lineheight:3,
// 			line-height:"3",
			paddingtop:100,
// 			padding:10,
			 width: 1360
			 };
	 
	  var pdf = new jsPDF('p', 'pt', 'a4');
	 var margins = {
			   top: 25,
			   bottom: 60,
			   left: 20,
			   background:"#fff",
			   width: 522
			};
			// all coords and widths are in jsPDF instance's declared units
			// 'inches' in this case
			/*pdf.addHTML($(elem), margins.top, margins.left, {}, function() {
			    pdf.save('test.pdf');
			});  */
			
			 console.log(options);
	   var pdf = new jsPDF('p', 'pt', 'a4');
	  pdf.addHTML($(elem), 50, 150, options, function() {
		   pdf.setFontSize(40);
	    pdf.save('pageContent.pdf');
	  });  
	 
		 /*  $('#cmd').click(function() {
		    doc.fromHTML($('#target').html(), 15, 15, {
		      'width': 170,
		      'elementHandlers': specialElementHandlers
		    });
		    doc.save('sample-file.pdf');
		  });
		}); */
     
    Popup($(elem).html());
    
    
    
    
}

	 
$(function() {
	  var doc = new jsPDF();
	  var specialElementHandlers = {
	    '#editor': function(element, renderer) {
	      return true;
	    }
	  };
	  $('.printbtn').click(function() {
		  $("#printCylinder").css('display', 'block');
		  console.log($('#printCylinder').html());
	    doc.fromHTML('<div class="col-md-12 printTable"><button class="printbtn btn-primary" >Print</button><div class="clearfix"></div> <table class="table-responsive "> <tbody><tr><td class="det"><div class="custom">Customer Details</div></td></tr></tbody><tbody style="padding:10px;   border:1px solid lightgray;"> <tr><td><label for="focusedinput ">Customer Name :</label></td><td><span class="customerNameId"></span></td></tr> <tr><td><label for="focusedinput ">Customer Type :</label></td><td><span class="customerTypeId"></span></td></tr> <tr><td><label for="focusedinput ">Customer Address :</label></td><td><span class="customerAddress"></span></td></tr> <tr><td><label for="focusedinput mobile">Mobile :</label></td><td><span class="mobile"></span></td></tr> </tbody> </table>', 15, 15, {
	      'width': 170,
	      'elementHandlers': specialElementHandlers
	    });
	    doc.save('sample-file.pdf');
	  });
	});
	 










function Popup(data)
{
	var mywindow = window.open('','new div');

    var is_chrome = Boolean(mywindow.chrome);
    var isPrinting = false;
    mywindow.document.write('<html><head><title>Donor Details</title><link rel="stylesheet" href="../assets/css/cylinderdeliverPrint.css" /> <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"><style>body{font-size:normal;}</style></head><body>');
    mywindow.document.write(data);
   
    mywindow.document.write('</body></html>');
    mywindow.document.close(); // necessary for IE >= 10 and necessary before onload for chrome

$(".printbtn").show();
$(".noPrint").show();
$("#printFooter").hide();
$("#printCylinder").show();
    if (is_chrome) {
        mywindow.onload = function() { // wait until all resources loaded 
            mywindow.focus(); // necessary for IE >= 10
            mywindow.print();  // change window to mywindow
            mywindow.close();// change window to mywindow
        };
    
    
   } else {
        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10

        mywindow.print();
        mywindow.close();
   }
	
	
	
   /* var mywindow = window.open('', 'new div');
    mywindow.document.write('<html><head><title>Donor Details</title></head><body>');
    mywindow.document.write(data);
    mywindow.document.write('</body></html>');
    mywindow.print();
    mywindow.close();
    $(".printbtn").show();*/
    return true;
}

if(invoiceId != ""){
	invoicePrint(invoiceId);
}
function invoicePrint(id){
	//alert(this.id);
	 $("#cylinderdataId").hide();
	 $("#printCylinder").show();
	 var invoiceId=id;
	 

	var formData = new FormData();
    formData.append('invoiceId', id);
	$.fn.makeMultipartRequest('POST', 'getInvoiceData', false,
			formData, false, 'text', function(data){
		var lponumbertitle=null;
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		var alldata1 = jsonobj.allOrders2;
// 		alert(alldata);
		var table=$('.deliverCylinders tbody').html('');
		$(".deliverCylinders tbody").html("");

var j=0;
		$.each(alldata,function(i, orderObj) {
		j=i+1;
		
		
			$(".customerNameId").text(orderObj.customername);
			$(".customerTypeId").text(orderObj.customertype);
			$(".customerAddress").text(orderObj.customeraddress);
			$(".mobile").text(orderObj.mobile);
			$(".totalAmount").text(orderObj.totalnetamount);
			$(".vat").text(orderObj.vatamount);
			$(".paidAmount").text(orderObj.paidamount);
			$(".dueAmount").text(orderObj.dueamount);
			$(".previousdueamount").text(orderObj.previousdueamount);
			$(".grassAmount").text(orderObj.grossamount);

			
			
			id="'+ dependentRowCount+ 'taxable"
			
			var tblRow =	'   <tr><th scope="col" style="font-weight:normal;"><span class="sno">'+j+'</span></th>'
				           +'   <th scope="col" style="font-weight:normal;" ><span  class="ite'+j+' ite">items</span></th>'
				           +'    <th scope="col" style="font-weight:normal;"><span  class="quant'+j+' quant">0.0</span></th>'
				           +'    <th scope="col" style="font-weight:normal;"><span  class="pri'+j+' pri">0.0</span></th>'
				           +'    <th scope="col" style="font-weight:normal;"><span  class="tot'+j+' tot">0.0</span></th>'
				           +'    <th scope="col" style="font-weight:normal;"><span  class="dis'+j+' dis">00</span></th>'
				           +'    <th scope="col" style="font-weight:normal;"><span  class="net'+j+' net">00</span></th></tr> ';
							$(tblRow).appendTo(".deliverCylinders tbody");
							$(".ite"+j).text(orderObj.name);
							$(".quant"+j).text(orderObj.quantity);
							$(".pri"+j).text(orderObj.price);
							$(".tot"+j).text(orderObj.totalamount);
							$(".dis"+j).text(orderObj.discount);
							$(".net"+j).text(orderObj.netamount);
			
			
	});
		
		$.each(alldata1,function(i, orderObj) {
			j=i+1;
			
				$(".returnTruck").text(orderObj.trucknumber);
				$(".customerNameId").text(orderObj.customername);
				$(".customerTypeId").text(orderObj.customertype);
				$(".customerAddress").text(orderObj.customeraddress);
				$(".mobile").text(orderObj.mobile);
				$(".totalAmount").text(orderObj.totalnetamount);
				$(".vat").text(orderObj.vatamount);
				$(".paidAmount").text(orderObj.paidamount);
				$(".dueAmount").text(orderObj.dueamount);
				$(".previousdueamount").text(orderObj.previousdueamount);
				$(".grassAmount").text(orderObj.grossamount);

				var varcheckBox = "<div>"+orderObj.name+"</div>"; 
				$(".retunCylinders").append(varcheckBox);
				
				/* id="'+ dependentRowCount+ 'taxable"
				
				var tblRow =	'   <tr><th scope="col"><span class="sno">'+j+'</span></th>'
					           +'   <th scope="col"><span class="ite" id="ite'+j+'">items</span></th>'
					           +'    <th scope="col"><span class="quant" id="quant'+j+'">0.0</span></th>'
					           +'    <th scope="col"><span class="pri" id="pri'+j+'">0.0</span></th>'
					           +'    <th scope="col"><span class="tot" id="tot'+j+'">0.0</span></th>'
					           +'    <th scope="col"><span class="dis" id="dis'+j+'">00</span></th>'
					           +'    <th scope="col"><span class="net" id="net'+j+'">00</span></th></tr> ';
								$(tblRow).appendTo(".deliverCylinders tbody");
								$("#ite"+j).text(orderObj.items);
								$("#quant"+j).text(orderObj.quantity);
								$("#pri"+j).text(orderObj.price);
								$("#tot"+j).text(orderObj.totalamount);
								$("#dis"+j).text(orderObj.discount);
								$("#net"+j).text(orderObj.netamount); */
				
				
		});
	});
	
}

$("#pageName").text("Cylinder Deliver To Customer");
$(".cylinderDeliver").addClass("active");
</script>
