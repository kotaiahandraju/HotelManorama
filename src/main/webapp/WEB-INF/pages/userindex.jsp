<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Hotel Manorama</title>
<meta name="keywords" content="Home">
<meta name="description" content="Home">
<link href="${baseurl}/assets/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="user/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="user/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="user/css/style.css">
<link rel="stylesheet" type="text/css"
	href="user/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="user/css/style_banner.css">
<link rel="stylesheet" type="text/css" href="user/css/settings.css">
<link rel="stylesheet" type="text/css"
	href="user/css/jquery-ui-1.8.18.custom.css">
<link href="user/css/ninja-slider.css" rel="stylesheet" />
<script src="user/js/ninja-slider.js"></script>

<link href="user/css/thumbnail-slider.css" rel="stylesheet"
	type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<script src="user/js/thumbnail-slider.js" type="text/javascript"></script>
<script async="" src="user/js/analytics.js.download"></script>
<script type="text/javascript" src="user/js/jquery.js"></script>
<script type="text/javascript" src="user/js/bootstrap.min.js.download"></script>
<script type="text/javascript"
	src="user/js/jquery.themepunch.plugins.min.js.download"></script>
<script type="text/javascript"
	src="user/js/jquery.themepunch.revolution.min.js.download"></script>
<style>
@font-face {
	font-family: 'Roboto', sans-serif;
}

@font-face {
	font-family: 'Roboto', sans-serif;
}

body {
	font-family: 'Roboto', sans-serif;
}

ul {
	padding: 0;
	margin: 0;
}
/*--services--*/
.top-content {
	text-align: center;
	padding: 0em 0 2em;
}

.top-content h1 {
	font-size: 3em;
	color: #1B3E5C;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.top-content p {
	font-size: 1em;
	color: #B4B2B2;
	line-height: 1.9em;
}

.grid-top {
	text-align: center;
}

.glyphicon.glyphicon-home, .glyphicon.glyphicon-time, .glyphicon.glyphicon-cog,
	.glyphicon.glyphicon-lock {
	font-size: 1.5em;
	color: #FFF;
	background: #1b3e5c;
	border-radius: 100px;
	width: 50px;
	height: 50px;
	text-align: center;
	line-height: 2.3em;
}

.top-grid h3 {
	font-size: 1.5em;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: 600;
	color: #000;
	margin: 0.5em 0 0.3em;
}

.top-grid p {
	color: #B4B2B2;
	line-height: 1.9em;
	font-size: 1em;
}

.content-top {
	padding: 0 0 4em;
}
/*----*/
.content-middle {
	padding: 4em 0 0;
}

/*--responsive--*/
@media ( max-width :1366px) {
}

@media ( max-width :1280px) {
}

@media ( max-width :1024px) {
	.welcome h5 {
		font-size: 1em;
		margin: 0.5em 0;
	}
	.top-grid h3 {
		font-size: 1.2em;
	}
	.top-sed label {
		padding: 1.3em 0 0;
	}
	.sed-top h4 {
		font-size: 1.2em;
		margin: 0.8em 0;
	}
	.sed h5 {
		font-size: 1em;
		margin: 0.5em 0;
	}
	.sed p {
		margin: 0.5em 0 0em;
	}
	/*--about--*/
	.mid-about p {
		line-height: 1.7em;
	}
	.bottom-top h3 {
		font-size: 1.65em;
		margin-top: 1em;
	}
	/*--services--*/
	.top-services h5 {
		font-size: 1.05em;
	}
}

@media ( max-width :768px) {
	span.menu {
		display: block;
		text-align: right;
		cursor: pointer;
		position: relative;
	}
	.top-nav ul {
		display: none;
		position: absolute;
		width: 100%;
		z-index: 9999;
		left: 0%;
		margin: 1.1em 0em;
		background: #1b3e5c;
		border: 0;
	}
	.top-nav span.menu {
		display: block;
	}
	.top-nav ul li {
		display: block;
		float: none;
		padding: 0.3em;
		text-align: center;
	}
	.top-nav ul li a {
		color: #fff;
		display: block;
		margin: 0;
		background: none;
		border: none;
		padding: 0.4em;
	}
	.top-nav ul li.active a {
		color: #000;
	}
	.red {
		margin-top: 2em;
	}
	.grid-top {
		float: left;
		width: 25%;
	}
	.sed-top {
		float: left;
		width: 33.3%;
	}
	.item-in p {
		width: 100%;
	}
	.sed {
		margin-top: 2em;
	}
	.top-sed label {
		padding: 2.2em 0 0;
	}
	.content-welcome {
		padding: 3em 0;
	}
	.content-top {
		padding: 0 0 3em;
	}
	.col-mn {
		min-height: 261px;
		padding: 3.5em 0;
	}
	.col-mn4 {
		margin-top: 1.5em;
	}
	.content-middle {
		padding: 3em 0 0;
	}
	p.footer-in {
		width: 70%;
	}
	.logo img {
		top: -132px;
	}
	.header-top {
		padding: 1em 0;
	}
	/*--about--*/
	.mid-about p {
		line-height: 1.9em;
		margin-top: 1em;
	}
	.grid-ab {
		padding: 0;
	}
	.content-bottom1 {
		float: left;
		width: 33.3%;
	}
	.bottom-top span {
		font-size: 1.8em;
		width: 50px;
		height: 50px;
	}
	.bottom-top h3 {
		font-size: 1.2em;
	}
	.about-in {
		padding: 3em 0;
	}
	/*--services--*/
	.top-services {
		float: left;
		width: 33.3%;
	}
	.services {
		padding-top: 3em;
	}
	/*--contact--*/
	.contact-grid {
		margin-bottom: 2em;
	}
	.contact {
		padding: 3em 0;
	}
	/*--single--*/
	.md-in {
		float: left;
		width: 50%;
	}
	.comment {
		padding: 1em 0 0;
	}
	.single-bottom textarea {
		margin: 1em 0em;
		width: 100%;
	}
	.single-bottom input[type="submit"] {
		margin: 0;
	}
	/*--typo--*/
	h1.grid2 {
		font-size: 2.3em;
	}
}

@media ( max-width :640px) {
	.welcome h3, .red h3, .top-content h1, .sed h3, .sed-in h3 {
		font-size: 2.5em;
	}
	.col-mn2 h2 {
		font-size: 3em;
		margin-bottom: 0.3em;
	}
	.top-sed label {
		padding: 1.5em 0 0;
	}
	p.footer-in {
		font-size: 1.5em;
		width: 88%;
	}
	.header {
		height: 445px;
	}
	/*--about--*/
	.about-bottom h2, .about-top h1 {
		font-size: 2.5em;
	}
	.bottom-top span {
		font-size: 1.2em;
		width: 35px;
		height: 35px;
		line-height: 2em;
		margin-right: 3%;
	}
	.bottom-top h3 {
		font-size: 1.05em;
		margin-top: 0.7em;
	}
	/*--services--*/
	.service-top h1 {
		font-size: 2.5em;
	}
	.top-services {
		padding: 0 5px;
	}
	/*--contact--*/
	.contact-top h1 {
		font-size: 2.5em;
	}
	/*--single--*/
	.single-bottom input[type="submit"] {
		width: 14%;
	}
	.single-middle h1, .single-bottom h2 {
		font-size: 2.5em;
	}
	/*--page--*/
	button.btn.btn-lg {
		font-size: 1.1em;
	}
	h1.grid2 {
		font-size: 2em;
	}
	h2.grid2 {
		font-size: 1.9em;
	}
}

@media ( max-width :480px) {
	.welcome h3, .red h3, .top-content h1, .sed h3, .sed-in h3 {
		font-size: 2em;
	}
	.top-grid h3 {
		font-size: 1.1em;
	}
	.col-mn2 h2 {
		text-transform: uppercase;
		font-size: 2.5em;
	}
	.top-sed label {
		font-size: 1.8em;
		padding: 1.4em 0 0;
	}
	.sed-top h4 {
		font-size: 1.05em;
	}
	.item-in p {
		font-size: 1.2em;
	}
	p.footer-in {
		font-size: 1.3em;
	}
	.content-middle {
		padding: 2em 0 0;
	}
	.con-in {
		padding: 2em 0 0em;
	}
	.wmuSliderPagination {
		right: 36%;
	}
	.header {
		height: 336px;
	}
	.sed-top img {
		margin: 0 auto;
		width: 34%;
	}
	.logo img {
		width: 140px;
		top: -58px;
	}
	.content-welcome {
		padding: 2em 0;
	}
	.sed-top {
		width: 100%;
	}

	/*--about--*/
	.about-bottom h2, .about-top h1 {
		font-size: 2em;
	}
	.about-1 ul li a {
		font-size: 1em;
		margin: 0.5em 0;
	}
	.about-in {
		padding: 2em 0;
	}
	.content-bottom1 {
		width: 100%;
	}
	.bottom-top h3 {
		font-size: 1.2em;
	}
	.content-bottom1 p {
		line-height: 1.7em;
		margin: 0.4em 0 0;
	}
	.about-top {
		padding: 0em 0 2em;
	}
	/*--services--*/
	.service-top h1 {
		font-size: 2em;
	}
	.top-services {
		width: 100%;
	}
	.services {
		padding-top: 2em;
	}
}

@media ( max-width :320px) {
	.content-welcome {
		padding: 1.5em 0;
	}
	.welcome h3, .red h3, .top-content h1, .sed h3, .sed-in h3 {
		font-size: 1.5em;
	}
	.welcome h5 {
		font-size: 0.9em;
	}
	.welcome p {
		font-size: 0.9em;
		line-height: 1.7em;
	}
	.hvr-bounce-to-right {
		padding: 0.4em 1em;
		font-size: 0.9em;
	}
	.red {
		margin-top: 1em;
		padding: 0;
	}
	.top-content p, .top-grid p {
		font-size: 0.9em;
		line-height: 1.7em;
	}
	.grid-top {
		padding: 0 5px;
	}
	.top-grid h3 {
		font-size: 1em;
		line-height: 1.4em;
	}
	.col-mn2 h2 {
		font-size: 1.8em;
	}
	.content-top {
		padding: 0 0 1.5em;
	}
	.col-mn2 p {
		font-size: 0.9em;
		line-height: 1.7em;
	}
	.col-mn {
		min-height: 244px;
		padding: 2em 0;
	}
	.col-mn3, .col-mn4 {
		padding: 0;
	}

	/*--services--*/
	.service-top h1 {
		font-size: 1.5em;
	}
	.service-top {
		padding: 0;
	}
	.service-top h5 {
		font-size: 1em;
		margin: 0.5em 0;
	}
	.service-top p, .top-services p {
		font-size: 0.9em;
		line-height: 1.7em;
	}
	.top-services h5 {
		font-size: 1em;
	}
	.content-middle {
		padding: 1.5em 0 0;
	}
}

a {
	text-decoration: none;
}

span {
	font-style: italic;
	color: black;
}

.frmsearch {
	background: #E0DAD2;
}
</style>
</head>

<body>
<<<<<<< HEAD
<div class="container-fluid">
  <div class="row">
    <nav class="navbar navbar-inverse navbar-top" >
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="userindex" > <img src="user/img/logo.png" class="img-responsive"></a> </div>
        <div class="collapse navbar-collapse" id="myNavbar" >
          <ul class="nav navbar-nav pull-right" >
            <li style='text-align: right;'><a href="userindex" >Home</a></li>
            <li style='text-align: right;'><a href="aboutus" >About Us</a></li>
            <li style='text-align: right;'><a href="usersroomtariff" >Room & Tariff</a></li>
            <li style='text-align: right;'><a href="facilities">Facilities</a></li>
            <li style='text-align: right;'><a href="contactus" >Contact Us</a></li>
            <li style='text-align: right;'><a href="userlogin" >Login</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
<div class="clear-fix"></div>
<div class="row">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active"> <img src="images/slide1.jpg" alt="" > </div>
    <div class="item"> <img src="images/slide2.jpg" alt=""> </div>
    <div class="item"> <img src="images/slide3.jpg" alt=""> </div>
  </div>
</div>
</div>




<div class="row frmsearch">
<div class="container">
  <div class="col-md-12 ">
    <div class="col-md-2 text-center-xs text-center-sm "> <img src="user/img/bookingHome.png" class="responsive_02" title="Hotel Manorama" alt="Hotel Manorama"> </div>
    <form method="post" action="reservation.html" id="checkAv">
      <div class="col-md-3 col-sm-12 col-xs-12 homeBook padding_0">
        <div class="col-md-3 col-xs-3 col-sm-2 text-right-md text-center-xs text-center-sm padding_TB_01"> Name </div>
        <div class="col-md-9 col-xs-9 col-sm-10 pull-right padding_0">
          <input type="text" name="na" id="na" placeholder="Name Here">
        </div>
      </div>
      <div class="col-md-3 homeBook padding_0">
        <div class="col-md-5 col-xs-3 col-sm-2 text-right-md text-center-xs text-center-sm padding_TB_01" align="right"> Check in</div>
        <div class="col-md-7 col-xs-9 col-sm-10 pull-right padding_0">
          <input name="from_date" id="checkIn" type="text" class="dateBg hasDatepicker" placeholder="DD/MM/YYYY">
        </div>
      </div>
      <div class="col-md-3 homeBook padding_0">
        <div class="col-md-5 col-xs-3 col-sm-2 text-right-md text-center-xs text-center-sm padding_TB_01" align="right"> Check out </div>
        <div class="col-md-7 col-xs-9 col-sm-10 pull-right padding_0">
          <input name="date" id="checkOut" type="text" class="dateBg hasDatepicker" placeholder="DD/MM/YYYY" >
        </div>
      </div>
      <div class="col-md-1 homeBook padding_0 text-right-md text-right-lg text-right-xs text-right-sm"> <img src="user/img/checkavailability.png" alt="Manorama" class="responsive_02 margin_TB_01" onclick="subForm();"> </div>
    </form>
  </div>
</div>
</div>








<div class="container">
  <div class="content-top">
    <div class="top-content">
      <h1>Our Services</h1>
    </div>
    <div class="content-top1">
      <div class=" col-md-1 col-md-offset-1  grid-top"> <a href="usersroomtariff" style='text-decoration: none;'> <img src='user/icons/list.png' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Rooms</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="facilities" style='text-decoration: none;'> <img src='user/icons/facility.png' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Facilities</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="meetings" style='text-decoration: none;'> <img src='user/icons/banquets.jpg' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Banquets</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="dining" style='text-decoration: none;'> <img src='user/icons/dining.png' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Dining</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="gallery" style='text-decoration: none;'> <img src='user/icons/gallery.png' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Gallery</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="offers" style='text-decoration: none;'> <img src='user/icons/offer.jpg' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Offers</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="enquiry" style='text-decoration: none;'> <img src='user/icons/enquire.png' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Enquiry</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="reach" style='text-decoration: none;'> <img src='user/icons/reach.png' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Address</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="userRoomReservation" style='text-decoration: none;'> <img src='user/icons/reservation.jpg' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Reservation</span> </div>
        </a> </div>
      <div class=" col-md-1 grid-top"> <a href="attractions" style='text-decoration: none;'> <img src='user/icons/attractions.png' style='width: 55px;' alt=''></img>
        <div class="top-grid"> <span>Attractions</span> </div>
        </a> </div>
    </div>
    <div class="clearfix"> </div>
  </div>
</div>
<div class="container padding_0">
  <div class="col-md-12 col-sm-12 col-xs-12 padding_0 text-center-xs text-center-sm padding_TB_02"> <strong>Hotel Manorama, Business class hotel</strong> - Luxury Accommodation at Vijayawada & Hyderabad - a perfect destination for business travelers or tourists traveling to Vijayawada & Hyderabad </div>
</div>
<div class="row footCon_Warp bdr_Top padding_0" style="margin-left: 0px; margin-right: 0px;">
  <div class="row margin_0" style="margin-left: 0px; margin-right: 0px;">
    <!--container start-->
    <div class="container footPadd01 paddingLR_0">
      <!--foot LEft start-->
      <div class="col-md-3 col-sm-12 col-xs-12 padding_0">
        <div class="footLogo text-center-xs text-center-sm"> </div>
        <div class="allreserve padding_0 text-center-xs text-center-sm">© 2018. Hotel Manorama. All rights reserved. </div>
      </div>
      <!--foot LEft End-->
      <!--foot 2Nd start-->
      <div class="col-md-8 col-sm-12 col-xs-12 pull-right padding_0 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 pull-right">
        <!--One Start-->
        <div class="col-md-3 col-sm-12 col-xs-12 padding_0">
          <div class="footItem"> <a href="aboutus" title="About Us" alt="About Us" class="footMore">About Us</a> <br>
            <a href="reach.jsp" title="How to Reach" alt="How to reach" class="footMore">How to Reach</a> <br>
            <a href="attractions.jsp" title="Attractions" alt="Attractions" class="footMore">Attractions</a> <br>
            <a href="offers" title="Offers" alt="Offers" class="footMore">Offers</a> </div>
        </div>
        <!--One End-->
        <!--Two Start-->
        <div class="col-md-3 col-sm-12 col-xs-12 padding_0">
          <div class="footItem"> <a href="gallery.jsp" title="Gallery" class="footMore">Gallery</a><br>
            <a href="meetings" title="Meetings" class="footMore">Meetings</a><br>
            <a href="dining" title="Dining" alt="Dining" class="footMore">Dining</a><br>
            <a href="careers.jsp" title="Careers" alt="Careers" class="footMore">Careers</a><br>
          </div>
        </div>
        <!--Two End-->
        <!--Three Start-->
        <div class="col-md-2 col-sm-12 col-xs-12 padding_0">
          <div class="footItem"> <a href="enquiry" title="Enquiry" alt="Enquiry" class="footMore">Enquiry</a><br>
            <a href="facilities" title="Facilities" alt="Facilities" class="footMore">Facilities</a> <br>
            <a href="userRoomReservation" title="Reservations" class="footMore">Reservation</a> <br>
            <a href="contact" title="Contact Us" alt="Contact Us" class="footMore">Contact Us</a><br>
          </div>
        </div>
      </div>
      <!--foot 2Nd End-->
    </div>
    <!--container End-->
  </div>
</div>
</div>
<br /><br />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<script type='text/javascript' src='${baseurl }/assets/js/bootstrap.min.js'></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>
<script>
				$(function() {
					$("#checkOut").datetimepicker({
						useCurrent : false,
						format : 'DD-MMM-YYYY HH:mm',
						showTodayButton : true,
						sideBySide : true,
						minDate : new Date(),
								    showClose: true,
								    showClear: true,
						toolbarPlacement : 'top'

					}); 

					 $("#checkIn").datetimepicker({
						useCurrent : false,
						format : 'DD-MMM-YYYY HH:mm',
						showTodayButton : true,
						sideBySide : true,
						minDate : new Date(),
							    showClose: true,
							    showClear: true,
						toolbarPlacement : 'top'
					}); 
					
				});
					/* $('#checkOut').daterangepicker({
					    "startDate": "03/15/2018",
					    "endDate": "03/21/2018"
					}, function(start, end, label) {
					  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
					});
				 */
			</script>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
=======
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar navbar-inverse navbar-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="userindex"> <img
							src="user/img/logo.png" class="img-responsive"></a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav pull-right">
							<li style='text-align: right;'><a href="userindex">Home</a></li>
							<li style='text-align: right;'><a href="aboutus">About
									Us</a></li>
							<li style='text-align: right;'><a href="usersroomtariff">Room
									& Tariff</a></li>
							<li style='text-align: right;'><a href="facilities">Facilities</a></li>
							<li style='text-align: right;'><a href="contactus">Contact
									Us</a></li>
							<li style='text-align: right;'><a href="userlogin">Login</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="clear-fix"></div>
		<div class="row">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img src="images/slide1.jpg" alt="">
					</div>
					<div class="item">
						<img src="images/slide2.jpg" alt="">
					</div>
					<div class="item">
						<img src="images/slide3.jpg" alt="">
					</div>
				</div>
			</div>
		</div>




		<div class="row frmsearch">
			<div class="container">
				<div class="col-md-12 ">
					<div class="col-md-2 text-center-xs text-center-sm ">
						<img src="user/img/bookingHome.png" class="responsive_02"
							title="Hotel Manorama" alt="Hotel Manorama">
					</div>
					<form method="post" action="reservation.html" id="checkAv">
						<div class="col-md-3 col-sm-12 col-xs-12 homeBook padding_0">
							<div
								class="col-md-3 col-xs-3 col-sm-2 text-right-md text-center-xs text-center-sm padding_TB_01">
								Name</div>
							<div class="col-md-9 col-xs-9 col-sm-10 pull-right padding_0">
								<input type="text" name="na" id="na" placeholder="Name Here">
							</div>
						</div>
						<div class="input text required">
							<input name="checkIn"
								style="width: 170px; background-color: #f3ebda; border-color: #f3ebda;"
								value="select Date" class="form-control validate"
								title="From Date" required="required"
								onkeydown="removeBorder(this.id);" type="text" id="checkIn" />
						</div>
						<span class="input-group-addon" id="basic-addon1"
							style="background-color: #f3ebda; border-color: #f3ebda;">Check
							Out <font color="red">*</font> :
						</span>
						<div class="input text required">
							<input name="checkOut"
								style="width: 170px; background-color: #f3ebda; border-color: #f3ebda;"
								value="select Date" class="form-control validate"
								title="To Date" required="required"
								onkeydown="removeBorder(this.id);" type="text" id="checkOut" />
						</div>
						<div
							class="col-md-1 homeBook padding_0 text-right-md text-right-lg text-right-xs text-right-sm">
							<img src="user/img/checkavailability.png" alt="Manorama"
								class="responsive_02 margin_TB_01" onclick="subForm();">
						</div>
					</form>
				</div>
			</div>
		</div>








		<div class="container">
			<div class="content-top">
				<div class="top-content">
					<h1>Our Services</h1>
				</div>
				<div class="content-top1">
					<div class=" col-md-1 col-md-offset-1  grid-top">
						<a href="usersroomtariff" style='text-decoration: none;'> <img
							src='user/icons/list.png' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Rooms</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="facilities" style='text-decoration: none;'> <img
							src='user/icons/facility.png' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Facilities</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="meetings" style='text-decoration: none;'> <img
							src='user/icons/banquets.jpg' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Banquets</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="dining" style='text-decoration: none;'> <img
							src='user/icons/dining.png' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Dining</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="gallery" style='text-decoration: none;'> <img
							src='user/icons/gallery.png' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Gallery</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="offers" style='text-decoration: none;'> <img
							src='user/icons/offer.jpg' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Offers</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="enquiry" style='text-decoration: none;'> <img
							src='user/icons/enquire.png' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Enquiry</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="reach" style='text-decoration: none;'> <img
							src='user/icons/reach.png' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Address</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="userRoomReservation" style='text-decoration: none;'>
							<img src='user/icons/reservation.jpg' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Reservation</span>
							</div>
						</a>
					</div>
					<div class=" col-md-1 grid-top">
						<a href="attractions" style='text-decoration: none;'> <img
							src='user/icons/attractions.png' style='width: 55px;' alt=''></img>
							<div class="top-grid">
								<span>Attractions</span>
							</div>
						</a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="container padding_0">
			<div
				class="col-md-12 col-sm-12 col-xs-12 padding_0 text-center-xs text-center-sm padding_TB_02">
				<strong>Hotel Manorama, Business class hotel</strong> - Luxury
				Accommodation at Vijayawada & Hyderabad - a perfect destination for
				business travelers or tourists traveling to Vijayawada & Hyderabad
			</div>
		</div>
		<div class="row footCon_Warp bdr_Top padding_0"
			style="margin-left: 0px; margin-right: 0px;">
			<div class="row margin_0"
				style="margin-left: 0px; margin-right: 0px;">
				<!--container start-->
				<div class="container footPadd01 paddingLR_0">
					<!--foot LEft start-->
					<div class="col-md-3 col-sm-12 col-xs-12 padding_0">
						<div class="footLogo text-center-xs text-center-sm"></div>
						<div class="allreserve padding_0 text-center-xs text-center-sm">©
							2018. Hotel Manorama. All rights reserved.</div>
					</div>
					<!--foot LEft End-->
					<!--foot 2Nd start-->
					<div
						class="col-md-8 col-sm-12 col-xs-12 pull-right padding_0 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 pull-right">
						<!--One Start-->
						<div class="col-md-3 col-sm-12 col-xs-12 padding_0">
							<div class="footItem">
								<a href="aboutus" title="About Us" alt="About Us"
									class="footMore">About Us</a> <br> <a href="reach"
									title="How to Reach" alt="How to reach" class="footMore">How
									to Reach</a> <br> <a href="attractions" title="Attractions"
									alt="Attractions" class="footMore">Attractions</a> <br> <a
									href="offers" title="Offers" alt="Offers" class="footMore">Offers</a>
							</div>
						</div>
						<!--One End-->
						<!--Two Start-->
						<div class="col-md-3 col-sm-12 col-xs-12 padding_0">
							<div class="footItem">
								<a href="gallery" title="Gallery" class="footMore">Gallery</a><br>
								<a href="meetings" title="Meetings" class="footMore">Meetings</a><br>
								<a href="dining" title="Dining" alt="Dining" class="footMore">Dining</a><br>
								<a href="careers" title="Careers" alt="Careers" class="footMore">Careers</a><br>
							</div>
						</div>
						<!--Two End-->
						<!--Three Start-->
						<div class="col-md-2 col-sm-12 col-xs-12 padding_0">
							<div class="footItem">
								<a href="enquiry" title="Enquiry" alt="Enquiry" class="footMore">Enquiry</a><br>
								<a href="facilities" title="Facilities" alt="Facilities"
									class="footMore">Facilities</a> <br> <a
									href="userRoomReservation" title="Reservations"
									class="footMore">Reservation</a> <br> <a href="contactus"
									title="Contact Us" alt="Contact Us" class="footMore">Contact
									Us</a><br>
							</div>
						</div>
					</div>
					<!--foot 2Nd End-->
				</div>
				<!--container End-->
			</div>
		</div>
	</div>
	<br />
	<br />

	<script type="text/javascript">
		var tpj = jQuery;
		tpj.noConflict();
		tpj(document).ready(function() {
			if (tpj.fn.cssOriginal != undefined)
				tpj.fn.css = tpj.fn.cssOriginal;
			tpj('.fullwidthabnner').revolution({
				delay : 10000,
				startwidth : 1366,
				startheight : 612,

				onHoverStop : "off", // Stop Banner Timet at Hover on Slide on/off

				thumbWidth : 100, // Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
				thumbHeight : 50,
				thumbAmount : 4,

				/*hideThumbs:200,*/
				navigationType : "both", //bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
				/*navigationArrows:"verticalcentered",		//nexttobullets, verticalcentered, none*/
				navigationStyle : "round", //round,square,navbar

				touchenabled : "on", // Enable Swipe Function : on/off

				navOffsetHorizontal : 724,
				navOffsetVertical : 30,

				fullWidth : "off",

				shadow : 0
			//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)

			});

		});
	</script>
	<div id="ui-datepicker-div"
		class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
>>>>>>> 45eaae5b76d0793b95e14af906c00476f04974a1
</body>
</html>