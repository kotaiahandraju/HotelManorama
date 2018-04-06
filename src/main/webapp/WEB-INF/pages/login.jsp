<jsp:include page="../../header.jsp" />
 <div class="container padding_0">
            	 <div class="col-md-12 col-sm-12 col-xs-12 padding_0 text-center-xs text-center-sm padding_TB_02"> 
                 	<div class="col-md-10 col-sm-12 col-xs-12 padding_0 text-cente-xs text-cente-sm innerLeft">
                    	 
                        <script type="text/javascript"> 

function validatecontents(){
 jQuery('#UserregistrationLoginForm').submit();
 }
 
function reset_form()
{
document.getElementById('UserregistrationLoginForm').reset();
	jQuery(":input").next('label').remove();
	jQuery("label[class=error]").each(
	function(){
		jQuery(this).text('');
		
	}); 
}
</script> 

<h1>login</h1>
<ol class="breadcrumb">
     <li><a href="http://hotelmanorama.com" title="Home">Home</a></li>                      
      <li class="active">login</li>
</ol>			
Login User Page 
  
 <p> <p>
	<span style="color: rgb(0, 0, 0); font-family: Calibri, sans-serif; font-size: 15px; line-height: 18px; text-indent: -24px;">
	IF you are already a registered user of Manorama, please login with your username and password to avail more privileges.&rdquo;.
	For any queries, please send a mail to&nbsp;</span><a _bcc="" _body="" _cc="" _subject="" _to="support@Manorama.com" 
	style="color: purple; text-decoration: underline; outline: none; font-family: Calibri, sans-serif; font-size: 15px; 
	line-height: 18px; text-indent: -24px;">info@hotelmanorama.com</a></p>
 
</p>
  
                
         <form style="width: 50%;" action="/Userregistrations/Login" method="post" class="form-horizontal form-default" role="form" id="UserregistrationLoginForm" accept-charset="utf-8"><div style="display:none;"><input type="hidden" name="_method" value="POST"/></div>    
         
         <div class="form-group">
                <label for="fname" class="col-md-4 control-label">Userame</label>
                <div class="col-md-6">                   
                    <div class="input email required"><input name="data[Userregistration][email]" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" class="form-control" title="Username" required="required" placeholder="Username" maxlength="100" type="email" id="UserregistrationEmail"/></div>                </div>
          </div>
          <div class="form-group">
                <label for="fname" class="col-md-4 control-label">Password</label>
                <div class="col-md-6">                   
                    <div class="input password required"><input name="data[Userregistration][password]" class="form-control" title="Password" required="required" placeholder="Password" type="password" id="UserregistrationPassword"/></div>                </div>
          </div>
          <div class="form-group">
            <div class="col-md-5 col-md-offset-4">
              <button title="Submit" type="submit" class="btn btn-info" >Sign in</button>
              <button title="Reset" type="reset" class="btn btn-warning" onclick="reset_form();">Reset</button>
            </div>
          </div> 
          <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="checkbox text-left-sm  text-left-xs padding_0">                    
                     <a href="/Userregistrations/forgotpassword" class="more1" title="Forgot your password?">Forgot your password?</a><span class="space">|</span><a href="/Userregistrations/register" class="more1" title="Register Now">Register New Account</a>                      </div>
                </div>
          </div>     
                  
          </form>     
	                      </div>  
<jsp:include page="../../footer.jsp" />