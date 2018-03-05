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
			
			
						
			<script type='text/javascript' src='${baseurl }/assets/js/jquery-1.10.2.min.js'></script>
			
			<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
			<script type='text/javascript' src="${baseurl }/js/jquery.blockUI.min.js" ></script>
			<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
			
			<!-- <script async="" src="user/js/analytics.js.download"></script>
			<script type="text/javascript" src="user/js/jquery.js.download"></script>
			<script type="text/javascript" src="user/js/bootstrap.min.js.download"></script>
			<script type="text/javascript" src="user/js/docs.min.js.download"></script>
			<script type="text/javascript" src="user/js/jquery.themepunch.plugins.min.js.download"></script>
			<script type="text/javascript" src="user/js/jquery.themepunch.revolution.min.js.download"></script>
			<script type="text/javascript" src="user/js/jquery-ui-1.8.21.custom.min.js.download"></script>
			<script type="text/javascript" src="user/js/preview-fullwidth.js.download"></script>
			<script type="text/javascript" src="user/js/jquery-ui-1.8.18.custom.min.js.download"></script> -->
			<style>
			.box > .icon { text-align: center; position: relative; }
.box > .icon > .image { position: relative; z-index: 2; margin: auto; width: 88px; height: 88px; border: 8px solid white; line-height: 88px; border-radius: 50%; background: white; vertical-align: middle; }
.box > .icon:hover > .image { background: white; border: 8px solid yellowgreen; }
.box > .icon > .image > i { font-size: 36px !important; color: #fff !important; }
.box > .icon:hover > .image > i { color: white !important; }
.box > .icon > .info { margin-top: -24px; background: transparent; border: none; padding: 15px 0 10px 0; }
.box > .icon:hover > .info { background: transparent; border-color: none; color: white; }
.box > .icon > .info > h3.title { font-family: "Roboto",sans-serif !important; font-size: 16px; color: #222; font-weight: 500; }
.box > .icon > .info > p { font-family: "Roboto",sans-serif !important; font-size: 13px; color: #666; line-height: 1.5em; margin: 20px;}
.box > .icon:hover > .info > h3.title, .box > .icon:hover > .info > p, .box > .icon:hover > .info > .more > a { color: #222; }
.box > .icon > .info > .more a { font-family: "Roboto",sans-serif !important; font-weight: 700; font-size: 12px; color: #222; width: 140px; line-height: 12px; text-transform: uppercase; text-decoration: none; }
.box > .icon:hover > .info > .more > a { color: black; padding: 6px 8px; background-color: yellowgreen; width: 140px; font-weight: 700;}
.box .space { height: 30px; }
			</style>
			
			
			<script>
  $( function() {
    $( "#datepicker" ).datepicker({
      showOtherMonths: true,
      selectOtherMonths: true
    });
  } );
  </script>
  <script>
  $(document).ready(function () {
  $(".navbar-nav li a").click(function(event) {
    $(".navbar-collapse").collapse('hide');
  });
});
  </script>
  
  
	</head>
	<body style="background: transparent;">
		
		
     	<script type="text/javascript">
    function toggle_visibility(id) {
       
       var e = document.getElementById(id);
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }
	
	
	    function getDiv() {
		jQuery('#weather').show();
    }
	
	    function hidediv() {
		jQuery('#weather').hide();
    }
</script>
<script type="text/javascript">
   
	var tpj1=jQuery;
    
tpj1(document).ready(function(){

var cyear = new Date().getFullYear();
var endyear =parseInt(cyear)+5; 
	
	tpj1("#date_starting").datepicker({

		numberOfMonths: 1,
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
        changeYear: true,
         minDate : 0,
        yearRange: cyear+':' + endyear,
		onSelect: function(selected) { 
			tpj1("#date_ending").datepicker("option","minDate", selected) 
		} 
	});
	
	
	tpj1("#date_ending").datepicker({	
		numberOfMonths: 1,
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
        changeYear: true,
        yearRange: cyear+':' + endyear,
		onSelect: function(selected) {
			tpj1("#date_starting").datepicker("option","maxDate", selected) 
		}
	
	}); 

});


function subForm()
{
    document.getElementById("checkAv").submit();
}

</script>

<div class="container-fluid" style="margin: 0px; padding-left: 0px; padding-right: 0px;">
 <div class="row padding_0 usehd" style="background: transparent; margin: 0px;">
 <nav class="navbar navbar-inverse navbar-top" style="background: tomato;" >
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="Hotel manorama.html" style="color: white; font-size: 36px; height: 83px;">
	  <img src="user/img/logo2.png" class="img-responsive"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav pull-right" style="background: none;">
        <li><a href="userindex.jsp" style="color: white;">Home</a></li>
		<li><a href="about.jsp" style="color: white;">About Us</a></li>
        <li><a href="userRoomTariff" style="color: white;">Room & Tariff</a></li>
        <li><a href="facilities.jsp" style="color: white;">Facilities</a></li> 
        <li><a href="contact.jsp" style="color: white;">Contact Us</a></li> 
		<li><a href="login.jsp" style="color: white;">Login</a></li> 
      </ul>      
    </div>
  </div>
</nav>
        </div>     
       </div>           
	   
 
  </div>
			
  
<br>
		<div class="row" style="margin-left: 0px; margin-right: 0px;">
			<div class="container">
			<legend style="font-weight: bold; font-size: 26px; border-bottom: 2px solid teal; color: teal;">OUR SERVICES</legend>
        <!-- Boxes de Acoes -->
    		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/tariff.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="userRoomTariff" title="Title Link">
								Rooms
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/facility.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="facilities.jsp" title="Title Link">
								Facilities
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/banquets.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="meetings.jsp" title="Title Link">
								Banquets
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/dining.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="dining.jsp" title="Title Link">
								Dining
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/gallery.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="gallery.jsp" title="Title Link">
								Gallery
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/attractions.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="attractions.jsp" title="Title Link">
								Attractions
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/offer.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="offers.jsp" title="Title Link">
								Offers
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/enquire.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="enquiry.jsp" title="Title Link">
								Enquire
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/careers.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="careers.jsp" title="Title Link">
								Careers
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/reach.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="reach.jsp" title="Title Link">
								Address
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		
		 <div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/reservation.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="reservation.jsp" title="Title Link">
								Reservation
							</a>
						</div>
					</div>
				</div>
				<div class="space"></div>
			</div> 
		</div>
		</div>
</div>