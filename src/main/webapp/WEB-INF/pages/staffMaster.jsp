<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



		<div class="clearfix"></div>
		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li>Staff Master</li>
		</ol>
		<div class="clearfix"></div>
		<div class="container">
			<div class="row">
						<div class="col-md-12">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h4>Staff Master Details</h4>
									<div class="options">
										<a href="javascript:;" class="panel-collapse"><i
											class="fa fa-chevron-down"></i></a>
									</div>
								</div>
								<div class="panel-body collapse in">
								<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
									<div class="table-responsive" id="tableId">
										<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
											<thead>
												<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Staff Code</th>
													<th>Staff Number</th>
													<th>Designation</th>
													<th>Nationality</th>
													<th>Mobile</th>
													<th>Documents</th>
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
					</div>


				<div class="row" id="moveTo">
					<div class="col-md-12 col-sm-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>Staff Master Details</h4>
								<div class="options"></div>
							</div>
							<form:form modelAttribute="staffMaster" class="form-horizontal"
								role="form" id="education-form" action="saveStaffDetails"
								method="post"  enctype="multipart/form-data">
								<div class="panel-body">
									
								<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Staff Code
												<span class="impColor">*</span>
												
												</label>
												<div class="col-sm-6">
												<form:hidden path="id"/>
													<form:input path="staffcode"
														class="form-control  validate"
														autocomplete="off" placeholder="Staff Code"
														required="required" />
													<span class="hasError" id="staffcodeError"></span>
													<div>
														<form:errors path="staffcode" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Staff Number
												<span class="impColor">*</span>
												
												</label>
												<div class="col-sm-6">
													<form:input path="staffno"
														class="form-control  validate"
														autocomplete="off" placeholder="3 digit number" required="required" maxlength="3" />
													<span class="hasError" id="staffnoError"></span>
													<div>
														<form:errors path="staffno" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Designation</label>
												<div class="col-sm-6">
													<form:input path="designation"
														class="form-control onlyCharacters validate"
														autocomplete="off" placeholder="Designation" required="required" />
													<span class="hasError" id="designationError"></span>
													<div>
														<form:errors path="designation" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Nationality
												</label>
												<div class="col-sm-6">
												      <form:input path="nationality"
															class="form-control onlyCharacters validate"
															autocomplete="off" placeholder="Nationality" required="required" />
													<span class="hasError" id="nationalityError"></span>
													<div>
														<form:errors path="nationality" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">First Name
												<span class="impColor">*</span>
												</label>
												<div class="col-sm-6">
													<form:input path="firstname"
														class="form-control onlyCharacters validate"
														autocomplete="off" placeholder="First Name" required="required" />
													<span class="hasError" id="firstnameError"></span>
													<div>
														<form:errors path="firstname" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Last Name
													<span class="impColor">*</span>
												</label>
												<div class="col-sm-6">
													<form:input path="lastname"	class="form-control onlyCharacters validate" autocomplete="off" placeholder="Last Name" required="required" />
													<span class="hasError" id="lastnameError"></span>
													<div>
														<form:errors path="lastname" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Mobile <span class="impColor">*</span></label>
												<div class="col-sm-6">
													<form:input path="mobile"
														class="form-control numericOnly validate"
														autocomplete="off" placeholder="Mobile" required="required" maxlength="13" />
													<span class="hasError" id="mobileError"></span>
													<div>
														<form:errors path="mobile" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Image
													<!-- <span class="impColor">*</span> -->
												</label>
												<div class="col-sm-6">
<%-- 													<form:input path="documents" class="form-control validate" autocomplete="off" placeholder="" required="required" /> --%>
													<img id="imageId" style="display: none;    width: 20%;" src="" ><span id="imageLable" style="display: none;"></span>
													<form:hidden path="imagePath"/>
													<input type="file" name="file" style="margin-top: 3%;" id="documents" onchange="" />
													<span class="hasError" id="documentsError"></span>
													<div>
														<form:errors path="documents" cssClass="error" />
													</div>
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
												<input type="reset" value="Reset" id="imageClear" class="btn-danger btn cancel"/>
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
var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}

function displayTable(listOrders)
{
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
		+ '<thead><tr><th>First Name</th><th>Last Name</th><th>Staff Code</th><th>Staff Number</th><th>Designation</th><th>Nationality</th><th>Mobile</th><th>Image</th><th>Status</th><th style="text-align: center;">Action</th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders, function(i, orderObj){
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deleteStaffMasterDetails("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deleteStaffMasterDetails("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		
		var edit = "<a class='edit editIt' onclick='editStaffMasterDetails(" + orderObj.id + ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
			+ "<td title='"+orderObj.firstname+"'>" + orderObj.firstname + "</td>"
			+ "<td title='"+orderObj.lastname+"'>" + orderObj.lastname + "</td>"
			+ "<td class='impFiled' title='"+orderObj.staffcode+"'>" + orderObj.staffcode + "</td>"
			+ "<td class='impFiled' title='"+orderObj.staffcode+"'>" + orderObj.staffno + "</td>"
			+ "<td title='"+orderObj.designation+"'>" + orderObj.designation + "</td>"
			+ "<td title='"+orderObj.nationality+"'>" + orderObj.nationality + "</td>"
			+ "<td title='"+orderObj.mobile+"'>" + orderObj.mobile + "</td>"
			+ "<td title='image'><img style='width: 50px;height: 40px;' src=${baseurl }/"+orderObj.documents +"></td>"
			+ "<td title='"+orderObj.staffStatus+"'>" + orderObj.staffStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>" 
			+ "</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}
			
function editStaffMasterDetails(id)
{
	$("#id").val(serviceUnitArray[id].id);
	$("#firstname").val(serviceUnitArray[id].firstname);
	$("#lastname").val(serviceUnitArray[id].lastname);
	$("#staffcode").val(serviceUnitArray[id].staffcode);
	$("#staffno").val(serviceUnitArray[id].staffno);
	$("#designation").val(serviceUnitArray[id].designation);
	$("#nationality").val(serviceUnitArray[id].nationality);
	$("#mobile").val(serviceUnitArray[id].mobile);
	$("#documents").css('color', 'transparent');
	$("#imageId").show();
	$("#imageLable").show();
	$("#dynamicImage").remove();
	
	var editImage=serviceUnitArray[id].documents;
	var replaceImage=editImage.replace("documents/","");
	$("#imageId").attr("src","${baseurl }/"+editImage);
	$("#imageLable").text(replaceImage);
	$("#imagePath").val(editImage);
	//alert($("#imageLable").val(replaceImage));
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deleteStaffMasterDetails(id,status)
{
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
	}
	console.log(status);
	if (checkstr == true)
	{
		var formData = new FormData();
		formData.append('id', id);
		formData.append('status', status);
		$.fn.makeMultipartRequest('POST', 'deleteStaffMasterDetails', false, formData, false, 'text', function(data) {
				var jsonobj = $.parseJSON(data);
				window.location.reload();
				var alldata = jsonobj.allOrders1;
				console.log(jsonobj.allOrders1);
				displayTable(alldata);
		});
	}
}

$("#documents").change(function(e) {
	
	$("#dynamicImage").remove();
	  $("#imageId").hide();
	  $("#imageLable").hide();

    for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        
        var file = e.originalEvent.srcElement.files[i];
        
        var img = document.createElement("img");
        img.id='dynamicImage';
//         img.setAttribute('width', '50%');
        img.setAttribute('style', 'width: 60px;height: 60px;');
        var reader = new FileReader();
        reader.onloadend = function() {
             img.src = reader.result;
        }
        reader.readAsDataURL(file);
        $("#documents").before(img);
//         $("#imageId").css('width', '20%');
    }
});

function kkmodifyImagePath(){
	
for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        
        var file = e.originalEvent.srcElement.files[i];
        //$("#imageId").attr();
        var img = document.createElement("img");
        var reader = new FileReader();
        reader.onloadend = function() {
             img.src = reader.result;
        }
        reader.readAsDataURL(file);
        $("input").before(img);
        $("#input").css('color', 'width: 20%');
    }
	
	
	/* var iLable=$("#documents").val();
	$("#imageId").attr("src","${baseurl }/"+editImage);
	$("#imageLable").text(replaceImage); */
}
$("#imageClear").click(function() {
	$("#imageId").val("");
	$("#imageLable").val("");
	$("#documents").val("");
	$("#dynamicImage").remove();
})

function inactiveData() {
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveStaff', false,
				formData, false, 'text', function(data) {
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
				});
		
}
$("#pageName").text("Staff Master");
$(".staff").addClass("active");
</script>