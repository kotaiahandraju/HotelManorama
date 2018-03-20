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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">


<script type='text/javascript' src='${baseurl }/js/canvasjs.min.js'></script> 
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script type="text/javascript">
var isClick = 'No';
</script>
</head>
<style>
.scrol {
	max-height: 350px;
	overflow-y: auto;
}
</style>
<body>
	<div class="header">
		<!--<img src="images/1.png" class="img-responsive" style="margin:0 auto;"/>-->
		<div id="logo">
			<h2 style="text-align: center;">Hotel Booking</h2>
		</div>
	</div>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
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
					<ul class="nav navbar-nav">
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
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-tags" aria-hidden="true"></span><br>
									Rooms
								</button></a>
							<ul class="dropdown-menu">
								<li><a href="roomTypeHome">Room Type</a></li>
								<li><a href="capacityHome">Room Occupation</a></li>
								<li><a href="roomMasterHome">Room Master</a></li>
								<li><a href="roomPriceHome">Room Tariff</a></li>
								<li><a href="roomPhotosHome">Room Photos</a></li>
								<li><a href="offerPriceForm">Special Offer Price</a></li>
							</ul></li>
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
						<li><a href="index.html"><button type="button"
									class="btn btn-default btn-lg">
									<span class="glyphicon glyphicon-off" aria-hidden="true"></span><br>
									Logout
								</button></a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>