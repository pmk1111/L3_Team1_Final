<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>WidUs - 이슈 상세보기</title>
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
    
    <!-- issue-detail CSS -->
    <link rel="stylesheet" href="../resources/issue/css/issue-detail.css">
    <!-- Helpers -->
    <script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../resources/mainboard/assets/js/config.js"></script>
	
	<!-- JQuery Lib -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <style>
      .leftbar-close{background-color: #9F7AB0; border-radius: 50%;}
    </style>
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

         <!-- Content wrapper -->
        <div class="content-wrapper">
          <!-- Content -->

          <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row">

              <!-- Total Revenue -->
              <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-detail">
                <div class="card">

                  <div class="card-body issue-card">
                    <div class="issue-location">
                      프로젝트 / L3_Final Project / 이슈 게시글 클릭 시 자료실 게시판으로 페이지 이동됨
                    </div>
                    <hr class="issue-hr">

                    <div class="issue-write-info">
                      <img src="../resources/mainboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto user-img" />
                      <span class="issue-writer">MKP</span> <sup class="issue-create">2023-09-22 15:32:27</sup>
                    </div>
                    <h3 class="issue-title">이슈 게시글 클릭 시 자료실 게시판으로 페이지 이동됨</h3>
                    <hr class="issue-hr">

                    <div class="issue-info">
                      <div class="issue-status-area">
                        <span>상태</span>
                        <div class="status-select">
                          <button type="button" class="status-btn">To Do</button>
                          <button type="button" class="status-btn">In Progress</button>
                          <button type="button" class="status-btn">Resolved</button>
                          <button type="button" class="status-btn">Done</button>
                        </div>
                      </div>
                      <div class="issue-assigned-area">
                        <span>담당자</span><span class="issue-assigned">홍길동</span>
                      </div>
                      <hr class="issue-hr">

                      <div class="issue-content">
                        프로젝트란,<br>
                        부서 또는 업무 주제별 공간을 만들어 구성원을 초대하여 소통하는 '업무 소통 방' 입니다.<br>
                        <br>
                        혹시.. 프로젝트를 어떻게 세팅을 해야 할지 몰라서 프로젝트 만들기를 미루고 있으신가요?<br>
                        플로우를 만들고 있는 마드라스체크 직원들은 5단계 프로세스가 정착되어 있어,<br>
                        신입 직원이더라도 누구나 쉽게, 그리고 일관된 규칙으로 프로젝트를 만들고 세팅하고 있답니다.<br>
                        <br>
                        아래의 포인트를 생각하며 프로젝트를 만들고, 주기적으로 점검해 주세요!<br>
                        <br>
                        ✅ 프로젝트 제목은 직관적으로 만들었나요?<br>
                        ✅ 프로젝트 옵션 설정은 잘 되어있나요?<br>
                        ✅ 이 프로젝트는 어떤 프로젝트인지, 어떤 규칙이 있는지 운영방법이 공유되어 있나요?<br>
                        ✅ 업무와 관련된 참여자를 모두 초대했나요?<br>
                        ✅ 프로젝트 관리자로 추가 지정할 사람은 없나요?<br>
                        <br>
                        프로젝트 규칙 만드는 Tip 영상으로 확인하기 ▶ https://youtu.be/DwgWSLsLgpU
                      </div>
                      <hr class="issue-hr">

                      <div class="issue-file-area">
                        <span>첨부파일</span><img class="folder-img" src="../resources/issue/img/folder.svg">
                        <span class="attached-folder">프로젝트 작성 양식.txt</span>
                      </div>
                      <div class="subtask-wrap">
                        <span class="subtask-text">관련이슈</span>
                        <button type="button" class="add-subtask-btn"><img
                            src="../resources/issue/img/plus.svg">이슈추가
                      </div><!-- subtask-wrap end-->
                      <div class="subtask">
                        <div class="subtask-item">
                          <div class="subtask-status">In Progress</div>
                          <p class="subtask-title">채팅 기능 추가</span>
                        </div>
                      </div> <!-- subtask end-->

                    </div> <!-- issue-info end -->


                  </div> <!-- issue-card end -->

                  <div class="card comment-card">
                    <hr style="color: rgb(162, 162, 162); margin-bottom: 0px;">
                    <div class="comment-wrap">
                      <div class="comments">
                        <img src="../resources/mainboard/assets/img/avatars/1.png" alt="작성자 이미지" class="w-px-40 h-auto comment-writer-img" />
                        <span class="comment-writer">MKP</span> <sup class="comment-created">2023-09-22 15:32:27</sup>
                        <br>
                        <div class="comment-content">
                        <span>확인해주세요.</span>
                      </div>
                        <hr class="comment-hr">
                      </div>

                      <div class="comments">
                        <img src="../resources/mainboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto comment-writer-img" />
                        <span class="comment-writer">MKP</span> <sup class="comment-created">2023-09-22 15:32:27</sup>
                        <br>
                        <div class="comment-content">
                        <span>오늘은 해야 할 업무가 있습니다.<br>
                              내일까지 완료하겠습니다.
                        </span>
                      </div>
                        <hr class="comment-hr">
                      </div>

                      <div class="comments create-comment">
                        
                        <img src="../resources/mainboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto comment-writer-img" />
                        <textarea id="comment-textarea" class="comment-input" maxlength="400" rows="10" cols="50"
                          placeholder="댓글 내용을 입력하세요."></textarea>
                        <button type="button" class="comment-submit-btn">댓글 작성</button>

                      </div> <!-- create-comment end -->
                    </div> <!-- comment-wrap end -->
                  </div>
                </div>
              </div>
            </div>
            <!--/ Total Revenue -->
            <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
              <div class="row">
              </div>
            </div>
          </div>
          <div class="row">


          </div>          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->

	</div>
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
	</div> <!-- Layout-Wrapper end -->

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
    
    <!-- comment.js -->
	<script src="../resources/issue/js/comment.js"></script>
  </body>
</html>