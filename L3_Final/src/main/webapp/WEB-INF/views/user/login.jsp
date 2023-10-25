<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="google-signin-client_id" content="625666498826-vv7f0001u0rk3v8pc18on0icn71vro2e.apps.googleusercontent.com">
    <title>WidUs-login</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="../resources/user/css/login.css" />
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
        .guest-or {
            text-align: center;
        }

        #confirmBtn {
            margin-bottom: 20;
        }
    </style>
</head>

<body>
 <jsp:include page="header.jsp"></jsp:include>
 <form action="loginProcess" method="post">
     <div class="auth-section after-contents">
         <div class="account-wrap">
             <div class="account">로그인</div>
             <div class="formDiv">
                 <div>
                     <b class="bTxt">이메일 주소</b><br>
                     <input type="text" id="email" class="email" name="email" maxLength="30" placeholder="이메일을 입력하세요" required>
                     <p class="errMsg" id="email_message">오류메세지 영역</p>
                 </div>
                 <div>
                     <b class="bTxt">비밀번호</b><br>
                     <input type="password" id="password" placeholder="비밀번호를 입력하세요" class="pw" name="password" required>
                     <p class="errMsg" id="pw_message">오류메세지 영역</p>
                 </div>
             </div>
             <div class="clearfix">
                 <button type="submit" id="confirmBtn" class="submitbtn">로그인</button>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
             </div>
         </div>
         <div style="margin-top:30px;">
         <div class="guest-or">
             <strong>아이디가 없으신가요?</strong>
         </div>
         <div>
             <a href="${pageContext.request.contextPath}/user/join" id="login" class="submitbtn">
       		 <strong>회원가입</strong>
    		</a>
         </div>
         </div>
     </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 </form>
 <input type="hidden" id="isChkPassword" name="isChkPassword" value="N" />
 <input type="hidden" id="isChkEmail" name="isChkEmail" value="N" />

 <div id="signupFooterArea" style="display: block;">
  <jsp:include page="footer.jsp"></jsp:include>
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
    if("${loginfail}" == 'loginFailMsg'){
        alert("아이디나 비밀번호 오류 입니다.");
     }
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

        $("#password").on('focusout', function() {
            if (this.value.length < 6) {
                printErrMsg("pw_message", "비밀번호는 6글자 이상이어야 합니다.");
            } else {
                document.getElementById("pw_message").style.visibility = "hidden";
                document.getElementById("isChkPassword").value = "Y";
            }
        });
    });
   
    </script>
</body>

</html>