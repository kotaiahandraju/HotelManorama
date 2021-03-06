<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="container">


<h2>Room Photos</h2>
         
         <ol class="breadcrumb">
         <li><a href="#">Rooms</a></li>
         <li>Room Photos</li>
         
         
         </ol>        
         
       <div class="row">
    <div class="col-md-12">
    <div class="col" style="border:solid 1px; border-color:#CCCCCC; border-radius:5px;">
				<ul style="background-color:#F7F7F7; margin-top:5px; border:solid 1px; border-color:#CCCCCC; border-radius:5px;" id="myTab" class="nav nav-tabs" role="tablist">
					<li style="margin-left:3px; margin-top:5px;"  class="roomTypeHome"><a href="roomTypeHome" >Rooms Type</a></li>
					<li style="margin-top:5px;" role="presentation" class="roomcapacity"><a href="roomcapacity">Room Capacity</a></li>
					<li style="margin-top:5px;" role="presentation" class="occupation"><a href="occupation" >Room Occupation</a></li>
					<li style="margin-left:3px; margin-top:5px;" class="roomMasterHome"><a href="roomMasterHome" >Room Master</a></li>
					<li style="margin-top:5px;" role="presentation" class="roomPriceHome"><a href="roomPriceHome" >Room Tariff</a></li>
					<li style="margin-top:5px;" role="presentation" class="roomPhotosHome"><a href="roomPhotosHome" >Room Photos</a></li>
					<li style="margin-top:5px;" role="presentation" class="offerPriceForm"><a href="offerPriceForm" >Special Offer Price</a></li>
				</ul>
				<div id="myTabContent" class="tab-content"></div>
    
    </div> 
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
									<th>Room Capacity</th>
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
          <h3 class="panel-title" id="moveTo">Room Photos</h3>
         
        </div>
        <form:form modelAttribute="roomPhotoForm" action="addRoomPhotos" class="form-horizontal" method="Post"  enctype="multipart/form-data">
        <div class="panel-body">
        
       
      <div class="col-md-12">
     <div class="col-md-6">
								<div class="form-group">
									<form:hidden path="id"/>
									<label for="roomTypeId" class="col-md-4 control-label">Room Type <span class="impColor">*</span></label>
									<div class="col-md-7">
									<form:select style='width: 218px;' path="roomTypeId" class="form-control validate" onfocus="removeBorder(this.id);">
									<form:option value="">-- Select Room Type --</form:option>
									<form:options items="${roomtype }"></form:options>
									</form:select>
									</div>
                    			</div>
                    			<div class="form-group">
                    				<label for="capacityId" class="col-md-4 control-label">Room Capacity <span class="impColor">*</span></label>
                    				<div class="col-md-7">
                    				<form:select style='width: 218px;' path="capacityId" class="form-control validate" onfocus="removeBorder(this.id);">
									<form:option value="">-- Select Room Capacity --</form:option>
									<form:options items="${capacity }"></form:options>
									</form:select>
                    				</div>
                    			</div>
                    			<div class="form-group">
                    				<label for="sun" class="col-md-4 control-label">Image<span class="impColor">*</span></label>
                    				<div class="col-md-7" id="dvPreview1">
                    				<img id="imageId" style="display: none;    width: 20%;" src="">
                    				<span id="imageLable" style="display: none;"></span>
										<input id="imagePath" name="imagePath" type="hidden" value="">
		                            	<input style='width: 218px;' type="file" id="image" name="image" class="form-control images" multiple="multiple">
								  	</div>
                    			</div>
							</div>
        </div><br><br><br>
        <div class="col-sm-12">
        <div class="col-sm-7">
				      			<div class="btn-toolbar" 
         style="float:right;">
					      			<input class="btn-primary btn" type="submit" value="Submit" id="submit1">
					      			<input class="btn-danger btn cancel" type="reset" value="Reset">
				      			</div>
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


function showTableData(response){
	var table=$('#tableId').html('');
	serviceUnitArray = {};
	var protectType = null;
	var tableHead = '<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">'+
    	'<thead><tr><th>Room Type </th><th>Capacity</th><th>Images</th><th>Images</th><th>Images</th><th>Images</th><th>Images</th><th>Status</th><th></th></tr>'+
    	"</thead><tbody></tbody></table>";
	$("#tableId").html(tableHead);
	$.each(response,function(i, orderObj) {
		var image1="";var image2="";var image3="";var image4="";var image5="";
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
			+ "<td title='"+orderObj.roomTypeId+"'>" + orderObj.roomTypeName + "</td>"
			+ "<td title='"+orderObj.capacityId+"'>" + orderObj.roomOcupenceyName + "</td>"
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
	
	var imagePaths = serviceUnitArray[id].images;
	console.log(typeof(imagePaths));
	$("#imagePath").val(imagePaths);
	console.log($("#imagePath").val());
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deletePhotos(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
		 $('#inActive').prop('checked', false);
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
		            tooltip1();
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
						 tooltip1();
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
	     $("#imagePath").val("");
	     
	     var maxFiles = 5,
	     filesCounter = 0;
	
    for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
    	
    	 if (filesCounter + i + 1 > maxFiles) {
    		 alert("Selected Maximum only 5 images...");
    		 $('.images').css('color','transparent');
             return null;
         }else{
		    	
        	 var file = e.originalEvent.srcElement.files[i];
 	        
 	        var img = document.createElement("img");
 	        img.id='dynamicImage';
// 	         img.setAttribute('width', '50%');
 	        img.setAttribute('style', 'width: 60px;height: 60px;');
 	        var reader = new FileReader();
 	        reader.onloadend = function() {
 	             img.src = reader.result;
 	        }
 	        reader.readAsDataURL(file);
 	      //  $("#image").before(img);
// 	         console.log( $("#image").val());
    	}
    	 
       
    }
   
    
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
$(".roomPhotosHome").addClass("active"); 
</script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
function dynamicImage(){
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
}
       
</script>