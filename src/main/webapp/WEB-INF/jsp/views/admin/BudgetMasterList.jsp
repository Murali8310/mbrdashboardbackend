<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>ISCM Stationery</title>
<!-- Custom CSS -->
<link href=" dist/css/style.min.css" rel="stylesheet">
<link href="dist/css/loading.css" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<style>

.remove-counter {
    counter-increment: none !important; /* Reset or set to initial value */
    content: none !important; /* Remove content */
}

section label {
	padding-top: 10px;
}

vertical-align: text-bottom ; footer {
	color: Teal;
	font-weight: bold;
	/* color:#ffffffd9;
  	position: fixed; */
	bottom: 0;
	left: 0;
	width: 100%;
	text-align: center;
}

.oneline {
	margin-left: -20px;
}

#quarterDivId   .custom-control-label {
	margin-top: -10px;
	padding-right: 20px
}

.error {
	color: #a94442;
}

.modal-lg {
    max-width: 1100px !important;
}

    
.dataTables_scrollBody td:last-child {
  background-color: white;
}

/* set background color for the header of the fixed column */
.dataTables_scrollHead th:last-child {
  background-color: white;
}

/* fix the position of the first column */
.dataTables_scrollBody td:last-child,
.dataTables_scrollHead th:last-child ,{
  position: sticky;
  right: 0;
  z-index: 1000;
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-sidebartype="full" class="mini-sidebar">
		
		<jsp:include page="/WEB-INF/jsp/views/header/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/jsp/views/header/sideBar.jsp"></jsp:include>
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title display-5">Cost Center & Budget Report</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="landPage">Home</a></li>
									<li class="breadcrumb-item"><a href="manageByAdmin">Management</a></li>
									<li class="breadcrumb-item active" aria-current="page">Budget Master 
										List</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<script
					src="https://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
				<script>

</script>
				<c:if test="${role == 'Buyer'}">
					<!-- Only show the page content if the user is an Indent Manager -->
					<div class="card">
						<div class="card-body">
							<h5 class="card-title"></h5>
							<div class="">

								<div id="zero_config_wrapper"
									class="dataTables_wrapper container-fluid dt-bootstrap4">
									<div class="row">
										<div  class="col-sm-12">
										<div style='display:none' style="text-align:end;margin-bottom:4px;"><button onclick="redirectToProductMasterCreation()" class='btn btn-primary'>Add Budget</button>
										</div>
										<c:set var="counter" value="1" />
  										<table id="example"
											class="table table-striped table-bordered display nowrap"
											style="width: 100%;">
																								
<style>
    table {
      border-collapse: collapse;
      width: 100%;
    }

    th {
      font-size: 21px;
      text-align: center !important;
    }

    td, th {
      border: 1px solid #dddddd;
      padding: 8px;
      font-size: 17px;
    }
    table {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    border-radious:3px;
}
body
{
    counter-reset: Serial;           /* Set the Serial counter to 0 */
}

table
{
    border-collapse: separate;
}

tr td:first-child:before
{
  counter-increment: Serial;      /* Increment the Serial counter */
  content: counter(Serial); /* Display the counter */
}

.headerStyles{
 background: #01AFAE !important;
 color: white !important;      
    font-size: 17px;
 
	}
	.tbodyCustomColor {
	    color: black !important;
    font-size: 17px;
	}
  </style>
											<thead class="thead-light">
												<tr>
									             <th class="headerStyles" scope="col"><b>Sl No.</b></th>
													<th class="headerStyles" scope="col"><b>GL</b></th>
													<th class="headerStyles" scope="col"><b>GL Description</b></th>
													<th class="headerStyles" scope="col"><b>Cost Center</b></th>
													<th class="headerStyles" scope="col"><b>Cost Center Description</b></th>
													<th class="headerStyles" scope="col"><b>Location</b></th>
											        <th  class="headerStyles" scope="col"><b>CC Owner</b></th>
													<th class="headerStyles" scope="col"><b>Yearly Budget(Rs)</b></th>
											       <th class="headerStyles" scope="col"><b>Year</b></th>
													<th class="headerStyles">Actions</th>
												</tr>
											</thead>
											<tbody class="customtable">
											 <c:set var="serialNumber" value="1" />
												<c:forEach items="${ProductListt}" var="indent"
													varStatus="loop">
													<tr>
														<td class="tbodyCustomColor"></td>
														<td class="tbodyCustomColor">${indent[3]}</td>
														<td class="tbodyCustomColor">${indent[4]}</td>
														<td class="tbodyCustomColor">${indent[0]}</td>
														<td class="tbodyCustomColor">${indent[2]}</td>
														<td class="tbodyCustomColor">${indent[5]}</td>
														<td class="tbodyCustomColor">${indent[7]}</td>
													    <td class="tbodyCustomColor" style="text-align:right !important">${indent[6]}.00</td>
														<td class="tbodyCustomColor" style="text-align:center !important">${indent[1]}</td>
														<td class="tbodyCustomColor"></td> 
													</tr>
            <c:set var="serialNumber" value="${serialNumber + 1}" /> <!-- Increment the serial number -->
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
							</div>

							</div>
						</div>

					</div>
				</c:if>

				<c:if test="${role != 'Buyer'}">
					<!-- Show an access denied message or redirect if the user is not an Indent Manager -->
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Access Denied</h5>
							<p>You do not have permission to access this page.</p>
						</div>
					</div>
				</c:if>

			</div>
		</div>

	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>ABM History List search</h2>
				<button type="button" class="close" id="close" data-dismiss="modal">&times;</button>

			</div>
			<div class="modal-body">
				<!-- <input id="my_field" type="text" class="form-control"
					onkeydown="popsearch()"> -->
				<div id="productQualityDivId" style="overflow:scroll"></div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

	<jsp:include page="/WEB-INF/jsp/views/header/footer.jsp"></jsp:include>

	<!-- 	<footer class="footer text-center">
				<span>2019 &copy Titan Company</span>
			</footer> -->
	</div>
	</div>

	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="dist/js/custom.min.js"></script>
	
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.min.js"></script>
	<script type="text/javascript" 
		src="https://cdn.datatables.net/fixedcolumns/4.2.2/js/dataTables.fixedColumns.min.js"></script>

	<script type="text/javascript">
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1);
		};
	</script>
	

	<script>
	 function redirectToProductMasterCreation() {
         window.location.href = 'budgetmastercreation';
     }


	 document.addEventListener("DOMContentLoaded", function() {
	  
	var table=  $('#example').DataTable( {
		scrollX:        true,
        scrollCollapse: true,
        paging:        true,
    	pageLength : 50,
        fixedColumns:   {
        	left:0,
            right: 1				        },
		 columnDefs: [
	            {
	                searchable: false,
	                orderable: false,
	                targets: 0,
	            },
	        ],
	        columnDefs: [
	            {
	                searchable: true, 
	                //orderable: true,
	                targets: [0,1,2,3,4,5, 6] 
	            },
	            {
	                searchable: false,
	                orderable: false,
	                targets: 7 
	            }
	        ],
	        order: [[1, 'asc']],
    	responsive :true,
        "sScrollX": "100%",
        "sScrollXInner": "110%",
        "bScrollCollapse": true,
        dom: 'Bfrtip',
        buttons: [
        	 {
                 extend: 'excelHtml5',
					text : '<i class="fa fa-file-excel-o"> Export</i>',
					titleAttr : 'Excel',
                 title: 'Budget Master List'
             },
        ],
        responsive: true,
        "columns" : [{
			"data" : "SL NO"
		},{
			"data" : "GL"
		}, {
			"data" : "GL Description"
		}, {
			"data" : "Cost Center"
		},{
			"data" : "Cost Center Description"
		},{
			"data" : "Location"
		} ,
		{
			"data" : "CC Owner"
		},
		{
			"data" : "Yearly Budget"
		},
		{
			"data" : "Year"
		}  ,{"targets": -1, // The last column (Actions)
            "data": null,
            "render": function(data, type, row) {
                   return "<button class='btn btn-success Edit-btn' id='Edit'>Edit</button>";
            },
            "searchable": false,
            "sortable": false,
            "createdCell": function(td, cellData, rowData, rowIndex, colIndex) {
                $(td).attr("data-row", rowIndex);
            }
        }
    ],
  
	} );
	
	
    table.buttons().container().appendTo('#example_wrapper .col-md-6:eq(0)' );
    
    
    $('#example').on('click', '.Edit-btn', function () {
    	  var $row = $(this).closest('tr');
    	    var rowData = table.row($row).data();
    	    console.log(rowData,'rowData')
    	    var indentDocumentNumber = rowData['Product ID'];
    	    var productName = rowData['Product Name'];
    	    
    	    if (table.search() === '') {
    	        sessionStorage.setItem('rowData', JSON.stringify(rowData));
    	    } else {
    	        // A search filter is applied, use the filtered data
    	        var filteredData = table.rows({"search": "applied"}).data().toArray();
    	        var matchingRow = filteredData.find(function (row) {
    	            return row['Product ID'] === indentDocumentNumber && row['Product Name'] === productName; ;
    	        });

    	        if (matchingRow) {
    	            console.log(matchingRow);
    	            sessionStorage.setItem('rowData', JSON.stringify(matchingRow));
    	        } else {
    	            console.log('Matching row not found in filtered data. Edit canceled.');
    	        }
    	    }

    	    window.location.href = 'budgetmasterupdate';
    });
    
   
   
   
  
});
	 
	 window.addEventListener('keyup', function() {
		// When you want to remove the styling
		 document.querySelectorAll('tr td:first-child:before').forEach(function(el) {
		   el.classList.add('remove-counter');
		 });

		});
	 

</script>
</body>
</html>
