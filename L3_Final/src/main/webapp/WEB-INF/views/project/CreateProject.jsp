<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 생성</title>

    <link href="../resources/project/css/createProject.css" rel="stylesheet">
</head>
<body>
	<form action="Create" method="get" name="projectform">
	<div class="create-header">
		<a class="create-close"></a>
	</div>

	<div class="card">
		<div class="CreateProject">
			<div style="display:flex; justify-content: space-between; border-bottom: 1px solid #ccc; padding-bottom: 20px;">
				<span id="header-span">프로젝트 만들기</span>
			</div>

			<div class="create-input-info">
				<input name="TITLE" class="create-inputbox" type="text" placeholder="제목을 입력하세요">
				<div style="margin-top: 15px;">
					<textarea name="SUBTITLE" class="create-textarea" placeholder="프로젝트를 간단히 소개해보세요"></textarea>
				</div>
			</div>
			
			<div style="display:flex">
<!-- 				<button class="invite-button">팀원 초대하기</button> -->
				<button class="create-button on">프로젝트 생성하기</button>
			</div>
		</div>
	</div>

	<div class="background-img">
		<img id="background-img"
			src="../resources/project/img/template-bg.png">
	</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function() {
	    	$('.card').addClass('card-animate');
	});
</script>
</body>
</html>