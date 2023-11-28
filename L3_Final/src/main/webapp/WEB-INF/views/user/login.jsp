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
    <title>WidUs · 로그인</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Favicons -->
    <link rel="icon" type="image/x-icon"
			href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
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
 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
    <link rel="stylesheet" href="../resources/user/css/login.css" />

</head>

<body>
 <jsp:include page="../user/header.jsp"></jsp:include>
 


<div class="container-xxl flex-grow-1 container-p-y" style="display:flex; justify-content:center; align-items: center;">
    <div class="row-login">
        <!-- Total Revenue -->
        <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 jj-login" style="height:100%">
            <div class="card" style="height:100%">
                <div class="card-body project-list-card-body" style="height:100%">
 <form action="loginProcess" method="post">
     <div class="auth-section after-contents">
         <div class="account-wrap">
             <div class="account">로그인</div>
             <div class="formDiv">
                 <div>
                     <b class="bTxt mail-text">이메일</b><br>
                     <input type="text" id="email" class="email" name="email" maxLength="30" placeholder="이메일을 입력하세요" required>
                     <p class="errMsg" id="email_message">오류메세지 영역</p>
                 </div>
				<div class="password-container">
				  <b class="bTxt">비밀번호</b><br>
				  <input type="password" id="password" placeholder="비밀번호를 입력하세요" class="pw" name="password" required>
				  <img src="../resources/JJ/img/eye_gray.svg" class="eye">
				  <!-- <p class="errMsg" id="pw_message">오류메세지 영역</p> -->
				</div>
             </div>
             <div class="clearfix">
                 <button type="submit" id="confirmBtn" class="submitbtn">로그인</button>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
             </div>
         </div>
         
         <div style="margin-top:35px;">
	         <div class="guest-or"><strong style="font-size:14px">회원이 아니신가요?</strong></div>
	         	<div style="display: flex; justify-content: center;">
		          <button class="button2 button--nina button--text-thick button--text-upper button--size-s" id="join" data-text="회원가입">
		            <span>회</span><span>원</span><span>가</span><span>입</span>
		          </button>
		        </div> 
		             <%-- <a href="${pageContext.request.contextPath}/user/join" id="login" class="submitbtn btn-11">
		       		 <strong>회원가입</strong>
		    		</a>
		         </div> --%>
	         </div>
     </div>
     
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 </form>
 <input type="hidden" id="isChkPassword" name="isChkPassword" value="N" />
 <input type="hidden" id="isChkEmail" name="isChkEmail" value="N" />

				</div>
			</div>
		</div>
	</div>
</div>

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
	    
	    // 입력을 하고 난 후에 포커스아웃 될 때 변경
	    $("#email").keyup(function(){
	        $("#email").on('focusout', function() {
	            if (!validateEmail(this.value)) {
	                if ($(this).val() == '') {
	                    $("#email_message").removeClass("errAction");
	                    $("#email").removeClass("errId");
	                    $(".mail-text").removeClass("Action");
	                    
	                    document.getElementById("email_message").style.visibility = "hidden";
	                } else {
	                    printErrMsg("email_message", "이메일 형식이 올바르지 않습니다.");
	                    
	                    $("#email_message").addClass("errAction");
	                    $("#email").addClass("errId");
	                    $(".mail-text").addClass("Action");
	                }
	            } else {
	                document.getElementById("email_message").style.visibility = "hidden";
	                
	                $("#email_message").removeClass("errAction");
	                $("#email").removeClass("errId");
	                $(".mail-text").removeClass("Action");
	                
	                document.getElementById("isChkEmail").value = "Y";
	            }
	        });
	    });
	    
	    // 진석 js
	    $('#password').keyup(function(){
	        if ($(this).val() == '') {
	            $('.eye').hide();
	        } else {
	            $('.eye').show();
	        }
	    });
	    
	    
	    $('.eye').hover(function(){
	        $('.eye').attr('src', '../resources/JJ/img/eye_black.svg');
	        $('.pw').attr('type', 'text');
	    }, 
	    function(){
	        $('.eye').attr('src', '../resources/JJ/img/eye_gray.svg');
	        $('.pw').attr('type', 'password');
	      }
	    );
	    
	    $('#join').click(function(){
	        window.location.href = '${pageContext.request.contextPath}/user/join';
	    })
	    
	});

	</script>    
    
</body>

</html>