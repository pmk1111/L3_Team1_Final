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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>WidUs · 가입대기</title>
<meta name="description" content="" />

<link rel="icon" type="image/x-icon"
			href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="../resources/user/js/wait-approve.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../template/cssTemplate.jsp"></jsp:include>
<link rel="stylesheet" href="../resources/user/css/wait-approve.css" />

<!-- Helpers -->
<script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../resources/mainboard/assets/js/config.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>

<body>

	<div class="container">
		<div class="card">
			<form action="admin/wait-approve" method="GET">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
					 
				
				<h2 style="text-align: center; margin-top: 100px;">가입 요청 완료</h2>
				<img src="../resources/admin/image/wait.png"
					style="width: 400px; height: 300px; margin-left: 37%;" /> <br>
				<h4 style="text-align: center;">회사 관리자에게 가입 요청</h4>
				<p style="text-align: center;">관리자 승인 완료 시 접속할 수 있습니다.
				
				<div style="display: flex; justify-content: space-evenly; align-items: center; flex-direction: row; margin-top: 5%">
				
					<div class="moveToLogin" style="margin-left:20%">
						<button type="button" class="button button--nuka button--round-s button--text-thick btn_move" style="width:250px;">로그인페이지로 이동</button>
					</div>
									
					<div class="cancelwait" style="margin-right:20%">
						<button type="button" class="button button--nuka button--round-s button--text-thick btn_cancel" style="width:250px;">가입 요청 취소</button>
					</div>					
				
				</div>
			</form>
		</div>
	</div>

</body>
</html>