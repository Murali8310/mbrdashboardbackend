<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">

/* width */
::-webkit-scrollbar {
	width: 12px;
}

/* Track */
::-webkit-scrollbar-track {
	box-shadow: inset 0 0 5px grey;
	border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	background: grey;
	border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
	background: grey;
}

@media (min-width: 768px){
#main-wrapper.mini-sidebar .topbar .top-navbar .navbar-header .logo-text {
    display: block !important;
}

#main-wrapper.mini-sidebar .topbar .top-navbar .navbar-header {
    width: 100px;
}

}
.bottom-content {
    position: fixed;
    bottom: 0;
    width: 100%;
    padding: 10px;
    background-color: #01AFAE;
    text-align: center;
    /* Add other styling properties as needed */
}


/* Style for the link within the bottom-content */
.bottom-content a {
    color: #333; /* Link color */
    /* Additional link styling */
}
.sidebar-item {
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
margin: 5px;
    border-radius: 3px;
        background: #00e8ff;
}


.left-sidebar {
    position: absolute;
    width: 250px;
    height: 100%;
    top: 0px;
    z-index: 10;
    padding-top: 64px;
   background: #01AFAE !important;
    -webkit-box-shadow: 1px 0px 20px rgba(0, 0, 0, 0.08);
    box-shadow: 1px 0px 20px rgba(0, 0, 0, 0.08);
}



/* For screens smaller than 768px */
@media (max-width: 767px) {
    #main-wrapper.mini-sidebar .left-sidebar:hover {
        width: 250px !important;
    }
    
    #main-wrapper.mini-sidebar .left-sidebar {
    width: 250px !important;
}
}

</style>
</head>
<body>
	<!-- <div class="scroll-ksidebar" style="position: relative;"> -->
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav left-sidebar">

		<ul id="sidebarnav" class="p-t-30">
			<%
			String role = (String) session.getAttribute("role");
				if(role == null)
				{	
			%>
			<jsp:forward page="login/login.jsp"/> 
			
			<%} %>
						<c:if test="${role =='Indent Manager'}">
							<li class="sidebar-item"id='dashboardiD' ><a
				class="sidebar-link waves-effect waves-dark"
				href="dashboard" aria-expanded="false"><i
					class="mdi mdi-view-dashboard"></i> <span class="hide-menu heading">Dashboard</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link far " href="manageByAdmin"
					aria-expanded="false"><i  class="fa fa-users fa-5x"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Management</span></a></li>
				<!--  <li class="sidebar-item"><a
					class="sidebar-link far " href="usermanagementupload"
					aria-expanded="false"><i class="fa fa-upload"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Bulk upload</span></a></li> -->
				<li class="sidebar-item"><a
					class="sidebar-link far" href="adminreports"
					aria-expanded="false"><i class="fa fa-file-excel"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Reports</span></a></li>
						<!-- <li class="sidebar-item"><a
					class="sidebar-link far" href="update"
					aria-expanded="false"><i class="fa fa-edit"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Update</span></a></li>  -->
						
			</c:if>
			
			<%
		 Object accessRoleobj = session.getAttribute("accessRole");
			String accessRole = (String)accessRoleobj ;
		
			 %> 
				<c:if test="${role =='Buyer'}">
				<li class="sidebar-item"><a
					class="sidebar-link far " href="manageByAdmin"
					aria-expanded="false"><i  class="fa fa-users fa-5x"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Management</span></a></li>
						<c:if test="${accessRole == '1'}">
				 <li class="sidebar-item"><a
					class="sidebar-link far " href="usermanagementupload"
					aria-expanded="false"><i class="fa fa-upload"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Bulk upload</span></a></li>
						</c:if>
						
				<li class="sidebar-item"><a
					class="sidebar-link far" href="adminreports"
					aria-expanded="false"><i class="fa fa-file-excel"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Reports</span></a></li>
						<!-- <li class="sidebar-item"><a
					class="sidebar-link far" href="update"
					aria-expanded="false"><i class="fa fa-edit"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Update</span></a></li>  -->
						
			</c:if>
			<c:if test="${role =='Tray Manager'}">
				<li class="sidebar-item"><a
					class="sidebar-link far " href="manageByAdmin"
					aria-expanded="false"><i class="fa fa-users"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Management</span></a></li>
						
					<li class="sidebar-item"><a
					class="sidebar-link far" href="adminreports"
					aria-expanded="false"><i class="fa fa-file-excel"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Reports</span></a></li>
						
							
						<!-- <li class="sidebar-item"><a
					class="sidebar-link far" href="update"
					aria-expanded="false"><i class="fa fa-edit"></i><span
						class="hide-menu" style="font-family: 'Montserrat'">Update</span></a></li>
										 -->
			</c:if>
			
				</ul>
		</nav>
		<!--  <div class="bottom-content">
            <a class="sidebar-link waves-effect waves-dark" href="dashboard" aria-expanded="false">
                <span class="hide-menu heading" style="text-align:center">� 2023 TITAN COMPANY LTD.</span> <br>
                <span style="text-align:center" >ALL RIGHTS RESERVED.</span>
            </a>
        </div> -->
		<!-- End Sidebar navigation -->
	<!-- </div> -->
	<!-- End Sidebar scroll-->
</body>



<!-- All Jquery -->
<script src="assets/libs/jquery/dist/jquery.min.js"></script>
<!--Menu sidebar -->
<script src="dist/js/sidebarmenu.js"></script>
<script
	src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<!-- <script>
$(".sidebar-item").on("click", function(){
	alert("Hi");
});
</script> -->
</html>