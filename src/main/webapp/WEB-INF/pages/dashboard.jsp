<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

	<!-- <style type="text/css">
table { border-collapse: collapse; }

caption { background: #D3D3D3; }

th {
  background: #A7C942;
  border: 1px solid #98BF21;
  color: #ffffff;
  font-weight: bold;
  text-align: left;
}

td {
  border: 1px solid #98BF21;
  text-align: left;
  font-weight: normal;
  color: #000000;
}

tr:nth-child(odd) { background: #ffffff; }

tbody tr:nth-child(odd) th {
  background: #ffffff;
  color: #000000;
}

tr:nth-child(even) { background: #EAF2D3; }

tbody tr:nth-child(even) th {
  background: #EAF2D3;
  color: #000000;
}

#target {
  width: 600px;
  height: 400px;
}

#target2 {
  width: 800px;
  height: 400px;
}
</style> -->

<script>
$(document).ready(function(){
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
});
</script>

<script type="text/javascript" src="${baseurl }/js/TableBarChart.js"></script>
	<link rel="stylesheet" href="${baseurl }/assets/css/TableBarChart.css" />
	
        <div class="clearfix"></div>
             <ol class="breadcrumb">
              <li><a href="#">Dashboard</a></li>
            </ol>
            <div class="clearfix"></div>
        <div class="container">
            <div class="row">
	            		<div class="col-md-3 col-xs-12 col-sm-6">
	                            <a class="info-tiles tiles-orange" href="#">
	                                <div class="tiles-heading">EMPTY CYLINDERS</div>
	                                <div class="tiles-body-alt">
	                                <c:if test="${not empty Empty}">
	                                    <div class="text-center" id="emptycylinders">${Empty }</div>
	                                </c:if>
	                                <c:if test="${ empty Empty}">
	                                    <div class="text-center" id="emptycylinders">0</div>
	                                </c:if>
	                                </div>
	                            </a>
	                        </div>
                        <div class="col-md-3 col-xs-12 col-sm-6">
                            <a class="info-tiles tiles-toyo" href="#">
                                <div class="tiles-heading">CYLINDER IN FILLING STATION</div>
                                <div class="tiles-body-alt">
                                    <!--i class="fa fa-bar-chart-o"></i-->
                                    <div class="text-center" id="idleCylinders" >${FillingStation}</div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-12 col-sm-6">
                            <a class="info-tiles tiles-alizarin" href="#">
                                <div class="tiles-heading">FILLED CYLINDERS</div>
                                <div class="tiles-body-alt">
                                 <c:if test="${not empty Filled}">
                                    <div class="text-center" id="filledcylinders">${Filled }</div>
                                  </c:if>
                                   <c:if test="${empty Filled}">
                                    <div class="text-center" id="filledcylinders">0</div>
                                  </c:if>
                                </div>
                            </a>
                        </div>
                         <div class="col-md-3 col-xs-12 col-sm-6">
                            <a class="info-tiles tiles-alizarin" href="#">
                                <div class="tiles-heading">QUALITY CHECK CYLINDERS</div>
                                <div class="tiles-body-alt">
                                 <c:if test="${not empty QualityCheck}">
                                    <div class="text-center" id="filledcylinders">${QualityCheck }</div>
                                  </c:if>
                                   <c:if test="${empty QualityCheck}">
                                    <div class="text-center" id="filledcylinders">0</div>
                                  </c:if>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-12 col-sm-6">
                            <a class="info-tiles tiles-info" href="#">
                                <div class="tiles-heading">CYLINDERS IN TRUCK</div>
                                <div class="tiles-body-alt">
                                    <div class="text-center">${Truck }</div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-12 col-sm-6">
                            <a class="info-tiles tiles-success" href="#">
                                <div class="tiles-heading" id="delivered">DELIVERED CYLINDERS</div>
                                <div class="tiles-body-alt">
                                    <!--i class="fa fa-money"></i-->
                                     <c:if test="${not empty Delivered}">
                                    <div class="text-center">${Delivered }</div>
                                    </c:if>
                                     <c:if test="${empty Delivered}">
                                    <div class="text-center">0</div>
                                    </c:if>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-12 col-sm-6">
                            <a class="info-tiles tiles-warning" href="#">
                                <div class="tiles-heading">RECEIVED CYLINDERS</div>
                                <div class="tiles-body-alt">
                                    <div class="text-center" id="returned">${Returned }</div>
                                </div>
                            </a>
                        </div>
                        
                        <div class="col-md-3 col-xs-12 col-sm-6">
                            <a class="info-tiles tiles-warning" href="#">
                                <div class="tiles-heading">MISSED CYLINDERS</div>
                                <div class="tiles-body-alt">
                                    <div class="text-center" id="missidcylinders">${MissedCylinder }</div>
                                </div>
                            </a>
                        </div>
                        
                    </div>
                    
            <div class="row">
            <div class="col-md-6 col-lg-6">
<!--                 <div class="panel panel-primary"> -->
<!--                     <div class="panel-heading"> -->
<!--                         <h4>Cylinders Usage</h4> -->
<!--                         <div class="options"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="panel-body"> -->
<!--                       <div id="bar-example"></div> -->
<!--                     </div> -->
<!--                 </div> -->

<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>  
            </div>
           <!--  <div id="chart-container">FusionCharts will render here</div>
				<div id="details">
				    <div id="header" class="textStyle">Total Revenue</div>
				    <div></div>
				    <div id="data" class="textStyle">$7.25M</div>
			</div> -->
				
            <div class="col-md-6 col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4>Gas Usage</h4>
                        <div class="options">
                        </div>
                    </div>
                    <div class="panel-body">
                        <div id="line-example"></div>
                    </div>
                </div>
            </div>
            
            
        </div>

        </div> <!-- container -->
    </div> <!-- #wrap -->
</div> <!-- page-content -->
 
 
 <table id="source" style="display: none">
      <caption>
  Locating Element By Id
  </caption>
      <thead>
    <tr>
          <th></th>
          <th>Run 1</th>
          <th>Run 2</th>
          <th>Run 3</th>
        </tr>
  </thead>
      <tbody>
    <tr>
          <th>Chrome</th>
          <td>1595</td>
          <td>1578</td>
          <td>1584</td>
        </tr>
    <tr>
          <th>Firefox</th>
          <td>1470</td>
          <td>1430</td>
          <td>1500</td>
        </tr>
    <tr>
          <th>Internet Explorer</th>
          <td>2750</td>
          <td>3140</td>
          <td>3162</td>
        </tr>
    <tr>
          <th>HTMLUnit with JS</th>
          <td>170</td>
          <td>100</td>
          <td>90</td>
        </tr>
  </tbody>
    </table>
<div id="target"> </div>
<br/>
<br/>

<!-- Body Ends Here -->
<script type="text/javascript">


$(".dashboard").addClass("active"); 




</script>
	<script type="text/javascript">
	var listOrders1 = ${allOrders1};
	var data = JSON.stringify(listOrders1);
	var myJSON = $.parseJSON(data);
	
	window.onload = function () {
		var chart = new CanvasJS.Chart("chartContainer", {
			title:{
				text: "Gas Usage"              
			},
			data: [              
			{
				// Change type to "doughnut", "line", "splineArea", etc.
				type: "column",
				dataPoints: myJSON
			}
			]
		});
		chart.render();
	}
// 	$(function() {
// 		$('#source').tableBarChart('#target', '', false);
// 		$('#source2').tableBarChart('#target2', '', true);
// 	});
	</script>
	
