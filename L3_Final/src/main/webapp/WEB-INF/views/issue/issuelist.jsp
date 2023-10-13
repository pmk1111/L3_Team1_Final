<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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





.custom-file-upload {
  border: 2px solid #ccc;
  display: inline-block;
  padding: 6px 12px;
  cursor: pointer;
  text-align: center;
  background-color: #f2f2f2;
  border-radius: 4px;
}

.custom-file-upload input[type="file"] {
  display: none;
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
										<form name="search-form" autocomplete="off" method="post">
										<div class="search-create">
											<div class="search-area">
												<input type="text" class="issue-search" id="searchInput" name="searchText"
													placeholder="제목 또는 작성자를 검색하세요">
												<input type="button" onclick="getSearchList()" value="검색">
											</div>
											<button type="button" class="create-issue">글쓰기</button>
										</div>
										
										</form>
										<hr>

										<div class="search-title">
											<span class="search-result-title">전체 <span
												class="all-issue-count">${listcount}</span></span>
											<div class="issue-filter">
												<img src="../resources/issue/img/filter.svg"> <span>필터</span>
											</div>
											<div class="filter-dropdown">
											<form name="filter-form" autocomplete="off" method="post">
												<ul class="dropdown-items">
													<li><span>유형</span>
														<div class="custom-select">
															<div class="custom-selected"  id="issueType">-</div>
															<div class="custom-options">
																<div class="custom-option" data-value="-">-</div>
																<div class="custom-option" data-value="To Do">To Do</div>
																<div class="custom-option" data-value="In Progress">In Progress</div>
																<div class="custom-option" data-value="Resolved">Resolved</div>
																<div class="custom-option" data-value="Done">Done</div>
															</div>
														</div></li>
													<li><span>중요도</span>
														<div class="custom-select">
															<div class="custom-selected" id="issuePriority">-</div>
															<div class="custom-options">
																<div class="custom-option" data-value="-">-</div>
																<div class="custom-option" data-value="low">low</div>
																<div class="custom-option" data-value="middle">middle</div>
																<div class="custom-option" data-value="high">high</div>
																<div class="custom-option" data-value="critical">critical</div>
															</div>
														</div></li>
												</ul>
													</form>
											</div>


										</div>

										<div class="issue-area">

											<ul class="all-issue-list">

												<c:choose>
													<c:when test="${empty issuelist}">
														<h1>데이터가 없습니다.</h1>
													</c:when>
													<c:otherwise>
														<c:forEach var="i" items="${issuelist}">
															<li class="list">
																<div class="issuetype-wrap">

																	<c:choose>
																		<c:when test="${i.issue_type eq '버그'}">
																			<img src="../resources/issue/img/bug.svg"
																				class="issuetype-icon">
																		</c:when>
																		<c:when test="${i.issue_type eq '에픽'}">
																			<img src="../resources/issue/img/epic.svg"
																				class="issuetype-icon">
																		</c:when>
																		<c:when test="${i.issue_type eq '작업'}">
																			<img src="../resources/issue/img/task.svg"
																				class="issuetype-icon">
																		</c:when>
																	</c:choose>


																	<span class="issuetype">${i.issue_type}</span> <a
																		href="issuedetail?num=${i.issue_id}"> <span
																		class="issue-title">${i.issue_subject}</span>
																	</a>
																</div>

																<div class="issuewriter-created">
																	<span class="issue-writer">${i.create_user}</span> 
																	<span class="issue-created">${i.issue_created.substring(0, 10)}</span>
																</div>
															</li>
														</c:forEach>
													</c:otherwise>
												</c:choose>

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