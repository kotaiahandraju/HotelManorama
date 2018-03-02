<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Hotel Manorama</title>
        <meta name="keywords" content="Home">
            <meta name="description" content="Home">
			
			<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
			<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
			<link rel="stylesheet" type="text/css" href="css/style.css">
			<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
			<link rel="stylesheet" type="text/css" href="css/style_banner.css">
			<link rel="stylesheet" type="text/css" href="css/settings.css">
			<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.18.custom.css">
			
			<script async="" src="js/analytics.js.download"></script>
			<script type="text/javascript" src="js/jquery.js.download"></script>
			<script type="text/javascript" src="js/bootstrap.min.js.download"></script>
			<script type="text/javascript" src="js/docs.min.js.download"></script>
			<script type="text/javascript" src="js/jquery.themepunch.plugins.min.js.download"></script>
			<script type="text/javascript" src="js/jquery.themepunch.revolution.min.js.download"></script>
			<script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js.download"></script>
			<script type="text/javascript" src="js/preview-fullwidth.js.download"></script>
			<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js.download"></script>
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
	  <img src="img/logo2.png" class="img-responsive"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav pull-right" style="background: none;">
        <li><a href="index.html" style="color: white;">Home</a></li>
		<li><a href="about.html" style="color: white;">About Us</a></li>
        <li><a href="roomtariff.html" style="color: white;">Room & Tariff</a></li>
        <li><a href="facilities.html" style="color: white;">Facilities</a></li> 
        <li><a href="contact.html" style="color: white;">Contact Us</a></li> 
		<li><a href="login.html" style="color: white;">Login</a></li> 
      </ul>      
    </div>
  </div>
</nav>
        </div>     
       </div>           
	   
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
   
 <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
	  <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

   
    <div class="carousel-inner">
      <div class="item active">
        <img src="img/droom1.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="img/restaurent.png" alt="Chicago" style="width:100%;">
      </div>
    
	
	<div class="item">
        <img src="img/dining.png" alt="Insia" style="width:100%;">
      </div>
    </div>
</div>
    
   <!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      
    </a> -->
  </div>
			
<!-- <img src="img/droom1.png" class="img-responsive" style=" width: 100%; height: 400px;">-->
			
				 <div class="row" style="background: wheat; margin-left: 0px; margin-right: 0px;">
                	
                	 <div class="col-md-12 col-sm-12 col-xs-12">                    
                     	<div class="col-md-2 col-sm-12 col-xs-12 text-center-xs text-center-sm padding_0">
                        
                        	<img src="img/bookingHome.png" class="responsive_02" title="Hotel Manorama" alt="Hotel Manorama">  
                        </div>
                       
                          <form method="post" action="reservation.html" id="checkAv">
                           <div class="col-md-3 col-sm-12 col-xs-12 homeBook padding_0">
                        	<div class="col-md-3 col-xs-3 col-sm-2 text-right-md text-center-xs text-center-sm padding_TB_01">
                            	Name
                            </div>
                            <div class="col-md-9 col-xs-9 col-sm-10 pull-right padding_0">                            	
                                <input type="text" name="na" id="na" placeholder="Name Here">
                            </div>
                        	
                        </div>
                                     <div class="col-md-3 col-sm-12 col-xs-12 homeBook padding_0">
                                    	<div class="col-md-5 col-xs-3 col-sm-2 text-right-md text-center-xs text-center-sm padding_TB_01">
                                        	Check in Date
                                        </div>
                                        <div class="col-md-7 col-xs-9 col-sm-10 pull-right padding_0">                            	
                                             <input name="from_date" id="datepicker" type="text" class="dateBg hasDatepicker" placeholder="DD/MM/YYYY" readonly="readonly">
                                        </div>
                                    	
                                    </div>
                                     <div class="col-md-3 col-sm-12 col-xs-12 homeBook padding_0">
                                    	<div class="col-md-5 col-xs-3 col-sm-2 text-right-md text-center-xs text-center-sm padding_TB_01">
                                        	Departure Date
                                        </div>
                                        <div class="col-md-7 col-xs-9 col-sm-10 pull-right padding_0">
                                        	 <input name="to_date" id="datepicker" type="text" class="dateBg hasDatepicker" value="DD/MM/YYYY" readonly="readonly">
                                        </div>
                                    	
                                   	 </div>
                                     <div class="col-md-1 col-sm-12 col-xs-12 homeBook padding_0 text-right-md text-right-lg text-right-xs text-right-sm">
                                     <img src="img/checkavailability.png" alt="Manorama" class="responsive_02 margin_TB_01" onclick="subForm();">
                                                                                <!-- <input type="image" src="/img/checkavailability.png" alt="Submit" class="responsive_02 margin_TB_01" />-->
                                    </div>  
                          </form>                
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
					<div class="image"><img src="icons/tariff.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="roomtariff.html" title="Title Link">
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
					<div class="image"><img src="icons/facility.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="facilities.html" title="Title Link">
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
					<div class="image"><img src="icons/banquets.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="meetings.html" title="Title Link">
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
					<div class="image"><img src="icons/dining.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="dining.html" title="Title Link">
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
					<div class="image"><img src="icons/gallery.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="gallery.html" title="Title Link">
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
					<div class="image"><img src="icons/attractions.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="attractions.html" title="Title Link">
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
					<div class="image"><img src="icons/offer.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="offers.html" title="Title Link">
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
					<div class="image"><img src="icons/enquire.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="enquiry.html" title="Title Link">
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
					<div class="image"><img src="icons/careers.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="careers.html" title="Title Link">
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
					<div class="image"><img src="icons/reach.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="reach.html" title="Title Link">
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
					<div class="image"><img src="icons/reservation.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
					<div class="info">
						<div class="more">
							<a href="reservation.html" title="Title Link">
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

				<div class="container padding_0">
            	 <div class="col-md-12 col-sm-12 col-xs-12 padding_0 text-center-xs text-center-sm padding_TB_02">    
                 	<strong>Hotel Manorama, Business class hotel</strong> - Luxury Accommodation at Vijayawada - a perfect destination for business travelers or tourists traveling to Vijayawada 
                 </div>
                </div>
        <div class="row footCon_Warp bdr_Top padding_0" style="margin-left: 0px; margin-right: 0px;">        	 
        	<div class="row margin_0" style="margin-left: 0px; margin-right: 0px;">
                <!--container start-->
                <div class="container footPadd01 paddingLR_0">
                	<!--foot LEft start-->
                     <div class="col-md-3 col-sm-12 col-xs-12 padding_0">    
                     	<div class="footLogo text-center-xs text-center-sm">
                         
                        <!-- <a href="http://www.hotelManorama.com/"><img src="img/icon.png" title="Hotel Manorama" alt="Hotel Manorama"></a>     -->                    </div>
                     	<div class="allreserve padding_0 text-center-xs text-center-sm">
                    		© 2014 Hotel Manorama. All rights reserved.
                    
                    	</div>
                     
                     </div>
                	<!--foot LEft End-->
                    <!--foot 2Nd start-->
                      <div class="col-md-8 col-sm-12 col-xs-12 pull-right padding_0 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 pull-right">
                      		<!--One Start-->
                     		<div class="col-md-3 col-sm-12 col-xs-12 padding_0">
                            	<div class="footItem">
                                    <a href="about.html" title="About Us" alt="About Us" class="footMore">About Us</a>                                     <br>                                     
                                     <a href="reach.html" title="How to Reach" alt="How to reach" class="footMore">How to Reach</a>                                     <br>                                     
                                     <a href="attractions.html" title="Attractions" alt="Attractions" class="footMore">Attractions</a>                                     <br>                                     
                                     <a href="offers.html" title="Offers" alt="Offers" class="footMore">Offers</a>                                   
                                    
                        		 </div>
                            
                            </div>
                            <!--One End-->
                             <!--Two Start-->
                            <div class="col-md-3 col-sm-12 col-xs-12 padding_0">
                            	 <div class="footItem">
                                 		<a href="gallery.html" title="Gallery" class="footMore">Gallery</a><br>                                 	
                                      	<a href="meetings.html" title="Meetings" class="footMore">Meetings</a><br>
                                        <a href="dining.html" title="Dining" alt="Dining" class="footMore">Dining</a><br>
                                        <a href="careers.html" title="Careers" alt="Careers" class="footMore">Careers</a><br>
                                       
                        		  </div>
                            
                            </div>
                             <!--Two End-->
                              <!--Three Start-->
                            <div class="col-md-2 col-sm-12 col-xs-12 padding_0">
                            	<div class="footItem">
                                	 <a href="enquiry.html" title="Enquiry" alt="Enquiry" class="footMore">Enquiry</a><br>
                                	<a href="facilities.html" title="Facilities" alt="Facilities" class="footMore">Facilities</a>   <br>                                 
                                   
                                    <a href="reservation.html" title="Reservations" class="footMore">Reservation</a>  <br>
                                    <a href="contact.html" title="Contact Us" alt="Contact Us" class="footMore">Contact Us</a><br>
                                   
                        		  </div>
                            
                            </div>
                             <!--Three End-->
                            <div class="col-md-3 col-sm-12 col-xs-12 padding_0  pull-right bdr_Top_02">
                     			<!--web_Social_F start-->
                               					 <div class="web_Social_F">
                                                 		
                                                 	 	<div class="tweet_F">
                                                        <a href="http://www.twitter.com/" target="_blank" title="Hotel Manorama on Twitter">&nbsp;
                                                        </a>
                                                         </div>
                                                        <div class="fb_F">
                                                        <a href="http://www.facebook.com/" target="_blank" title="Find us Facebook">&nbsp;
                                                        </a>
                                                        </div>
                                                        <div class="linkdin_F">
                                                        <a href="http://www.linkedin.com/" target="_blank" title="Hotel Manorama on linkedin">&nbsp;
                                                        </a>
                                                        </div>
                                                        <div class="gplus_F">
                                                        <a href="https://plus.google.com/+googleplus/posts/8C5oKFUKLVs" target="_blank" title="Hotel Manorama on Google +">&nbsp;
                                                        </a>
                                                        </div>
                                                        
                                                 </div>
                               				 <!--web_Social_F End-->
                                            <!-- powered_F start-->
                                             <div class="powered_F">
                                             <!--	Powered By : <a href="http://www.windsonline.com/" class="footMore" target="_blank">Winds Online</a> -->
                                             
                                             </div>
                                             <!-- powered_F End-->
                     		</div>
                     </div>
                     <!--foot 2Nd End-->
                
                </div>
                 <!--container End-->
                
            </div>        	        
        </div>         
	
    <script type="text/javascript">								
				var tpj=jQuery;
				tpj.noConflict();				
				tpj(document).ready(function() {				
				if (tpj.fn.cssOriginal!=undefined)
					tpj.fn.css = tpj.fn.cssOriginal;
					tpj('.fullwidthabnner').revolution(
						{	
							delay:10000,												
							startwidth:1366,
							startheight:612,
							
							onHoverStop:"off",						// Stop Banner Timet at Hover on Slide on/off
							
							thumbWidth:100,							// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
							thumbHeight:50,
							thumbAmount:4,
							
							/*hideThumbs:200,*/
							navigationType:"both",					//bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
							/*navigationArrows:"verticalcentered",		//nexttobullets, verticalcentered, none*/
							navigationStyle:"round",				//round,square,navbar
							
							touchenabled:"on",						// Enable Swipe Function : on/off
							
							navOffsetHorizontal:724,
							navOffsetVertical:30,
							
							fullWidth:"off",
							
							shadow:0								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)
														
						});	
						
			});
			</script>
   

<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
	</body>
</html>