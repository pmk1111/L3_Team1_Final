<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>WidUs-join</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="../resources/user/css/join.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            /* 화면 전체 너비 */
            height: 100%;
            /* 화면 전체 높이 */
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            position: relative;
            top: 50%;
            left: 50%;
            width: 475px;
            height: 300px;
            max-height: 70%;

            padding: 20px;
            border: 1px solid #888;

            transform: translate(-50%, -50%);

        }


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

        .authDescription {
            text-align: center;
            width: 100%;
            margin-bottom: 20px;
        }

    </style>

</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <form id="joinform" name="joinform">
	    <div class="auth-section after-contets">
	        <div class="accont-wrap">
	                <div class="account">개인회원</div>
	                <div class="formDiv">
	                    <div>
	                        <b class="bTxt">이메일 주소</b><br> <input type="text" id="email" class="email" name="email" maxLength="30" placeholder="이메일을 입력하세요" required>
	                        <p class="errMsg" id="email_message">오류메세지 영역</p>
	                    </div>
	                    <div>
	                        <b class="bTxt">이름</b><br> <input type="text" id="userName" class="name" name="name" placeholder="이름을 입력하세요" maxLength="15" required>
	                        <p class="errMsg" id="name_message">오류메세지 영역</p>
	                    </div>
	                    <div>
	                        <b class="bTxt">비밀번호</b><br> <input type="password" id="password" placeholder="비밀번호를 입력하세요" class="pw" name="pass" required>
	                        <p class="errMsg" id="pw_message">오류메세지 영역</p>
	                    </div>
	
	                    <div class="mt10">
	                        <div>
	                            <input type="checkbox" id="policyCheckbox" class="policy" name="policy" value="필수"> <label for="policy" class="policyLabel"> <b class="require">(필수)</b>&nbsp; <a href="Service.net" style="color: #7C00B6; text-decoration: dash">
	                                    서비스 이용약관</a>,<a href="PrivatePolicy.net" style="color: #7C00B6; text-decoration: dash">개인정보 처리방침</a>에
	                                동의합니다.
	                            </label>
	                        </div>
	                        <br>
	                        <div>
	                            <input type="checkbox" id="benefits" class="benefits" name="benefits" value="선택"> <label for="benefits" class="benefitsLabel"> <b>(선택)</b>&nbsp;혜택 수신에 동의합니다.
	                            </label>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="clearfix">
	                    <button type="button" id="confirmBtn" class="submitbtn" onclick="sendMailAuthCode();">
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
	                <span class="close">&times;</span>
	                <strong style="padding-left: 40px; padding-bottom: 20px;">인증번호 입력</strong>
	                 <label for="authDescription" class="authDescription"></label><br>
	
	                 <input type="text" id="authNum" class="authNum" name="authNum" placeholder="인증번호를 입력하세요" maxLength="6" required>
	                 <p class="errMsg" id="auth_message">오류메세지 영역</p>
	
	                 <button class="save" type="button" onclick="chkAuthCode()">확인</button>
	            </div>
	        </div>
	    </div>
    </form>
    
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
    <script type="text/javascript">
        // 오류 메세지 출력
        function printErrMsg(id, msg) {
            const element = document.getElementById(id);
            element.innerHTML = msg;
            element.style.visibility = "visible";
        }

        // 이메일 유효성 검사
        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }

        $(document).ready(function() {

            $("#email").on('focusout', function() {
                if (!validateEmail(this.value)) {
                    printErrMsg("email_message", "유효한 이메일을 입력해주세요.");
                } else {
                    document.getElementById("email_message").style.visibility = "hidden";
                    document.getElementById("isChkEmail").value = "Y";
                }
            });

            $("#userName").on('focusout', function() {
                if (this.value.length < 2) {
                    printErrMsg("name_message", "이름은 2글자 이상이어야 합니다.");
                } else {
                    document.getElementById("name_message").style.visibility = "hidden";
                    document.getElementById("isChkName").value = "Y";
                }
            });

            $("#password").on('focusout', function() {
                if (this.value.length < 6) {
                    printErrMsg("pw_message", "비밀번호는 6글자 이상이어야 합니다.");
                } else {
                    document.getElementById("pw_message").style.visibility = "hidden";
                    document.getElementById("isChkPassword").value = "Y";
                }
            });

            $("#policyCheckbox").on('change', function() {
                if (!this.checked) {
                    alert('서비스 이용약관 동의는 필수입니다.');
                    this.focus();
                }else{
                	document.getElementById("isChkpolicy").value = "Y";
                }
            })

        });
    </script>
    <script>
    function openModal() {
        var email = document.getElementById('email').value;
        var modal = document.getElementById('myModal');
        var authDescription = document.querySelector('.authDescription');

        if (document.getElementById("isChkPassword").value == 'Y' &&
            document.getElementById("isChkName").value == 'Y' &&
            document.getElementById("isChkEmail").value == 'Y' &&
            document.getElementById("isChkpolicy").value == 'Y') {

            authDescription.innerHTML = email + '으로 <br> 6자리 인증번호가 전송되었습니다';
            modal.style.display = 'block';
            
        } else {
            alert('입력값을 확인해주세요.');
        }
    }
    
    function sendMailAuthCode(){
    	var sendForm = $("#joinform").serialize();
    	
    	 $.ajax({
    	        url: "../user/sendMailAuthCode",
    	        type: "POST",
    	        data: sendForm,
    	        async: false,
    	        success: function(response) {
    	        	openModal();
    	        },
    	        error: function(error) {
                }
    	});
    }
    
    function chkAuthCode(){
    	var sendForm = $("#joinform").serialize();
    	
	   	 $.ajax({
	   	        url: "../user/chkAuthCode",
	   	        type: "POST",
	   	        data: sendForm,
	   	        async: false,
	   	        success: function(data) {
	   				debugger;
	   	        },
	   	        error: function(error) {
	            }
	   		});	
    }
    
    
    
    
    
     var modal = document.getElementById('myModal');
     var span = document.getElementsByClassName("close")[0];

     span.onclick = function() {
        modal.style.display = "none";
     }
    </script>



</body>

</html>