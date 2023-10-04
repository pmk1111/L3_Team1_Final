<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../resources/mainboard/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>WidUs - ProjectList</title>
<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../resources/mainboard/assets/img/favicon/favicon.ico" />

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

<!-- issue-list CSS -->
<link rel="stylesheet" href="../resources/issue/css/issue-list.css">
<!-- Helpers -->
<script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../resources/mainboard/assets/js/config.js"></script>

<!-- JQuery cdn -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
.leftbar-close {
	background-color: #9F7AB0;
	border-radius: 50%;
}
</style>
</head>
<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<jsp:include page="../mainboard/navbar.jsp"></jsp:include>

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">

							<!-- Total Revenue -->
							<div
								class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list">
								<div class="card">

									<div class="card-body issue-list-card-body">
										<h3 style="margin-bottom: 30px; font-weight: 700;">프로젝트
											리스트</h3>
										<div class="search-create">
											<input type="text" class="issue-search"
												placeholder="검색어를 입력하세요.">
											<button type="button" class="create-issue">글쓰기</button>
										</div>
										<hr>

										<div class="search-title">
											<span class="search-result-title">전체 <span
												class="all-issue-count">1</span></span>
											<div class="issue-filter">
												<img src="../resources/issue/img/filter.svg"> <span>필터</span>
											</div>
											<div class="filter-dropdown">
												<ul class="dropdown-items">
													<li><span>어쩌구</span>
														<div class="custom-select">
															<div class="custom-selected">일반</div>
															<div class="custom-options">
																<div class="custom-option" data-value="To Do">To
																	Do</div>
																<div class="custom-option" data-value="In Progress">In
																	Progress</div>
																<div class="custom-option" data-value="Resolved">Resolved</div>
																<div class="custom-option" data-value="Done">Done</div>
															</div>
														</div></li>
													<li><span>저쩌구</span>
														<div class="custom-select">
															<div class="custom-selected">즐겨찾기</div>
															<div class="custom-options">
																<div class="custom-option" data-value="low">low</div>
																<div class="custom-option" data-value="middle">middle</div>
																<div class="custom-option" data-value="high">high</div>
																<div class="custom-option" data-value="critical">critical</div>
															</div>
														</div></li>
												</ul>
											</div>

										</div>

										<div class="issue-area">
											<ul class="all-issue-list">

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/bug.svg"
															class="issuetype-icon"> <span class="issuetype">버그</span>
														<span class="issue-title">잘 쓸께요</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">JJOK</span> <span
															class="issue-created">2023-09-25</span>
													</div>
												</li>
												
												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/bug.svg"
															class="issuetype-icon"> <span class="issuetype">버그</span>
														<span class="issue-title">이 게시판은 이제 제껍니다</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">JJOK</span> <span
															class="issue-created">2023-09-25</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/bug.svg"
															class="issuetype-icon"> <span class="issuetype">버그</span>
														<span class="issue-title">AWS 요금이 500만원이 나왔습니다.</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">MKP</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/task.svg"
															class="issuetype-icon"> <span class="issuetype">작업</span>
														<span class="issue-title">퇴근 전에 안쓰는 EC2 꼭 끄세요.</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">MKP</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/bug.svg"
															class="issuetype-icon"> <span class="issuetype">버그</span>
														<span class="issue-title">새 프로젝트 생성이 안되는 버그</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">홍길동</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/bug.svg"
															class="issuetype-icon"> <span class="issuetype">버그</span>
														<span class="issue-title">특정 페이지 페이로드 안 되는 이슈</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/task.svg"
															class="issuetype-icon"> <span class="issuetype">작업</span>
														<span class="issue-title">프로젝트 생성 작업 관련 정보</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">이재용</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/epic.svg"
															class="issuetype-icon"> <span class="issuetype">에픽</span>
														<span class="issue-title">프로젝트 생성, 및 삭제 기능 추가</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/bug.svg"
															class="issuetype-icon"> <span class="issuetype">버그</span>
														<span class="issue-title">새 프로젝트 생성이 안되는 버그</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">홍길동</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/bug.svg"
															class="issuetype-icon"> <span class="issuetype">버그</span>
														<span class="issue-title">특정 페이지 페이로드 안 되는 이슈</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/task.svg"
															class="issuetype-icon"> <span class="issuetype">작업</span>
														<span class="issue-title">프로젝트 생성 작업 관련 정보</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">이재용</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/epic.svg"
															class="issuetype-icon"> <span class="issuetype">에픽</span>
														<span class="issue-title">프로젝트 생성, 및 삭제 기능 추가</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/epic.svg"
															class="issuetype-icon"> <span class="issuetype">에픽</span>
														<span class="issue-title">프로젝트 생성, 및 삭제 기능 추가</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/epic.svg"
															class="issuetype-icon"> <span class="issuetype">에픽</span>
														<span class="issue-title">프로젝트 생성, 및 삭제 기능 추가</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/epic.svg"
															class="issuetype-icon"> <span class="issuetype">에픽</span>
														<span class="issue-title">프로젝트 생성, 및 삭제 기능 추가</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/epic.svg"
															class="issuetype-icon"> <span class="issuetype">에픽</span>
														<span class="issue-title">프로젝트 생성, 및 삭제 기능 추가</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>

												<li class="list">
													<div class="issuetype-wrap">
														<img src="../resources/issue/img/epic.svg"
															class="issuetype-icon"> <span class="issuetype">에픽</span>
														<span class="issue-title">프로젝트 생성, 및 삭제 기능 추가</span>
													</div>

													<div class="issuewriter-created">
														<span class="issue-writer">마이콜</span> <span
															class="issue-created">2023-09-23</span>
													</div>
												</li>
											</ul>
										</div>
										<!-- issue-area -->


									</div>
								</div>
								<!-- issue-card end -->

							</div>
						</div>
					</div>
					<!--/ Total Revenue -->
				</div>

			</div>
			<!-- / Layout page -->

		</div>

	</div>

	<!-- Layout-Wrapper end -->

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

	<!-- issue-list JS -->
	<script src="../resources/issue/js/issuelist.js"></script>
</body>
</html>