<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Admin Panel</title>

<!-- Bootstrap -->
<link href="${baseurl}/assets/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/assets/css/style.css">
	<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/datatables/dataTables.css' /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${baseurl}/assets/css/datepicker1.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='${baseurl}/assets/js/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='${baseurl}/assets/js/bootstrap.min.js'></script> 

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<script type='text/javascript' src="${baseurl}/js/jquery.blockUI.min.js" ></script>
<script type='text/javascript' src='${baseurl}/js/ajax.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
<link rel="stylesheet" href="${baseurl }/assets/css/select2.css">



<script type='text/javascript' src='${baseurl }/js/canvasjs.min.js'></script> 
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script type="text/javascript">
var isClick = 'No';

function tooltip1(){
	$('.view').attr('data-toggle','tooltip');
	$('.view').attr('data-original-title','View');
	$('.edit').attr('data-toggle','tooltip');
	$('.edit').attr('data-original-title','Edit');
	$('.delete').attr('data-toggle','tooltip');
	$('.delete').attr('data-original-title','Delete');
	$('.activate').attr('data-toggle','tooltip');
	$('.activate').attr('data-original-title','Activate');
	$('.printlpo').attr('data-toggle','tooltip');
	$('.printlpo').attr('data-original-title','Print');
	$('.deactivate').attr('data-toggle','tooltip');
	$('.deactivate').attr('data-original-title','Deactivate');
	  $('[data-toggle="tooltip"]').tooltip();  
}
</script>
<style>
.navbar-default
 .navbar-nav>.active>a,
  .navbar-default
   .navbar-nav>
   .active>a:focus, 
   .navbar-default 
   .navbar-nav>
   .active>a:hover{background: transparent;}
   
.alert-success, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}

.msgcss
{
/* 	width: 50% !important; */
/* 	font-weight: bold; */
	margin: auto;
	text-align: center;
	top: 3px !important;
	left:0;
	right:0;
	position: fixed;
	font-size: 14px;
	z-index:99999;
}
.navbar {
margin-bottom:10px;
}
.form-control {
    display: block;
    width: 185px;
    }
</style>
<script>
window.setTimeout(function() {
    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 5000);

</script>
</head>

<body>
	<c:if test="${not empty msg}">
		<div class="msgcss row">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-${cssMsg} fadeIn animated">${msg}</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="header">
		<!--<img src="images/1.png" class="img-responsive" style="margin:0 auto;"/>-->
		<div id="logo">
			<h2 style="text-align: center;">Hotel Booking</h2>
		</div>
	</div>
	<div class="container-fluid" style='padding-left: 0px; background:#f8f8f8;'>
		<nav class="navbar navbar-default" style='border: none;height: 73px;'>
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!--<a class="navbar-brand" href="#">Hotel Bookings</a>-->
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="collapse-1">
					<ul class="nav navbar-nav" style='margin: -11px 135px;'>
						<li class="active"><a href="dashboard.html"><button
									type="button" class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span><br>
									Dashboard
								</button></a></li>

						<li><a href="bookings.html"><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-book" aria-hidden="true"></span><br>
									Bookings
								</button></a></li>
						<li class="roommenu"><a href="roomTypeHome" ><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-tags" aria-hidden="true"></span><br>
									Rooms
								</button></a>
							</li>
						<li><a href="options.html"><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-menu-hamburger"
										aria-hidden="true"></span><br> Options
								</button></a></li>
						<li><a href="reports.html"><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span><br>
									Reports
								</button></a></li>
						<li><a href="users.html"><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span><br>
									Users
								</button></a></li>
						<!--<li>
        	<a href="#"><button type="button" class="btn btn-default btn-lg">
  				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span><br> Preview
			</button></a>
            </li>
        <li>
        	<a href="#"><button type="button" class="btn btn-default btn-lg">
  				<span class="glyphicon glyphicon-save" aria-hidden="true"></span><br> Install
			</button></a>
            </li>-->
						<li><a href="../logoutHome"><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-off" aria-hidden="true"></span><br>
									Logout
								</button></a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->			
			<!-- /.container-fluid -->
		</nav>
	</div>
	<script>
$(document).on('click', '.panel-heading span.clickable', function(e){
    var $this = $(this);
  if(!$this.hasClass('panel-collapsed')) {
    $this.parents('.panel').find('.panel-body').slideUp();
    $this.addClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
  } else {
    $this.parents('.panel').find('.panel-body').slideDown();
    $this.removeClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
  }
})
</script>