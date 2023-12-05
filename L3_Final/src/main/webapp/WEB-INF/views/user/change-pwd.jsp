<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../resources/mainboard/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>WidUs · 비밀번호 변경</title>
<meta name="description" content="" />


<!-- CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<jsp:include page="../template/cssTemplate.jsp"></jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/changepw.css">

<script src="../resources/mainboard/assets/js/config.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- jQuery library (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS (necessary for some of Bootstrap's JavaScript plugins) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled and minified Bootstrap JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="../resources/user/js/change-pwd.js"></script>

</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<jsp:include page="../admin/admin-leftbar.jsp"></jsp:include>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">
						  <div class="row justify-content-center">
							<div class="col-lg-8 mb-4 order-0 welcome-message">
								<div class="container-fluid">
									<div class="card">
										<div class="card-body">
											<h2 class="card-title text-primary">비밀번호 변경</h2>
											<hr>
											<p class="content">안전한 비밀번호로 내 정보를 보호하세요.<br>
											
												<em>다른 아이디/사이트에서 사용한 적 없는 비밀번호</em>
												<br>
											
												<em>이전에 사용한 적 없는 비밀번호</em>가 안전합니다.
											</p>

											<!-- content -->
											<form id="changePassword" method="POST" action="../user/update-pwd"  autocomplete="off">
											  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											    <input type="hidden" id="userEmail" name="userEmail" value="${email}">
											  
												<div class="changepassword">

												 
													<div class="form-group">
														<label for="usedpwd">현재비밀번호</label> <input type="text"
															class="form-control" id="usedPwd"
															placeholder="비밀번호를 입력하세요" name="usedPwd" required>
													</div>
													
													<div id="message"></div>
												
												  
													<div class="form-group new" >
														<label for="newpwd">새 비밀번호</label> <input type="text"
															class="form-control" id="newPwd"
															placeholder="비밀번호를 입력하세요" name="newPwd" required>
													</div>
													<div id="message1"></div>
													<br>
													<div class="form-group new">
														<label for="checkpwd">새 비밀번호 확인</label> <input type="text"
															class="form-control" id="checkPwd"
															placeholder="비밀번호를 입력하세요" name="checkPwd" required>
													</div>
													
													
													<div class="btnArea">
														<button type="submit" class="btn btn-secondary"
															id="saveButton">저장</button>
														<button type="button" class="btn btn-secondary"
															id="cancelButton">취소</button>
													</div>
												</div>
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
	</div>




	<!-- Footer -->
	<footer class="content-footer footer bg-footer-theme"
		style="padding-top: 20px;">
		<div
			class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
			<div class="mb-2 mb-md-0">
				©
				<script>
					document.write(new Date().getFullYear());
				</script>
				(주)WidUs
			</div>
			<div>
				<a href="https://themeselection.com/license/"
					class="footer-link me-4" target="_blank">License</a> <a
					href="https://themeselection.com/" target="_blank"
					class="footer-link me-4">More Themes</a> <a
					href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
					target="_blank" class="footer-link me-4">Documentation</a>

				<a
					href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
					target="_blank" class="footer-link me-4">Support</a>
			</div>
		</div>

	</footer>
	<!-- Footer -->

	<div class="content-backdrop fade"></div>
	
	<!-- Content wrapper -->
	
	<!-- / Layout page -->
	

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	
	<!-- / Layout wrapper -->
	
	<jsp:include page="../template/jsTemplate.jsp"></jsp:include>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>