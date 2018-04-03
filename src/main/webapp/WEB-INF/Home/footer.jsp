\
<%-- <%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%> --%>


<div class="clearfix"></div><br>
    <div id="footer-wrap">
			<div class="content"  style="margin:0 100px;">
			   	<p>All Rights Reserved © 2018 <a href="#" target="_blank"></a></p>
	        </div>
        </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
<!--     <script src="js/bootstrap.min.js"></script> -->
    <script>
	
 
  $('ul.nav li.dropdown').hover(function() {
  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
}, function() {
  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
});
  var isClick='Yes';
  $(document).ready(function(){
		tooltip1();
		
	});
  $(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
  </script>
  
  
<%--  <script type='text/javascript' src="${baseurl}/assets/js/jqueryui-1.10.3.min.js"></script>  --%>





  <script type='text/javascript' src='${baseurl }/js/customValidation.js'></script> 

  <script type='text/javascript' src="${baseurl }/js/select2.min.js" ></script>

  	<!-- Datatables -->


<!-- <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/> -->
<!-- <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"/> -->
<script src="${baseurl }/datatable/jquery.dataTables.min.js"></script>
<!-- <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->
<script type='text/javascript' src='${baseurl }/assets/plugins/datatables/jquery.dataTables.min.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/plugins/datatables/dataTables.bootstrap.js'></script> 
<script type='text/javascript' src='${baseurl }/assets/demo/demo-datatables.js'></script> 
<script src="${baseurl }/datatable/dataTables.buttons.min.js"></script>
<script src="${baseurl }/datatable/pdfmake.min.js"></script>
<script src="${baseurl }/datatable/vfs_fonts.js"></script>
<script src="${baseurl }/datatable/buttons.html5.min.js"></script>
<script src="${baseurl }/datatable/buttons.print.min.js"></script>
<script src="${baseurl }/datatable/buttons.flash.min.js"></script>
<script src="${baseurl }/datatable/jszip.min.js"></script>
<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
<script type='text/javascript' src="${baseurl }/js/jquery.blockUI.min.js" ></script>
<script type="text/javascript" src="http://momentjs.com/downloads/moment.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>
      <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css">
  	<script>
    $('.datatables').dataTable();
  	</script>
  	
  	
  </body>
</html>

