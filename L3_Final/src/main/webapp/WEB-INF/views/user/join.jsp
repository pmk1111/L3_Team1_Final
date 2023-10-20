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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Favicons -->
    <link href="../resources/home/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
    <style>
        .modalarea {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
        }
        
        .modal {
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        
        .modal-content {
           background-color: #f4f4f4;
           padding: 20px;
           border-radius: 5px; 
           max-width: 400px;  
        }
        
        .close {
          color:#aaa ;
          float:right ;
          font-size :28px ;
          font-weight :bold ;
         }
        
         .close:hover,
         .close:focus{
             color:black ;
             text-decoration:none ; 
             cursor:pointer ; 
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

    <form id="joinform" name="joinform" action="join-success" method="post">

        <div class="auth-section after-contets">
            <div class="accont-wrap">
                <div class="account">개인회원</div>
                <div class="formDiv">
                    <div>
                        <b class="bTxt">이메일 주소</b>
                        <br>
                        <input type="text" id="email"  class="email" name="email" maxLength="30" placeholder="이메일을 입력하세요" required>
                        <p class="errMsg" id="email_message">오류메세지 영역</p>
                    </div>
                    <div>
                        <b class="bTxt">이름</b>
                        <br>
                        <input type="text" id="userName" class="name" name="name" placeholder="이름을 입력하세요" maxLength="15" required>
                        <p class="errMsg" id="name_message">오류메세지 영역</p>
                    </div>
                    <div>
                        <b class="bTxt">비밀번호</b>
                        <br>
                        <input type="password" id="password" placeholder="비밀번호를 입력하세요" class="pw" name="password" required>
                        <p class="errMsg" id="pw_message">오류메세지 영역</p>
                    </div>

                    <div class="mt10">
                        <div>
                            <input type="checkbox" id="policyCheckbox" class="policy" name="policy" value="필수">
                            <label for="policy" class="policyLabel">
                                <b class="require">(필수)</b>&nbsp;
                                <a href="Service.net" style="color: #7C00B6; text-decoration: dash">서비스 이용약관</a>,
                                <a href="PrivatePolicy.net" style="color: #7C00B6; text-decoration: dash">개인정보 처리방침</a>에 동의합니다.
                            </label>
                        </div>
                        <br>
                        <div>
                            <input type="checkbox" id="benefits" class="benefits" name="benefits" value="선택">
                            <label for="benefits" class="benefitsLabel">
                                <b>(선택)</b>&nbsp;혜택 수신에 동의합니다.
                            </label>
                        </div>
                    </div>
                </div>
				
				<!-- submitbtn 클래스명 수정 -->
                <div class="clearfix">
                    <button type="button" class="submitbtn" id="confirmBtn">
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
                    
                    <!-- 입력한 이메일 데이터값 -->
                    <input type="hidden" id="hiddenEmail" name="hiddenEmail">
                    
                    <strong style="padding-left: 40px; padding-bottom: 20px;">인증번호 입력</strong>
                    <label for="authDescription" class="authDescription"></label><br>

                    <input type="text" id="authNum" class="authNum" name="authNum" placeholder="인증번호를 입력하세요" maxLength="6" required>
                    <p class="errMsg" id="auth_message">오류메세지 영역</p>

                    <button type="submit" class="save">확인</button>
                </div>
            </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

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
                return;
            } else {
                var email = this.value;

                $.ajax({
                    url: '../user/check-email',
                    type: 'POST',
                    data: { email: email },
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        if (response == 1) {  // 동일한 이메일이 DB에 존재한다면
                            printErrMsg("email_message", "이미 사용중인 이메일입니다.");
                            document.getElementById("isChkEmail").value = "N";
                        } else {  // 동일한 이메일이 DB에 없다면
                            document.getElementById("email_message").style.visibility = "hidden";
                            document.getElementById("isChkEmail").value = "Y";
                        }
                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
            }
        });

        $("#userName").on('focusout', function() {
            if (this.value.length < 2) {
                printErrMsg("name_message", "이름은 2글자 이상이어야 합니다.");
                document.getElementById("isChkName").value = "N";
            } else {
                document.getElementById("name_message").style.visibility = "hidden";
                document.getElementById("isChkName").value = "Y";
            }
        });

        $("#password").on('focusout', function() {
            if (this.value.length < 6) {
                printErrMsg("pw_message", "비밀번호는 6글자 이상이어야 합니다.");
                document.getElementById("isChkPassword").value = "N";
            } else {
                document.getElementById("pw_message").style.visibility = "hidden";
                document.getElementById("isChkPassword").value = "Y";
            }
        });

        $("#policyCheckbox").on('change', function() {
            if (!this.checked) {
                alert('서비스 이용약관 동의는 필수입니다.');
                document.getElementById("isChkpolicy").value = "N";
                this.focus();
            } else {
                document.getElementById("isChkpolicy").value = "Y";
            }
        });

        // 모달창 띄우기
        $("#confirmBtn").click(function(e) {
            var isEmailValid = $("#isChkEmail").val() === "Y";
            var isNameValid = $("#isChkName").val() === "Y";
            var isPassValid = $("#isChkPassword").val() === "Y";
            var isCheckValid = $("#isChkpolicy").val() === "Y";

            // 모든 필드의 유효성을 확인
            if (!isEmailValid || !isNameValid || !isPassValid || !isCheckValid) {
                if (!isEmailValid) {
                    alert("이메일을 확인해주세요.");
                    return;
                }
                if (!isNameValid) {
                    alert("이름을 확인해주세요.");
                    return;
                }
                if (!isPassValid) {
                    alert("비밀번호를 확인해주세요.");
                    return;
                }
                if (!isCheckValid) {
                    alert("이용약관을 확인해주세요.");
                    return;
                }
                
                e.preventDefault(); // 유효성 검사에 실패한 경우 폼 제출을 막음
            } else {
            	$(".modalarea").css("display", "block");
            	
                // 모달 끄기
                $(".close").click(function() {
                    $(".modalarea").css("display", "none");
                });

                // 이메일 입력시 이메일 저장
                $("#email").blur(function() {
                    var email = $(this).val();
                    $("#hiddenEmail").val(email);
                });

                var serverVerificationCode;  // 서버로부터 받은 인증 코드를 저장할 전역 변수

                // 이메일
                    e.preventDefault();

                    var email = $("#hiddenEmail").val();

                    $.ajax({
                        url: '../user/send-mail-auth-code',
                        type: 'POST',
                        data: { email: email },
                        beforeSend: function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
                            xhr.setRequestHeader(header, token);
                        },
                        success: function(response) {
                            console.log(response);
                            serverVerificationCode = response; // 응답으로 받은 인증 코드를 저장
                        },
                        error: function(error) {
                            console.error(error);
                        }
                    });

                    // 에이잭스로 가져온 인증번호와 입력한 인증번호 비교
                    $(".save").click(function() {
                        var userVerificationCode = $("#authNum").val();

                        console.log("Server code: " + serverVerificationCode);  // 로그 추가
                        console.log("User code: " + userVerificationCode);  // 로그 추가

                        if (serverVerificationCode == userVerificationCode) {
                            alert("회원가입을 축하합니다");
                        } else {
                            alert("인증번호를 확인하세요");
                            event.preventDefault();
                        }
                    });
            }
        });
    });
</script>
 
</body>
</html>