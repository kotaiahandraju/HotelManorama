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
									<input id="id" name="id" type="hidden" value="0">
									<span for="roomTypeId" class="col-md-4 control-label">Room Type <span class="impColor">*</span></span>
									<div class="col-md-7">
									<select id="roomTypeId" name="roomTypeId" class="form-control validate default-class placeholder-style your-class" onFocus="removeBorder(this.id);" style="color: rgb(231, 61, 74); border-color: rgb(231, 61, 74);">
									<option value="">-- Select Room Type --</option>
									
									</select>
									</div>
                    			</div>
                    			<div class="form-group">
                    				<span for="capacityId" class="col-md-4 control-label">Room/Adult <span class="impColor">*</span></span>
                    				<div class="col-md-7">
                    				<select id="capacityId" name="capacityId" class="form-control validate" onFocus="removeBorder(this.id);">
									<option value="">-- Select Room Capacity --</option>
									<option value="1">Single(1)</option><option value="2">Double(2)</option><option value="3">Triple(3)</option>
									</select>
                    				</div>
                    			</div>
                    			<div class="form-group">
                    				<span for="sun" class="col-md-4 control-label">image<span class="impColor">*</span></span>
                    				<div class="col-md-7">
		                            	<input type="file" id="image1" name="image" class="form-control images">
								  	</div>
                    			</div>
								<div class="form-group">
                    				<span for="sun" class="col-md-4 control-label">image<span class="impColor">*</span></span>
                    				<div class="col-md-7">
		                            	<input type="file" id="image1" name="image" class="form-control images">
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