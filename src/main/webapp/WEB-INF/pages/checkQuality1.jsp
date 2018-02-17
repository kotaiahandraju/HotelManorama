<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  


 
<!--         body starts heare -->
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="#">Home</a></li>
               <li>Cylinder</li>
            </ol>
            <div class="clearfix"></div>
        <div class="container">
            
            <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-12">
<!--                 <div class="panel panel-primary"> -->
<!--                     <div class="panel-heading"> -->
<!--                         <h4>Add Cylinder</h4> -->
<!--                         <div class="options"></div> -->
<!--                     </div> -->
<%--                     <form:form class="form-horizontal" modelAttribute="cylinderForm"  role="form" id="cylider-form" action="addcylinder" method="post"> --%>
<!--                     <div class="panel-body"> -->
<%--                     	<c:if test="${not empty msg}"> --%>
<!-- 	                    	<div class="row"> -->
<!-- 	                    		<div class="col-sm-4 col-sm-offset-4"> -->
<!-- 	                    			<div class="form-group"> -->
<%-- 	                    				<div class="msgcss alert alert-${cssMsg} fadeIn animated" style="text-align: center;">${msg}</div> --%>
<!-- 	                    			</div> -->
<!-- 	                    		</div> -->
<!-- 	                    	</div> -->
<%--                     	</c:if> --%>
<!--                     	<div class="row"> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<%--                     				<form:hidden path="id"/> --%>
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Cylinder ID<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								      <form:input path="cylinderid" class="form-control validate" placeholder="Cylinder ID"/> --%>
<!-- 								      <span class="hasError" id="cylinderidError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Size<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:select path="size" items="${cylinderTypes}" class="form-control"/> --%>
<!-- 								      <span class="hasError" id="sizeError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     	</div> -->
                    	
<!--                     	<div class="row"> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label ">Capacity</label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="capacity" value="11" class="form-control" readonly="true" placeholder="Capacity"/> --%>
<!-- 								      	<span class="hasError" id="capacityError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Status<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:select path="cylinderstatus" class="form-control"> --%>
<%-- 									  		<form:option value="idle">Idle</form:option> --%>
<%-- 									  		<form:option value="filled">Filled</form:option> --%>
<%-- 									  		<form:option value="Delivered">Delivered</form:option> --%>
<%-- 			                                <form:option value="empty">Empty</form:option> --%>
<%-- 			                                <form:option value="missing">Missing</form:option> --%>
<%-- 									  	</form:select> --%>
<!-- 								      <span class="hasError" id="cylinderstatusError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     	</div> -->
                     
<!--                      <div class="row"> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Location<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="location" value="" class="form-control validate onlyCharacters" placeholder="Location" /> --%>
<!-- 								      	<span class="hasError" id="locationError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">LPO Number<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="lponumber" value="" class="form-control validate" placeholder="LPO No" /> --%>
<!-- 								      	<span class="hasError" id="lponumberError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     	</div> -->
                    	
<!--                     	<div class="row"> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Owner Company<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="ownercompany" value="" class="form-control validate onlyCharacters" placeholder="Owner Company" /> --%>
<!-- 								      	<span class="hasError" id="ownercompanyError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Color Of Cylinder<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="color" value="" class="form-control  validate onlyCharacters"  placeholder="Color Of Cylinder"/> --%>
<!-- 								      	<span class="hasError" id="colorError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     	</div> -->
                    	
<!--                     	<div class="row"> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Made In<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="madein" value="" class="form-control validate onlyCharacters" placeholder="Made In" /> --%>
<!-- 								      	<span class="hasError" id="madeinError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Expiry Date<span class="impColor">*</span></label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="expirtdate1" value="" class="form-control" readonly="true" placeholder="Expiry Date" onblur="isDate(this.id)" /> --%>
<!-- 								      	<span class="hasError" id="expirydateError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     	</div> -->
<!--                     	<div class="row"> -->
<!--                     		<div class="col-md-6"> -->
<!--                     			<div class="form-group"> -->
<!--                     				<label for="focusedinput" class="col-md-4 control-label">Remarks</label> -->
<!-- 								    <div class="col-md-6"> -->
<%-- 								    	<form:input path="remarks" value="" class="form-control"  placeholder="Remarks"/> --%>
<!-- 								      	<span class="hasError" id="remarksError"></span> -->
<!-- 								    </div> -->
<!--                     			</div> -->
<!--                     		</div> -->
<!--                     	</div> -->
<!-- 				</div> -->
<!--                     <div class="panel-footer"> -->
<!-- 				      	<div class="row"> -->
<!-- 				      		<div class="col-sm-12"> -->
<!-- 				      			<div class="btn-toolbar  pull-right"> -->
<!-- 					      			<input type="submit" id="submit1" value="Submit" class="btn-primary btn"/> -->
<!-- 					      			<input type="reset" value="Reset" class="btn-danger btn cancel"/> -->
<!-- 				      			</div> -->
<!-- 				      		</div> -->
<!-- 				      	</div> -->
<!-- 				      </div> -->
				      
<%-- 				      </form:form>   --%>
<!-- 			</div> -->
                    
                </div>
            </div>
            
            
            
        </div>
        
        <div class="row">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Cylinders List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="panel-body collapse in">
                        <div class="table-responsive" id="tableId">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                                <thead>
                                    <tr>
                                        <th>Cylinder ID</th><th>Size</th><th>Cylinder Status</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div> <!-- container -->
    </div> <!-- #wrap -->
</div> <!-- page-content -->

<script type='text/javascript' src='${baseurl }/js/jquery-ui.min.js'></script> 

<script type="text/javascript">

var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Cylinder ID</th><th>Size</th><th>Cylinder Status</th><</tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		
					serviceUnitArray[orderObj.id] = orderObj;
					var tblRow = "<tr >"
							+ "<td title='"+orderObj.cylinderid+"'>"+ orderObj.cylinderid + "</td>"
							+ "<td title='"+orderObj.size+"'>"+ orderObj.size + "</td>"
    						+ "<td title='"+orderObj.cylendersstatus+"'>"+ orderObj.cylendersstatus + "</td>"
							+ "</tr >";
					$(tblRow).appendTo("#tableId table tbody");
					});
	
	
}


 $("#pageName").text("Cylinder Master");
 $(".cylinder").addClass("active"); 
 
</script>