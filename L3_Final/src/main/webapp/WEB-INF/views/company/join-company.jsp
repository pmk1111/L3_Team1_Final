<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>WidUs-join</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="../resources/user/css/join-company.css" />
    <!-- Favicons -->
    <link href="../resources/home/assets/img/favicon.png" rel="icon">
    <link href="../resources/home/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
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
    <!-- ======================================================== * Template Name: Arsha * Updated: Jul 27 2023 with Bootstrap v5.3.1 * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ * Author: BootstrapMade.com * License: https://bootstrapmade.com/license/ ======================================================== -->
    <style type="text/css">
        .errMsg {
            margin-top: 5px;
            margin-bottom: 5px;
            visibility: hidden;
        }

        .btn-join {
            margin-bottom: 100px;
        }
        .errMsg {
            text-align: left;
            margin-top: 10px;
            color: #ff6b6b;
            font-size: 14px;
            line-height: 21px;
        }
    </style>
</head>

<body>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <jsp:include page="header.jsp"></jsp:include>

    <div class="auth-section after-contets">
        <div class="accont-wrap">
            <div id="companyJoinMain" class="login-wrap">
                <div class="login-text">기존 회사 참여</div>
                <div class="login-company">이미 회사에서 사용하고 있다면 회사 URL을 입력하여
                    함께하세요.</div>
                <div class="join-contets">
                    <p class="url-tit">회사 URL</p>
                    <div class="url-wr">
                        <span>https://</span> <input id="domain" type="text" class="join-input" autocomplete="off" placeholder="회사 URL">
                        <span>.widus.team</span>
                    </div>
                    <p id="helpMsg" class="join-company-url" style="display: block;">
                        회사URL 주소는 관리자를 통해 확인할 수 있습니다.
                </div>
                <button id="companyJoinBtn" class="btn-join" onclick="signUpDomain()">참여하기</button>
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
</body>
<script type='text/javascript'>
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");

    function validateURL(input){
        var re = /^[a-zA-Z0-9-]{3,30}$/;
        return re.test(input);
    }
    
	function signUpDomain(){
		var domain = $("#domain").val() ;
		if(!validateURL(domain)){
			alert("도메인이 정상적이지 않습니다. 다시 확인해주세요!");
			return;
		}
		
		$.ajax({
	   		url: '../company/sign-up-domain',
	       	type: 'POST',
	       	data: {"domain" : domain} ,
	       	beforeSend: function(xhr) {
	           xhr.setRequestHeader(header, token);
	       	},
	   		success: function(response) {
	       		if (response == 0) {  
	       			alert("신청하신 도메인 '" +domain+ "'에 정상적으로 신청이 되었습니다.");
	       			window.location.href = "/myhome/mainboard/my-dashboard";
	       		} else  { 
	       			alert("신청하신 도메인 '" +domain+ "' 은 존재하지 않는 도메인입니다. 도메인을 다시 확인해주세요.");
	       		}
	   		},
	   		error: function(error) {
	       		console.error(error);
	   		}
			});
		
	}

	
  
   $(document).ready(function() {
     $("#joinInput").on('focusout', function() {
         if (!validateURL(this.value)) {
             document.getElementById("helpMsg").innerHTML = "회사 URL은 3~30글자의 영문자/숫자/하이픈(-)으로만 입력해야 합니다.";
             document.getElementById("helpMsg").style.color = "red";
         } else {
             document.getElementById("helpMsg").innerHTML = "회사URL 주소는 관리자를 통해 확인할 수 있습니다.";
             document.getElementById("helpMsg").style.color = "#623ad6";
         }
     });
  });

</script>

</html>