<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
    <title>회사 정보</title>
    <meta name="description" content="" />


	<!-- CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

	<!-- jQuery library (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS (necessary for some of Bootstrap's JavaScript plugins) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

	<!-- Latest compiled and minified Bootstrap JavaScript -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="../resources/admin/js/companyinfo.js"></script>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon"
			href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />

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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <style>
      .leftbar-close{background-color: #9F7AB0; border-radius: 50%;}
      .welcome-message{width:100%;}
 
 	  #urlupdate, #nameupdate {margin-top: 50px;
 	  						   border: 1px solid #d9dee3;
 	  						   background-color: white;
 	  						   color: #697a8d;
 	  						   }
 	  .form-control {border:1px solid transparent;
 	    			 border-bottom: 1px solid #d9dee3;
 	    			 background-color:white;
 	  				
 	  				}
 	  #formCompanySetting input:disabled {
   					 background-color: transparent;
					}
	 .card {
   			 height: 85vh; /* 화면 높이에 85% 맞춤 */
	}
	
	.card-body { padding:50px;}
	
	.form-label, .col-md-12  {padding-top: 20px}
	
	.changepassword { margin: 20px 0px 40px 0px}
	.changepwd { background-color: white;
				 border: 1px solid #d9dee3;
				 color: #697a8d;
				 border-radius: 5px;
			
	}
	.pwdsubmit {border: 1px solid #d9dee3;
 	  						    background-color: white;
 	  						    color: #697a8d;
 	  						    box-shadow:none;
 	  						    border-radius:5px;}
	
	#saveButton, #cancelButton,
	#saveNameButton, #cancelNameButton {margin-top:50px;
								border: 1px solid #d9dee3;
 	  						    background-color: white;
 	  						    color: #697a8d;
 	  						    box-shadow:none;
	 }
	 
	 #saveButton, #saveNameButton {color:white;
	 							   background-color:#696cff;}
 
 	.modal .modal-header .btn-close {transform: translate(23px,-25px)};
 	/* swal */
 	
    </style>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

  		<jsp:include page="../admin/admin-leftbar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

<%--         <jsp:include page="navbar.jsp"></jsp:include>
 --%>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0 welcome-message">
                  <div class="container-fluid" >
                    <div class="card">
                        <div class="card-body">
                          <h2 class="card-title text-primary">회사 정보</h2>
                          <hr>
                          <p class="mb-4">
                          
                          <!-- content -->
                          
                          <form id="formCompanySetting" method="GET" action = "../admin/companyinfo">
                             <%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                               <input type="hidden" id="companyId" name="companyId" value="${companyinfo.id}">                  
                        <div class="row">
                        <div class="mb-3 col-md-6" id="name">
                            <label for="companyName" class="form-label">회사명</label>
                             <input
                              class="form-control"
                              type="text"
                              id="companyName"
                              name="companyName"
                              value="${companyinfo.name}"
                              disabled="disabled"
                              
                            />
                          
                        </div>
                       
                       <div class="mb-3 col-md-6">
      					     <button type="button" class="btn" id="nameupdate">수정</button>
      					     <button type="submit" class="btn btn-secondary d-none" id="saveNameButton">저장</button>
       						 <button type="button" class="btn btn-secondary d-none" id="cancelNameButton">취소</button>
  					   </div>
  					   <input type="hidden" name="updateType" id="updateType" value="updateName">
  					   
                      
                         <div class="mb-3 col-md-6">
                            <label for="companyDomain" class="form-label">전용 URL</label>
                             <input
                              class="form-control"
                              type="text"
                              id="companyDomain"
                              name="companyDomain"
                              value= "${companyinfo.domain}"
                              disabled="disabled"
                            />

                        </div>

                        <div class="mb-3 col-md-6">
      					     <button type="button" class="btn" id="urlupdate">수정</button>
      					     <button type="submit" class="btn btn-secondary d-none" id="saveButton">저장</button>
       						 <button type="button" class="btn btn-secondary d-none" id="cancelButton">취소</button>
  					   </div>
  					   <input type="hidden" name="updateType" id="updateDomain" value="updateDomain">
  					   
  					   <!-- 		이걸 넣을까 말까...
                         <div class="col-md-12">
                         	<div class="employeeParticipation">직원 참여 옵션</div>
                         	<br>
    						<label for="participation1" style="padding-bottom: 15px;">
   						    <input type="radio" id="participation1" name="employeeParticipation" value="1" checked>
     							관리자의 가입 승인 완료 후, 참여하도록 설정합니다.</label><br>
    						<label for="participation2">
   							<input type="radio" id="participation2" name="employeeParticipation" value="2">
   								특정 도메인의 이메일로 가입시, 관리자 승인 없이도 바로 참여할 수 있도록 설정합니다.</label><br><br>
    			 		
    					
    						<div class="row">
    						 <div class="col-md-6">  <!-- 왼쪽 컨텐츠 비워놓기 
    						</div>
    						
   							<div class="col-md-6">
       						 <div class="d-flex justify-content-end mt-2" style="width: 450px;">
            					<button type="submit" class="btn btn-primary me-2">저장</button>
           					    <button type="reset" class="btn btn-outline-secondary">취소</button>
        					 </div>
    						</div>
                       </div>
                	 -->
                
                      </div>
                       
                    </form>
                   </div>
                  </div>
                 </div>
                </div>
                      
                      
            

          <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme" 
            style="padding-top: 20px;">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  (주)WidUs
                </div>
                <div>
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
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