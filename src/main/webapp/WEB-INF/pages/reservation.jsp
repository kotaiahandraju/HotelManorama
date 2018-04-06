<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:include page="../../header.jsp" />

<link href="${baseurl }/assets/css/datepicker1.css" rel="stylesheet" type="text/css" />
<style>
p{
font-size: 12px;
}
.form-control{
font-size: 12px;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-8">

			<div class="lock" id="svg_cont_load_items"
				style="display: none !important;">

				<svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					width="40px" height="40px" viewBox="0 0 40 40"
					enable-background="new 0 0 40 40" xml:space="preserve">
  <path opacity="0.2" fill="#000"
						d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
    s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
    c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"></path>
  <path fill="#000"
						d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
    C22.32,8.481,24.301,9.057,26.013,10.047z"
						transform="rotate(156 20 20)">
    <animateTransform attributeType="xml" attributeName="transform"
						type="rotate" from="0 20 20" to="360 20 20" dur="0.5s"
						repeatCount="indefinite"></animateTransform>
    </path>
  </svg>

			</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script> -->

 
<!-- Include Date Range Picker -->
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script> -->

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



			<legend style="font-size: 36px;">Reserve A Room Now</legend>
			<ol class="breadcrumb">
				<li><a href="http://hotelmanorama.com/" title="Home">Home</a></li>
				<li class="active">Reserve A Room Now</li>
			</ol>


			
			<p>Reserve your room by using our online reservation system</p>

			
					<p>Please fill the form below accurately to enable us serve you
					better, Fields marked in <span style="color: #F00">*</span> are
					mandatory
				</p>
				<form:form action="" modelAttribute="reservationForm" method="post"
					class="form-horizontal" id="reservationAddForm">
					<div style="display: none;">
						<input type="hidden" name="_method" value="POST" />
					</div>
					<div class="row white-box-form">
						<div class="col-xs-12">
							<legend>Room Information</legend>
							<div style="display: inline-flex; width: 600px;">
								<div class="input-group" style='padding: 2px 24px 13px 0px;'>
									<span style="background-color: #f3ebda;border-color: #f3ebda;" class="input-group-addon" id="basic-addon1">Check
										In<font color="red">*</font> :
									</span>
									<div class="input text required">
										<input name="checkIn" style="width: 170px; background-color: #f3ebda;border-color: #f3ebda;" value="select Date"
											class="form-control validate" title="From Date" required="required" onkeydown="removeBorder(this.id);" placeholder="Checck In"	 type="text" id="checkIn" />
									</div>
									<span class="input-group-addon" id="basic-addon1" style="background-color: #f3ebda;border-color: #f3ebda;">Check Out <font color="red">*</font> :
									</span>
									<div class="input text required">
										<input name="checkOut" style="width: 170px; background-color: #f3ebda;border-color: #f3ebda;" value="select Date"
											class="form-control validate" title="To Date" required="required" onkeydown="removeBorder(this.id);" placeholder="Check Out" type="text" id="checkOut" />
									</div>
								</div>
							</div>
						
							<div class="rooms">
								<div class="input-group roomplan-w">
									<span class="input-group-addon" id="basic-addon1">Room
										Type :</span>
									<form:select path="roomTypeId" class="form-control validate"	onfocus="removeBorder(this.id);" onchange="getRoomOcupation(),CheckAvailability()">
										<form:option value="">-- Select Room Type --</form:option>
										<form:options items="${roomtype }"></form:options>
									</form:select>
								</div>
							</div>
							<div class="rooms">
								<div class="input-group roomplan-w">
									<span class="input-group-addon" id="basic-addon1">Room		Capacity<font color="red">*</font> :
									</span>

									<form:select path="capacityId" class="form-control validate" onfocus="removeBorder(this.id);" onchange="CheckAvailability()" >
										<form:option value="">-- Select Room Capacity --</form:option>
<%-- 										<form:options items="${capacity }"></form:options> --%>
									</form:select>

								</div>
							</div>
								<div class="rooms">
								<div class="input-group roomplan-w">
									<span class="input-group-addon" id="basic-addon1">How Many Rooms<font color="red">*</font> :
									</span> 
									<select name="noOfRooms" class="form-control validate" onfocus="removeBorder(this.id);"	id="noOfRooms" onchange="CheckAvailability()" >
									<option value="">-- Select How Many Rooms --</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									</select>
								</div>
							</div>
							<div class="rooms" id="noOfAdt"></div>
														
<!-- 									<button style="margin: 0px 0px 0px 289px;" type="button" class="btn btn-success" onclick="checkDateWise();">Check Availability</button> -->
									
									<div>
								<h4  class="badge badge-info" style='background: teal;font-size: 15px;'>Rooms Price:</h4>
								 <span class="badge badge-success" style='color: white;background: teal;font-size: 15px;' id="roomPrice"></span>
							</div>
								
							<div>
								<h4  class="badge badge-info" style='background: teal;font-size: 15px;'>Total Rooms Price:</h4>
								 <span class="badge badge-success" style='color: white;background: teal;font-size: 15px;' id="roomTotalPrice"></span>
							</div>
							<p class="notes">
								* Rate will be finalised after confirmation<br />* The rates are
								inclusive of all taxes<br />* Maximum Number of adults in a room
								is 3 person (including 1 extra bed)<br />* Children ( below 10
								years ) will not be charged for extra bed
							</p>
							<div class="checkrate">
								<table>
									<tr>
										<td><a href="javascript:void(0);" onclick="getRate();">
												
										</a></td>
										<td><span id="rate_div"> </span></td>
									</tr>
								</table>

							</div>
							</div>
					</div>
					<div class="row bottom-form">
						<div class="col-xs-12" style="padding-left: 20px;">
							<legend>Personal Information</legend>
							<div class="form-group">
								<label for="fname" class="col-sm-3">Name <span
									style="color: #F00">*</span></label>
								<div class="col-md-4">
									<div class="input text required">
										<input name="name" value=""
											class="form-control" title="Name" required="required"
											placeholder="Name" pattern="[a-zA-Z ]+.{2,16}"
											maxlength="200" type="text" id="name" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="fname" class="col-sm-3">Mobile
									Number <span style="color: #F00">*</span>
								</label>
								<div class="col-md-4">
									<div class="input text required">
										<input name="mobileNumber" value="" class="form-control"
											title="Name" required="required" placeholder="Mobile Number" pattern="[0-9]{10,16}"
											id="mobileNumber" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="fname" class="col-sm-3">Alternate
									MobileNumber<span style="color: #F00">*</span>
								</label>
								<div class="col-md-4">
									<div class="input text required">
										<input name="alternateMobileNumber" value=""
											class="form-control" title="Name" required="required"
											placeholder="Alternate MobileNumber" maxlength="200" type="text" pattern="[0-9]{10,16}"
											id="alternateMobileNumber" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="fname" class="col-sm-3">Email
									ID <span style="color: #F00">*</span>
								</label>
								<div class="col-md-4">
									<div class="input email required">
										<input name="email" class="form-control" title="Email ID"
											required="required" placeholder="name@something.com"
											pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" maxlength="200"
											type="email" id="email" />
									</div>
								</div>
							</div>


							<div class="form-group">
								<label for="fname" class="col-sm-3">City <span
									style="color: #F00">*</span></label>
								<div class="col-md-4">
									<div class="input text required">
										<input name="city" class="form-control"
											title="City" required="required" placeholder="City"
											maxlength="200" type="text" id="city" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="fname" class="col-sm-3">Address
								</label>
								<div class="col-md-4">
									<div class="input textarea">
										<textarea name="address"
											class="form-control" title="Address" rows="3"
											placeholder="Address" maxlength="255" cols="30"
											id="address"></textarea>
									</div>
								</div>
							</div>


							<div class="form-group">
								<label for="fname" class="col-sm-3">Country
									<span style="color: #F00">*</span>
								</label>
								<div class="col-md-4">
									<select name="country" required="required"
										class="form-control" title="Please select Country"
										id="country">
										<option value="">Select Country</option>
										<option value="1">Afghanistan</option>
										<option value="2">Albania</option>
										<option value="3">Algeria</option>
										<option value="4">Andorra</option>
										<option value="5">Angola</option>
										<option value="6">Antigua and Barbuda</option>
										<option value="7">Argentina</option>
										<option value="9">Armenia</option>
										<option value="10">Australia</option>
										<option value="11">Austria</option>
										<option value="12">Azerbaijan</option>
										<option value="13">Bahrain</option>
										<option value="14">Bangladesh</option>
										<option value="15">Belarus</option>
										<option value="16">Belgium</option>
										<option value="17">Benin</option>
										<option value="18">Bhutan</option>
										<option value="19">Bolivia</option>
										<option value="20">Bostwana</option>
										<option value="21">Brazil</option>
										<option value="22">Brunei</option>
										<option value="23">Bulgaria</option>
										<option value="24">Burkina Faso</option>
										<option value="25">Burundi</option>
										<option value="27">Cameroon</option>
										<option value="28">Canada</option>
										<option value="29">Central African Republic</option>
										<option value="30">Chile</option>
										<option value="31">China</option>
										<option value="32">Colombia</option>
										<option value="26">Combodia</option>
										<option value="33">Costa Rica</option>
										<option value="34">Cote dlvoire</option>
										<option value="35">Croatia</option>
										<option value="36">Cuba</option>
										<option value="37">Cyprus</option>
										<option value="38">Czech Republic</option>
										<option value="39">Denmark</option>
										<option value="40">Dominica</option>
										<option value="41">Dominican Republic</option>
										<option value="42">East Timor</option>
										<option value="43">Ecuador</option>
										<option value="44">Egypt</option>
										<option value="45">Estonia</option>
										<option value="46">Ethiopia</option>
										<option value="47">Fiji</option>
										<option value="48">Finland</option>
										<option value="49">France</option>
										<option value="50">Georgia</option>
										<option value="51">Germany</option>
										<option value="52">Ghana</option>
										<option value="53">Greece</option>
										<option value="54">Guatemala</option>
										<option value="55">Guyana</option>
										<option value="56">Hungary</option>
										<option value="57">Iceland</option>
										<option value="80" selected="selected">India</option>
										<option value="59">Indonesia</option>
										<option value="60">Iran</option>
										<option value="61">Iraq</option>
										<option value="62">Ireland</option>
										<option value="63">Israel</option>
										<option value="64">Italy</option>
										<option value="65">Jamaica</option>
										<option value="66">Japan</option>
										<option value="67">Jordan</option>
										<option value="68">Kaszakhstan</option>
										<option value="69">Kenya</option>
										<option value="72">Kuwait</option>
										<option value="73">Kyrgyzstan</option>
										<option value="74">Laos</option>
										<option value="75">Latvia</option>
										<option value="76">Lebanon</option>
										<option value="77">Liberia</option>
										<option value="78">Libya</option>
										<option value="79">Lithuania</option>
										<option value="58">Luxembourg</option>
										<option value="81">Macedonia</option>
										<option value="82">Madagascar</option>
										<option value="83">Malawi</option>
										<option value="84">Malaysia</option>
										<option value="85">Maldives</option>
										<option value="86">Mali</option>
										<option value="87">Malta</option>
										<option value="93">Mangolia</option>
										<option value="88">Mauritania</option>
										<option value="89">Mauritius</option>
										<option value="90">Mexico</option>
										<option value="91">Moldova</option>
										<option value="92">Monaco</option>
										<option value="94">Montenegro</option>
										<option value="95">Morocco</option>
										<option value="96">Mozambique</option>
										<option value="97">Myanmar(Burma)</option>
										<option value="98">Namibia</option>
										<option value="99">Nepal</option>
										<option value="100">Netherlands</option>
										<option value="101">New zealand</option>
										<option value="102">Niger</option>
										<option value="129">Nigeria</option>
										<option value="70">North Korea</option>
										<option value="104">Norway</option>
										<option value="105">Oman</option>
										<option value="106">Pakistan</option>
										<option value="107">Panama</option>
										<option value="108">Papua New Guinea</option>
										<option value="109">Paraguay</option>
										<option value="110">Peru</option>
										<option value="111">Philippines</option>
										<option value="112">Poland</option>
										<option value="113">Portugal</option>
										<option value="114">Qatar</option>
										<option value="115">Romania</option>
										<option value="116">Russia</option>
										<option value="117">Rwanda</option>
										<option value="118">Samoa</option>
										<option value="119">San Marino</option>
										<option value="120">Saudi arabia</option>
										<option value="121">Senegal</option>
										<option value="122">Serbia</option>
										<option value="123">Sierra Leone</option>
										<option value="155">Singapore</option>
										<option value="125">Slovakia</option>
										<option value="126">Slovenia</option>
										<option value="127">Somalia</option>
										<option value="128">South Africa</option>
										<option value="71">South Korea</option>
										<option value="103">Spain</option>
										<option value="130">Sri Lanka</option>
										<option value="131">Sudan</option>
										<option value="132">Sweden</option>
										<option value="133">Switzerland</option>
										<option value="134">Syria</option>
										<option value="135">Taiwan</option>
										<option value="136">Tajikistan</option>
										<option value="137">Tanzania</option>
										<option value="138">Thailand</option>
										<option value="139">Togo</option>
										<option value="140">Tonga</option>
										<option value="141">Trinidad and Tobago</option>
										<option value="142">Tunisia</option>
										<option value="143">Turkey</option>
										<option value="144">Turkmenistan</option>
										<option value="145">Uganda</option>
										<option value="146">Ukraine</option>
										<option value="147">United Arab Emirates</option>
										<option value="148">United Kingdom</option>
										<option value="149">United States</option>
										<option value="150">Uruguay</option>
										<option value="151">Uzbekistan</option>
										<option value="152">Venezuelea</option>
										<option value="153">Vietnam</option>
										<option value="154">Yemen</option>
										<option value="124">Zambia</option>
										<option value="156">Zimbabwe</option>
									</select>
								</div>
							</div>
							
							<div class="rooms" style='padding: 0px 69px 0px 306px;'>
								<div class="input-group roomplan-w">
									<button type="button" class="btn btn-success"
										onclick=" userDetails();">Confirmation</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-4">
									<button type="button" onclick="showlock();"
										style="padding: 0px; background-color: transparent; border: 0px; margin-right: 10px;">
										
									</button>
									<a href="javascript:void(0);" onclick="reset_form();">
								</div>
							</div>


						</div>
					</div>
			</div>
			</form:form>
			<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
			<script type="text/javascript">
			function getAdults(){
				var roomTypeId = $("#roomTypeId").val();
				var capacityId = $("#capacityId").val();
				var noOfRooms = $("#noOfRooms").val();
				var checkIn = $("#checkIn").val();
				var checkOut = $("#checkOut").val();
				if(roomTypeId !=null && roomTypeId !='' && roomTypeId != "undefined" && 
					capacityId !=null && capacityId !='' && capacityId != "undefined" && 
					noOfRooms !=null && noOfRooms !='' && noOfRooms != "undefined"){
					var formData = new FormData();
					formData.append('roomTypeId', roomTypeId);
					formData.append('capacityId', capacityId);
					formData.append('noOfRooms', noOfRooms);
					formData.append('checkOut', checkOut);
					formData.append('checkIn', checkIn);
					$.fn.makeMultipartRequest('POST','getAdults', false,formData, false, 'text', function(data) {
						$("#noOfAdt").html('');
						var roomData=JSON.parse(data);
						alert(roomData.maxchaild);
						alert(roomData.numberOfAdult);
						var adultDiv='';
						var childDiv='';
						var rows =0;
						for(var i=1;i<=roomData.numberOfAdult;i++)
						{
							adultDiv=adultDiv+'<option>'+ i; +'</option>';
						}
						for(var i=1;i<=roomData.maxchaild;i++)
						{
							console.log(i);
							childDiv=childDiv+'<option>'+ i; +'</option>';
						}
						
						 			
						 	for(var i=1;i<=noOfRooms;i++)
					 		{    
						 		var appendDiv= '<div class="input-group nos "><span class="input-group-addon right-arrow" id="basic-addon1" style="border:1px solid #333; width:70px;">'
					     			+'Room &nbsp;'
					     			+(++i)
					     			+'</span>'
									+'<div class="input-group roomplan-w">'
					 				+'<span class="input-group-addon" id="basic-addon1">No Of Adults<font color="red">*</font> :'
					 				+'</span>'
					 				+'<select name="numberOfAdult" required="required" class="form-control" title="Please select Country" id="numberOfAdult">'
					 				+'<option value="">Select Adults</option>'
					 				+adultDiv
					 				+'</select>'
					 				+'</div>'
					 				+'<div class="input-group roomplan-w">'
					 				+'<span class="input-group-addon" id="basic-addon1">No Of Childs<font color="red">*</font> :'
					 				+'</span>'
					 				+'<select name="max_chaild" required="required" class="form-control" title="Please select Country" id="max_chaild">'
					 				+'<option value="">Select Childs</option>'
					 				+childDiv
					 				+'</select>'
					 				+'</div></div>';
					 			$("#noOfAdt").append(appendDiv);
					 		}
							 
					});
				}
			}
				function CheckAvailability() {
					var roomTypeId = $("#roomTypeId").val();
					var capacityId = $("#capacityId").val();
					var noOfRooms = $("#noOfRooms").val();
					var checkIn = $("#checkIn").val();
					var checkOut = $("#checkOut").val();
					if(roomTypeId !=null && roomTypeId !='' && roomTypeId != "undefined" && 
							capacityId !=null && capacityId !='' && capacityId != "undefined" && 
							noOfRooms !=null && noOfRooms !='' && noOfRooms != "undefined" &&
							checkIn !=null && checkIn !='' && checkIn != "undefined" &&
							checkOut !=null && checkOut !='' && checkOut != "undefined"){
					var formData = new FormData();
					
					formData.append('roomTypeId', roomTypeId);
					formData.append('capacityId', capacityId);
					formData.append('noOfRooms', noOfRooms);
					formData.append('checkOut', checkOut);
					formData.append('checkIn', checkIn);
					var room=0;
					$.fn.makeMultipartRequest('POST','roomCheckAvail', false,formData, false, 'text', function(data) {
						$("#noOfAdt").html('');
						var roomData=JSON.parse(data);
						
						$("#roomTotalPrice").text(roomData.price);
						
						$("#roomPrice").text(roomData.roomPrice);
						var adultDiv='';
						var childDiv='';
						console.log("adult"+roomData.numberOfAdult);
						for(var i=1;i<=roomData.numberOfAdult;i++)
						{
							adultDiv=adultDiv+'<option>'+ i; +'</option>';
						}
						console.log("child"+roomData.numberOfChaild);
						for(var i=1;i<=roomData.numberOfChaild;i++)
						{
							console.log(i);
							childDiv=childDiv+'<option>'+ i; +'</option>';
						}
						
						 			var room="";
						 	for(var i=0;i<roomData.noOfRooms;i++)
					 		{   	 room=i;
					 				room ++;
					 				var appendDiv= '<div class="input-group nos "><div class="row"><span class="input-group-addon right-arrow" id="roomData" style="border:1px solid #333; width:70px;">'
					 								+'Room :'
						     						+room
								 					+'</span>'
													+'<div class="input-group roomplan-w">'
									 				+'<span class="input-group-addon" id="basic-addon1">No Of Adults<font color="red">*</font> :'
									 				+'</span>'
									 				+'<select name="numberOfAdult" required="required" class="form-control" title="Please select Country" id="numberOfAdult">'
									 				+'<option value="">Select Adults</option>'
									 				+adultDiv
									 				+'</select>'
									 				+'</div>'
									 				+'<div class="input-group roomplan-w">'
									 				+'<span class="input-group-addon" id="basic-addon1">No Of Childs<font color="red">*</font> :'
									 				+'</span>'
									 				+'<select name="max_chaild" required="required" class="form-control" title="Please select Country" id="max_chaild">'
									 				+'<option value="">Select Childs</option>'
									 				+childDiv
									 				+'</select>'
									 				+'</div></div></div>';
					 			$("#noOfAdt").append(appendDiv);
					 		}
							 
							});

				}
				}
				
				function userDetails() {
					var roomTypeId = $("#roomTypeId").val();
					var capacityId = $("#capacityId").val();
					var noOfRooms = $("#noOfRooms").val();
					var name = $("#name").val();
					var mobileNumber = $("#mobileNumber").val();
					var alternateMobileNumber = $("#alternateMobileNumber").val();
					var email = $("#email").val();
					var city = $("#city").val();
					var address = $("#address").val();
					var country = $("#country").val();
					var roomPrice = $("#roomPrice").text();
					var roomsStatus = $("#roomsStatus").val();
					var GST = $("#GST").val();
					var totalPrice = $("#roomTotalPrice").val();
					var checkIn = $("#checkIn").val();
					var checkOut = $("#checkOut").val();
					
					
					var formData = new FormData();
					formData.append('roomTypeId', roomTypeId);
					formData.append('capacityId', capacityId);
					formData.append('noOfRooms', noOfRooms);
					formData.append('name', name);
					formData.append('mobileNumber', mobileNumber);
					formData.append('alternateMobileNumber', alternateMobileNumber);
					formData.append('email', email);
					formData.append('city', city);
					formData.append('address', address);
					formData.append('roomPrice', roomPrice);
					formData.append('country', country);
					formData.append('roomsStatus', roomsStatus);
					formData.append('totalPrice', totalPrice);
					formData.append('GST', GST);
					formData.append('checkOut', checkOut);
					formData.append('checkIn', checkIn);
					
					$.fn.makeMultipartRequest('POST','roomUserDetails', false,
							formData, false, 'text', function(data) {
								console.log(data);
								//$("#roomPrice").text(data);
								window.location.reload();
							});

				}
				function checkDateWise() {
					/* var roomTypeId = $("#roomTypeId").val();
					var capacityId = $("#capacityId").val();
					var noOfRooms = $("#noOfRooms").val();
					var name = $("#name").val();
					var mobileNumber = $("#mobileNumber").val();
					var alternateMobileNumber = $("#alternateMobileNumber").val();
					var email = $("#email").val();
					var city = $("#city").val();
					var address = $("#address").val();
					var country = $("#country").val();
					var roomPrice = $("#roomPrice").text();
					var roomsStatus = $("#roomsStatus").val();
					var GST = $("#GST").val();
					var totalPrice = $("#totalPrice").val(); */
					var checkIn = $("#checkIn").val();
					var checkOut = $("#checkOut").val();
					
					
					var formData = new FormData();
					/* formData.append('roomTypeId', roomTypeId);
					formData.append('capacityId', capacityId);
					formData.append('noOfRooms', noOfRooms);
					formData.append('name', name);
					formData.append('mobileNumber', mobileNumber);
					formData.append('alternateMobileNumber', alternateMobileNumber);
					formData.append('email', email);
					formData.append('city', city);
					formData.append('address', address);
					formData.append('roomPrice', roomPrice);
					formData.append('country', country);
					formData.append('roomsStatus', roomsStatus);
					formData.append('totalPrice', totalPrice);
					formData.append('GST', GST); */
					formData.append('checkOut', checkOut);
					formData.append('checkIn', checkIn);
					
					$.fn.makeMultipartRequest('POST','checkDateWise', false,
							formData, false, 'text', function(data) {
								console.log(data);
								//$("#roomPrice").text(data);

							});

				}

				/* function showlock(sts) {
					var check_in = $('#ReservationFromDate').val();
					var Check_out = $('#ReservationToDate').val();
					var no_of_rooms = $('#no_of_rooms').val();

					var pname = $('#ReservationName').val();
					var pemail = $('#ReservationEmail').val();
					var pphone = $('#ReservationPhone').val();
					var pcity = $('#ReservationCity').val();
					var pcountry = $('#ReservationCountry').val();
					var ReservationCaptcha = $('#ReservationCaptcha').val();

					jQuery.post('/reservations/ajax_validate/', {
						a : 1,
						check_in : check_in,
						Check_out : Check_out,
						no_of_rooms : no_of_rooms,
						pname : pname,
						pemail : pemail,
						pphone : pphone,
						pcity : pcity,
						pcountry : pcountry,
						ReservationCaptcha : ReservationCaptcha
					}, function(data) {
						if (data == "") {
							document.getElementById('ReservationAddForm')
									.submit();

						} else {
							alert(data);
						}
					}, "html");

				}

				function get_states() {
					var country_id = jQuery('#ReservationCountry').val();

					var state_id = jQuery('#ReservationStateId').val();
					jQuery.post('/states/ajax_update_state/', {
						country_id : country_id,
						state_id : state_id
					}, function(data) {

						jQuery("#states_div").html(jQuery.trim(data));
					}, "html");
				}

				function clearRate() {

					jQuery("#amount").val("");
					jQuery("#rate_div").html("");

				}

				function getRate() {

					var room_no = $('#no_of_rooms').val();
					var plan_id = jQuery('#ReservationRoomPlanId').val();
					var to_date = jQuery('#ReservationToDate').val();
					var from_date = jQuery('#ReservationFromDate').val();
					var pmode_string = "";
					var sum1 = "";

					if (from_date == "") {
						alert("Please Select Check in Date..!");
						return false;
					}
					if (to_date == "") {
						alert("Please Check out Date..!");
						return false;
					}
					if (room_no == 0) {
						alert("Please Select Room Number..!");
						return false;
					}

					$('.odoo').each(
							function() {

								var adult_ids = this.id;
								var ids = this.id.substr(5);
								var room_nos = ids;
								var adult_no = $('#adult' + ids).val();
								var child_no = $('#child1' + ids).val();

								if (pmode_string == "") {
									pmode_string = room_nos + "*" + adult_no
											+ "*" + child_no;
								} else {
									pmode_string += "|" + room_nos + "*"
											+ adult_no + "*" + child_no;
								}

							});

					jQuery.post('/reservations/ajax_getRate/', {
						plandet_id : plan_id,
						pmode_string : pmode_string,
						from_date : from_date,
						to_date : to_date,
						room_nos : room_no
					}, function(data) {
						console.log(data);
						//   alert(data);  
						//$("#rate_div").html(data);

						//jQuery("#rate_div").val(jQuery.trim(data));
						jQuery("#rate_div").html(
								"Rs. " + jQuery.trim(data) + "<font>*</font>");
					}, "html");

					// console.log(pmode_string);

					// if (selected.length > 0) 
					// {
					//     selectedVal = selected.val();
					// }

					// jQuery.post('/reservations/ajax_getRate/', { plandet_id:plan_id ,no_of_rooms:no_of_rooms, single_double :to_date:to_date,from_date:from_date} ,function(data)
					// { 
					//  //alert(data);  
					//   jQuery("#amount").val(jQuery.trim(data));
					//   jQuery("#rate_div").html("Rs. "+jQuery.trim(data)+"<font>*</font>");
					// },"html");
				}

				function reset_form() {

					$('#ReservationFromDate').val("");
					$('#ReservationToDate').val("");
					$('#no_of_rooms').val(0);
					$("#ol").html("");
					jQuery("#rate_div").html("");

					document.getElementById('ReservationAddForm').reset();
					jQuery("label[class=error]").each(function() {
						jQuery(this).text('');

					});
				} */
				function getRoomOcupation(){
					var roomTypeId = $("#roomTypeId").val();
					var formData = new FormData();
					formData.append('roomTypeId', roomTypeId);
					
					$.fn.makeMultipartRequest('POST', 'getRoomOcupation1', false,formData, false, 'text', function(data) {
//				 		alert(data);
				$("#capacityId").html("");
						var optionsForClass = "";
						optionsForClass = $("#capacityId").empty();
				optionsForClass.append(new Option("-- Select Room Capacity --", ""));
				// $("#capacityId").html("");
						if(data != ""){
						var jsonobj = $.parseJSON(data);
						$("#capacityId").html("");
						var optionsForClass = "";
						optionsForClass = $("#capacityId").empty();
						optionsForClass.append(new Option("-- Select Room Capacity --", ""));
						
						$.each(jsonobj, function(i, tests) {
							var id=tests.id;
							var capacityname=tests.name;
							optionsForClass.append(new Option(capacityname, id));
						});
					}
					});
				}
			</script>

		<div class="col-md-4">
			<legend style="font-size: 36px;"> Services</legend>
			<img src="user/img/b7.png" class="thumbnail img-responsive pull-right"><br> <img
				src="user/img/b4.png" class="thumbnail img-responsive pull-right"><br> <img
				src="user/img/b8.png" class="thumbnail img-responsive pull-right"><br> <img
				src="user/img/b1.png" class="thumbnail img-responsive pull-right"><br> <img
				src="user/img/b2.png" class="thumbnail img-responsive pull-right"><br> <img
				src="user/img/b3.png" class="thumbnail img-responsive pull-right">
		</div>
		</div>
	</div>
	<jsp:include page="../../footer.jsp" />