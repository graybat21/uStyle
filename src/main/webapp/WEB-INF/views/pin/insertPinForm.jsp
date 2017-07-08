<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html class='no-js' lang='ko'>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	#columns {
		column-width:350px;
		column-gap:10px;
		padding:30px;
	}
	
	#columns figure {
	 display:Inline-block;
	 border:1px solid rgba(0,0,0,0.2);
	 margin:0px;
	 margin-bottom:10px;
	 box-shadow: 2px 2px 5px rgba(0,0,0,0.5);
	}
	div img {
	width:100%;
	}
	#columns figure figcaption {
	border-top: 1px solid rgba(0,0,0,0.2);
	padding:10px;
	margin-top:10px;
	}


</style>
</head>
<body class="cms-index-index">
	<div class="wrapper">
		<div class="page one-column">
		
		<h1>Insert Pin Form</h1>
		
		</div>
		<!-- /.page -->
	</div>
	<!-- /.wrapper -->
	
<div class="container" style="width:300px; height:auto; margin:0px;">
    <div class="row">
    	<form method="post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
       	<input type="text" name="productid">
       	<input type="hidden" name="pinboardno" value="${pinboardno } ">
       	<input type="submit">	
      	</form>
    </div>
</div>

	
	
	
</body>
</html>





		
		
		

