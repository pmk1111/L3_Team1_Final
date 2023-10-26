<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>WidUs-Documents</title>
    <meta name="description" content="" />

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>

    <!-- Helpers -->
    <script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../resources/mainboard/assets/js/config.js"></script>


    <style>
        #documentarea1 {
            width: 1414px;
        }

        #layout-navbar {

            margin-top: 0px;
        }

        .file-search {
            border: 1px solid lightgrey;
            border-radius: 3px;
            width: 350px;
            height: 35px;
            padding-left: 15px;
            color: #6a6192;
            font-weight: 700
        }

        .leftbar-close {
            background-color: #9F7AB0;
            border-radius: 50%;
        }

        .welcome-message {
            width: 100%;
        }

        .my-schedule {
            width: 66%;
            margin-right: 6.6px;
        }

        .memo,
        .my-work {
            min-height: 315px;
        }

        .container-p-y {
            margin-top: 0px;
        }

        .content-wrapper {
            margin-top: 0;
        }

        #documentarea2 {
            margin-top: 100px;
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
                <div class="container-xxl flex-grow-1 container-p-y" id="documentarea2">
                    <div class="row">
                        <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list" id="documentarea1">
                            <div class="card">

                                <div class="card-body documents-list-card-body">


                                    <!-- Content wrapper -->
                                    <div class="content-wrapper">
                                        <!-- Content -->

                                        <div class="container-xxl flex-grow-1 container-p-y">
                                            <div class="container">
                                                <h3 style="margin-bottom: 30px; font-weight: 700;">파일함</h3>
                                                <input type="text" class="file-search" placeholder="검색어를 입력하세요.">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">선택</th>
                                                            <th scope="col">파일명</th>
                                                            <th scope="col">용량</th>
                                                            <th scope="col">등록자</th>
                                                            <th scope="col">등록일</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">1</th>
                                                            <td>주간 업무 계획 및 보고서 양식.xlsx</td>
                                                            <td>8.78kb</td>
                                                            <td>옥진석</td>
                                                            <td>2023-09-09 19:21</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">2</th>
                                                            <td>2023년 00회사 주간 회의</td>
                                                            <td>-</td>
                                                            <td>옥진석</td>
                                                            <td>2023-09-09 19:21</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">3</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">4</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">5</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">6</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">7</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">8</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">9</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">10</th>
                                                            <td>flow_noname_image.png</td>
                                                            <td>48.17kb</td>
                                                            <td>DD</td>
                                                            <td>2023-08-16 10:03</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

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
                                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                                <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>

                                <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
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