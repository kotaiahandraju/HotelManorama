<jsp:include page="header.jsp" />
<div class="container">
         <div class="row">
            	 <div class="col-md-8">
                    	 
                         <div class="lock" id="svg_cont_load_items" style="display: none !important;">

<svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="40px" height="40px" viewBox="0 0 40 40" enable-background="new 0 0 40 40" xml:space="preserve">
  <path opacity="0.2" fill="#000" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
    s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
    c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"></path>
  <path fill="#000" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
    C22.32,8.481,24.301,9.057,26.013,10.047z" transform="rotate(156 20 20)">
    <animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0 20 20" to="360 20 20" dur="0.5s" repeatCount="indefinite"></animateTransform>
    </path>
  </svg>

</div>

<script type="text/javascript">

   
	var tpj1=jQuery;
    
tpj1(document).ready(function(){
//showlock(0);
var cyear = new Date().getFullYear();
var endyear =parseInt(cyear)+5; 
	
	tpj1("#ReservationFromDate").datepicker({

		numberOfMonths: 1,
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
        changeYear: true,
         minDate : 0,
        yearRange: cyear+':' + endyear,
		onSelect: function(selected) { 
			tpj1("#ReservationToDate").datepicker("option","minDate", selected) 
		} 
	});
	
	
	tpj1("#ReservationToDate").datepicker({	
		numberOfMonths: 1,
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
        changeYear: true,
        yearRange: cyear+':' + endyear,
		onSelect: function(selected) {
			tpj1("#ReservationFromDate").datepicker("option","maxDate", selected) 
		}
	
	}); 

});



</script>



<legend style="font-size: 36px;">Reserve A Room Now</legend> 
<ol class="breadcrumb">
      <li><a href="/" title="Home">Home</a></li>                     
      <li class="active">Reserve A Room Now</li>
</ol>			
 
  
 <p> <p>
	Reserve your room by using our online reservation system </p>
 
</p> 
<div class="row">
 <p class="desc-form">Please fill the form below accurately to enable us serve you better, Fields marked in <span style="color: #F00">*</span>  are mandatory</p>
 </div>
 <div>
 <form action="reservation.html" method="post" class="form-horizontal" role="form" id="ReservationAddForm" accept-charset="utf-8"><div style="display:none;"><input type="hidden" name="_method" value="POST"/></div><div class="row white-box-form">
<div class="col-xs-12">
 <p  class="form-subhead">Room Information</p>
 <div class="checkin-checkout">
 <div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Check In<font color="red">*</font> :</span>
  <div class="input text required"><input name="data[Reservation][from_date]" value="" class="form-control" title="From Date" required="required" onblur="clearRate();" type="text" id="ReservationFromDate"/></div></div>
<div class="input-group">
  <span class="input-group-addon" id="basic-addon1">Check Out <font color="red">*</font> :</span>
   <div class="input text required"><input name="data[Reservation][to_date]" value="" class="form-control" title="To Date" required="required" onblur="clearRate();" type="text" id="ReservationToDate"/></div></div>
</div>

<div  class="rooms">
<div class="input-group roomplan-w">
  <span class="input-group-addon" id="basic-addon1">Room Type :</span>
<select name="data[Reservation][room_plan_id]" required="required" class="form-control" title="Room Plan" onchange="clearRate();" id="ReservationRoomPlanId">
<option value="17">Economy</option>
<option value="22">Executive</option>
<option value="23">Premium</option>
<option value="20">Executive Suite</option>
<option value="21">Premium Suite</option>
</select></div>
</div>

<div  class="rooms">
<div class="input-group roomplan-w">
  <span class="input-group-addon" id="basic-addon1">How Many Rooms<font color="red">*</font>  :</span>
 
  <div class="input select required"><select name="data[Reservation][no_of_rooms]" id="no_of_rooms" class="form-control nos" required="required" onchange="find_rooms();">
<option value="0">please select one</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select></div></div>

</div>

<!--roooms -->
<div id="ol">
</div>
<!--rooms -->
<script>Reservations/add
function find_rooms()
{
  jQuery("#rate_div").html("");

var a=$("#no_of_rooms").val();
var min=1;
var max=a;
var text="";

if(a>0)
{

  
  while(min<=max)
  {
    text += '<div  class="rooms"><div class="input-group nos "><span class="input-group-addon right-arrow" id="basic-addon1" style="border:1px solid #333; width:70px;">Room &nbsp'+min+ '</span></div><div class="input-group nos"><span class="input-group-addon smaller" id="basic-addon1" >Adult :</span><select name="info[room'+min+'][adult][]" onchange="childhide();" id="adult'+min+'"  class="form-control nos odoo "><option value="1">01</option><option value="2">02</option><option value="3">03</option>  </select></div><div class="input-group nos " id="child'+min+'"><span class="input-group-addon smaller jk" >Children :</span><select name="info[room'+min+'][child][]" class="form-control jk" onchange="clearRate();" id="child1'+min+'"><option value="0" selected>00</option><option value="1">01</option><option value="2">02</option>  </select></div></div>';
    $("#ol").html(text);
    min++;
  }


  


}
  else
  {
     $("#ol").html("");
  }
}
</script>
<script>
function childhide($this)
{
   jQuery("#rate_div").html("");
 $('.odoo').each(function(){ 

 
 var adult_ids=this.id;

  var ids = this.id.substr(5);
  var room_nos=ids;
  var child_id="child"+ids;
   var child_id2="child1"+ids;

  //alert(child_id);exit;
  var adult_no=$('#adult'+ids).val();
  var child_no=$('#child'+ids).val();
  var child=this.ss;
 

if(adult_no>2)
{
  $("#"+child_id).hide();
  $("#"+child_id2).val(0);
  // $("#"+child_id).find(':selected').val(0);
  // $("#"+child_id).attr('val', 0);
   //$("#"+child_id).val();

}
else
{
   $("#"+child_id).show();

}


  
  
             
  
       });
//   var a=$(.odoo).id();
//   alert(a);
}
</script>





<!-- 
<div  class="single-double">

 <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label" ><strong style="font-size: 13px;text-align: left;">Single / Double</strong> :</label>
    <div class="col-sm-10" style="
    padding-left: 0px;width:auto;
">
    <label class="radio-inline" style="
    font-size: 14px;
">
  <input type="radio" name="data[Reservation][single_double]" id="ReservationSingleDouble0" value="0" div="1" checked="checked">Single
</label>
<label class="radio-inline" style="
    font-size: 14px;
">
  <input type="radio" name="data[Reservation][single_double]" id="ReservationSingleDouble1" value="1" div="1">Double
</label>
    </div>
  </div>


</div> -->


<div  class="checkrate">

<table>
  <tr>
    <td><a href="javascript:void(0);" onclick="getRate();" > <img src="user/img/check-rate-btn.png" alt="" /></a></td>
    <td><span id="rate_div">      </span></td>
  </tr>
</table>

</div>
<p class="notes">* Rate will be finalised after confirmation<br/>* The rates are inclusive of all taxes<br/>* Maximum Number of adults in a room is 3 person (including 1 extra bed)<br/>* Children ( below 10 years ) will not be charged for extra bed </p>



   </div>
 </div>
 <div class="row bottom-form"> 
<div class="col-xs-12" style="padding-left: 20px;"><p class="form-subhead">Personal Information</p>
                <div class="form-group">
                    <label for="fname" class="col-sm-2 control-label">Name <span style="color: #F00">*</span></label>
                    <div class="col-sm-10 col-md-6">                   
                        <div class="input text required"><input name="data[Reservation][name]" value="" class="form-control" title="Name" required="required" placeholder="Name" pattern="[a-zA-Z ]+.{2,16}" maxlength="200" type="text" id="ReservationName"/></div>                    </div>
                </div>
                <div class="form-group">
                    <label for="fname" class="col-sm-2 control-label">Email ID <span style="color: #F00">*</span></label>
                    <div class="col-sm-10 col-md-6">                   
                        <div class="input email required"><input name="data[Reservation][email]" class="form-control" title="Email ID" required="required" placeholder="name@something.com" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" maxlength="200" type="email" id="ReservationEmail"/></div>                    </div>
               </div> 
             



               <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Telephone <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input tel"><input name="data[Reservation][phone]" class="form-control" title="telephone" maxlength="15" required="required" placeholder="0000000000" pattern="[0-9]{10,16}" type="tel" id="ReservationPhone"/></div>                </div>
              </div>
          
            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">City <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input text required"><input name="data[Reservation][city]" class="form-control" title="City" required="required" placeholder="City" maxlength="200" type="text" id="ReservationCity"/></div>                </div>
            </div> 
            <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Address </label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input textarea"><textarea name="data[Reservation][address1]" class="form-control" title="Address" rows="3"  placeholder="Address" maxlength="255" cols="30" id="ReservationAddress1"></textarea></div>                </div>
            </div>  
            
               
               <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Country <span style="color: #F00">*</span></label>
                <div class="col-sm-10 col-md-6">                   
                    <select name="data[Reservation][country]" required="required" class="form-control" title="Please select Country" id="ReservationCountry">
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
             <!--<div class="form-group">
                <label for="fname" class="col-sm-2 control-label">State</label>
                <div class="col-sm-10 col-md-6">   
                                          <div id="states_div">   
                      <div class="input select"><select name="data[Reservation][state]" class="form-control" title="Please select State" id="ReservationState">
<option value="">Select State</option>
<option value="1">Andaman and Nicobar Islands</option>
<option value="2">Andhra Pradesh</option>
<option value="3">Arunachal Pradesh</option>
<option value="4">Assam</option>
<option value="5">Bihar</option>
<option value="6">Chandigarh</option>
<option value="7">Chattisgarh</option>
<option value="8">Sikkim</option>
<option value="9">Rajasthan</option>
<option value="10">Delhi</option>
<option value="11">Goa</option>
<option value="12">Gujarat</option>
<option value="14">Himachal Pradesh</option>
<option value="15">Jammu and Kashmir</option>
<option value="16">Jharkhand</option>
<option value="17">Karnataka</option>
<option value="18" selected="selected">Kerala</option>
<option value="19">Punjab</option>
<option value="20">Madhya Pradesh</option>
<option value="21">Maharashtra</option>
<option value="22">Manipur</option>
<option value="23">Meghalaya</option>
<option value="24">Mizoram</option>
<option value="25">Haryana</option>
<option value="26">Orissa</option>
<option value="27">Tamil Nadu</option>
<option value="28">Tripura</option>
<option value="29">Uttar Prasesh</option>
<option value="30">West Bengal</option>
<option value="31">Lakshdweep</option>
<option value="32">Daman &amp; Diu</option>
<option value="33">Dadra &amp; Nagar</option>
<option value="34">Uttaranchal</option>
<option value="35">Pondicherry</option>
<option value="2980">United Arab Emirates</option>
<option value="2981">Kuwait</option>
<option value="2982">Bahrain </option>
<option value="2983">Qatar</option>
<option value="2984">Oman</option>
</select></div> 
                    </div>
                </div>
            </div>  
              <div class="form-group">
                <label for="fname" class="col-sm-2 control-label">Zip </label>
                <div class="col-sm-10 col-md-6">                   
                    <div class="input text"><input name="data[Reservation][zip]" class="form-control" title="Zip"  placeholder="000000" maxlength="6" onkeyup="this.value=this.value=this.value.replace(/[^\d+-]/,&#039;&#039;)" type="text" id="ReservationZip"/></div>                </div>
            </div>-->
		               
	    <div class="form-group">            
                <label for="captcha" class="col-sm-2 control-label"></label>
                <div class="col-sm-10 col-md-6">         		 
			     <img src="http://www.hotelManorama.com/pages/captcha" style="" vspace="2" id="captcha_image" alt="" />                 <a href="javascript:void(0);" onclick="javascript:document.images.captcha_image.src='http://www.hotelManorama.com/pages/captcha?' + Math.round(Math.random(0)*1000)+1">
                   <img src="user/img/refresh.jpg" alt="" /> 	
                 </a>
                </div>
            </div>
            <div class="form-group">
                <label for="captcha" class="col-sm-2 control-label">Captcha </label>
                <div class="col-sm-10 col-md-6">                  
                  <div class="input text"><input name="data[Reservation][captcha]" required="required" placeholder="Type The Code" class="form-control" autocomplete="off" title="Please enter the code " type="text" id="ReservationCaptcha"/></div>                </div>
            </div>                     
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="button" onclick="showlock();" style="
    padding: 0px;
    background-color: transparent;
    border: 0px;
    margin-right: 10px;
" ><img src="user/img/bookmyplan-now.png" alt="" /></button>
              <a href="javascript:void(0);" onclick="reset_form();" ><img src="user/img/reset-btn.png" alt="" /></a>
            </div>
          </div>          
	    
      
         </div>
    </div>
</div>
</form> 
<script type="text/javascript">

function showlock(sts){
var check_in=$('#ReservationFromDate').val();
var Check_out=$('#ReservationToDate').val();
var no_of_rooms=$('#no_of_rooms').val();

var pname=$('#ReservationName').val();
var pemail=$('#ReservationEmail').val();
var pphone=$('#ReservationPhone').val();
var pcity=$('#ReservationCity').val();
var pcountry=$('#ReservationCountry').val();
var ReservationCaptcha=$('#ReservationCaptcha').val();



  jQuery.post('/reservations/ajax_validate/', {
    a:1,check_in:check_in,Check_out:Check_out,no_of_rooms:no_of_rooms,pname:pname,pemail:pemail,pphone:pphone,pcity:pcity,pcountry:pcountry,ReservationCaptcha:ReservationCaptcha
  } ,function(data)
   { 
      if(data==""){
        document.getElementById('ReservationAddForm').submit();

      }else{
      alert(data);
      }
   },"html");
  
}


  
 

 
function get_states(){
  var country_id=jQuery('#ReservationCountry').val();
    
  var state_id=jQuery('#ReservationStateId').val();
  jQuery.post('/states/ajax_update_state/', { country_id:country_id , state_id : state_id} ,function(data)
  { 
     
    jQuery("#states_div").html(jQuery.trim(data));
  },"html");
}

function clearRate(){

jQuery("#amount").val("");
jQuery("#rate_div").html("");

}

    function getRate(){



    var room_no=$('#no_of_rooms').val();
    var plan_id=jQuery('#ReservationRoomPlanId').val();
    var to_date=jQuery('#ReservationToDate').val();
    var from_date=jQuery('#ReservationFromDate').val();
    var pmode_string="";
    var sum1="";



if(from_date=="")
{
  alert("Please Select Check in Date..!");
  return false;
}
if(to_date=="")
{
  alert("Please Check out Date..!");
  return false;
}
if(room_no==0)
{
  alert("Please Select Room Number..!");
  return false;
}





$('.odoo').each(function(){ 

 
 var adult_ids=this.id;
  var ids = this.id.substr(5);
  var room_nos=ids;
  var adult_no=$('#adult'+ids).val();
  var child_no=$('#child1'+ids).val();
  




          if(pmode_string=="")
        {
          pmode_string = room_nos+"*"+adult_no+"*"+child_no;
          }
          else
          {
          pmode_string +="|"+room_nos+"*"+adult_no+"*"+child_no;
          }
  
             
  
       });



   jQuery.post('/reservations/ajax_getRate/', { plandet_id:plan_id,pmode_string:pmode_string,from_date:from_date,to_date:to_date,room_nos:room_no} ,function(data)
   { 
    console.log(data);
   //   alert(data);  
   //$("#rate_div").html(data);

   //jQuery("#rate_div").val(jQuery.trim(data));
    jQuery("#rate_div").html("Rs. "+jQuery.trim(data)+"<font>*</font>");
   },"html");


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


 function reset_form()
  { 

    $('#ReservationFromDate').val("");
    $('#ReservationToDate').val("");
    $('#no_of_rooms').val(0);
     $("#ol").html("");
     jQuery("#rate_div").html("");
    
  document.getElementById('ReservationAddForm').reset();
  jQuery("label[class=error]").each(
  function(){
    jQuery(this).text('');
    
  }); 
  }  
</script>                    </div>   
             <!--    <img src="img/but_banner_bussines.png" class="img-responsive pull-right" title="Manorama" alt="Manorama" style="margin-top: -240px;">
                 	 <div class="col-md-2 col-sm-12 col-xs-12 padding_0 text-cente-xs text-cente-sm text-right-lg text-right-md padding_Top_01 rImg">
    	<div class="col-md-12 col-sm-6 col-xs-12 padding_0 text-cente-xs text-cente-sm padding_TB_03 hidden-xs hidden-sm"> 
        	<a href="facilities.html"><img src="img/but_facilities.png" title="Facilities" alt="Facilities" class="img-responsive_02" /></a>            
		 </div>
        <div class="col-md-12 col-sm-6 col-xs-12 padding_0 text-cente-xs text-cente-sm padding_TB_03 hidden-xs hidden-sm">
            <a href="enquiry.html"><img src="img/but_enquiry.png" title="Enquiry" alt="Enquiry" class="img-responsive_02" /></a>        </div>-->
    	
    
       
<div class="col-md-4">	
	<legend style="font-size: 36px;"> Services</legend>
	<img src="user/img/b7.png" class="img-responsive"><br>
	<img src="user/img/b4.png" class="img-responsive"><br>
	<img src="user/img/b8.png" class="img-responsive"><br>
	<img src="user/img/b1.png" class="img-responsive"><br>
	<img src="user/img/b2.png" class="img-responsive"><br>
	<img src="user/img/b3.png" class="img-responsive">
	</div>   </div>                    
                 </div>
                </div>   
				<jsp:include page="footer.jsp" />