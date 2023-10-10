<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../resources/mainboard/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>구성원 관리</title>
<meta name="description" content="" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="../resources/admin/js/employee_list.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../resources/mainboard/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../resources/mainboard/assets/js/config.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.tab1_style {
	width: 800px;
	margin: 0 auto;
	margin-top: 50px;
}

.nav-tabs .nav-item .nav-link:not(.active) {
	background-color: white;
	border: 1px solid #d9dee3
}

.nav-tabs .nav-item .nav-link.active {
	border: 3px solid #307cff;
	padding-bottom: 5px;
	cursor: default;
	font-weight: bold;
}

.card {
	height: 80vh; /* 화면 높이에 80% 맞춤 */
	width: 100%;
}

.tab-pane {
	display: none;
}

/* 활성 탭 내용만 표시 */
.tab-pane.active {
	display: block;
}

.col-lg-8 {
	flex: 0 0 auto;
	width: 100%;
}


 .nav-tabs {
	padding-bottom: 1px;
    border-bottom: 1px solid #d9dee3;
}

.tab1_style {
    width: 100%;
}
tbody tr {
	text-align: center;
}

button {
	background-color: white;
	font-size: 13px;
	border: none;
	padding-left: 0px;
	color: #697A8D;
}

.auth-delete {
	color: red;
	font-size: 12px;
	padding-left: 6px;
}

 p {
	display: inline;
	font-size:13px;
}

</style>

</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<jsp:include page="../mainboard/Admin_leftbar.jsp"></jsp:include>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<%--         <jsp:include page="navbar.jsp"></jsp:include>
 --%>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">
							<div class="col-lg-8 mb-4 order-0 welcome-message">
								<div class="container-fluid">
									<div class="card">
										<div class="card-body">
											<h2 class="card-title text-primary">구성원 관리</h2>
											<hr>
											<p class="mb-4">

												<!-- content -->

												<!-- 탭 -->
											<div id="head-tab" class="tab1_style mgt30"
												style="margin-left: 0px;">
												<ul class="nav nav-tabs">
													<li class="nav-item"><a class="nav-link active"
														data-toggle="tab" data-tab="useruse" href="#useruse"><span>정상</span> <c:choose>
																<c:when test="${employeecount > 0}">
																	<small><b>[&nbsp;<c:out
																				value="${employeecount}" />&nbsp;]
																	</b></small>
																</c:when>
																<c:otherwise>
																	<small><b>[&nbsp;0&nbsp;]</b></small>
																</c:otherwise>
															</c:choose> </a></li>
													<li class="nav-item"><a class="nav-link"
														data-toggle="tab" data-tab="userstop" href="#userstop"><span>이용중지</span> <c:choose>
																<c:when test="${stopemployeecount > 0}">
																	<small><b>[&nbsp;<c:out
																				value="${stopemployeecount}" />&nbsp;]
																	</b></small>
																</c:when>
																<c:otherwise>
																	<small><b>[&nbsp;0&nbsp;]</b></small>
																</c:otherwise>
															</c:choose> </a></li>
													<li class="nav-item"><a class="nav-link"
														data-toggle="tab" data-tab="userwait" href="#userwait"><span>가입대기</span> <c:choose>
																<c:when test="${count > 0}">
																	<small><b>[&nbsp;<c:out value="${count}" />&nbsp;]
																	</b></small>
																</c:when>
																<c:otherwise>
																	<small><b>[&nbsp;0&nbsp;]</b></small>
																</c:otherwise>
															</c:choose> </a></li>
												</ul>

											</div>

											<br>
											<!-- 검색 -->
											<div id="search">
												<form action="list" method="post">
													<div class="input-group" style="width: 50%">
														<select id="viewcount" name="search_field"
															style="border: 1px solid #d9dee3;">
															<option value="4" selected>전체</option>
															<option value="0" >이름</option>
															<option value="1">이메일</option>
															<option value="2">부서</option>
															<option value="3">직책</option>
														</select> <input name="search_word" type="text"
															class="form-control" style="height: 38.55px;"
															placeholder="검색어를 입력하세요" value="${search_word}">
														<button class="btn btn-primary" id="searchBtn" type="submit">검색</button>
													</div>
												</form>
								


											<br>
											<div id="content">
												<div class="tab-pane fade show active" id="useruse">
													<table class="table">
														<tr>
															<th>프로필</th>
															<th>사원번호</th>
															<th>이름</th>
															<th>부서</th>
															<th>직책</th>
															<th>이메일</th>
															<th>휴대폰번호</th>
															<th>상태</th>
															<th>관리자</th>
														</tr>



														<c:choose>
															<c:when test="${empty employee}">
																<tr>
																	<td colspan="10" style="border-bottom: none">조회된
																		데이터가 없습니다.</td>
																</tr>
															</c:when>
															<c:otherwise>
																<c:forEach var="emp" items="${employee}">
																	<tr>
																			<td><c:choose>
																				<c:when test="${empty stop.user_photo}">
																					<!-- user_photo가 비어있을 때, 기본 이미지 표시 -->
																				<img src="<c:url value='/img/profile.png' />" alt="프로필 사진" width="25" height="25">
																				</c:when>
																				<c:otherwise>
																					<!-- user_photo가 비어있지 않을 때, 사용자의 이미지 표시 -->
																					  <img src="<c:url value='/usrupload/' />${emp.user_photo}" alt="프로필 사진" width="25" height="25">
																						프로필 사진" width="25" height="25">
																				</c:otherwise>
																			</c:choose></td>
																		<td><c:out value="${emp.employee_no}" /></td>
																		<td><c:out value="${emp.user_name}" /></td>
																		<td><c:out value="${emp.department}" /></td>
																		<td><c:out value="${emp.position}" /></td>
																		<td><c:out value="${emp.user_email}" /></td>
																		<td><c:out value="${emp.user_phone}" /></td>
																		<td>
																			 <p>정상</p>
																			<button class="user-stop" data-employee_no="${emp.employee_no }" >[이용중지]</button>
																		</td>
																		<td>
																			<span class="employee-auth-value"><c:out value="${emp.employee_auth}" /></span>
																			<button class="auth-delete" data-employee_no="${emp.employee_no }">[삭제]</button></td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</table>
												</div>
												<div class="tab-pane fade" id="userstop">
													<table class="table">
														<tr>
															<th>프로필</th>
															<th>사원번호</th>
															<th>이름</th>
															<th>부서</th>
															<th>직책</th>
															<th>이메일</th>
															<th>휴대폰번호</th>
															<th>상태</th>
															<th>관리자</th>
														</tr>

														<c:choose>
															<c:when test="${empty stopEmployee}">
																<tr>
																	<td colspan="10" style="border-bottom: none">조회된
																		데이터가 없습니다.</td>
																</tr>
															</c:when>
															<c:otherwise>
																<c:forEach var="stop" items="${stopEmployee}">
																	<tr>
																		<td><c:choose>
																				<c:when test="${empty stop.user_photo}">
																					<!-- user_photo가 비어있을 때, 기본 이미지 표시 -->
																					<img
																						src="${pageContext.request.contextPath}/user/img/profile.png"
																						alt="프로필 사진" width="25" height="25">
																				</c:when>
																				<c:otherwise>
																					<!-- user_photo가 비어있지 않을 때, 사용자의 이미지 표시 -->
																					<img src="<c:out value="${stop.user_photo}" /> alt="
																						프로필 사진" width="25" height="25">
																				</c:otherwise>
																			</c:choose></td>
																		<td><c:out value="${stop.employee_no}" /></td>
																		<td><c:out value="${stop.user_name}" /></td>
																		<td><c:out value="${stop.department}" /></td>
																		<td><c:out value="${stop.position}" /></td>
																		<td><c:out value="${stop.user_email}" /></td>
																		<td><c:out value="${stop.user_phone}" /></td>
																		<td>
																			<p>이용중지</p>
																			<button class="user-use" data-employee_no="${stop.employee_no }" >[정상]</button>
																		</td>
																		<td><span class="employee-auth-value"><c:out value="${stop.employee_auth}" /></span>
																			<button class="auth-delete">[삭제]</button></td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</table>
												</div>
												<div class="tab-pane fade" id="userwait">
													<table class="table">
														<tr>
															<th>프로필</th>
															<th>이름</th>
															<th>이메일</th>
															<th>가입요청일</th>
															<th>설정</th>
														</tr>

														<c:choose>
															<c:when test="${empty user}">
																<tr>
																	<td colspan="10" style="border-bottom: none">조회된
																		데이터가 없습니다.</td>
																</tr>
															</c:when>
															<c:otherwise>
																<c:forEach var="user" items="${user}">
																	<tr>
																		<td><c:choose>
																				<c:when test="${empty emp.user_photo}">
																					<!-- user_photo가 비어있을 때, 기본 이미지 표시 -->
																					<img
																						src="${pageContext.request.contextPath}/user/img/profile.png"
																						alt="프로필 사진" width="25" height="25">
																				</c:when>
																				<c:otherwise>
																					<!-- user_photo가 비어있지 않을 때, 사용자의 이미지 표시 -->
																					<img src="<c:out value="${emp.user_photo}" /> alt="
																						프로필 사진" width="25" height="25">
																				</c:otherwise>
																			</c:choose></td>
																		<td><c:out value="${user.user_name}" /></td>
																		<td><c:out value="${user.user_email}" /></td>
																		<td><c:out value="${user.user_create}" /></td>
																		<td>
																			<button class="approveUser"
																				data-userid="${user.user_id}">[승인]</button>
																			<button class="rejectUser"
																				data-userid="${user.user_id})">[거절]</button>
																		</td>

																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</table>
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
										document
												.write(new Date().getFullYear());
									</script>
									(주)WidUs
								</div>
								<div>
									<a href="https://themeselection.com/license/"
										class="footer-link me-4" target="_blank">License</a> <a
										href="https://themeselection.com/" target="_blank"
										class="footer-link me-4">More Themes</a> <a
										href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
										target="_blank" class="footer-link me-4">Documentation</a> <a
										href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
										target="_blank" class="footer-link me-4">Support</a>
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
	</div>
	</div>
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script
		src="../resources/mainboard/assets/vendor/libs/jquery/jquery.js"></script>
	<script
		src="../resources/mainboard/assets/vendor/libs/popper/popper.js"></script>
	<script src="../resources/mainboard/assets/vendor/js/bootstrap.js"></script>
	<script
		src="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../resources/mainboard/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script
		src="../resources/mainboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script src="../resources/mainboard/assets/js/main.js"></script>

	<!-- Page JS -->
	<script src="../resources/mainboard/assets/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>