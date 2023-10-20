<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
    data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
		<meta name="_csrf" content="${_csrf.token}">
		<meta name="_csrf_header" content="${_csrf.headerName}">

    <title>Widus-Calendar</title>
    <meta name="description" content="" />

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>
    <link rel="stylesheet" href="../resources/calendar/css/calendar.css">

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
          <div class="container-xxl flex-grow-1 container-p-y" id="calendararea2">
            <div class="row">
              <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list" id="calendararea1">
                <div class="card">

                  <div class="card-body issue-list-card-body">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                      <!-- Content -->

                      <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="calendararea">
                          <jsp:include page="calendar.jsp"></jsp:include>

                          <!-- 일정 추가 모달 창 -->
                          <div id="myModal" class="modal">
                            <div class="modal-content">
                              <span class="close" onclick="closeModal()">&times;</span>
                              <h2>일정 등록</h2>
                              <form id="scheduleForm" method="post" name="create-schedule">
                                <label for="eventTitle">일정 제목:</label>
                                <input type="text" id="eventTitle" name="subject" required><br>

                                <label for="eventStartDate">시작일:</label>
                                <input type="date" id="eventStartDate" name="start-date" required><br>

                                <label for="eventEndDate">끝나는 날:</label>
                                <input type="date" id="eventEndDate" name="end-date" required><br>

                                <label for="eventLocation">장소:</label>
                                <input type="text" id="eventLocation" name="place"><br>


                                <label for="eventAlarm">알람:</label>
                                <select id="eventAlarm" name="eventAlarm">
                                  <option value="15">15분 전</option>
                                  <option value="30">30분 전</option>
                                  <option value="60">1시간 전</option>
                                  <option value="0">없음</option>
                                </select><br>

                                <label for="eventCategory">일정 구분</label>
                                <select id="eventCategory" name="category">
                                  <option value="1">업무</option>
                                  <option value="2">일정</option>
                                  <option value="0">선택안함</option>
                                </select><br>
                                <label for="eventDescription">설명:</label>
                                <textarea id="eventDescription" name="content"></textarea><br>

                                <button class="save" type="button" onclick="saveSchedule()">저장</button>
                                <button class="modify" type="button" onclick="modifySchedule()">수정</button>
                                <button class="remove" type="button" onclick="removeSchedule()">삭제</button>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More
                  Themes</a>

                <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                  target="_blank" class="footer-link me-4">Documentation</a>

                <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank"
                  class="footer-link me-4">Support</a>
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
    <!-- / Layout wrapper -->

    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script src="../resources/calendar/js/calendar.js"></script>
  </body>

  </html>