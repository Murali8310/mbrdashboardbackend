<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/titan-logo.png">
<title>Stationery</title>
<!-- Custom CSS -->
<link href="assets/libs/flot/css/float-chart.css" rel="stylesheet">
<!-- Custom CSS -->
<link href=" dist/css/style.min.css" rel="stylesheet">

<style>
.page-wrapper {
	/* background-position-x: center;
  background-repeat: no-repeat;
  background-size: 100%;
background-image: url(assets/images/Backgroundimg.jpg;); */
	
}
</style>
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<style>
/* #anchorbutton {
	background-color: #2e92c3;
} */

h6 {
	font-size: 24px
}

h1 {
	font-size: 65px;
}
</style>
	<style>
.card-default {
	color: #333;
	background: linear-gradient(#fff, #ebebeb) repeat scroll 0 0 transparent;
	font-weight: 600;
	border-radius: 6px;
}

.form-control {
	border-color: #ced4da;
	font-weight: 600;
	font-size: 16px;
	line-height: 22px;
	padding: 0.5rem 0.9rem;
	height: 42px !important;
}

.rows {
	padding: 20px 20px 10px 12px;
}

@media only screen and (max-width: 769px) and (min-width: 570px) {
	.page-title {
		font-size: 24px !important;
	}
	.h4 {
		font-size: 24px;
	}
	.breadcrumb {
		display: none;
	}
}

@media only screen and (max-width: 569px) and (min-width: 320px) {
	.page-title {
		/*margin-top: 20% !important;*/
		font-size: 24px !important;
	}
	.h4 {
		font-size: 24px;
	}
	.breadcrumb {
		display: none;
	}
}
</style>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-sidebartype="full" class="mini-sidebar">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->

		<jsp:include page="/WEB-INF/jsp/views/header/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/jsp/views/header/sideBar.jsp"></jsp:include>

		<div class="page-wrapper" >
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<!-- <h4 class="page-title display-5" style="color: Teal;">Bulk Upload</h4> -->
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="landPage">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Bulk
										Upload</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Sales Cards  -->
				<!-- ============================================================== -->

				<div class="row rows">

			<% String role = (String) session.getAttribute("role");
				if(role == null)
				{	
			%>
			<c:redirect url="login"></c:redirect>
			
			<%} %>
			
				<c:if test="${role =='Buyer'}">
				
					
					<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="productImageUpload" id="anchorbutton">
								<div class="box tile-color text-center">
									<h1 class="font-light text-white display-2">
										<!-- <i class="fa fa-shopping-cart fa-3x"></i> -->
										<img height="170" width="200" src="assets/images/store.png">
									</h1>
								</div>
									<div class="box tile-color text-center">
									<h6 class="text-white display-5">Product Image Upload</h6>
								</div>
							</a>
						</div>
					</div>


					<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="budgetbulkupload" id="anchorbutton">
								<div class="box tile-color text-center">
									<h1 class="font-light text-white display-2">
										<!-- <i class="fa fa-shopping-cart fa-3x"></i> -->
										<img height="170" width="200" src="assets/images/store.png">
									</h1>
								</div>
									<div class="box tile-color text-center">
									<h6 class="text-white display-5">Cost Center & Budget Master Upload</h6>
								</div>
							</a>
						</div>
					</div>



					<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="hoildaybulkupload" id="anchorbutton">
								<div class="box tile-color text-center">
									<h1 class="font-light text-white display-2">
										<!-- <i class="fa fa-universal-access fa-3x"></i> -->
										<img height="170" width="200" src="assets/images/sm.png">
									</h1>
								</div>
									<div class="box tile-color text-center">
									<h6 class="text-white display-5">Holiday Master Upload</h6>
								</div>
							</a>
						</div>
					</div>
					
					
				 	<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="productmasterupload" id="anchorbutton">
								<div class="box tile-color text-center">
									<h1 class="font-light text-white display-2">
										<i class="fa fa-cubes fa-3x"></i>
									</h1>
								</div>
									<div class="box tile-color text-center">
									<h6 class="text-white display-5">Product Master Upload</h6>
								</div>
							</a>
						</div>
					</div> 
					<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="uploadBulkPoEntry" id="anchorbutton">
								<div class="box tile-color text-center">
									<h1 class="font-light text-white display-2">
										<i class="fa fa-cubes fa-3x"></i>
									</h1>
								</div>
									<div class="box tile-color text-center">
									<h6 class="text-white display-5">PO Entry Bulk Upload</h6>
								</div>
							</a>
						</div>
					</div> 

					<!-- <div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="bulkstoreemployeeupload" id="uploadBulkPoEntry">
								<div class="box bg-danger text-center">
									<h1 class="font-light text-white display-2">
										<i class="fa fa-users fa-3x"></i>
									</h1>
									<h6 class="text-white display-5"></h6>
								</div>
							</a>
						</div>
					</div>  -->
				
				</c:if>
				
				
<c:if test="${role =='Super Admin'}">
					<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="abmuserupload" id="anchorbutton">
								<div class="box tile-color text-center" >
									<!-- <h1 class="font-light text-white"><i class="fa  fa-list"></i></h1> -->
									<h1 class="font-light text-white display-2">
										<!-- <i class="fa fa-user-secret fa-3x"></i> -->
										<img height="170" width="200" src="assets/images/abm.png">
									</h1>
								</div>
								<div class="box tile-color text-center" style="border-radius: 30px !important;margin: 5px;">
									<h6 class="text-white display-5">ABM Upload</h6>
								</div>
							</a>
						</div>
					</div>


					<!-- <div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="bulkstoreupload" id="anchorbutton">
								<div class="box bg-warning text-center">
									<h1 class="font-light text-white display-2">
										<i class="fa fa-shopping-cart fa-3x"></i>
									</h1>
									<h6 class="text-white display-5">Store Upload</h6>
								</div>
							</a>
						</div>
					</div>



					<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="bulkstoremanagerupload" id="anchorbutton">
								<div class="box bg-cyan text-center">
									<h1 class="font-light text-white display-2">
										<i class="fa fa-universal-access fa-3x"></i>
									</h1>
									<h6 class="text-white display-5">Store Manager Bulk Upload</h6>
								</div>
							</a>
						</div>
					</div>

					<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="bulkstoreemployeeupload" id="anchorbutton">
								<div class="box bg-danger text-center">
									<h1 class="font-light text-white display-2">
										<i class="fa fa-users fa-3x"></i>
									</h1>
									<h6 class="text-white display-5">Store Staff Bulk Upload</h6>
								</div>
							</a>
						</div>
					</div>
 --></c:if>
		<%-- <c:if test="${role =='Indent Manager'}">
				
						<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="abmuserupload" id="anchorbutton">
								<div class="box tile-color text-center">
									<h1 class="font-light text-white display-2">
										<!-- <i class="fa fa-users fa-3x"></i> -->
										<img height="170" width="200" src="assets/images/storestaff.png">
									</h1>
								</div>
								
								<div class="box tile-color text-center">
									<h6 class="text-white display-5">Budget Bulk Upload</h6>
								</div>
							</a>
						</div>
					</div>				
			</c:if> --%>
			
				<%-- <c:if test="${role =='Indent Manager'}">
				<div class="col-md-6 col-lg-4 col-xlg-3">
						<div class="card card-hover">
							<a href="abmuserupload" id="anchorbutton">
								<div class="box tile-color text-center">
									<h1 class="font-light text-white display-2">
										<!-- <i class="fa fa-users fa-3x"></i> -->
										<img height="170" width="200" src="assets/images/storestaff.png">
									</h1>
								</div>
								
								<div class="box tile-color text-center">
									<h6 class="text-white display-5">Holiday Master Bulk Upload</h6>
								</div>
							</a>
						</div>
					</div>
						
</c:if> --%>

				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/jsp/views/header/footer.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Wrapper -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->

		<script type="text/javascript">
			history.pushState(null, null, location.href);
			window.onpopstate = function() {
				history.go(1);
			};
		</script>


		</script>


		<!-- All Jquery -->
		<!-- ============================================================== -->
		<script src="assets/libs/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap tether Core JavaScript -->
		<script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
		<script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
		<script
			src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
		<script src="assets/extra-libs/sparkline/sparkline.js"></script>
		<!--Wave Effects -->
		<script src="dist/js/waves.js"></script>
		<!--Menu sidebar -->
		<script src="dist/js/sidebarmenu.js"></script>
		<!--Custom JavaScript -->
		<script src="dist/js/custom.min.js"></script>
		<!--This page JavaScript -->
		<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
		<!-- Charts js Files -->
		<script src="assets/libs/flot/excanvas.js"></script>
		<script src="assets/libs/flot/jquery.flot.js"></script>
		<script src="assets/libs/flot/jquery.flot.pie.js"></script>
		<script src="assets/libs/flot/jquery.flot.time.js"></script>
		<script src="assets/libs/flot/jquery.flot.stack.js"></script>
		<script src="assets/libs/flot/jquery.flot.crosshair.js"></script>
		<script src="assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
		<script src="dist/js/pages/chart/chart-page-init.js"></script>
</body>
</html>