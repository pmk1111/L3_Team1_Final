<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>WidUs</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link rel="stylesheet" href="../resources/user/css/join.css" />
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<!-- Favicons -->
<link href="../resources/home/assets/img/favicon.png" rel="icon">
<link href="../resources/home/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="../resources/home/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="../resources/home/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../resources/home/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="../resources/home/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="../resources/home/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../resources/home/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="../resources/home/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<!-- Template Main CSS File -->
<link href="../resources/home/assets/css/home.css" rel="stylesheet">
<!-- ======================================================== * Template Name: Arsha * Updated: Jul 27 2023 with Bootstrap v5.3.1 * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ * Author: BootstrapMade.com * License: https://bootstrapmade.com/license/ ======================================================== -->
<style>
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="auth-section after-contets">
		<div class="accont-wrap">
			<form id="joinform" name="joinform" action="joinProcess.net"
				method="post">
				<div class="account">개인회원</div>
				<div class="formDiv">
					<div>
						<b class="bTxt">이메일 주소</b><br> <input type="text" id="email"
							class="email" name="email" maxLength="30"
							placeholder="이메일을 입력하세요" required>
						<p class="errMsg" id="email_message">오류메세지 영역</p>
					</div>
					<div>
						<b class="bTxt">이름</b><br> <input type="text" id="userName"
							class="name" name="name" placeholder="이름을 입력하세요" maxLength="15"
							required>
						<p class="errMsg" id="name_message">오류메세지 영역</p>
					</div>
					<div>
						<b class="bTxt">비밀번호</b><br> <input type="password"
							id="password" placeholder="비밀번호를 입력하세요" class="pw" name="pass"
							required>
						<p class="errMsg" id="pw_message">오류메세지 영역</p>
					</div>

					<div class="mt10">
						<div>
							<input type="checkbox" id="policyCheckbox" class="policy"
								name="policy" value="필수"> <label for="policy"
								class="policyLabel"> <b class="require">(필수)</b>&nbsp; <a
								href="Service.net" style="color: #7C00B6; text-decoration: dash">
									서비스 이용약관</a>,<a href="PrivatePolicy.net"
								style="color: #7C00B6; text-decoration: dash">개인정보 처리방침</a>에
								동의합니다.
							</label>
						</div>
						<br>
						<div>
							<input type="checkbox" id="benefits" class="benefits"
								name="benefits" value="선택"> <label for="benefits"
								class="benefitsLabel"> <b>(선택)</b>&nbsp;혜택 수신에 동의합니다.
							</label>
						</div>
					</div>
				</div>

				<div class="clearfix">
					<button type="button" id="confirmBtn" class="submitbtn"
						onclick="openModal();">
						<strong>가입하기</strong>
					</button>
				</div>
			</form>
			
			<input type="hidden" id="authRandNum" name="authRandNum" />
			<input type="hidden" id="isChkPassword" name="isChkPassword" value="N" />
			<input type="hidden" id="isChkEmail" name="isChkEmail" value="N" /> 
			<input type="hidden" id="isChkverify" name="isChkverify" value="N" />
			<input type="hidden" id="isChkpolicy" name="isChkpolicy" value="N" />
		</div>

	</div>
	
	<div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>인증번호 입력</h2>
            <form id="authChkForm">
                <label for="authDescription">이메일주소로 <br>
                6자리 인증번호가 전송되었습니다</label><br>
                
                <input type="text" id="authNum"
							class="authNum" name="authNum" placeholder="인증번호를 입력하세요" maxLength="6"
							required>
                
                
                <button class="save" type="submit" onclick="saveSchedule()">저장</button> 
            </form>
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
								<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
									href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
									href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
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
	<script
		src="../resources/home/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="../resources/home/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="../resources/home/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="../resources/home/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="../resources/home/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="../resources/home/assets/vendor/php-email-form/validate.js"></script>
	<!-- Template Main JS File -->
	<script src="../resources/home/assets/js/main.js"></script>
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
	
	
</body>
</html>