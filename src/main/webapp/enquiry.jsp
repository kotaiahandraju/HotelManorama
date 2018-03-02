<jsp:include page="header.jsp" />
			<div class="container">
			<legend style="font-weight: bold; font-size: 26px; border-bottom: 2px solid teal; color: teal;">OUR SERVICES</legend>
        <!-- Boxes de Acoes -->
    		
		<div class="col-md-1">
			<div class="box">							
				<div class="icon">
					<div class="image"><img src="user/icons/tariff.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/facility.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/banquets.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/dining.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/gallery.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/attractions.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/offer.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/enquire.png" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
					<div class="image"><img src="user/icons/reservation.jpg" style="width: 50px; margin: -15px 0px 0px 0px;"></div><br>
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
                 	<div class="col-md-10 col-sm-12 col-xs-12 padding_0 text-cente-xs text-cente-sm innerLeft">
                    	 
                        <script type="text/javascript">
function updating(){
	var country_id=jQuery('#EnquiryCountryId').val();
    jQuery.post('/states/ajax_update_state/', { country_id:country_id} ,function(data)
	{	   
       jQuery("#states1").html(jQuery.trim(data));
	},"html"); 
	
}

 function reset_form()
	{ 
	document.getElementById('EnquiryIndexForm').reset();
	jQuery("label[class=error]").each(
	function(){
		jQuery(this).text(''); 
	}); 
	}
 </script> 
<h1>Enquiry</h1>
<ol class="breadcrumb">
      <li><a href="/" title="Home">Home</a></li>                     
      <li class="active">Enquiry</li>
</ol>			
 
  
 <p> <p>
	<span style="color:#ffffff;">.</span></p>
 
</p>
 
      <h2>Send us an enquiry now</h2>
	   <p>Please fill the form below accurately to enable us serve you better, Fields marked in <span style="color: #F00">*</span> are mandatory</p>
            <form action="/Enquiries" method="post" class="form-horizontal" role="form" id="EnquiryIndexForm" accept-charset="utf-8"><div style="display:none;"><input type="hidden" name="_method" value="POST"/></div>            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">First Name <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input text required"><input name="data[Enquiry][first_name]" class="form-control" title="First Name" required="required" placeholder="First Name" pattern="[a-zA-Z ]+.{2,16}" maxlength="100" type="text" id="EnquiryFirstName"/></div>                </div>
            </div>
            <div class="form-group">
                <label for="lname" class="col-sm-2 control-label">Last Name </label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input text"><input name="data[Enquiry][last_name]" class="form-control"  title="Last Name" placeholder="Last Name" pattern="[a-zA-Z ]+" maxlength="100" type="text" id="EnquiryLastName"/></div>                </div>
            </div>
            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Address <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input textarea required"><textarea name="data[Enquiry][address]" class="form-control" title="Address" rows="3" required="required" placeholder="Address" maxlength="200" cols="30" id="EnquiryAddress"></textarea></div>                </div>
            </div>
            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Email ID <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input email required"><input name="data[Enquiry][email]" class="form-control" title="Email ID" required="required" placeholder="name@something.com" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" maxlength="100" type="email" id="EnquiryEmail"/></div>                </div>
            </div> 
            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">City <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input text required"><input name="data[Enquiry][city]" class="form-control" title="City" required="required" placeholder="City" maxlength="100" type="text" id="EnquiryCity"/></div>                </div>
            </div> 
     
			<input type="hidden" name="data[Enquiry][created]" type="text" value="2018-02-15 04:50:28" id="EnquiryCreated"/>            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Country <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <select name="data[Enquiry][country_id]" required="required" onchange="updating();" class="form-control" title="Please select Country" id="EnquiryCountryId">
<option value="">Select Country</option>
<option value="1">Afghanistan</option>
<option value="2">Albania </option>
<option value="3">Algeria  </option>
<option value="4">Andorra</option>
<option value="5">Angola </option>
<option value="6">Antigua and Barbuda </option>
<option value="7">Argentina </option>
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
</select>                </div>
            </div>
             <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">State</label>
                <div class="col-sm-10 col-md-6">    
                    <div id="states1">               
                    <div class="input select"><select name="data[Enquiry][state_id]" class="form-control" title="Please select State" id="EnquiryStateId">
<option value="">Select State</option>
<option value="1">Andaman and Nicobar Islands</option>
<option value="2">Andhra Pradesh</option>
<option value="3">Arunachal Pradesh</option>
<option value="4">Assam</option>
<option value="5">Bihar</option>
<option value="6">Chandigarh</option>
<option value="7">Chattisgarh</option>
<option value="33">Dadra &amp; Nagar</option>
<option value="32">Daman &amp; Diu</option>
<option value="10">Delhi</option>
<option value="11">Goa</option>
<option value="12">Gujarat</option>
<option value="25">Haryana</option>
<option value="14">Himachal Pradesh</option>
<option value="15">Jammu and Kashmir</option>
<option value="16">Jharkhand</option>
<option value="17">Karnataka</option>
<option value="18" selected="selected">Kerala</option>
<option value="31">Lakshdweep</option>
<option value="20">Madhya Pradesh</option>
<option value="21">Maharashtra</option>
<option value="22">Manipur</option>
<option value="23">Meghalaya</option>
<option value="24">Mizoram</option>
<option value="26">Orissa</option>
<option value="35">Pondicherry</option>
<option value="19">Punjab</option>
<option value="9">Rajasthan</option>
<option value="8">Sikkim</option>
<option value="27">Tamil Nadu</option>
<option value="28">Tripura</option>
<option value="29">Uttar Prasesh</option>
<option value="34">Uttaranchal</option>
<option value="30">West Bengal</option>
</select></div> 
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Telephone <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input tel required"><input name="data[Enquiry][telephone]" class="form-control" title="telephone" maxlength="15" required="required" placeholder="0000000000" pattern="[0-9]{10,16}" type="tel" id="EnquiryTelephone"/></div>                </div>
            </div> 

            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Zip </label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input text"><input name="data[Enquiry][zip]" class="form-control" title="Zip"  placeholder="000000" maxlength="6" onkeyup="this.value=this.value=this.value.replace(/[^\d+-]/,&#039;&#039)" type="text" id="EnquiryZip"/></div>                </div>
            </div>
            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Enquiry Details <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input textarea required"><textarea name="data[Enquiry][enquiry_details]" class="form-control" title="Enquiry Details " rows="3" required="required" placeholder="Enquiry Details " cols="30" id="EnquiryEnquiryDetails"></textarea></div>                </div>
            </div>            
            <div class="form-group">            
                <label for="captcha" class="col-sm-2 control-label"></label>
                <div class="col-sm-10 col-md-6">         		 
			     <img src="http://www.hotelManorama.com/pages/captcha" style="" vspace="2" id="captcha_image" alt="" />                 <a class="btn btn-info btn-sm capbtn" href="javascript:void(0);" onclick="javascript:document.images.captcha_image.src='http://www.hotelManorama.com/pages/captcha?' + Math.round(Math.random(0)*1000)+1">
                  Show a Different Image 	 	
                 </a>
                </div>
            </div>
            <div class="form-group">
                <label for="captcha" class="col-sm-2 control-label">Type The Code <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                  
                  <div class="input text required"><input name="data[Enquiry][captcha]" required="required" class="form-control" autocomplete="off" title="Please enter the code " type="text" id="EnquiryCaptcha"/></div>                </div>
            </div>                     
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button title="Submit" type="submit" class="btn btn-default" style="margin-right:10px;">Submit</button>
              <button title="Reset" type="reset" onclick="reset_form();" class="btn btn-default">Reset</button>
            </div>
          </div>          
	    </form>                     </div>                    
                     
   
    
</div>                              
                 </div>
                </div>  
<jsp:include page="footer.jsp" />