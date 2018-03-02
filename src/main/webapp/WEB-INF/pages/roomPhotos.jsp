<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="clearfix"></div>
	<ol class="breadcrumb">
    	<li><a href="#">Home</a></li>
		<li>Room Phoos</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Room Phoos List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
					<div class="table-responsive" id="tableId">
						<table class="table table-striped table-bordered datatables"
							id="example">
							<thead>
								<tr>
									<th>Room Type</th>
									<th>Capacity</th>
									<th>Images</th>
									<th>Images</th>
									<th>Images</th>
									<th>Images</th>
									<th>Images</th>
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
						<h4>Room Type</h4>
					</div>
					<form:form modelAttribute="roomPhotoForm" action="addRoomPhotos" class="form-horizontal" method="Post"  enctype="multipart/form-data">
					<div class="panel-body">
						<div class="row">
						<div class="col-md-4">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="roomTypeId" class="col-md-4 control-label">Room Type <span class="impColor">*</span></label>
									<div class="col-md-7">
									<form:select path="roomTypeId" class="form-control validate" onfocus="removeBorder(this.id);">
									<form:option value="">-- Select Room Type --</form:option>
									<form:options items="${roomtype }"></form:options>
									</form:select>
									</div>
									</div>
									</div>
									<div class="col-md-4">
                    			<div class="form-group">
                    				<label for="capacityId" class="col-md-4 control-label">Room/Adult <span class="impColor">*</span></label>
                    				<div class="col-md-7">
                    				<form:select path="capacityId" class="form-control validate" onfocus="removeBorder(this.id);">
									<form:option value="">-- Select Room Capacity --</form:option>
									<form:options items="${capacity }"></form:options>
									</form:select>
                    				</div>
                    			</div>
                    			</div>
                    			<div class="col-md-4">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="image1" class="col-md-4 control-label">Image<span class="impColor">*</span></label>
									<div class="col-md-7">
										<img id="imageId1" style="display: none;    width: 20%;" src="">
										<span id="imageLable1" style="display: none;"></span>
										<input id="imagePath1" name="imagePath1" type="hidden" value="">
										
										<%-- <form:input path="file" type="file" class="form-control validate" placeholder="Item Name"/> --%>
										<input  type="file" id="image1" name="image" class="form-control images" />
									</div>
									</div>
                    			</div>
						</div>
						<div class="row">
						<div class="col-md-3">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="image2" class="col-md-4 control-label">Image<span class="impColor">*</span></label>
									<div class="col-md-7">
									
									<img id="imageId2" style="display: none;    width: 20%;" src="">
										<span id="imageLable2" style="display: none;"></span>
										<input id="imagePath2" name="imagePath2" type="hidden" value="">
										
										<%-- <form:input path="file" type="file" class="form-control validate" placeholder="Item Name"/> --%>
										<input  type="file" id="image2" name="image" class="form-control images" />
									</div>
									</div>
                    			</div>
                    			<div class="col-md-3">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="image3" class="col-md-4 control-label">Image<span class="impColor">*</span></label>
									<div class="col-md-7">
									<img id="imageId3" style="display: none;    width: 20%;" src="">
										<span id="imageLable3" style="display: none;"></span>
										<input id="imagePath3" name="imagePath3" type="hidden" value="">
										
										<%-- <form:input path="file" type="file" class="form-control validate" placeholder="Item Name"/> --%>
										<input  type="file" id="image3" name="image" class="form-control images" />
									</div>
									</div>
                    			</div>
                    			<div class="col-md-3">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="image4" class="col-md-4 control-label">Image<span class="impColor">*</span></label>
									<div class="col-md-7">
									
									<img id="imageId4" style="display: none;    width: 20%;" src="">
										<span id="imageLable4" style="display: none;"></span>
										<input id="imagePath4" name="imagePath4" type="hidden" value="">
										
										<%-- <form:input path="file" type="file" class="form-control validate" placeholder="Item Name"/> --%>
										<input  type="file" id="image4" name="image" class="form-control  images"/>
									</div>
									</div>
                    			</div>
                    			<div class="col-md-3">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="image5" class="col-md-4 control-label">Image<span class="impColor">*</span></label>
									<div class="col-md-7">
									
									<img id="imageId5" style="display: none;    width: 20%;" src="">
										<span id="imageLable5" style="display: none;"></span>
										<input id="imagePath5" name="imagePath5" type="hidden" value="">
										
										<%-- <form:input path="file" type="file" class="form-control validate" placeholder="Item Name"/> --%>
										<input  type="file" id="image5" name="image" class="images" />
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
        <% 
        String rootPath = System.getProperty("catalina.home");
        session.setAttribute("rootPath", rootPath);
        %>
       
	</div> <!-- container -->

<script type="text/javascript">
var listOrders1 =${allOrders1};

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
    	'<thead><tr><th>Room Type </th><th>Capacity</th><th>Images</th><th>Images</th><th>Images</th><th>Images</th><th>Images</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deletePhotos("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deletePhotos("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editPhotos("+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.roomTypeId+"'>" + orderObj.roomTypeId + "</td>"
			+ "<td title='"+orderObj.capacityId+"'>" + orderObj.capacityId + "</td>"
			+ "<td title='Image'><img style='height: 4%;' src='${baseurl}/"+ orderObj.image1 +"'/></td>"
			+ "<td title='"+orderObj.image2+"'><img style='height: 4%;' src='${baseurl}/"+ orderObj.image2 +"'/></td>"
			+ "<td title='"+orderObj.image3+"'><img style='height: 4%;' src='${baseurl}/"+ orderObj.image3 +"'/></td>"
			+ "<td title='"+orderObj.image4+"'><img style='height: 4%;' src='${baseurl}/"+ orderObj.image4 +"'/></td>"
			+ "<td title='"+orderObj.image5+"'><img style='height: 4%;' src='${baseurl}/"+ orderObj.image5 +"'/></td>"
			+ "<td title='"+orderObj.photoStatus+"'>" + orderObj.photoStatus + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>"
			+"</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
}

function editPhotos(id){
	$("#id").val(id);
	$("#roomTypeId").val(serviceUnitArray[id].roomTypeId);
	$("#capacityId").val(serviceUnitArray[id].capacityId);
	
	
    $("#image1").css('color', 'transparent');
    $("#image2").css('color', 'transparent');
    $("#image3").css('color', 'transparent');
    $("#image4").css('color', 'transparent');
    $("#image5").css('color', 'transparent');
    
	$("#imageId1").show();
	$("#imageId2").show();
	$("#imageId3").show();
	$("#imageId4").show();
	$("#imageId5").show();
	
	$("#imageLable1").show();
	$("#imageLable2").show();
	$("#imageLable3").show();
	$("#imageLable4").show();
	$("#imageLable5").show();
	
	$("#dynamicImage1").remove();
	$("#dynamicImage2").remove();
	$("#dynamicImage3").remove();
	$("#dynamicImage4").remove();
	$("#dynamicImage5").remove();
	
	
	/* var editImage=serviceUnitArray[id].documents;
	var replaceImage=editImage.replace("documents/","");
	$("#imageId").attr("src","http://localhost:8099/NBD/"+editImage);
	$("#imageLable").text(replaceImage);
	$("#imagePath").val(editImage); */
	
	 $("#imageId1").attr("src", '${baseurl}/'+serviceUnitArray[id].image1);
	$("#imageId2").attr("src", '${baseurl}/'+serviceUnitArray[id].image2);
	$("#imageId3").attr("src", '${baseurl}/'+serviceUnitArray[id].image3);
	$("#imageId4").attr("src", '${baseurl}/'+serviceUnitArray[id].image4);
	$("#imageId5").attr("src", '${baseurl}/'+serviceUnitArray[id].image5);
	$("#imagePath1").val(serviceUnitArray[id].image1);
	$("#imagePath2").val(serviceUnitArray[id].image2);
	$("#imagePath3").val(serviceUnitArray[id].image3);
	$("#imagePath4").val(serviceUnitArray[id].image4);
	$("#imagePath5").val(serviceUnitArray[id].image5);
	
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deletePhotos(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
	}
	if(checkstr == true){
		$.ajax({
			type : "POST",
			url : "deleteRoomPhotos.htm",
			data :"id="+id+"&status="+status,
			beforeSend : function() {
				$.blockUI({ message: 'Please wait' });
			},
			success: function (response) {
				if(response != null ){
					$.unblockUI();
		        	var resJson=JSON.parse(response);
		            showTableData(resJson.allOrders1);
		            //window.location.reload();
				}
		       // window.location.reload();
			},
			error: function (e) { 
		    	$.unblockUI();
				console.log(e);
			}
		});
	}
}
function inactiveData() {
	
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
		$('#inActive').prop('checked', false);
	}
		
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveRoomPhotos', false,
				formData, false, 'text', function(data) {
			if(data != ''){
				var resJson=JSON.parse(data);
	            showTableData(resJson);
						console.log(resJson);
			}else{
				//alert('Inactive Data Empty...! ');
				showTableData(data);
			}
			
				});
	
}

	
	
 $(".images").change(function(e) {
	var id = $(this).attr('id');
	var num = id.replace(/[^0-9]/gi, '');
	console.log(num);
	$("#dynamicImage"+num).remove();
	  $("#imageId"+num).hide();
	  $("#imageLable"+num).hide();
	
    for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        
        var file = e.originalEvent.srcElement.files[i];
        
        var img = document.createElement("img");
        img.id='dynamicImage'+num;
//         img.setAttribute('width', '50%');
        img.setAttribute('style', 'width: 60px;height: 60px;');
        var reader = new FileReader();
        reader.onloadend = function() {
             img.src = reader.result;
        }
        reader.readAsDataURL(file);
        $("#image"+num).before(img);
        console.log( $("#image"+num).val());
//         $("#imageId").css('width', '20%');
    }
});

 
 $( document ).ready(function() {
	    console.log( "ready!" );
	    var aa= $("#image1").val("");
	    
		console.log("data"+aa)
	});
/* var idImage = $.makeArray($('.images').map(function() {
	return this.id;
}));
console.log(idImage);
alert("----idImage---:"+idImage); */


function dataClear(){
	$("#id").val("");
	$("#Name").val("");
	$("#s").val("");
	$("#location").val("");
}
$("#pageName").text("Room Photos");
$(".roomPhoto").addClass("active"); 
</script>