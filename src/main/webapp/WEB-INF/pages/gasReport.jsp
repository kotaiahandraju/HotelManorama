<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Khaibar Gas LLC</title>
    <link rel="shortcut icon" href="${baseurl }/img/logo.jpeg"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${baseurl }/assets/css/styles.css">
    <link rel="stylesheet" href="${baseurl }/assets/css/animate.min.css">
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
    <![endif]-->

    <!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/form-toggle/toggles.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/datatables/dataTables.css' /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="${baseurl }/assets/css/datepicker1.css" rel="stylesheet" type="text/css" />

<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/plugins/charts-morrisjs/morris.css' /> 
<link rel='stylesheet' type='text/css' href='${baseurl }/assets/css/MonthPicker.min.css' /> 

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->

<link rel="stylesheet" href="${baseurl }/assets/css/select2.css">



<style type="text/css">
#page-container, #page-content{min-height: auto;}
.control-label {
	text-align: right;
	margin-bottom: 0;
    padding-top: 8px;
}
.impColor{color:red;}

.view, .edit, .delete, .activate, .deactivate {cursor: pointer;}
.edit {color: blue;}
.deactivate {color: blue;}
.activate {color: red;}

 .impFiled {color: blue;}
 .panel-success {background-color: #4CAF50 !important;}

span.has-error,span.hasError
{
  font-weight:normal;
  border-color: #e73d4a;
  color:red;
  margin-top: -3px;
  display: block !important;
  position: absolute;
}

.error{color: red; font-weight: bold;}

.alert-success, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}

.msgcss
{
/* 	width: 50% !important; */
/* 	font-weight: bold; */
	margin: auto;
	text-align: center;
	top: 3px !important;
	left:0;
	right:0;
	position: fixed;
	font-size: 14px;
	z-index:99999;
}
.select2
{
/* 	max-width: 100% !important; */
/* 	width: 100% !important; */
}

h1, .h1 {
    font-size: 24px;
    text-align: center;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${baseurl }/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${baseurl }/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="${baseurl }/js/jszip.min.js"></script>
<script type="text/javascript" src="${baseurl }/js/pdfmake.min.js"></script>
<script type="text/javascript" src="${baseurl }/js/vfs_fonts.js"></script>
<script type="text/javascript" src="${baseurl }/js/buttons.print.min.js"></script>
<script type="text/javascript" src="${baseurl }/js/buttons.html5.min.js"></script>

<script type="text/javascript" src="${baseurl }/assets/css/jquery.dataTables.min.css"></script>

<script type="text/javascript" src="${baseurl }/assets/css/buttons.dataTables.min.css"></script>


<script type='text/javascript' src='${baseurl }/js/ajax.js'></script>
<script type='text/javascript' src="${baseurl }/js/jquery.blockUI.min.js" ></script>
<script type='text/javascript' src='${baseurl }/js/customValidation.js'></script> 

<script type='text/javascript' src='${baseurl }/assets/js/bootstrap.min.js'></script>  
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type='text/javascript' src='${baseurl }/js/MonthPicker.min.js'></script>


<script type="text/javascript">
	var isClick = 'No';
		window.setTimeout(function() {
		    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
		        $(this).remove(); 
		    });
		}, 5000);
		$(document).ready(function(){
			
			var formData = new FormData();
		    
			$.fn.makeMultipartRequest('POST', 'getCount', false,
					formData, false, 'text', function(data){
				var jsonobj = $.parseJSON(data);
//		 		alert(jsonobj.cylinderCount);
				$("#cylinderCount1").text(jsonobj.totalCylinderCount);
				$("#customerCount1").text(jsonobj.customerCount);
				$("#totalGas1").text(jsonobj.totalGas);
				
//		 		var alldata = jsonobj.allOrders1;
//		 		console.log(jsonobj.allOrders1);
//		 		displayTable(alldata);
			});
		});
		

		/* $(document).ready(function() {
		    $('#example').DataTable( {
		        dom: 'Bfrtip',
		        buttons: [
		            'excelHtml5',
		            'pdfHtml5',
		            {
		                extend: 'print',
		                customize: function ( win ) {
		                    $(win.document.body)
		                        .css( 'font-size', '10pt' )
		                        .prepend(
		                            '<img src="${baseurl }/assets/img/khaibar_logo.png" style="position:absolute; top:0; left:0;" />'
		                        );
		 
		                    $(win.document.body).find( 'table' )
		                        .addClass( 'compact' )
		                        .css( 'font-size', 'inherit' );
		                }
		            },
		            {
		                extend: 'pdfHtml5',
		                customize: function ( doc ) {
		                    doc.content.splice( 1, 0, {
		                        margin: [ 0, 0, 0, 12 ],
		                        alignment: 'center',
		                        image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAIAAAD/gAIDAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA9lpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wUmlnaHRzPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvcmlnaHRzLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcFJpZ2h0czpNYXJrZWQ9IkZhbHNlIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDoxN2FlYzk4Yy0zMjgzLTExZGEtYTIzOC1lM2UyZmFmNmU5NjkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QUYzODU5RTYxNDNCMTFFNTlBNjVCOTY4NjAwQzY5QkQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QUYzODU5RTUxNDNCMTFFNTlBNjVCOTY4NjAwQzY5QkQiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowODgwMTE3NDA3MjA2ODExOTJCMDk2REE0QTA5NjJFNCIgc3RSZWY6ZG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjE3YWVjOThjLTMyODMtMTFkYS1hMjM4LWUzZTJmYWY2ZTk2OSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pu9vBW8AADRxSURBVHja3H0JmFxXdea79y21967uVi+SbLXUkiVZso2NZWJjsyQEAsYZlnHIJCyZJPARMsnnyZedBJjJB5kMA5kQCAkhkECCweAVbxjvtmRsy7YWS+puLb13V3fXvrzl3jnn3HtfVRsbwsQ2JKXncnUtr97731n+s9xTTEpp/bhvQRDU6dZoNHzfD8PIsiS3bc91E8lkOpVKp9Oe5/3Yj9N5+b8SLs/KyurCwvzM7Ozc3Nzi4tLKykqxWKxWa00AK/CjSEgpGAO4uOclUqlkLpvr7u7u798wPDK8aXTT6OjowEC/bdv/YcECOCYnJ48de/b4ieOnT51ZWFhYKxSq1Wqz2QTJiqJImlv8EcYY3HP4HwfgbMdxQL4ymUxvb+/o6MjOnTv37du7e/fugf7+l+cU2EuthuVy5eixo48//vjTTz8zNTm1uLRUKpUAIIWOQiS+vZAkqvv29wN2rutms9mhoaHzz99zxeWX799/aV9f379XsE6fPvPIo488+uiBY8eOgcKBZIE9QknhvB0dif/gJuBmSaH+tFgMC1eb+vP7seModE4mk968edNP/dRP/dyb3nTBBfv+PYEF6Nzz3e8+/PAjJ06cWFpaBssNT4IsxAAJEUVhEEZgniIAx2KObSc4T9g8wbjHLBuQQfRkIIUvREPIBrgBxgSpo8vhPQz31q65gBroaU9Pz6WXvvKd73jHlVe++oVE9ScFrBMnTt5xxx33P/DA8eMn8vk8GCM4OSVK8EVhCOa7AQABLolkbzqzMZMdTqcGvWSv63RxnuEsaUlPWo6UtowYoBXCu8NmGFR8f6XRnGs2zjaap4NwXsiSzUEZk+AzQe5i1Mi+8VwuB1r5nne/+4orLv9JBGtpaem2226/8667jhw+vLS8DOeoYIKXwjBoNmtRGCUS3Z3d53b3jnd0bkmm+l0nyyxXWrYUsMEJcwswklzAY3hGgnDZ8BifxD9pE1YYAb1YqtdPVKtPVOuHgnCac+E4ac7ddhsHqAFkP/3613/wgx8YHx//SQEL1OW+++674ZvfOnjg4PTMTBiGCibYM8hRo1EDk9LTNz4weEFXz9ZksocxOCuAAHC0yR3TRjARKHCv8EL4RMQINZAycy8ZvNmSIH0sjAq12pFS+Z5y9aFQLLgOCFrKQoPX8qoDAwPve997f/W//koikfgxgzU/P3/99V+//Y47gBNUKhWwGkqaQJQa9VoqPbBx5OLBoQuz2QEwNEQDwNa4tIFhctA84WnHMmUECjBCyBihhhgRahY9hnuLHpMAWShQfjBfLH93tXBj0z8GRg0ErV3K4LZ///4P//Ef7d17/o8NrAMHDv7TV77y4IMPzc7Okgl34Nh9H1AqpzKDm865YuPwhclkN7kzm4NhZmCbNVIIE22kX0rX4GBskiAEKIL7iGAipERkCS1fVgsvqf0iw8vgRqJUKt+7vPqP9cYzjpMCixbDBZYP2Nnv/Pfr3vOed7/cYIGufevGG//lX772xBNPAm8CygM2AnxctVKwndyWrVeNbN6fSnXB/gEjsME2JxfGQawcpgTKUmqoZIop7SPhYoQRjwCaEEUpUlIWWZGSL0BNGsiIdRidExgkcU+Iylrx1sXlLwThGdfNwdcZpoEE5dprr/0fH/soMNuXCaxyufylL335W9+6EdgmxHGKEzQa1Ua9MTRy8diON+Q6NiJtdFzH9lCgtEw5pIO0WVxqvNB4kUyxNqSMNOE9jyIjWfoZS90b4UKnaVlazECGKK5MhMHCwvLf5le/xmzh2Bl6CW9gRF/1qld95jP/d3Rk5CUHa3l5+W8+//lbb7ltcmpKMWnYQ6W85npdO3ZfMzRyAYkS2K6E7STwMXcRTe5wy1b6iJ5ewYRIkcEGmbKMCQdE8PwJmpArgBCvkCnUSNAsBRnhBfcx2ZIkX7BFeGzcKVUemp7/RL1x3PM6yPDjDQL2bdvGvvB3f7t7966XEKy5ufnPfOYz3779jrNnzypbDrSgUi70b9y36/y3ZTr6OaDiJkCgbMdD7bPhPbDZSH6YTQaeW0THcZO0WZxsUMvrtdkpZsSKR6H+Ex8oKNWnyH4p2SLhEjFkjIWglWG0Mj3/yfzqDa6bIkcslXwNDgz8w5e+ePErXvGSgAWO79Of/stv3347xC7KSPnNeq1W27bzjWM7fsZxkxSuJQAjCHgBI0JKMVJO1ooBTPAf3iFGjOy6pYRLmSEES2qbJSKDl0CAgMkKgxdIXGREjNQQwdGSpWw+IAVPwc6skGgqW8p/dWb+kyBxyuqTv252d3d/9Sv/ePHFF7/IYIH2/Z9PffqWW26dm1NI8Xq9HAZyz4W/MLL5UkAEYEKZUqqHGxBsTlFdHNmpO9zUV5NkwT9FnUi5SLikQkoiQDLSuGikDEyxrBFYTAuXUOeyTr4sFgJGcGCF0n2nzvxxJFZtY8JAvsBF3vCNr+/Zs/tFAwss+qc+9Zc3fPOb09PTCqlarSSld+Er3zuwcTeg4bgp1006jova56Ah55hV4QocRsGOgogBHJaijZY2ItJYd8kMBeWKZ5HL40olI7JfSg1JyhA1SaihVmoXIYl8aZ0E/2xMPmwQeCVqtWdOnvkdP5hx7Cy9gVWr1c2bNt18y02bRkdfBLCAJXz2s5/7p698dWJy0kUgECnLSl582a/19W8DSFxPIeWBuVKqB7pnKbEinYtTLQojrSp4egqyyOYCNxvuLU7vAZIVBjzw7abv+L4X+G4YOhQVWcqEhaGGTyksokae0ewTZYwpy7UOL7fenDh56rqGf1q5SDhCoD6XXHLxjd/6Zjab/beCdf313/js5z53+PBhjje7US9H0r3ksvf3DWyHPz0vjQroKIvucKIRKFOkcpx0Dq82U9YXtYIeRJ7TSCf9jozI5Xg246ZTrge2ToeTeFSRkEEQNRpRtRoVi3J11V5Z8QqFTL2eFBHwfmQPIWqirTymjJgyecZyaeZloSgDZBovbjuN5sSJqd9u+jO2nVZ4ra2tvetdv/D5v/ncvwmsgwcPfvwTf/7II49CAAhmCCx60w8vedX7BzbuQaQSKbDrLrAE2wFWRSJFGQZusiPMUhaKiCOYc+E69c5Mra/H2tCb6urMpNJpAFoZNeX+NQnQd5pOAt0Ft1urNVdXfQgWTp9OLS1mm80ks5Rn1MKl7BfptdZEVHutlQAcGi+LBUApqvUjx6d+K4rWONcBY6FQ+F9//okPfOD9/59gLSwsfvRjH/v2t28HxQaigCyhUrrwkvduOucyDF4SSqYS4APh6zlFz2jOufJ5xiThKQNpECm30tdTGx5M9m/oymRzoBFwCpiz0hi1Z/TwodA5QdAokx+0yCGIsFZvzM02jx3zpqY669UUfB28GSAj50DuQhkuy8gXW48X6WOx/ODJU79DjMxR1gbuv33bLRdddNGPDBacBri/L3/5yzMzs64LMbAsFpbHd7115563kEylwVSR9gFNJzKl01YoVaR+lrLqcOWTbnWgt7p5ND3QvyGVyhBRiNSJGCZpApc2wGKklJsj+ZKaiCJhk2HYnJtrHHoyceLZbrBrmOZANeSWUOelz6+N3MPhKGUEXAKHu4v5fzk983GVqIBbpVI5f8+eO++8PZVKPS8m9p/8yZ887wvf/e53v/gPX5qYmHDQqLNyeW1g6IK9F/5nsE1uIuWBRXeRTznAEhyFFMkUck/1CPUOSGt/9+p529h546P9GwZADBUS5CQVtkYGdQ617Zk2LdZPoWAxLXeIiN3Rkdi6NeofKBcKsriWUEJtqSuldtX6gx61BAOugZ/N7gqDfKX6FGVELM8DUZ2C03n1FVf8CJKVz+f/6I8+DPwTmAioF8R9jGcuf8112dwAqB6A5ToIFogV6CMjpGzeVnRAI85TXmnzxurY1oHu7g1kXISJN8xRm7wTY9KUcozGoUCRKEVS1X1QK4UkdTMSh6/imyHiqlabBx91Hn+sJ4ocNIBER5gVO5ZYgnUwpIQLDyoqHZ/6jVr9BOdJSk5gaHn33Xft2b37XytZX/3qP994081ARB3XhSOqVav7Lv6lDQPjgDoqIBEFRArMlEkbc25oJ7m7ruzKrm1i5/g5uVy3Tl2qkhbXgCI7A02gWAiOsFaPCqVgZS3Ir/pwXyyHtVoUhAJO3HU5CDfnJp6RWt6kEjU8Q9iVc845orevPDPj1utwYNKKE/Ca6sVP6MtJ/49sJ51Kjq4W7iEQ8fiq1cr02Zl3vvMd/6q64cmTE7ffcQcwdVRAy6pUCiOb94+MXgQyrmAiSuWQ79OGinMl8RTEWGKgO79rPDs8NAqvCCyX6kqNqQZaDtAqIQvlcGGpAdta0a/WQt+H64wWnwI9oeD1PDuXcXq7vYF+r6/HSXgcEAwDtUNpaRRQAEPpbB9nnV1rt90iFheycJVbWqw4HmXoCWVOYgaIOkL4uewrBvvfNr/0ZWahqcpmO+64887bbvv2G9/4sz9cDf/3Jz/5hS98cWlpCci6j/UF+9Wv/91c50ZAClmVRx4QGBHmEmySqVbtD+jkxp7lPef19g8MKUkw11T/H0QJQDk7V588U13MNxpNtPS4B0vzBUqBCm3dBepgRBwKzg1QGx1KnLPF6+6CWEf6Ab2R3kZJCPw4MNtiKbz1ps6Zs1nPE5TbkFQtYbEuEs1XmYlQWgFQsFCsTZz6ULV2RkkPBLz79u29+647QVx+kBoeO/bs3/3d34Nd5xT6VsqFHbvePLTpIiAHxNQTJFkkVrZCSisgISU39ub37t7Q3z+k6DozhgzgAG2C/U+eqT3y+NqzE5VSJeQkYo5tEZGNjbjRFxYrr6ToyWo0xdx8ODEVlkqys4NnMpgRNPaaKbYLzyST/Jxz6/NzdrEARytbfsPSRoy+w9ImEu8gugYqkyxXH8T6CCq+Ozk5tXv37p07d7SDw58jVnfccefkxARVq1izUcvmhraMXQ57xiDZpQgZUy6cazul0i36QPu78nt29vRt2Iiq13JIiCZoE1iiu+/PP3hgpVD0PZclXCWSClQjm1yfBmGn3qB2goEeWCIP3Wn07PHmTbfWDz0VwNvIVDBFPnFvHEyYlcnYb3pzsW9DA8gT0yQrdrn60Ag3uF6YvLVk0NVxVWfHBeC+FQ6A11995q8FOd3nB+vMmbMPPfTQ6toa9VzIRrO+dfy1qVSXynlidRMkwdaypLQPjxAdmN2ZWQM7BdqHbMegBAcE8geCeORE+c77lhaWG16CKcauUICd2G2yiRfA1gEAM2YQTohz4uK0weNEUoaReOSAf/sdQbksPc8YcE0/MAzq6GQ/87OFVBqsoEp+6DjeiJcizpwpvOA4Wbqv++c9UwFKp9MHDhx44IEHXhCs+++/f2JyArgsyE2z2chkB0c2vQL2TOkEh2TK5lyTKm2K0EnxpFceP9faODRianaaNgFM8OfDj68dPFSAl1yPsbbz4sZPWa0/LSWp2mvoLGG8Twn0jRkpSyblzEx0083h7KxIJCRrUTLcZxDwwSFx+ZUFEWc52HrXqPeutMOBSDSTvqQjuxusnirWglj9/d9/8fnBgpjmoYcfXllZ1bWsRm3zOZel0l0Y92EeXWsf047PilNTnAXApzZv3sQUwzEaaDvACeT9B1ZOTFU8VawwYQhr34M2bMaOmOc57YorleStrAs4WHyeCxSxlKzV5W3fFpOTFuBlKUCJtcGbfZ/tPK9x3u5y4GsJNdeqJV/mK0mmeaar42cSCV2szWazd3/nnpmZmecB6+mnnwHrDv5JJYtdL4dihQUutFOofoqaG+attB6IZm9HYevWAQiqFb9UhwPKBX89+Njqmdm65+nsA5w2XAgtLkyaZBdqGSGyXur4OsahPqJcm0lUoVNzXTQsd91lTU1ZCa8VkCotloLv31/u7vExwGZxgKWPPvY+qjggrTCTuiSb2WI7FNDaNpDzm2++5XnAAhVdXFxUh9ps1voHz8t1DOhGDMOqDKlUVwMVMOHUzt3sdnX2wiG3zCcgYrODTxUAqQQiJVmbirVtzHipFhXjrHVMLUGjfco4fwDyRSrJCT5weSDCd93J5+el28KL/FzEsrnoootL2lKv+3ZL9+q0KgPSsXtz2VfCMSsNSCS8m26++blglUqlQ089BZGkKrsDORwGFmpTHl2l0nXrT9z8o3CRg72V4aFBy2RzybwgSzg+UTkxVU14dP50IOakKRGviju0h3XgM7mOc3PLgEnHuu5UpRFPwsuVzSb7zt1OvSYwpRbTdPBzAd8+Xh8aaooI5F3G8ZjpaorpBKdqpkwnL0mnOtXbUqn0k08eOnXq1DqwTpw4AU8FQQCfDkM/me7t3TBGvkwhZVttehJf+KRb3TScTiYzQLoVJZVIO1l+xT90pOg6yjoLY6ekEX+pDRGKhja9baTBxEOW9X05KZVmp3oOaCKL6B6+GjirBH1cztsPPgCXO2K8JZtgrF3X2ntB2QQQ0moFQjpYj78bdu4652Yy5wIjoUyAXSgU7rvv/nVgPfPMkeXlvPICgd/o7RtLp7vJoCsPaLJ6+qvwbIAx93XV+/v7ZJxfp6sDAv/k4aIfCJXybJltI1vciIzOKjBdEWNtMbYOZeiNVhzX6V42LYA6ga85FIpYwhPPHktMTABwMrYJ8C8I2aYtjQ0DPmglWxccGuOljD2hwVk2ldyTTDqK8IMZuvfee1tgwWkfO3YMvKHyg8BMNgzsYLreR3le1v7VFDjA5bIbQ4PYHytU2phYAxi3MzP1+cUGyJdlyLP5VIudG9lXUqNIZXwGTGGnX1KWShFOdcSsZbniQo62/aRljx306o2QTsVUE6XluWL7eJXMvHGslmylbFjMOvBjnrszlcqo55LJJGhio9HQYK2urigdBFwglgXi3927meifw3XBvS3406olc5nahr5O83VSUQCI+46dLHNTRTXmxYqxttZ5OBk7OtmyuCoh2mIZdCSknpbykJau3OjcC+mm0PlW2xFLS96J45YWLkNMwohv2lLPZCIVGOmviK8cfQ/XTkg4fFMq2Q+2TyW5ZmZnIPrRWYfZ2dmFxUXVfgakIZ3pzWT6yKlx4/14nJxTmsJZONAn0+ksHCQcDnWxgMTyucXmaiEAjq5DLzwwIVvpEe0GWnG8FSd/mTAxniTvSaYfQ2WQ9CgQAWxhFAUyCEUUYhI5DOzQt+neCfwoDBwIiCPhhr714P32pk01iGRVvEIXS3Z0BIMbG6emMhAdUzrMXJOYB+G7yPCyrkRyFALERgP0llertSNHjuzadR6Cdfbs2WKxqEgSfGfHho2elyb6YZsgLZaGVoY8lcqBswypY5ZR9gKOrKvDyWScejOyudWuWi0R0n+sy5MzEwjDvxBcMSZhhB9EgE6ImxDwDGIGL1EukPq2BD62wgikBl6Fx4CmhHeKKJqe9iZOFsd32CDp0qTzPS/KdZbz+VQqBWzDAjIFMTy345KKFedwGbzX2ZRIOPW6UmcLwLKst+PD6ZnZer2uwIDjyXUOKb5OZfe4/qA8uzEolj09z5X3jH1LJKxcxtm6OQ2nFNt0DZX+rLVOwKSWvkha4BDqtaBU9otlH+7LtaDRDEGaCBop9ZdaZi+SxUZHCpNit1QsDZdYSufEcQ/TL1odEK0oZP39dVCgQkGs5KPlxWh5KVpbFdWqCEPJDNtWh+3YQ2CtlENxHOfkyZPaZi3ML6jTJrW3srmBlrK3bLsSV31cYPqXV625xToEf6Z0hfdwkQGsbNoWQmp7EtvTuEmK6WorvBlksFINiqVmpdKsNVCUUAyM5YptsJSqmUHGiedWDcIylTZF08i3gsGanU2WSwFv1XgxG9HZFXR1B2jGKe8aBLJaEYDX8pJYXg6LReE3cYdAx2zel0hkFNau60LQg0wCYAJSD8GzSiKCUQfSoA41tlYmhGh5XDpYPnm6iR/UdVM83kjITMbeMpoKIkGF+rgVSMYGFeSuXo/KFb9Y8au1ABOk6kxNwcdUwVqtahoOKu+oLJ8wfUbPWZOhBBrC7EolubwsuB37OzyCREL09ARCmKSWCr9oVUvgy3JJ5JfDxaVgdc1vNnOel1VYAzfPr6wUSyVeq9XAYClDiJVUJ5FI5GjvcW9QW5ig4zPEARR+acVaWKqh14h9NEq7HNuSTiV4JGIZILkSVrMpShWQI8IoIMphCsiaAkiDDFXgRQyIgkmvLSCkcI0BIdaCrT1tBXLkLC0xqqoa/oKJfwlxopQmNLRMDcgEvZjeCWSpHK7kIRzOwqlhQYTbENsU1tYQrGqtqugovuAkHDclZWsNBGu5cUN/WWzl+cTpBrioWCqwTSESuay7eSQFRlq9F+sRNdQ1kCbfjzSJNTKn9VXVc3RdR1jtcmMwMz1rCjWrrXxtSU1spU7FINvga6sOeARd3NAqzMAnqtxWG2+PIweVYsOoSEqX84xtc7UcAXgWiBSv0cI107ohVJKPtVL9rfRifIjaAKFuWwt5ubRcQ/bQKr6jYxrbkoFwtOkLVLdSs9pAnxabF9UhFBe82pDRKLXERZgamDCSJto/EUOmYVK8jnKKslq1A0yVUlOT9gZAdyKkOogKxuFcJRRZnFxsJdw5T9oIm17kVyqVOWin7wda77EGB4jaUlGTdtYWN1vEHJQuYRTyiVMN8O3tVWUAqzNn9/W4K2uNho+CwmLHZbUh0q5byuuJuGSo9U2t6YlfEgoyoUsVcVup4cZauzAmti3fd1C6W5ESvtlLRHB+rQQNb2UF1p0xAGh5ZLN0IhAIAw9xwUfUcudIPFr9ZhpC0aKQOjBT7WeY7WJzSzKfr3FuTI0AAhk1m9H2c9IQ9GjzYmwMgIK4RKIlJSRoRoyIgyoo9Ge0TIkYtZbqWaaTLY5YdQEF4zTMSTE4tXYGTDwAi7Kcq2w1cmkKDyR9UOrMmg5pnbhhChdAQITzHHfSngySsRDFLlowXdPV8Ri+FEb25OkGVYphjyGtRAV+KPp6vM3DKU0LjR8T6wVIKZyBpR0UJV1R6zVj0YUxBaoHVcXgsWTAaYNMgX2wiVC3+kws+dwzJNWjBLbUkZyiKCa9wXh7ioXCUtWY3Sqrm5YNkyBhOufW7vwxhmH6iKkkMbMgF5crId6iliwIsWs7OBSK3ITmBKYqr4VI26yohYb+bBSpZyP610JK3wNHQb8RqTZv1fJstVLUHKk5EEvJDKeLV1ugJCqDxbVkmfB13WnDGzkTsoUvc12He55r26afCpQzwnihLRSRravSKrQx06OPz4JdWF6Jnj5aBqANrJKkTPT3eaNDSSVcUdSuWKSPhAk9r57Rd5GyYOqmnozMC6q/Qfed6iU+tAyItApbzTlKlgMPmJcIua1rq7EEAPumsq5KZFOigtOf2gmIuN+G8ZCK48o6sWQqxSFSAoZqsh88ivxI+Po6qH+KL0iSJkHNn6plFhtleK0qikWIX9npabmyUudtawCVGIFwEeshnYti2y1iY61j5RioiESJ7iP1QLSrqVI9WhIlzGoxygur7hSAyaHeCNhSKd9xuGwJC55Ko2FTjoBx7TQZj9OnrTQ9PAPsP4AvV70bEPHksjmeTmeSyVS8JjmKICRrtARS6hioFb1gzxVmisPAKhTDSjWivAOr1Z1nT9YwuDSqBv8FvhjsTwwPoHBp7TSSEwNB/4+M1AiDVBRFBiDlDVTaitboQAQCPAg2y3Kwqk3LN4Bnuy52mrguU1s223RoTUN7FaNadWLiji2stlRgPacOYtsQ/zXhGJTLAqbe1dXpZLOZXDarGCmAHAVNv1khNy+0ZSYzScUaZQoR1Fo9qtSw34dhCkx5E3vyjNi5vd7ZmYnZNLJcyXeNZ8/M1ISxzHFLgyXbpdAy4tZum0S8Mpqjm4YQ2ZXMjaSHyUfu4pIw7NvDvBuu/nWwV4wWM2BnW2dn07ZTEG62IkkJMY2rPIDyesquCyG1Spg4wnYaUtaBHJIARd1dnd1d3bievaenW0fR2LAU1msFzRfUimV9ciZ+F6xcDesNQdlhUgqVAgISWHOPTzReeVFSCa9CFizX8GByaCA5M193bCsOuVUuQdNPS9P0dnqqIm50QVxl/RwUKOFGIeDlAFhomQAp7qC1wuomaZ9LQKCkVDs6gZHaSiYVsQ8DXiwC66bKkDJbKjGDkYc0SVR0665bDQWmKODEwG319PZ2dHYgnR8cHFRFHRVLV6vLxnVp8qPDCjQ9cq0Q1GqYR6YVNpx6Hrmg5adweSdOsWKxQVk7/SH4NMj87vEOrtYY4gJDtbLJiiM74z9lzD+VxnFc9+Nh946bcZ2MzTOWTFsyZcmkZXmwceaohnviCpLbcJUo34N1z+VcjouYquDqFFGt8lLJwYoGFtMEY60qpGk5p4KIJRLJst+sksQxYFgjw8NYjwCwRkdHgUDAU5hJ4LxcmgezgaKizgAZP/obvynLZSSwgIoQtKhEaiKsVpfA+ZXLiROT/iv2JUOp+5lw1YovR4YSQwPZ5XxgO0TgVZRsRZpPtTXhkvjqFfe0dBNNuIicKLJDn4NDB3uCzRwWFqZVDMsJKWCbqiVCksHr7FxJpztE1Ao4bUes5NONOnc9oXiDAsvYB2Eqkril0oXlfC2Odca2jem08jnnnJNMJilCxHCnUpoP/DpPOqLtNOqNqFKh9AHjqpwqTLOYNHG7Sh+fmLC3b22m00m0ZQQo3Hse27ktk1/xadWBSqWrAoxs1X7ayi2q6ZgWVrAQNtDIsFUYZaapA3fCBQiUjTIlkJ9EIaYeWaO/37ftJEakcbxtydmZFF0/RbIka6VI4/ZJDC/AtCe81XK5pkpqgPTuXbtisLZ0dXdBVK1Wo9ZqK7B5iayKTWAvtVpQqaq1AHbcEsZM3MNM7lL507WCd2KiccH5Xhi1mhObTWtokHVk7NWCpIZei7XXODXqOoJRa3vN4hOLFlOg84WgmLLvqjVQUvZN2Fi5iDDxbGH6GR1p6PRvWOzrS+vcFxkE+CKI7WZnk44rKKyxVI8J6byS7gglXYbwwPUqjOerVWBCIBkinUrtphZTR9msTaObzpw+QzsFe1YprJ3t6t6suGGl4sPXcNuD66FoV5wwlazVSxtHAeA5jx23t53bBHdLwkVMTWBj0Ni5/L6HBDxoTU+RJgIVFHXq9YMGqQjRweY/YOr0QJ05LY9DmaJ1E6GAMwyBE4Vk82zO/ZGRSjo1SkNJtFg5jjh7Nl0qeYkE6KO0FVgIs5YsGReKpMhkio1mvtEIqJuoOTQ0NDa2TaeVwWDt3r1LrUZSRii/fAJ5vIzK5UahWDchnWGq6vpb8aJ4jP4p+EDFgTfkV5InJwMkFSqkoftmU24esToyvF7jfhO3ZoO2OoOt0eCNGgODUq+xWg3v6/AkvdRsML+JKeBI90LSihweOTZsIbWfBUDpUDTQadj9fYvDwzmagBDbQQRsaiIH9MNxsP/NdnTwaOg3iqclYVcgWWGuY6lQWFHdG7Vabe++fel0qlWRvuTii0EQlD45jre2Muk3SyVAqlDTqYE4plM96Dq7q1o6TegvtOKAcB055lSrPrVNEF6RBPPheXL7mAUQBE04f+Y3WLNJG0KmsGP4ALGDV8GlgCdSqmep6BJbJm3peiCnwksI1Ckb5YtyUvAvkU7Xto41M5meyMiM6v1eWUnMz2dSSfys46rcg5J6Za2UE0Q15HY9lZ5bWSmoknMQ+FdddeW68v2FF14wMDCgs162W6/nZ6aPAwlAW0DRog7XVC7KUpZfaQ19j04qWAo7OIalpeTklBauOI8AwrX1HJHLoBwFPmyAmpYyeIzw0QMI38KAkamiReRCpz5QLlyACTc4Z9uOgAQQQZIU63hAtTZvnhsa6lfLw0zGDx37ieNdAFoiaRG5R/nivG39AFqBiEoIIpsrhNF8sYj1eVDkXC531VVXrQOrv79/7969ijGrVoPZmSejKIhEIKgUR6u0ItnSQyXaOhjSi2Y0Xkox7cNHvUbdp74fvYFwwbXdsT0CCUIfF9JKOAVNjA7psvKGKjdnE0ZuArsjk0npJQksF0wPRS3gdCBys5OcpQcGzo6NZVw3EwkRF5bAWuWXk2fPZpNpgdZK+U1LV28xqpJk11EB8WR7eufz+fkgCNVqxL3nn79927bn9me9/nWvjTuZHTtRLZ9s1lfUhB2FF00hUqGwqTFIqadSaO6k1mWRcHE5v5CaOh0iJxNx7GQ1fTm+PcxlLSBN8apevfTNNIgY6oTXH6QAHAJYCNrwsecSTbctVdPHiNBJWSzX1TUzPh52dvRjQBeXGTG6sA4/02NhjgVXNWLvjVR+E5h5QBtWugVOCAJmU05npufmlpQO1mrVq69+y/M0s1155atHRoZNJGaHYamwdoQC3QD3hb5GR7SxkZct4it11lhI7VoQAvuZI16zGVgmcQ63MJSZtNi5AwuVyveZFRM6yYsYIcO0XI2U5SXoHjYVIXtMtbjiCn8v6XkZxjo6cjM7dqz19w8TCbXiBD0Ytamp3Px8KpGIXYEfRD5gFPhwDIhXFPqYa4ma8FR3z2K1erZYrFD7Y9jV1XXNNdc8D1h9fX1XXXllPAMM4oy1lSf9Zjmi3cXKSJtuw7BatT7W6kc3tWEwq2BTz5wFk2niPoLMDySAlctS5K5zu5bKlmCIiwKFCRbXQEP3HDMKHq7WA4xwIZrjgUAxlgnDdCY9Nb59aWhoE7maVlUMDqBYcJ9+utv14BhwfUAk/DDCKXBBgBvJFKZ14flINEGSNmyYPnNmWvnBUrH4mquu2rJly/N3K7/97W+PR2mAmW/WF4pKuCISLqWMcVpYyVKrJhwnCOPuIDh05/DRBAZSVpxvB8slO3LhjvFmFLX1kKqcid4YJQ9Aggg1fAwhIuobxP2uC4Y8afOUiLJhaHd3PbNz58rQ8CZaTW1oAPlNoBqPHewBr2LbcLEx9RQETVI+QCoksaI/QAGlT9FyPohOzc/nbQzKJIQCv/Ir73vB1u6LLrpw//5L4WN6fJdtryw/6vvlMIR9+YLwokwlypclTE5iXTbWtAGpMroj5uYyMzOgAnFEi5gBejt3NjIZYVmmcEDxh36gsgK2fknV9dTSRfAAgQ9c3C6X3SBYGuh/ZOfOoL9/hFheKzONSWEePf69zvkFkMF6FAFMjQDVDdtMAurJoUpNSPPMcKSZxWpDw9NTU5PU2c7K5fJFF130ute97getsHjfe98TZ+VBExv1ubWVQyRczTDSeJm61boyy7oFQcz0aGCY6hw7lgRd1pbECFdXZ7htrAnWHUHB3gLya7ay3EzZb3pJL04CpMBdNht2pQJHVctln9wxfvi8nT0dHf2hkvhWLR9Mnjj8TMfERCaRDC3MQ4Q0nhLrEzglIlIxk9BWxUIZGxjIB+Hk9PSCGlJZrVZ+44MffM7AyueC9ZrXvAaEq9n0Y2VcWXqw0VhGyxU1SRkDbbx0SKXSGrGlb1+phqcJPmh2LjO/EFKZt3VKYQSWqwZMgiQYIDMVKoOU2g9hBKGlXau6lbLtN4u57NPbtz+2b5+/afNmx8mgGom4OwIvEhj1Y0c7jh7tSqeFq/0mpwEKNKWLJiCY6xYRXfAdtzI8cubYseMgbph3KZcuuGDf29/+th+yhA7e+qEP/cZDDz1s/nSCYG154YHhTVdbQYNmFFFOynThx+1tuolIyucWnLCl03v2eHJwoEmJYGkmIFidXeH4eAXkTgjP9BeaRIWl5jSoOAH0opxKrnZ15fv767296UxmBI4cTXOcNiMJx7S6LY8c7jpytCuRjLgphWHZWGDWispCpqImSQdlEyzM1rH51dVngTGA98DROpXK7/3u737/GNnnX8n6S7/87ptuujmdTitXB5H86JZrO7t34zJWL4OjqXiSc8y9WTjry7bMyCLMP1umMGXFjbWYQfvp1y319yfCsPV1HCu94dx8eXUVbASEDV4QODglhAQE/JfrNBPJRjbT6OiIOnIugOQ4aUrdRHG+2ZQGpWODLlqHDvWeOpVLYNmZ8i3aOyLpBS8c+IK640LFFYSoB0Et17G8deyJe+75TrVaAwFcXVl51WX777rrzu+fr/j8Q11///d+795774OA26YICpR9cf6OZGqIsR49J0x19nGzyiPu8tNXmenCkKkUBH4ChKuvD4TLMc3NFvZ3MntkpGt4GKlvEDaQIUZqdaal61o41gaYlEN0F05VtK03j9tOgdBHxaL35BP9EMOn0iG1gyLguHglUkE+9sWZQlJIqRh0kdyujm07e+TIU6VSBTxtSJWyP/uz//m8kyiff9kvcC7w93fddbfqfoPDDv1iGNYy2W2m00SvhIllx4ClMi3MjMRSI4jwbcWiM7SxnE7ZMeNXgSaxXYarPzhQAyCZKbU5bpLbCVyChCZZFaefgxJdbQe7GU6d6vze9wZrtUQqJRzbtI5jHgWnsEA0TukwDEfQA+pxnihW27ZPl8uPHzp0FBdRMr6wMP+bH/rQC01ve8FRBY1G441v+rknnngyk0mbSXDN/sE39PVf7rg4tdex07adgECfMY9ZDgORMfpIY9bowurmPTxoP+Dn7Vx81WVNHJSiVafVJBeff7tuyfgZ8wEts4QDRXkyn089+2zf8nLG8wRE11hh5rofCtAh1Yt8nygoMisgpU0RNYSoNv3a0ND8wMChu+6+FxwaKGCxUNiyZdMjDz8MwfOPPATj0KGnfvaNbwI2omJG4i9s48jbOrv3uHjL2DbO1eMAFvPIeOF8UVUfxkKxRZPW9EQx7C92Xf/Nb5rt7vZoEm5bs1+rsyLuDzWltPbhD/Q08gwMCazV1dTERNfcHE4RSySEqtmoJQgRIoUWCjYfYSL9VkiJuhA136+CuxgfP37f/d9ZXl6Fk6GmouKdd95xxeUvONr0Bec6qAwqYHzLLbcYZcQWo1plKpkacZxOSlcahxinh/VgLHUZzBAjoRuUm02w4lZnp0gmBaiPAkO0UnQtUYpb46QpjlJJAnPtYEjn5rJPP73hyNENxUISc1uuMK0vuvUQBMoHmJrC90OMbDBiA4qhkQqCajq9tmvXqcefeGhmZkEV5BcX5j7ykT/9xXf94r9pcM+v//oHvvTlL3d3d5tOvcDxuodG3pHJbgJ9xAoVOkdQxgRNwdTypUQM9VGNeJJ6SFYQcIiT+/r84eHG4ECjszMAH2/zlvxI2erZUe07ACZ8qlp1VteSiwvp5eV0reYCXwW9s22dwyPOQSwDc/bYGY4cnaK/EO0U2nK0U4BUWE0kCnv3njl69MEjR04AUsCW5ufnrr76Ld/4+td/8IThHw5WtVq9+uprDhw82NHRYdQi8BJ9g0P/KZMdhcjfdcF4pTiRCYblPBdcnqWqWGpApORxhxBNQYTzQSYN55lJRbmOoLMjyObCVCry3Ai1iSkuajeavF51yxXYvFoNGJ9NC9MxitLlGV1P1RwTiC5EChj6hTqaCUNlzkmmsMJMSJ0/fXLi0UNPHXWpeL2Sz28f3/bde+7p6el5EYaNTU/PvOnn3nzmzJlsNmveHyYSvRsGr85kz8HIlvBC8gXGC+29SwNIzVxbGq5paqtcmkFXYM70mEg1z661CFHGky7QE3PM86myoCq76+4ErvVcTTQAI4WrDULFpCgIpHQCIiXrUirtA6TmTpw88NRTR226FYuFzo4OIFnbt29/0cbYHT58+K1v/fmV1VVgqiabGiUSXb0b3pDJ7VB4OYQX+EfOtD5a5CLXqaRylPHoOkM4Wk10jLVXBmPZURG1Cq310BTsJRDEobDNJKQEuGpkhEeR9GniNzC7umXV/KDW3bW6Y+fskSMHDh8+4dBcCghrgLDcduutl1566Ys8IPHgwcfe8c53FoulGC9cpZxId3ZfkcldQEX2pO2k0T9qPuFazGVqbrKl8dL3huVLXaTV/YWtOT087ns0qDHJ2hqlsedeZ6uRbeKqHXPTiQTknA1pNVCmwsrw8Oqm0bPfe+zRyakzyk4BUrCzG274BoTDL8nozYMHD1577bvyKyuxPsJ1Tia8TG5POrc/keimKRkpUkmc7M41ZA61deiptwQWbw+G4tEwpk+KStxW7GZ1oya19qjFA7jyALl4KDRe9EhRcwEyJZuWbEqrHkU1xsvbxlZSqcmHHz6wtJRXSIH2gW/62teuf+1rX/OvP/0feajr008//Qvv+i+nT5/u7OyMP5tM2tnsaCqzP5Hc4npJmp6NG5ZmLc9Mnka8WBxImkkBrLVCMu74b/9NBtMrT9UQPfeImraI1qskFlYcCKlAWj7AZDEQqAaEHJ0da2PblvP5IwcPHqrXGw5NAFrN53t7e66//mv79+9/yccFg6X/5Xe/99FHH43dB+wkkXCy2Y5UerebON9L9LgOjaxBlUzS8GmPmtBoYrCRMlpvbYYrtBYjMNNqr1IOTMh44Ixs61fVbakqJ2UhTIFl+Yw1IPoIo4ZtVzaNrnR1Tj/9zKGTJ0/Fw3oXFxf27N79z//81R07drxMg6jL5fJv/rff+spXvgp8AgRbpajAWGYziUx2CPBy3HNdNweGX5kw1Eeu8HINWK1chQJLmj7alrvUjfJWnJKWps5rMKIaMq7+AqSaABNadKu6oa8wNLScXz7+5KHDxWJZjaAFjr68tHjNNW/9/Oc/39vb+3KPOP/0p//yIx/9mO/7QPTjtBKIWEdHLp0Zte2d3AEiliUR81pWnww/DsC3aBK8smLaV2ovGY+WjhdixC1jVA3FihZDUQo5B6TQSAFLYKza1VkaHFxuNE4fOXx0emYeMFKxWqlYDMPgD/7g9//wD//wxzY8/8CBA7/929d97/HHu7q6VOZM9WSlUx4YtWR6mNtbLTZi250EmRsTV8MtzO8ttHMLs2hCrkvHqAnAEY1yikiUcBPo9XxQuu7uUl/vSrMxfeLkyTNnZoGOqgF88GB5aWnXrvM+/elPxbXlH9vPMtRqtY9//BN/9Zm/rtfroJWqiVBDlk50duYymQHbGZFshLFezjOIGloxR1kxIhYOShbSCwXW+gC71ZGgxxvielVKB4OFSqUqXZ2FVCpfKs1MTZ2enV1s/12ItbU18CC/9mu/+uEPfxgu3k/KD348+eSTf/qnH73zrrswHZHJqCZVajO0Egm3oyOTy3WnUhtsZ1BaGyzWzVmWI4M1c+LVDAqmmtrbMjZW24IorIeDkQI5qicS1XSq5CXW/ObS4uLc9PTc6mqR7Kb+lZFSqVSrVa668sqPfOQjl1122U/KD36032688aa/+Iu/OPjY99TvVMVSpkZLppJeLpfO5TpT6W7P62Z2N2NwtbM4P44lNYPFfrnYMyqBCjkLbLvpOHXXqQHxFqJYra6srOSBNxUKJd8P6KeK9C/xgPOpVSv79u297rrrrr322hfx7F78HykCDv2Nb9zw2c9+9sDBx2DnQF/JXZrJo9SoC9YklUqk00kIBlKpTCKR8dwUR3bm0W8SqBlaegwrWiX8+RjQ8mqlXC6W4K6KA/AiwVX7LS1HCoOgWCpBTHjRhRe8//3vB5he9B+uewl//uruu+/+4j986Z7v3AOMP5lMplIpk0SU63+JiVGlCn+PydajlDjVeFDxQr0AX68K0gMYzA9oqWtTrVZrNfCDnVdedeV73/OeN7zhDS/RD9S95D+sBlz/5ptvufnmmw899VSxULRRplKuhwNOY0K7flJw6/df2ue8srZWTGyY8H1wLL7fBNZy/p49b3nLm6+++q3bqKf4pbuxl+3HIE+ePHnfffffe9+9hw49NTszC6eqZr652MLgkMXhbH20Y9ZxCZWaCvCGy89TqeTQxo179+69Cgz4lVfu3Lnz5TkF9vL/cibANDk5efjwEbidnDg5MzMLthrsUKPZxB9b0w11+le/sK8okcjibxr2DA8Pj41t27V7F8QrY2NjP3R8+38EsJ5zgwMo6FuxXCmDGQ98YJsSJA4UNpvNdeK6Gbxxzn+8h/r/BBgA16kwIwArdGsAAAAASUVORK5CYII='
		                    } );
		                }
		            }
		        ]
		    } );
		} ); */
		var documentMessage = "Gas Report";
		/* $(document).ready(function() {
			  $('#example').DataTable({
			    dom: 'Bfrtip',
			    buttons: [{
			    	 extend: 'pdfHtml5',
		             messageTop: documentMessage,
		             title: documentMessage
			    }, {
			      extend: 'excel',
			      title: documentMessage,
			      filename: documentMessage
			    }, 
			    {
	                extend: 'print',
	                customize: function ( win ) {
	                    $(win.document.body)
	                        .css( 'font-size', '10pt' )
	                        .prepend(
	                            '<img src="${baseurl }/assets/img/khaibar_logo.png" style="position:absolute; top:0; left:0;" />'
	                        );
	 
	                    $(win.document.body).find( 'table' )
	                        .addClass( 'compact' )
	                        .css( 'font-size', 'inherit' );
	                }
	            }]
			  });
			}); */
</script>
</head>

<body class="horizontal-nav ">
	<c:if test="${not empty msg}">
		<div class="msgcss row">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-${cssMsg} fadeIn animated">${msg}</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="msgcss row" style="visibility: hidden" >
			<div class="col-sm-4 col-sm-offset-4">
				<div class="form-group">
					<div class="alert alert-success fadeIn animated" id="msg"></div>
				</div>
			</div>
		</div>

    <header class="navbar navbar-inverse navbar-fixed-top" role="banner">
        <div class="navbar-header pull-left">
            <a class="navbar-brand" href="javascript:void(0);"><img src="${baseurl }/assets/img/khaibar_logo.png" class="img-responsive"></a>
            <div class="clearfix"></div>
        </div>
		<div class="masters">
	        <ul class="nav navbar-nav pull-right toolbar">
	            <li class="dropdown">
	                <a href="#" class="dropdown-toggle username" data-toggle="dropdown"><span class="hidden-xs">Master Admin <i class="fa fa-caret-down"></i></span><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt="Dangerfield" /></a>
	                <ul class="dropdown-menu userinfo arrow">
	                    <li class="username">
	                        <a href="#">
	                            <div class="pull-left"><img src="${baseurl }/assets/demo/avatar/dangerfield.png" alt=""/></div>
	                            <div class="pull-right"><h5>Master Admin!</h5><small>Logged in as <span>Master</span></small></div> 
	                        </a>
	                    </li>
	                    <li class="userlinks">
	                        <ul class="dropdown-menu">
	                            <li><a href="#">Edit Profile <i class="pull-right fa fa-pencil"></i></a></li>
	                            <li><a href="#">Change Password <i class="pull-right fa fa-cog"></i></a></li>
	                            <li class="divider"></li>
	                            <li><a href="../logoutHome" class="text-right">Sign Out</a></li>
	                        </ul>
	                    </li>
	                </ul>
	            </li>
	        </ul>
        </div>
    </header>

    <nav class="navbar navbar-default yamm top20" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <i class="fa fa-bars"></i>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse" id="horizontal-navbar">
            <ul class="nav navbar-nav">
            
            <li class="dashboard"><a href="${baseurl }/admin/dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
            <li class="items"><a href="${baseurl }/admin/itemsHome"><i class="fa fa-tint"></i> <span>Items</span></a></li>
             <li class="lpo"><a href="${baseurl }/admin/lpoHome"><i class="fa fa-bar-chart-o"></i> <span>LPO</span></a></li>
              <li class="company"><a href="${baseurl }/admin/companymaster"><i class="fa fa-building"></i> <span>Company</span></a></li>
              <li class="stores"><a href="${baseurl }/admin/storeHome"><i class="fa fa-th"></i> <span>Stores</span></a></li>
              <li class="cylinder"><a href="${baseurl }/admin/CylinderHome"><i class="fa fa-fire-extinguisher" aria-hidden="true"></i> <span>Cylinders</span></a></li>
             <li class="truck"><a href="${baseurl }/admin/truckHome"><i class="fa fa-truck" aria-hidden="true"></i> <span>Trucks</span></a></li>
                <li class="fillingStation"><a href="${baseurl }/admin/fillingStationHome"><i class="fa fa-archive"></i> <span>Filling Stations</span></a></li>
                <li class="customer"><a href="${baseurl }/admin/customerHome"><i class="fa fa-group"></i> <span>Customers</span></a></li>
                <li class="staff"><a href="${baseurl }/admin/staffMaster"><i class="fa fa-user"></i> <span>Staff</span></a></li>
                <li class="tariffMaster"><a href="${baseurl }/admin/tariffMaster"><i class="fa fa-bar-chart-o"></i> <span>Tariff Master</span></a></li>
				<li class="transactions">
            		<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-list"></i> <span>Transactions</span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="cylinderMovetofillingStation"><a href="${baseurl }/admin/cylinderMovetofillingStation"><i class="fa fa-bar-chart-o"></i> <span>Cylinder Move to FillingStation</span></a></li>
						<li class="cylinderFilledStatus"><a href="${baseurl }/admin/cylinderFilledStatus"><i class="fa fa-bar-chart-o"></i> <span>Cylinder Filled Status</span></a></li>
                		<li class="cylinderQualityCheck"><a href="${baseurl }/admin/cylinderQualityCheck"><i class="fa fa-bar-chart-o"></i> <span>Cylinder Quality Check</span></a></li>
						<li class="cylinderMovetoTruck"><a href="${baseurl }/admin/cylinderMovetoTruck"><i class="fa fa-bar-chart-o"></i> <span>Cylinder Move to Truck</span></a></li>
						<li class="cylinderDeliver"><a href="${baseurl }/admin/cylinderDeliver"><i class="fa fa-bar-chart-o"></i> <span>Cylinder Delivered to Customer</span></a></li>
						<li class="qualityCheckHome"><a href="${baseurl }/admin/qualityCheckHome"><i class="fa fa-bar-chart-o"></i> <span>Return Cylinder Quality Check And Move To Store</span></a></li>
						
					</ul>
				</li>
				<li class="transactions">
            		<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-list"></i> <span>Truck Tracking</span> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="truckTracking"><a href="${baseurl }/admin/TruckTrakingHome"><i class="fa fa-bar-chart-o"></i> <span>Truck is going out from Factory </span></a></li>
						<li class="truckTracking1"><a href="${baseurl }/admin/TruckComingintoFactory"><i class="fa fa-bar-chart-o"></i> <span>Truck Coming into Factory</span></a></li>
					</ul>
				</li>
				<li class="expenseTracker"><a href="${baseurl }/admin/expenseTrackerHome"><i class="fa fa-bar-chart-o"></i> <span>Expense Tracker</span></a></li>
				
				<li class="reports">
            		<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-list"></i> <span>Reports</span> <span class="caret"></span></a>
					<ul class="dropdown-menu" style="margin-left:-50px;">
						<li class="CylinderReport"><a href="${baseurl }/admin/reportsHome"><i class="fa fa-bar-chart-o"></i> <span>Cylinder Report </span></a></li>
						<li class="expensesReport"><a href="${baseurl }/admin/expensesReport"><i class="fa fa-bar-chart-o"></i> <span>Expenses Report</span></a></li>
						<li class="gasReport"><a href="${baseurl }/admin/gasReport"><i class="fa fa-bar-chart-o"></i> <span>Gas Report</span></a></li>
						
					</ul>
				</li>
				
			</ul>
		</div>
    </nav>

    <div id="page-container">
    	<div id="page-content" style="min-height: auto;">
    		<div id="wrap">
	        <div id="page-heading" class="row">
	        	<div class="col-md-6">
					<h1 id="pageName"></h1>
				</div>
				<div class="col-md-6">
					<div class="options">
		                <div class="btn-toolbar">
		                    <a href="#" class="btn btn-danger "><span id="cylinderCount1"></span><br />Cylinders</a>
		                    <a href="#" class="btn btn-warning"><span id="customerCount1"></span><br />Customers</a>
		                    <a href="#" class="btn btn-info"><span id="totalGas1"></span><br />Gas in Kgs</a>
		                </div>
	            	</div>
	            </div>
	            <div class="clearfix"></div>
	        </div>
<!-- Header ends Here -->

<style>

.dataTables_filter {
display: none; 
}
</style>

	<div class="clearfix"></div>
	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Gas Report</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
			<form:form commandName="gasReportsForm">
				<div class="row">
				
				<div class="panel panel-primary">
				<div class="panel-body">			
				
				
				<div class="form-group">
				  	<div class="col-md-3">
						<div class="form-group">
							<label for="focusedinput" class="col-md-5 control-label">From Date<span class="impColor">*</span></label>
							<div class="col-md-7">
							<form:input path="fromDate" class="form-control "   onkeydown="removeBorder(this.id)"/>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="focusedinput" class="col-md-5 control-label">To Date<span class="impColor">*</span></label>
							<div class="col-md-7">
				        		<form:input path="toDate" class="form-control "   onkeydown="removeBorder(this.id)"/>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label for="focusedinput" class="col-md-5 control-label">Month</label>
							<div class="col-md-7">
				        		<form:input path="month" class="form-control "  onkeydown="removeBorder(this.id)"/>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<div class="col-md-7">
				        		<input type="button" class="btn btn-primary" value="Search" onclick="searchData();">
							</div>
						</div>
					</div>
					</div>
					</div>
					</div>
				</div>
				
				
				<div class="row">
              <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4>Gas Report List</h4>
                            <div class="options">   
                                <a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
                            </div>
                        </div>
                        <div class="panel-body collapse in">
                        <div class="table-responsive" id="tableId">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
                             <thead><tr><th>Date</th><th>Fillingstation Name</th><th>Gas</th><th>Gas InKgs</th><th>Closed Gas InKgs</th></tr></thead><tbody></tbody></table>
                                <tbody></tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
				</form:form>
         	</div>
		</div>
	</div> <!-- container -->
<script type='text/javascript' src='${baseurl }/js/jquery-ui.min.js'></script> 
<script type="text/javascript">
$(document).ready(function() {
    // click on the text field.
    $('#month').MonthPicker({ Button: false });
});
$(function() {
	$("#fromDate").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true
	});
});

$(function() {
	$("#toDate").datepicker({
		dateFormat : "dd-M-yy",
		changeDate : true,
		changeMonth : true,
		changeYear : true
	});
});


function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
		+ '<thead><tr><th>Date</th><th>Fillingstation Name</th><th>Gas</th><th>Gas InKgs</th><th>Closed Gas InKgs</th></tr></thead><tbody></tbody></table>';
$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
	var stationName = "";
	serviceUnitArray[orderObj.id] = orderObj;
	if(orderObj.fillingstationname ==undefined){
		stationName="";
	}else{
		stationName=orderObj.fillingstationname;
	}
	var tblRow = "<tr >"
		+ "<td class='impFiled' title='"+orderObj.expirtdate1+"'>" + orderObj.expirtdate1 + "</td>"
		+ "<td class='impFiled' title='"+stationName+"'>" + stationName + "</td>"
		+ "<td class='impFiled' title='"+orderObj.addedGas+"'>" + orderObj.addedGas + "</td>"
		+ "<td title='"+orderObj.gasInKgs+"'>" + orderObj.gasInKgs + "</td>"
		+ "<td title='"+orderObj.closedgas+"'>" + orderObj.closedgas + "</td>"
		+ "</tr >";
	$(tblRow).appendTo("#tableId table tbody");
});
	if(isClick=='Yes'){
		$('.datatables').dataTable({
			 dom: 'Bfrtip',
			 
			 
			 buttons: [
			           {
			                        extend: 'pdfHtml5',
			                        messageTop : documentMessage,
// 			                        title : documentMessage,
									exportOptions: {columns: [0,1,2,3,4]},
			                        customize: function ( doc ) {
										doc.content.splice( 1, 0, {
											margin: [ 0, 0, 0, 12 ],
											alignment: 'center',
											image: 'data:image/jpeg;base64,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',
											width:250,height:50
										});
									}
			                    }, {
		      extend: 'excel',
		      title: documentMessage,
		      filename: documentMessage
		    }, 
		    {
                extend: 'print',
                title: 'Khaibar Gas LLC',
                customize: function(doc) {
                  doc.styles.title = {
                    color: 'red',
                    fontSize: '40',
                    background: 'blue',
                    alignment: 'center'
                  }   
                } , 
                customize: function ( win ) {
                    $(win.document.body)
                        .css( 'font-size', '10pt' )
                          
                        .prepend(
                            '<img src="${baseurl }/img/gas-logo.jpeg" style="position:absolute; top:0; left:0;margin-left:40%;width:250;height:50;" />'
                        ).prepend(
                        		documentMessage
                        );
                    $(win.document.body).find( 'table' )
                        .addClass( 'compact' )
                        .css( 'font-size', 'inherit' );
                }
            }]
		
		});
		
	}
}


	function searchData() {
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		var month=$("#month").val();
		var formData = new FormData();
		formData.append('fromDate', fromDate);
		formData.append('toDate', toDate);
		formData.append('month', month);
		$.fn.makeMultipartRequest('POST', 'searchGasReport', false,
				formData, false, 'text', function(data) {
					var jsonobj = $.parseJSON(data);
					var alldata = jsonobj.allOrders1;
					console.log(jsonobj.allOrders1);
					displayTable(alldata);
				});
	}
	

	$("#pageName").text("Gas Report");
	// $(".transactions").addClass("open");
	// $(".transactions").addClass("active");
	$(".gasReport").addClass("active");
	var isClick = 'Yes';
</script>


<!-- Footer Starts Here -->
		</div> <!-- #wrap -->
	</div> <!-- page-content -->
    <footer role="contentinfo">
        <div class="clearfix">
            <ul class="list-unstyled list-inline pull-left">
                <li>CHARVIKENT.COM</li>
            </ul>
            <button class="pull-right btn btn-inverse-alt btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
        </div>
    </footer>
</div> <!-- page-container -->