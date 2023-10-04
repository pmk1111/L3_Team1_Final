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

<title>WidUs - 이슈 상세보기</title>
<meta name="description" content="" />

<!-- JQuery cdn -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<jsp:include page="../template/cssTemplate.jsp"></jsp:include>

<!-- issue-list & issue-create CSS -->
<link rel="stylesheet" href="../resources/issue/css/issue-list.css">
<link rel="stylesheet" href="../resources/issue/css/issue-create.css">


<!-- dropzone -->
<!--  <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />-->
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

					<jsp:include page="../chat/chat.jsp"></jsp:include>
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">

							<!-- Total Revenue -->
							<div
								class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list">
								<div class="card">

									<div class="card-body issue-list-card-body">
										<h3 style="margin-bottom: 30px; font-weight: 700;">전체 이슈</h3>
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
													<li><span>유형</span>
														<div class="custom-select">
															<div class="custom-selected">To Do</div>
															<div class="custom-options">
																<div class="custom-option" data-value="To Do">To
																	Do</div>
																<div class="custom-option" data-value="In Progress">In
																	Progress</div>
																<div class="custom-option" data-value="Resolved">Resolved</div>
																<div class="custom-option" data-value="Done">Done</div>
															</div>
														</div></li>
													<li><span>중요도</span>
														<div class="custom-select">
															<div class="custom-selected">low</div>
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
	
	<jsp:include page="issuecreate.jsp"></jsp:include>
	
	<!-- common js -->
	<jsp:include page="../template/jsTemplate.jsp"></jsp:include>

	<!-- issue-list JS -->
	<script src="../resources/issue/js/issuelist.js"></script>
	
	<!-- issuecreate.js -->
	<script src="../resources/issue/js/issuecreate.js"></script>



	
</body>
</html>