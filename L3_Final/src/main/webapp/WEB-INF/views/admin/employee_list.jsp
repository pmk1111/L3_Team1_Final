<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
	
    <title>구성원 관리</title>
    <meta name="description" content="" />
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 		<!-- CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

		<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

		<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 	
 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
  	 
      .tab1_style {width:800px; margin:0 auto; margin-top:50px;} 
 
 	  .nav-tabs .nav-item .nav-link:not(.active) {
   		 background-color: white;
   		 border: 1px solid #d9dee3 
	}
	
	  .nav-tabs .nav-item .nav-link.active {
	  	 border: 1px solid #d9dee3 
	}
   
      .card {
   		 height: 80vh; /* 화면 높이에 80% 맞춤 */
   		 width: 100%;
	}
 	
      
 	
	  .col-lg-8 {
    	 flex: 0 0 auto;
    	 width: 100%;
    }
    
    th {
    	 text-align:center;
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
                          <h2 class="card-title text-primary">구성원 관리</h2>
                          <hr>
                          <p class="mb-4">
                          
                          <!-- content -->
                     
                     <!-- 탭 -->
                    <div id="head-tab" class="tab1_style mgt30" style="margin-left:0px;">
 					     <ul class="nav nav-tabs" >
             				 <li class="nav-item">
               				   <a class="nav-link active" data-toggle="tab" href="#useruse"><span>정상</span>
 					 		    <c:if test="${count > 0}"> <!-- ${count}가 0보다 큰 경우 -->
  								  <small><b>[&nbsp;<c:out value="${count}"/>&nbsp;]</b></small> 
								</c:if>
							   </a>
              				</li>
              				<li class="nav-item">
               				  <a class="nav-link" data-toggle="tab" href="#userstop"><span>이용중지</span>
 					 		    <c:if test="${count > 0}"> <!-- ${count}가 0보다 큰 경우 -->
  								  <small><b>[&nbsp;<c:out value="${count}"/>&nbsp;]</b></small> 
								</c:if>
							   </a>
              				</li>
              				<li class="nav-item">
                			  <a class="nav-link" data-toggle="tab" href="#userwait"><span>가입대기</span>
 					 			 <c:if test="${count > 0}"> <!-- ${count}가 0보다 큰 경우 -->
  								  <small><b>[&nbsp;<c:out value="${count}"/>&nbsp;]</b></small> 
								</c:if>
							  </a>
              				</li>
            			 </ul>
          			
					</div>
					
					<br>
					<!-- 검색 -->
					<div id="search">
					 <form action="list" method="post">
					  <div class="input-group" style="width:50%">
						<select id="viewcount" name="search_field" style= "border : 1px solid #d9dee3;" >
							<option value="4">전체</option>
							<option value="0" selected>이름</option>
							<option value="1">이메일</option>
							<option value="2">부서</option>
							<option value="3">직책</option>
						</select> 
				   			<input name="search_word" type="text" class="form-control" style="height:38.55px;"
					      		placeholder="검색어를 입력하세요"    value="${search_word}">
				  			<button class="btn btn-primary" type="submit">검색</button>
					 </div>
				    </form>
				   </div>
				  	<br>
					<div id="content">
 					 <div class="tab-pane fade show active" id="useruse">
               			<table border="1"  width="100%" style=" border: 1px solid #d9dee3; color:#566a7f;">
               			     <tr>
               			       <th>프로필</th>
               			   	   <th>사원번호</th>
               			       <th>이름</th>
               			       <th>부서</th>
               			       <th>직책</th>
               			       <th>이메일</th>
               			       <th>휴대폰번호</th>
               			       <th>상태</th>
               			       <th>관리자</th>
               			     </tr>
               			  
               			  
               			  <c:forEach var="row" items="${list}">
               			    <tr>
               			        <td></td>
               			    	<td></td>
               			    	<td></td>
               			    	<td></td>
               			    	<td></td>
               			    	<td></td>
               			    	<td></td>
               			    	<td></td>
               			    	<td></td>
               			    </tr>
               			    </c:forEach>
               			    
               			 </table>
               		 </div>
             		 <div class="tab-pane fade" id="userstop">
		                <table border="1" width="100%" style=" border: 1px solid #d9dee3; color:#566a7f;">
               			   <tr>
               			       <th>프로필</th>
               			   	   <th>사원번호</th>
               			       <th>이름</th>
               			       <th>부서</th>
               			       <th>직책</th>
               			       <th>이메일</th>
               			       <th>휴대폰번호</th>
               			       <th>상태</th>
               			       <th>관리자</th>
               			    </tr>
               			  
               			  
               			  <c:forEach var="row" items="${list}">
               			    <tr>
               			    	
               			    </tr>
               			    </c:forEach>
               			    
               			 </table>
               		 </div>
             		 <div class="tab-pane fade" id="userwait">
                		 <table border="1" width="100%" style=" border: 1px solid #d9dee3; color:#566a7f;">
               			   <tr>
               			       <th>프로필</th>
               			       <th>이름</th>
               			       <th>이메일</th>
               			       <th>가입요청일</th>
               			       <th>설정</th>
               			    </tr>
               			  
               			  
               			  <c:forEach var="row" items="${list}">
               			    <tr>
               			    	
               			    </tr>
               			    </c:forEach>
               			    
               			 </table>
               		 </div>
					</div>
                   </div>
                  </div>
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