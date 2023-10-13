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

<link rel="stylesheet" href="/css/search-bar.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

<style>
table {
	width: 100%;
	margin: 0 auto;
}

.card {
	box-shadow: 0 20px 27px 0 rgba(0, 0, 0, 0.05);
}

.avatar.sm {
	width: 2.25rem;
	height: 2.25rem;
	font-size: .818125rem;
}

.table-nowrap .table td, .table-nowrap .table th {
	white-space: nowrap;
}

.table>:not(caption)>*>* {
	padding: 0.75rem 1.25rem;
	border-bottom-width: 1px;
}

table th {
	font-weight: 600;
	background-color: #eeecfd !important;
}

.fa-arrow-up {
	color: #00CED1;
}

.fa-arrow-down {
	color: #FF00FF;
}

.hover-lift-light {
	transition: box-shadow .25s ease, transform .25s ease, color .25s ease,
		background-color .15s ease-in;
}

.text-decoration-none {
	text-decoration: none !important;
}

.py-4 {
	padding-top: 1.5rem !important;
	padding-bottom: 1.5rem !important;
}

.align-items-center {
	align-items: center !important;
}

.border-0 {
	border: 0 !important;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(30, 46, 80, .09);
	border-radius: 0.25rem;
}

.icon-circle {
	position: relative;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 3.2rem;
	height: 3.2rem;
	border-radius: 50%;
}

.bg-pastel-primary {
	background-color: #e9f3ff !important;
}

.mt-6 {
	margin-top: 4rem !important;
}

.mb-4 {
	margin-bottom: 1.5rem !important;
}

.badge {
	padding: 0.4rem 0.65rem 0.25rem;
}

.text-uppercase-bold-sm {
	text-transform: uppercase !important;
	font-weight: 500 !important;
	letter-spacing: 2px !important;
	font-size: .85rem !important;
}

.icon-circle[class*=text-] [fill]:not([fill=none]), .icon-circle[class*=text-] svg:not([fill=none]),
	.svg-icon[class*=text-] [fill]:not([fill=none]), .svg-icon[class*=text-] svg:not([fill=none])
	{
	fill: currentColor !important;
}

.shadow-sm {
	box-shadow: 0 .125rem .25rem rgba(35, 38, 45, .09) !important;
}

.input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3),
	.input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu)
	{
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.input-group-lg>.btn, .input-group-lg>.form-control, .input-group-lg>.form-select,
	.input-group-lg>.input-group-text {
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	border-radius: 0.3rem;
}

.input-group-text {
	display: flex;
	align-items: center;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #1f2c73;
	text-align: center;
	white-space: nowrap;
	background-color: #fff;
	border: 1px solid #dee2e6;
	border-radius: 0.25rem;
}

/* 추가된 스타일: 드롭다운 초기 숨김 */
.sub-row {
	display: none;
}

/* 추가된 스타일: 드롭다운 표시 스타일링 */
.main-row.open .sub-row {
	display: table-row;
	margin-left: 20px; /* 들여쓰기를 조절하기 위한 스타일 추가 */
}

/* 추가된 스타일: 상위 행 클릭 가능한 커서 스타일 */
.main-row {
	cursor: pointer;
}
</style>
<script>
 $(function(){
	 $("button").click(function(){
		 if($input.val() == ''){
			 alert("검색어를 입력하세요");
			 return false;
		 }
	 })
 })
</script>
</head>

<body>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
			<!-- / Menu -->
			<div class="layout-page">
				<!-- Navbar -->
				<jsp:include page="../mainboard/navbar.jsp"></jsp:include>
				<!-- / Navbar -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">
							<div class="col-lg-12 mb-4 order-0 welcome-message">
								<div class="container-fluid">
									<div class="card">
										<div class="card-body">
											<h1>내 작업보드</h1>
											<form class="mt-4">
												<div class="input-group input-group-lg shadow-sm">
													<span class="input-group-text border-0"> <i
														class="fas fa-search fa-xs text-secondary mb-1"></i>
													</span> <input type="text" name="search_word" id="searchInput"
														class="form-control bg-white border-0 px-1"
														placeholder="도움 주제 검색..."> <span
														class="input-group-text border-0 py-1 pe-2">
														<button type="submit"
															class="btn btn-primary text-uppercase-bold-sm">
															검색</button>
													</span>
												</div>
											</form>
											<c:if test="${totalmywork > 0 }">
											<table class="table">
												<thead>
													<tr>
														<th>프로젝트 이름</th>
														<th>시작일</th>
														<th>종료일</th>
														<th>상태</th>
													</tr>
												</thead>
												<tbody>
													<!-- 프로젝트 1 -->
													<tr class="main-row">
														<td class="main-cell">프로젝트 1</td>
														<td>2023-01-15</td>
														<td>2023-03-30</td>
														<td>진행 중</td>
													</tr>
													<!-- 이슈 1 -->
													<tr class="sub-row" style="display: none;">
														<td class="sub-cell">이슈 1</td>
														<td>2023-01-15</td>
														<td>2023-03-30</td>
														<td>진행 중</td>
													</tr>
													<!-- 프로젝트 2 -->
													<tr class="main-row">
														<td class="main-cell">프로젝트 2</td>
														<td>2023-02-10</td>
														<td>2023-04-20</td>
														<td>진행 중</td>
													</tr>
													<!-- 이슈 2 -->
													<tr class="sub-row" style="display: none;">
														<td class="sub-cell">이슈 2</td>
														<td>2023-01-15</td>
														<td>2023-03-30</td>
														<td>진행 중</td>
													</tr>
												</tbody>
											</table>
											</c:if>
										</div>
									</div>
								</div>




	                    <%-- 회원이 없는 경우 --%>
	                    <c:if test="${totalmywork == 0 && empty search_word }">
	                       <h1>내 업무가 없습니다.</h1>
	                    </c:if>
	                    
	                                <%-- 회원이 없는 경우 --%>
	                    <c:if test="${totalmywork == 0 && !empty search_word }">
	                       <h1>검색 결과가 없습니다.</h1>
	                    </c:if>
                       
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
			</div>
		</div>
	</div>

	<!-- / Layout page -->


	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>

	<!-- / Layout wrapper -->
	
	
	

	<!-- Core JS -->
	<script
		src="../resources/mainboard/assets/vendor/libs/jquery/jquery.js"></script>
	<script
		src="../resources/mainboard/assets/vendor/libs/popper/popper.js"></script>
	<script src="../resources/mainboard/assets/vendor/js/bootstrap.js"></script>
	<script
		src="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="../resources/mainboard/assets/vendor/js/menu.js"></script>
	<!-- Vendors JS -->
	<script
		src="../resources/mainboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>
	<!-- Main JS -->
	<script src="../resources/mainboard/assets/js/main.js"></script>
	<!-- Page JS -->
	<script src="../resources/mainboard/assets/js/dashboards-analytics.js"></script>
    <script>
                    // 클릭 이벤트 핸들러
      document.addEventListener("click", function (e) {
       // 클릭한 요소가 .main-row 클래스를 가진 <tr> 또는 .main-cell 클래스를 가진 <td>인지 확인
       if (e.target.classList.contains('main-row') || e.target.classList.contains('main-cell')) {
                            // 클릭한 <tr> 또는 <td>의 부모인 <tr> 요소 (상위 행) 찾기
                            var mainRow = e.target.closest('.main-row');

                            // 클릭한 상위 행의 다음 형제인 하위 행 찾기
                            var nextTr = mainRow.nextElementSibling;

                            // 다음 <tr>에 대한 스타일 변경 (드롭다운 열기/닫기)
                            if (nextTr.style.display === "none") {
                                nextTr.style.display = "table-row";
                                mainRow.classList.add('open');
                            } else {
                                nextTr.style.display = "none";
                                mainRow.classList.remove('open');
                            }
                        }
                    });
   </script>
                
                



	
</body>
</html>
