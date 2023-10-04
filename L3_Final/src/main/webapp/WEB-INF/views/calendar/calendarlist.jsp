<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>캘린더</title>
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


    <style>
      .file-search{border:1px solid lightgrey; border-radius:3px; width:350px; height:35px; padding-left: 15px; color:#6a6192; font-weight: 700}
      .leftbar-close{background-color: #9F7AB0; border-radius: 50%;}
      .welcome-message{width:100%;}
      .my-schedule{width:66%; margin-right:6.6px;}
      .memo, .my-work{min-height: 315px; }
    </style>
    <style type="text/css">
    /* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 40%;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

/* 모달 닫기 버튼 스타일 */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

/* 폼 스타일 */
form {
    margin-top: 10px;
}

label {
    font-weight: bold;
}

input[type="text"],
input[type="date"],
select,
textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}
    
</style>    
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

  		<jsp:include page="leftbar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

        <jsp:include page="navbar.jsp"></jsp:include>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

	  <div class="container-xxl flex-grow-1 container-p-y">
            
            <body>
    <button onclick="openModal()">일정 추가</button>

    <!-- 일정 추가 모달 창 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>일정 추가</h2>
            <form action="addEvent.jsp" method="post">
                <label for="eventTitle">일정 제목:</label>
                <input type="text" id="eventTitle" name="eventTitle" required><br>
                
                <label for="eventStartDate">시작일:</label>
                <input type="date" id="eventStartDate" name="eventStartDate" required><br>
                
                <label for="eventEndDate">끝나는 날:</label>
                <input type="date" id="eventEndDate" name="eventEndDate" required><br>
                
                <label for="eventLocation">장소:</label>
                <input type="text" id="eventLocation" name="eventLocation"><br>
                
                <label for="eventAttendees">참석자:</label>
                <input type="text" id="eventAttendees" name="eventAttendees"><br>
                
                <label for="eventAlarm">알람:</label>
                <select id="eventAlarm" name="eventAlarm">
                    <option value="15">15분 전</option>
                    <option value="30">30분 전</option>
                    <option value="60">1시간 전</option>
                    <option value="0">없음</option>
                </select><br>
                
                <label for="eventCategory">일정 구분</label>
                <select id="eventCategory" name="eventCategory">
                    <option value="업무">업무</option>
                    <option value="일정">일정</option>
                    <option value="선택안함">선택안함</option>
                </select><br>
                <label for="eventDescription">설명:</label>
                <textarea id="eventDescription" name="eventDescription"></textarea><br>
                
                <input type="submit" value="일정 추가">
            </form>
        </div>
    </div>

    <script>
        // 모달 창 열기
        function openModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = 'block';
        }

        // 모달 창 닫기
        function closeModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = 'none';
        }
    </script>
            
       </div>     
            
            

          <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
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