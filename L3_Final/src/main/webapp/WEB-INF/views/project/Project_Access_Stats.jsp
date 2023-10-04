<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>WidUs - 대시보드</title>
    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../resources/mainboard/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />
    
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../resources/mainboard/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../resources/mainboard/assets/js/config.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/echarts@latest/dist/echarts.min.js"></script>


    <style>
      .leftbar-close{background-color: #9F7AB0; border-radius: 50%;}
      .welcome-message{width:100%;}
      .my-schedule{width:66%; margin-right:6.6px;}
      .memo, .my-work{min-height: 315px; }
      
      .card2 {
    background-clip: padding-box;
      }
  
  .card2 {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
}

    </style>
  </head>

  <body>
      <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

  		<jsp:include page="../mainboard/Admin_leftbar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->


          <!-- / Navbar -->
   <div class="content-wrapper">
            <!-- Content -->

					
								<div class="card2">
								
												<canvas id="lineChart" data-zr-dom-id="zr_0" width="816" height="1155"
											style="position: absolute; left: 0px; top: 0px; width: 544px; height: 770px; user-select: none;
											 -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
											 padding: 0px; margin: 0px; border-width: 0px;">
											</canvas>
											
										
											
							                  <script>
							                  document.addEventListener("DOMContentLoaded", () => {
							                    echarts.init(document.querySelector("#lineChart")).setOption({
							              		  xAxis: {
													    type: 'category',
													    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
													  },
													  yAxis: {
													    type: 'value'
													  },
													  series: [
													    {
													      data: [150, 230, 224, 218, 135, 147, 260],
													      type: 'line'
													    }
													  ]
							                  
							                    });
							                  });
											</script>
												
												<p class="mb-4">
												
												</p>


									


								</div>




						




						<!-- Footer -->
						<footer class="content-footer footer bg-footer-theme">
							<div
								class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
								<div class="mb-2 mb-md-0">
									©
									<script>
										document
												.write(new Date().getFullYear());
									</script>
									(주)WidUs
								</div>
								<div>
									<a href="https://themeselection.com/license/"
										class="footer-link me-4" target="_blank">License</a> <a
										href="https://themeselection.com/" target="_blank"
										class="footer-link me-4">More Themes</a> <a
										href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
										target="_blank" class="footer-link me-4">Documentation</a>

									<a
										href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
										target="_blank" class="footer-link me-4">Support</a>
								</div>
							</div>

						</footer>

						<!-- Footer -->

						<div class="content-backdrop fade"></div>
					</div>
					<!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../resources/mainboard/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../resources/mainboard/assets/vendor/libs/popper/popper.js"></script>
    <script src="../resources/mainboard/assets/vendor/js/bootstrap.js"></script>
    <script src="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../resources/mainboard/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../resources/mainboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../resources/mainboard/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../resources/mainboard/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>