<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="container">


<h2 style="margin-top:0px;">Room Photos</h2>
         
         <ol class="breadcrumb">
         <li><a href="dashboard.html">Dashboard</a></li>
         <li><a href="#">Rooms</a></li>
         <li>Room Photos</li>
         
         
         </ol>        
         
       <div class="row">
    <div class="col-md-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Room Photos List</h3>
          <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-down"></i></span>
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
    </div></div>
<div class="clearfix"></div>
      <div class="row">
    <div class="col-md-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Room Photos</h3>
         
        </div>
        <form:form modelAttribute="roomPhotoForm" action="addRoomPhotos" class="form-horizontal" method="Post"  enctype="multipart/form-data">
        <div class="panel-body">
        
       
      <div class="col-md-12">
     <div class="col-md-6">
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
                    			<div class="form-group">
                    				<label for="capacityId" class="col-md-4 control-label">Room/Adult <span class="impColor">*</span></label>
                    				<div class="col-md-7">
                    				<form:select path="capacityId" class="form-control validate" onfocus="removeBorder(this.id);">
									<form:option value="">-- Select Room Capacity --</form:option>
									<form:options items="${capacity }"></form:options>
									</form:select>
                    				</div>
                    			</div>
                    			<div class="form-group">
                    				<span for="sun" class="col-md-4 control-label">image<span class="impColor">*</span></span>
                    				<div class="col-md-7" id="dvPreview1">
                    				<img id="imageId" style="display: none;    width: 20%;" src="">
                    				<span id="imageLable" style="display: none;"></span>
									<input id="imagePath" name="imagePath" type="hidden" value="">
		                            	<input type="file" id="image" name="image" class="form-control images" multiple="multiple">
								  	</div>
                    			</div>
							</div>
        </div><br><br><br>
        <div class="col-sm-12">
				      			<div class="btn-toolbar" 
         style="float:right;">
					      			<input class="btn-primary btn" type="submit" value="Submit" id="submit1">
					      			<input class="btn-danger btn cancel" type="reset" value="Reset">
				      			</div>
				      		</div>
      </div></form:form>
    </div>
    </div></div></div>
<script type="text/javascript">
var listOrders1 =${allOrders1};

console.log(listOrders1);
if (listOrders1 != "") {
	showTableData(listOrders1);
}

var damageId = 0;
// var serviceUnitArray ={};
var data = {};

var image1="";var image2="";var image3="";var image4="";var image5="";
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
		var myString = orderObj.images;
		var arr = myString.split(',');
		$.each(arr, function( index, value ) {
			console.log(index+"-----"+value);
			if(index==0){
				 image1=value;
			}
			if(index==1){
				 image2=value;				
			}
			if(index==2){
				 image3=value;
			}
			if(index==3){
				 image4=value;
			}
			if(index==4){
				 image5=value;
			}
		});
		var tblRow ="<tr>"
			+ "<td title='"+orderObj.roomTypeId+"'>" + orderObj.roomTypeId + "</td>"
			+ "<td title='"+orderObj.capacityId+"'>" + orderObj.capacityId + "</td>"
			+ "<td title='Image'><img style='height: 4%;' src='${baseurl}/"+image1 +"'/></td>"
			+ "<td title='"+image2+"'><img style='height: 4%;' src='${baseurl}/"+image2+"'/></td>"
			+ "<td title='"+image3+"'><img style='height: 4%;' src='${baseurl}/"+image3+"'/></td>"
			+ "<td title='"+image4+"'><img style='height: 4%;' src='${baseurl}/"+image4+"'/></td>"
			+ "<td title='"+image5+"'><img style='height: 4%;' src='${baseurl}/"+image5+"'/></td>"
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
	

	
	/* var editImage=serviceUnitArray[id].documents;
	var replaceImage=editImage.replace("documents/","");
	$("#imageId").attr("src","${baseurl}"+editImage);
	$("#imageLable").text(replaceImage);
	$("#imagePath").val(editImage); */
	
	/* $("#image").css('color', 'transparent');
	$("#imageId").show();
	$("#imageLable").show();
	$("#dynamicImage").remove(); */
	
	
// 	var replaceImage=editImage.replace("documents/","");
// 	$("#imageId").attr("src","${baseurl}/"+image1);
// 	$("#imageLable").text(replaceImage);
// 	$("#imagePath").val(image1);
	
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
// 	var id = $(this).attr('id');
// 	var num = id.replace(/[^0-9]/gi, '');
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
        $("#image").before(img);
//         console.log( $("#image").val());
//         $("#imageId").css('width', '20%');
    }
}); 
/* $(".images").change(function () {
    if (typeof (FileReader) != "undefined") {
        var dvPreview = $("#dvPreview");
        dvPreview.html("");
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
        $($(this)[0].files).each(function () {
            var file = $(this);
            if (regex.test(file[0].name.toLowerCase())) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = $("<img />");
                    img.attr("style", "height:100px;width: 100px");
                    img.attr("src", e.target.result);
                    dvPreview.append(img);
                }
                reader.readAsDataURL(file[0]);
            } else {
                alert(file[0].name + " is not a valid image file.");
                dvPreview.html("");
                return false;
            }
        });
    } else {
        alert("This browser does not support HTML5 FileReader.");
    }
}); */
 

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