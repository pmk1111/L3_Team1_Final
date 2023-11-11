<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
	  data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

	<title>WidUs - 이슈 상세보기</title>
	<meta name="description" content="" />

	<!-- JQuery cdn -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery.textcomplete/1.8.5/jquery.textcomplete.min.js"></script>

	<jsp:include page="../template/cssTemplate.jsp"></jsp:include>
	<!-- issue-list & issue-create CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/issue/css/issue-list.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/issue/css/issue-create.css">
	<style>
		.card {
			 min-width: 720px;
		}
		
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
		<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list">
			<div class="card">
				<div class="card-body issue-list-card-body">
					<h3 style="margin-bottom: 30px; font-weight: 700;">전체 이슈</h3>
					<form name="search-form" autocomplete="off" method="post">
						<div class="search-create">
							<div class="search-area">
								<input type="text" class="issue-search" id="searchInput" name="searchText" placeholder="이슈 제목을 입력하세요">
								<input type="button" id="search-btn" onclick="getSearchList()" value="검색">
								<label for="search-btn" class="search-label">
									<img class="search-btn-icon" src="../resources/project/img/projectboard/search.svg">
								</label>
							</div>

							<div class="paging-create-btn">
								<div class="center-block">
									<ul class="pagination justify-content-center">
										<c:if test="${page <= 1}">
											<li class="page-item">
												<a class="page-link gray">이전&nbsp;</a>
											</li>
										</c:if>
										<c:if test="${page > 1}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/issue/issue-list?page=${page-1}">이전&nbsp;</a>
											</li>
										</c:if>
										<c:forEach var="a" begin="${startPage}" end="${endPage}">
											<c:if test="${a == page}">
												<li class="page-item active">
													<a class="page-link">${a}</a>
												</li>
											</c:if>
											<c:if test="${a != page}">
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/issue/issue-list?page=${a}">${a}</a>
												</li>
											</c:if>
										</c:forEach>
										<c:if test="${page >= totalPage}">
											<li class="page-item">
												<a class="page-link gray">&nbsp;다음</a>
											</li>
										</c:if>
										<c:if test="${page < totalPage}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/issue/issue-list?page=${page+1}">&nbsp;다음</a>
											</li>
										</c:if>
									</ul>
								</div>
								<button type="button" class="create-issue" onclick="getProjectIdAndTeam()">글쓰기</button>
							</div>
						</div>
					</form>
					<hr>
					<div class="search-title">
						<span class="search-result-title">전체 
							<span class="all-issue-count">${listcount}</span>
						</span>
						<div class="issue-filter">
							<img src="../resources/issue/img/filter.svg">
							<span>필터</span>
						</div>
						<div class="filter-dropdown">
						<form name="filter-form" autocomplete="off" method="post">
							<ul class="dropdown-items">
								<li><span>유형</span>
									<div class="custom-select">
										<div class="custom-selected" id="issueStatus">-</div>
										<div class="custom-options">
											<div class="custom-option" data-value="To Do">To Do</div>
											<div class="custom-option" data-value="In Progress">In Progress</div>
											<div class="custom-option" data-value="Resolved">Resolved</div>
											<div class="custom-option" data-value="Done">Done</div>
										</div>
									</div>
								</li>
								<li><span>중요도</span>
									<div class="custom-select">
										<div class="custom-selected" id="issuePriority">-</div>
										<div class="custom-options">
											<div class="custom-option" data-value="low">low</div>
											<div class="custom-option" data-value="middle">middle</div>
											<div class="custom-option" data-value="high">high</div>
											<div class="custom-option" data-value="critical">critical</div>
										</div>
									</div>
								</li>
								<li>
									<span class="clear-filter">필터 초기화</span>
								</li>
							</ul>
						</form>
					</div>
				</div>
				<div class="issue-area">
					<ul class="all-issue-list">
					<c:choose>
						<c:when test="${empty issuelist}">
							<img class="no-issue-content" src="../resources/issue/img/no-issue-content.png">
							<p class="no-issue-text">작성된 이슈가 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" items="${issuelist}">
								<li class="list">
									<div class="issuetype-wrap">
									<c:choose>
										<c:when test="${i.type eq '버그'}">
											<img src="../resources/issue/img/bug.svg" class="issuetype-icon">
										</c:when>
										<c:when test="${i.type eq '에픽'}">
											<img src="../resources/issue/img/epic.svg" class="issuetype-icon">
										</c:when>
										<c:when test="${i.type eq '작업'}">
											<img src="../resources/issue/img/task.svg" class="issuetype-icon">
										</c:when>
									</c:choose>
									<span class="issuetype">${i.type}</span>
									<a class="issue-title-anchor" href="issue-detail?num=${i.id}">
										<span class="issue-title">${i.subject}</span>
									</a>
								</div>
								<div class="issuewriter-created">
								<c:choose>
									<c:when test="${i.priority == 'low'}">
										<span class="low">${i.priority}</span>
									</c:when>
									<c:when test="${i.priority == 'middle'}">
										<span class="middle">${i.priority}</span>
									</c:when>
									<c:when test="${i.priority == 'high'}">
										<span class="high">${i.priority}</span>
									</c:when>
									<c:otherwise>
										<span class="critical">${i.priority}</span>
									</c:otherwise>
							 	</c:choose>
							 	<span class="issue-writer">${i.create_user_name}</span>
							 	<span class="issue-created">${i.created_at.substring(2,10)}</span>
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
	<!-- Footer -->
	<footer class="content-footer footer bg-footer-theme">
		<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
			<div class="mb-2 mb-md-0">©
			<script>
				document.write(new Date().getFullYear());
			</script>
			주)WidUs
			</div>
			<div>
				<a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
				<a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>
				<a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>
				<a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
			</div>
		</div>
	</footer>
	<!-- Footer -->
<!--/ Total Revenue -->
	</div>
	</div><!-- / Layout page -->
	</div>
	</div>
	<jsp:include page="issue-create.jsp"></jsp:include>
	
	<!-- common js -->
	<jsp:include page="../template/jsTemplate.jsp"></jsp:include>

	 <!-- issue-list JS -->
	 <script src="${pageContext.request.contextPath}/issue/js/issuelist.js"></script>

	<!-- issuecreate.js -->
	<script src="${pageContext.request.contextPath}/issue/js/issuecreate.js"></script>

	</body>
</html>