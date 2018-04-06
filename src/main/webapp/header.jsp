<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Hotel Manorama</title>
        <meta name="keywords" content="Home">
            <meta name="description" content="Home">
			<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
			<link rel="stylesheet" type="text/css" href="user/css/bootstrap.css">
			<link rel="stylesheet" type="text/css" href="user/css/bootstrap-theme.css">
			<link rel="stylesheet" type="text/css" href="user/css/style.css">
			<link rel="stylesheet" type="text/css" href="user/css/font-awesome.min.css">
			<link rel="stylesheet" type="text/css" href="user/css/style_banner.css">
			<link rel="stylesheet" type="text/css" href="user/css/settings.css">
			<link rel="stylesheet" type="text/css" href="user/css/jquery-ui-1.8.18.custom.css">
			<link href="user/css/ninja-slider.css" rel="stylesheet" />
			<link href="${baseurl}/assets/css/bootstrap.min.css" rel="stylesheet">
			<script type='text/javascript' src='${baseurl }/assets/js/jquery-1.10.2.min.js'></script>
			
			<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
			<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
			<script type='text/javascript' src="${baseurl }/js/jquery.blockUI.min.js" ></script>
			<script src="user/js/ninja-slider.js"></script>
			<link href="user/css/thumbnail-slider.css" rel="stylesheet"	type="text/css" />
<script src="user/js/thumbnail-slider.js" type="text/javascript"></script>

<script async="" src="user/js/analytics.js.download"></script>
<script type="text/javascript" src="user/js/jquery.js.download"></script>
<script type="text/javascript" src="user/js/bootstrap.min.js.download"></script>
<!-- <script type="text/javascript" src="user/js/docs.min.js.download"></script> -->
<script type="text/javascript"
	src="user/js/jquery.themepunch.plugins.min.js.download"></script>
<script type="text/javascript"
	src="user/js/jquery.themepunch.revolution.min.js.download"></script>
<script type="text/javascript"
	src="user/js/jquery-ui-1.8.21.custom.min.js.download"></script>
<script type="text/javascript"
	src="user/js/preview-fullwidth.js.download"></script>
<script type="text/javascript"
	src="user/js/jquery-ui-1.8.18.custom.min.js.download"></script>
<style>
@font-face {
 font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
 src:url(../fonts/Oxygen-Regular.ttf) format('truetype');
}
@font-face {
 font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
 src:url(../fonts/Scada-Bold.ttf) format('truetype');
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
.glyphicon.glyphicon-home, .glyphicon.glyphicon-time, .glyphicon.glyphicon-cog, .glyphicon.glyphicon-lock {
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
	font-size:1.5em;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: 600;
	color:#000;
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
@media(max-width:1366px) {
}
@media(max-width:1280px) {
}
@media(max-width:1024px) {
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
@media(max-width:768px) {
 span.menu {
 display: block;
 text-align: right;
 cursor: pointer;
 position: relative;
}
.top-nav ul {
 display: none;
 position:absolute;
 width: 100%;
 z-index: 9999;
 left: 0%;
 margin:1.1em 0em;
 background:#1b3e5c;
 border:0;
}
.top-nav span.menu {
 display: block;
}
.top-nav ul li {
 display: block;
 float:none;
 padding:  0.3em;
 text-align: center;
}
.top-nav ul li a {
 color:#fff;
 display:block;
 margin:0;
 background: none;
 border:none;
 padding:0.4em;
}
.top-nav ul li.active a {
 color:#000;
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
@media(max-width:640px) {
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
@media(max-width:480px) {
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
 width:140px;
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
@media(max-width:320px) {
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
.frmsearch { background:#EAE5DE;}
.container-fluid {
    padding-right: 0;
    padding-left:0;
    margin-right: auto;
    margin-left: auto;
}
</style>
			
  
	</head>



<body>
<div class="container-fluid">
  <div class="row">
    <nav class="navbar navbar-inverse navbar-top" >
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="userindex.jsp" > <img src="user/img/logo.png" class="img-responsive"></a> </div>
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

<div class="container-fluid" style="background:#F9F9F9; border-bottom:1px solid #ccc; margin-bottom:25px;">
<div class="row">
	<div class="container">
			<div style="margin:25px 0;">
			<div class="content-top1">			
			  <div class=" col-md-1 col-md-offset-1  grid-top">
				<a href="usersroomtariff" style='text-decoration: none;'>
				 <img src='user/icons/list.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Rooms</span>
				  </div></a>
				</div>
			
			<div class=" col-md-1 grid-top">
				<a href="facilities" style='text-decoration: none;'>
				 <img src='user/icons/facility.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Facilities</span>
				  </div>
				</a>
			</div>
			<div class=" col-md-1 grid-top">
				<a href="meetings" style='text-decoration: none;'>
				 <img src='user/icons/banquets.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Banquets</span>
				  </div>
				</a>
			</div>
			<div class=" col-md-1 grid-top">
				<a href="dining" style='text-decoration: none;'>
				 <img src='user/icons/dining.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Dining</span>
				  </div>
				</a>
			</div>
			 <div class=" col-md-1 grid-top">
				<a href="gallery" style='text-decoration: none;'>
				 <img src='user/icons/gallery.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Gallery</span>
				  </div>
				</a>
			</div>
			 <div class=" col-md-1 grid-top">
				<a href="offers" style='text-decoration: none;'>
				 <img src='user/icons/offer.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Offers</span>
				  </div>
				</a>
			</div>
			 <div class=" col-md-1 grid-top">
				<a href="enquiry" style='text-decoration: none;'>
				 <img src='user/icons/enquire.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Enquiry</span>
				  </div>
				</a>
			</div>
			 <div class=" col-md-1 grid-top">
				<a href="reach" style='text-decoration: none;'>
				 <img src='user/icons/reach.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Address</span>
				  </div>
				</a>
			</div>
			<div class=" col-md-1 grid-top">
				<a href="userRoomReservation" style='text-decoration: none;'>
				 <img src='user/icons/reservation.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Reservation</span>
				  </div>
				</a>
			</div>
			 <div class=" col-md-1 grid-top">
				<a href="attractions" style='text-decoration: none;'>
				 <img src='user/icons/attractions.png' style='width: 55px;' alt=''></img>
				  <div class="top-grid">
					<span>Attractions</span>
				  </div>
				</a>
			</div>
			</div>
<div class="clearfix"> </div>
		</div>
		</div>
        </div>
        </div>