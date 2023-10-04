<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import = "java.util.Enumeration" %>
<html
  class="light-style layout-menu-fixed"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>회원관리 - 회원수정 페이지</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../user/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../user/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../user/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../user/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../user/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../user/assets/js/config.js"></script>
  </head>

  <body>
  
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        
        <!-- Menu -->

		<jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
		<!-- / Menu -->


        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
		  <jsp:include page="../mainboard/navbar.jsp"></jsp:include>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"></span> 회원정보 </h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> 계정</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="pages-account-settings-notifications.html"
                        ><i class="bx bx-bell me-1"></i> 알림</a
                      >
                    </li>
                   
                  </ul>
                  <div class="card mb-4">
                    <h5 class="card-header">프로필</h5>
                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="../user/assets/img/avatars/profile.png"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
                          width="100"
                          id="uploadedAvatar"
                        />
                        
                        
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">프로필 수정</span>
                            <i class="bx bx-upload d-block d-sm-none"></i>
                            <input
                              type="file"
                              id="upload"
                              class="account-file-input"
                              hidden
                              accept="image/png, image/jpeg"
                            />
                          </label>
                          <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                            <i class="bx bx-reset d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">취소</span>
                          </button>

                          <!-- <p class="text-muted mb-0">파일이름이 들어와야함</p> -->
                        </div>
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" method="POST" onsubmit="return false">
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label for="email" class="form-label">이메일</label>
                             <input
                              class="form-control"
                              type="text"
                              id="email"
                              name="email"
                              value="${userinfo.email}"
                              required readOnly
                            />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="company" class="form-label">회사</label>
                            <input
                              type="text"
                              class="form-control"
                              id="company"
                              name="company"
                              value="${userinfo.company}"
                            />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="name" class="form-label">이름</label>
                            <input class="form-control" type="text" name="name" id="name" value="${userinfo.name}" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="department" class="form-label">부서</label>
                            <input type="text" class="form-control" id="department" name="department" placeholder="" 
                            value="${userinfo.department}"/>
                          </div>
                        <div class="mb-3 col-md-6">
                            <label class="form-label" for="tel">휴대폰 번호</label>
                            <div class="input-group input-group-merge">
                              <input
                                type="text"
                                id="tel"
                                name="tel"
                                class="form-control"
                                placeholder="010 000 0000"
                                value="${userinfo.tel}"
                              />
                            </div>
                          </div>
                          
                         
                          <div class="mb-3 col-md-6">
                            <label for="position" class="form-label">직책</label>
                            <input type="text" class="form-control" id="position" name="position" placeholder="" 
                            value="${userinfo.position}"/>
                          </div>
                          
                       <div class="d-flex justify-content-between" >
    					 <div class="change password">
       						 <button type="button" class="btn btn-outline-secondary" style= "margin-top: 10;">비밀번호 변경</button>
    					 </div>
   						 <div class="mt-2">
      					     <button type="submit" class="btn btn-primary me-2">저장</button>
      					     <button type="reset" class="btn btn-outline-secondary">취소</button>
  					     </div>
					  </div>
					  </div>
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
                  <div class="card">
                    <h5 class="card-header">회원 탈퇴</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">정말로 탈퇴하시겠습니까?</h6>
                          <p class="mb-0">탈퇴시 모든 정보를 더 이상 확인할 수 없습니다.</p>
                        </div>
                      </div>
                      <form id="formAccountDeactivation" onsubmit="return false">
                        <div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            name="accountActivation"
                            id="accountActivation"
                          />
                          <label class="form-check-label" for="accountActivation"
                            >동의합니다.</label
                          >
                        </div>
                        <button type="submit" class="btn btn-danger deactivate-account">탈퇴</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            

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
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../assets/js/pages-account-settings-account.js"></script>

   
    <!-- Place this tag in your head or just before your close body tag. -->
    
    <script>
    $('input[type=file]').change(function(event){
        const inputfile=$(this).val().split('\\');
        const filename=inputfile[inputfile.length-1]; //inputfile.length-1 =2
        
        const pattern=/(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미
        if (pattern.test(filename)){
           $('#filename').text(filename);
           
           const reader = new FileReader(); //파일을 읽기 위한 객체 생성
           
    </script>

  </body>
</html>
