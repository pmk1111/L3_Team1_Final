<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 생성</title>

<style>
.create-header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 45px;
}

.create-close {
	display: inline-block;
	background:
		url(../resources/project/img/projectboard/icon-minipop-close.svg)
		no-repeat center/contain;
	width: 15px;
	height: 15px;
	position: absolute;
	right: 25px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

.card {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 9;
	width: 700px;
	height: 430px;
	padding: 20px;
	box-sizing: border-box; /* 패딩이 너비에 포함되도록 설정 */
	border: 1.5px solid #ccc;
	background-color: white;
	border-radius: 10px;
	box-shadow: 12px 12px 12px rgba(0, 0, 0, .8);
}

.CreateProject {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 10;
	width: 600px;
}

.background-img {
	position: relative;
	z-index: 0;
	float: right;
	margin-top: 95px;
	margin-right: 200px;
}

#background-img {
	width: 800px;
	height: 800px;
}

#header-span {
	display: block;
	font-size: 26px;
	font-weight: 700;
}

.create-input-info {
	margin-top: 20px;
}

.create-inputbox {
	width: 600px;
	height: 60px;
	color: #6449fc;
	font-weight: 700;
	font-size: 15px;
	line-height: 25px;
	border: 0.5px solid #555;
	border-radius: 4px;
	box-sizing: border-box;
	font-family: inherit;
	padding: 0 20px;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, .3);
}

.create-textarea {
	width: 600px;
	height: 100px;
	padding: 20px;
	font-size: 14px;
	font-weight: 500;
	line-height: 21px;
	border: 0.5px solid #555;
	border-radius: 4px;
	box-sizing: border-box;
	font-family: inherit;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, .3);
}

.create-button, .invite-button {
	width: 600px;
	height: 60px;
	border-radius: 6px;
	margin-top: 15px;
    border: 1px solid #9F7AB0;
    background-color: #ffffff;
    color: #9f7ab0;
	font-family: inherit;
	font-size: 15px;
	font-weight: 550;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, .3);
	transition: background-color 0.1s ease;
}

.create-button:hover, .invite-button:hover {
	border: 1px solid #9F7AB0;
	background-color: #9F7AB0;
	color: white;
}

.invite-button+.create-button {
	margin-left:15px;
}
</style>
</head>
<body>

	<div class="create-header">
		<a class="create-close"></a>
	</div>

	<div class="card">
		<div class="CreateProject">
			<div style="display:flex; justify-content: space-between; border-bottom: 1px solid #ccc; padding-bottom: 20px;">
				<span id="header-span">프로젝트 만들기</span>
			</div>

			<div class="create-input-info">
				<input class="create-inputbox" type="text" placeholder="제목을 입력하세요">
				<div style="margin-top: 15px;">
					<textarea class="create-textarea" placeholder="프로젝트를 간단히 소개해보세요"></textarea>
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

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>