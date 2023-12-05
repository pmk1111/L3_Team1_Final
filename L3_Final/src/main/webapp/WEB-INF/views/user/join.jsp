<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>WidUs · 회원가입</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="../resources/user/css/join.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Favicons -->
    <link rel="icon" type="image/x-icon"
			href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />

    <!-- Vendor CSS Files -->
    <link href="../resources/home/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <!-- Template Main CSS File -->
    <link href="../resources/home/assets/css/home.css" rel="stylesheet">
    <!-- ======================================================== * Template Name: Arsha * Updated: Jul 27 2023 with Bootstrap v5.3.1
     * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ * Author: BootstrapMade.com
     * License: https://bootstrapmade.com/license/ ======================================================== -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
    <link rel="stylesheet" href="../resources/user/css/join.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

</head>

<body>

    <jsp:include page="../user/header.jsp"></jsp:include>


    <div class="container-xxl flex-grow-1 container-p-y" style="display:flex; justify-content:center; align-items: center;">
        <div class="row-login">
            <!-- Total Revenue -->
            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 jj-login" style="height:100%">
                <div class="card" style="height:100%">
                    <div class="card-body project-list-card-body" style="height:100%">
                        <form id="joinform" name="joinform" action="login" method="get">

                            <div class="auth-section after-contets">
                                <div class="accont-wrap">
                                    <div class="account">회원 가입</div>
                                    <div class="formDiv">
                                        <div>
                                            <b class="bTxt mail-text">이메일</b>
                                            <br>
                                            <input type="text" id="email" class="email" name="email" maxLength="30" onfocusout="checkEmail(this)" placeholder="이메일을 입력하세요" required>
                                            <p class="errMsg" id="email_message">오류메세지 영역</p>
                                        </div>
                                        <div>
                                            <b class="bTxt user-text">이름</b>
                                            <br>
                                            <input type="text" id="userName" class="name" name="name" onfocusout="checkUserName(this)" placeholder="이름을 입력하세요" maxLength="15" required>
                                            <p class="errMsg" id="name_message">오류메세지 영역</p>
                                        </div>
                                        <div class="password-container">
                                            <b class="bTxt pass-text">비밀번호</b>
                                            <br>
                                            <input type="password" id="password" placeholder="비밀번호를 입력하세요" onfocusout="checkPassword(this)" class="pw" name="password" required>
                                            <img src="../resources/JJ/img/eye_gray.svg" class="eye">
                                            <p class="errMsg" id="pw_message">오류메세지 영역</p>
                                        </div>

                                        <div class="mt10" style="margin-left:10px">
                                            <div style="display:flex; margin-bottom:5px; align-items: center;">
                                                <input type="checkbox" id="policyCheckbox" class="policy" name="policy" value="필수">
                                                <label for="policy" class="policyLabel" style="margin-left:5px;">
                                                    <b class="require" style="color: #ff6b6b;">(필수)</b>
                                                    <a href="Service.net" style="color: #7C00B6; text-decoration: dash">서비스 이용약관</a>,
                                                    <a href="PrivatePolicy.net" style="color: #7C00B6; text-decoration: dash">개인정보 처리방침</a>에 동의합니다.
                                                </label>
                                            </div>
                                            <div>
                                                <div style="display:flex; margin-bottom:5px; align-items: center;">
                                                    <input type="checkbox" id="benefits" class="benefits" name="benefits" value="선택">
                                                    <label for="benefits" class="benefitsLabel" style="margin-left:5px;">
                                                        <b>(선택)</b>&nbsp;혜택 수신에 동의합니다.
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- submitbtn 클래스명 수정 -->
                                    <div class="clearfix">
                                        <button type="button" class="submitbtn" id="confirmBtn" onclick="confirmUser()">
                                            <strong>가입하기</strong>
                                        </button>
                                    </div>

                                    <input type="hidden" id="authRandNum" name="authRandNum" />
                                    <input type="hidden" id="isChkPassword" name="isChkPassword" value="N" />
                                    <input type="hidden" id="isChkName" name="isChkName" value="N" />
                                    <input type="hidden" id="isChkEmail" name="isChkEmail" value="N" />
                                    <input type="hidden" id="isChkpolicy" name="isChkpolicy" value="N" />
                                </div>

                            </div>

                            <div class="modalarea">
                                <div id="myModal" class="modal">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <img src="../resources/JJ/img/WidUs.png" style="height: 28px; margin-left: -20px;">
                                            <span class="close" onclick="closeModal()">&times;</span>
                                        </div>
                                        <!-- 입력한 이메일 데이터값 -->
                                        <div class="modal-body">
                                            <input type="hidden" id="hiddenEmail" name="hiddenEmail">

                                            <strong style=" margin-top: 20px; font-size: 25px;">인증 코드 입력</strong>
                                            <label for="authDescription" class="authDescription"></label><br>

                                            <div class="check-num">
                                                <input type="text" id="authNum" class="authNum" name="authNum" placeholder="인증번호를 입력하세요" maxLength="6" required>
                                                <span id="timer" style="display: none;"></span>
                                            </div>
                                        </div>

                                        <button type="button" class="save" onclick="checkAuthCode()">확인</button>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="signupFooterArea" style="display: block;">
        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h3>WidUs</h3>
                            <p>
                                서울 종로구 율곡로10길 <br> 105 디아망 4층<br> 봉익동 10-1 03134<br>
                                <br> <strong>Phone:</strong> 010-1234-1234<br> <strong>Email:</strong>
                                WidUs1004@naver.com<br>
                            </p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>다음으로 이동</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">홈</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">소개</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">솔루션</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">서비스
                                        약관</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">개인정보
                                        이용약관</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Services</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web
                                        Design</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web
                                        Development</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Product
                                        Management</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
                                        Design</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>SNS</h4>
                            <p>WidUs 팀원들의 SNS 계정을 방문해 보세요.</p>
                            <div class="social-links mt-3">
                                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container footer-bottom clearfix">

                <div class="copyright">
                    &copy; Copyright <strong><span>WidUs</span></strong>. All Rights
                    Reserved
                </div>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you purchased the pro version. -->
                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ -->
                    Designed by <a href="https://bootstrapmade.com/">JHTA_L3_1</a>
                </div>
            </div>
        </footer>
        <!-- End Footer -->
    </div>
    <!-- Vendor JS Files -->
    <script src="../resources/home/assets/vendor/aos/aos.js"></script>
    <script src="../resources/home/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/home/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../resources/home/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../resources/home/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="../resources/home/assets/vendor/waypoints/noframework.waypoints.js"></script>
    <script src="../resources/home/assets/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script src="../resources/home/assets/js/main.js"></script>
    <script src="../resources/user/js/join.js"></script>

</body>

</html>