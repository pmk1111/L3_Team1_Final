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

<title>WidUs - 간트차트</title>
<meta name="description" content="" />

<!-- JQuery cdn -->
    <script src="https://unpkg.com/dayjs"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/frappe-gantt@0.6.1/dist/frappe-gantt.js"></script>
    


<jsp:include page="../template/cssTemplate.jsp"></jsp:include>

<link href="../resources/project/css/projectboard/projectboard_Header.css" rel="stylesheet">

<style>
.leftbar-close {
	background-color: #9F7AB0;
	border-radius: 50%;
}

.body-wrapper {
  margin: 40px;
  font-family: sans-serif;
}

h1 {
  text-align: center;
  color: #636262;
}

/** buttons to change view mode */
.all-buttons {
  text-align: center;
  margin-bottom: 20px;
}

.button {
  margin: 5px;
  padding: 5px 10px;
  border: 2px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
}

.button.active {
  background-color: #636262;
  color: #ddd;
}

/** bar and bar progress of the different color */
/* initial state */
.gantt .bar-wrapper.blue .bar {
  fill: hsl(240, 50%, 57%);
}
.gantt .bar-wrapper.blue .bar-progress {
  fill: hsl(240, 100%, 77%);
}
.gantt .bar-wrapper.pink .bar {
  fill: hsl(347, 50%, 57%);
}
.gantt .bar-wrapper.pink .bar-progress {
  fill: hsl(347, 100%, 77%);
}
.gantt .bar-wrapper.purple .bar {
  fill: hsl(298, 50%, 57%);
}
.gantt .bar-wrapper.purple .bar-progress {
  fill: hsl(298, 100%, 77%);
}

/* hover state */
.gantt .bar-wrapper.blue:hover .bar-progress {
  fill: hsl(240, 100%, 77%);
}
.gantt .bar-wrapper.pink:hover .bar-progress {
  fill: hsl(347, 100%, 77%);
}
.gantt .bar-wrapper.purple:hover .bar-progress {
  fill: hsl(298, 100%, 77%);
}

/* active state */
.gantt .bar-wrapper.blue.active .bar {
  fill: hsl(240, 50%, 57%);
}
.gantt .bar-wrapper.blue.active .bar-progress {
  fill: hsl(240, 100%, 77%);
}
.gantt .bar-wrapper.pink.active .bar {
  fill: hsl(347, 50%, 57%);
}
.gantt .bar-wrapper.pink.active .bar-progress {
  fill: hsl(347, 100%, 77%);
}
.gantt .bar-wrapper.purple.active .bar {
  fill: hsl(298, 50%, 57%);
}
.gantt .bar-wrapper.purple.active .bar-progress {
  fill: hsl(298, 100%, 77%);
}

/** custom popup  */
.details-container {
  width: 150px;
  background-color: #fff;
  color: #434141;
  border: 2px solid #ddd;
  border-radius: 5px;
}

.details-container > h5,
.details-container > p {
  border-top: 2px solid #ddd;
  margin: 0;
  padding: 10px;
  font-size: 0.7rem;
}

.details-container > h5 {
  border-top: none;
}

.gantt .grid-header {
    fill: #ffffff;
    stroke: #e0e0e0;
    stroke-width: 1.4;
}

.gantt-container .popup-wrapper {
    position: absolute;
    top: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    padding: 0;
    color: #959da5;
    border-radius: 3px;
}

.gantt-container {
    position: relative;
    overflow: auto;
    font-size: 12px;
}

:not(svg) {
    transform-origin: 0px 0px;
}

svg[속성 스타일] {
    height: 700;
    width: 3040;
}

svg:not(:root) {
    overflow-clip-margin: content-box;
    overflow: hidden;
}

.gantt .grid-background {
    fill: none;
}

.gantt .grid-row {
    fill: #ffffff;
}

.gantt .grid-row:nth-child(even) {
    fill: #f5f5f5;
}

.gantt .row-line {
    stroke: #ebeff2;
}

.gantt .tick.thick {
    stroke-width: 0.4;
}

.gantt .tick {
    stroke: #e0e0e0;
    stroke-width: 0.2;
}

path[속성 스타일] {
    d: path("M 38 65 v 490");
}

.gantt .today-highlight {
    fill: #fcf8e3;
    opacity: 0.5;
}

.gantt .lower-text {
    fill: #333;
}

.gantt .lower-text, .gantt .upper-text {
    font-size: 12px;
    text-anchor: middle;
}

text {
    display: block;
    white-space-collapse: collapse;
    text-wrap: nowrap;
}

.gantt .arrow {
    fill: none;
    stroke: #666;
    stroke-width: 1.4;
}

.gantt .bar {
    fill: #b8c2cc;
    stroke: #8D99A6;
    stroke-width: 0;
    transition: stroke-width 0.3s ease;
    user-select: none;
}

.gantt .bar-wrapper {
    cursor: pointer;
    outline: none;
}

.gantt .bar-wrapper.blue .bar {
    fill: hsl(240, 50%, 57%);
}

.gantt .bar-wrapper.blue .bar-progress {
    fill: hsl(240, 100%, 77%);
}

.gantt .handle {
    fill: #ddd;
    cursor: ew-resize;
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s ease;
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

							<div class="col-lg-8 mb-4 order-0 welcome-message">
                                <div class="card project-info">

                                    <!-- Project Information -->
                                    <div class="project-left">

                                        <a class="select-color"></a>

                                        <!-- 색 선택 모달 -->
                                        <div id="modal-background" style="display: none">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                	프로젝트 색상
                                                    <a class="modal-close"></a>
                                                </div>

                                                <div class="modal-body">
                                                    <div class="color-option">
                                                        <ul id="selectColorTypes" class="select-color-group">
                                                            <li class="color-item project-color-type-5"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-11"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-1"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-10"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-2 project-color-check-active-1"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-7"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-9"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-6"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-3"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-4"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-8"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-0"><a class="cursor-pointer"><em></em></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="modal-bottom">
                                                        <button type="button" class="modal-cancle">취소</button>
                                                        <button type="button" class="modal-submit">확인</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="project-information">
                                            <div class="project-up">

                                                <!-- 프로젝트 색 선택 -->
                                                <div class="favorite-project">
                                                    <img class="star" src="../resources/project/img/projectboard/icon_star.png">
                                                </div>

                                                <!-- 프로젝트 설정 -->
                                                <div class="setting">
                                                    <div class="dropdown">
                                                        <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                        </button>

                                                        <!-- 드롭다운 메뉴 -->
                                                        <div class="dropdown-menu" aria-labelledby="cardOpt3">
                                                            <div class="project-setup-header">
                                                                <span>프로젝트 번호</span>
                                                                <em id="detailSettingProjectSrno">1997</em>
                                                            </div>

                                                            <div class="setting-menu">
                                                                <div class="setting-line">
                                                                    <a class="setting-anchor setting-exit">
                                                                        <img class="setting-img share" src="../resources/project/img/projectboard/share.svg">
                                                                        <span class="setting-span">프로젝트 나가기</span>
                                                                    </a>

                                                                    <div class="tooltip-container">
                                                                        <img class="setting-info" src="../resources/project/img/projectboard/info.svg">
                                                                        <div class="tooltip-text">프로젝트 나가기 시, 프로젝트 목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
                                                                    </div>
                                                                </div>

                                                                <div class="setting-line">
                                                                    <a class="setting-anchor setting-edit">
                                                                        <img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">
                                                                        <span class="setting-span">프로젝트 수정</span>
                                                                    </a>
                                                                </div>

                                                                <div class="setting-line">
                                                                    <a class="setting-anchor setting-delete">
                                                                        <img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">
                                                                        <span class="setting-span">프로젝트 삭제</span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- 프로젝트 정보 -->
                                                <div class="project-name">
                                                    <span class="project-name-span">[전사관리] 프로젝트 이름</span>
                                                </div>
                                            </div>
                                            <div class="discription">
                                                <span>프로젝트 관리 어쩌구저쩌구</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- left end -->

                                    <!-- invite -->
                                    <div class="invite">
                                        <button class="memberlist">
                                            <img class="memberlist-img" src="../resources/project/img/projectboard/project_member.svg">
                                            <span class="invite-span">Team</span>
                                        </button>

                                        <!-- invite 모달 -->
                                        <div id="modal-background-invite" style="display: none">
											<div class="modal-content-invite">
												<div style="text-align: right;">
													<a class="modal-close-invite"></a>
												</div>
												<div class="modal-header-invite">
													<span class="invite-header-span">Team 관리</span>
												</div>
												<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
													<li class="nav-item" role="presentation">
														<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">목록</button>
													</li>
													<li class="nav-item" role="presentation">
														<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">초대</button>
													</li>
												</ul>
												<div class="modal-search-list">
													<div class="modal-search">
														<input class="modal-search-input" type="text" id="image-input" placeholder="이름으로 검색">
													</div>
													<div class="modal-member-list">
														<div class="member-list">
															<ul id="member-list-ul">
																<li id="member-list-li">
																	<div class="modal-member-info">
																		<div class="modal-member-profile">
																			<img class="modal-memeber-img" src="../resources/project/img/projectboard/user3.jpg">
																		</div>
																		<div class="modal-member-name">
																			<a> 
																				<span class="modal-member-name-span">옥진석</span>
																			</a>
																		</div>
																		<div class="modal-member-role">
																			<span class="modal-member-role-span" style="color: #fff">관리자</span>
																		</div>
																		<!-- 관리자일때만 보이게 작업 -->
																		<div class="setting member-setting">
																			<div class="dropdown">
																				<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																					<i class="bx bx-dots-vertical-rounded"></i>
																				</button>
																				<div class="dropdown-menu drop-width"
																					aria-labelledby="cardOpt3">
																					<div class="setting-menu setting-menu-padding">
																						<div class="setting-line">
																							<a class="setting-anchor setting-exit"> 
																								<span class="setting-span setting-span-02">프로젝트 나가기</span> 
																								<!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
																							</a>
																						</div>
																						<div class="setting-line">
																							<a class="setting-anchor setting-manager-fire">
																								<span class="setting-span setting-span-02">관리자 해제</span> 
																								<!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
																							</a>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li id="member-list-li">
																	<div class="modal-member-info">
																		<div class="modal-member-profile">
																			<img class="modal-memeber-img" src="../resources/project/img/projectboard/user4.jpg">
																		</div>
																		<div class="modal-member-name">
																			<a> 
																				<span class="modal-member-name-span">박민기</span>
																			</a>
																		</div>
																		<div class="modal-member-role">
																			<a href="#" class="admin-invite-button-1 manager-badge">
																				<span>
																				</span>
																			</a>
																		</div>
																		<!-- 관리자일때만 보이게 작업 -->
																		<div class="setting member-setting">
																			<div class="dropdown">
																				<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																					<i class="bx bx-dots-vertical-rounded"></i>
																				</button>
																				<div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
																					<div class="setting-menu setting-menu-padding">
																						<div class="setting-line">
																							<a class="setting-anchor setting-fire">
																								<span class="setting-span setting-span-02">프로젝트 내보내기</span> 
																								<!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
																							</a>
																						</div>
																						<div class="setting-line">
																							<a class="setting-anchor setting-manager-hire">
																								<span class="setting-span setting-span-02">관리자 지정하기</span> 
																								<!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
																							</a>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li id="member-list-li">
																	<div class="modal-member-info">
																		<div class="modal-member-profile">
																			<img class="modal-memeber-img"
																				src="../resources/project/img/projectboard/user5.jpg">
																		</div>
																		<div class="modal-member-name">
																			<a> 
																				<span class="modal-member-name-span">김주영</span>
																			</a>
																		</div>
																		<div class="modal-member-role">
																			<a href="#" class="admin-invite-button-1 manager-badge">
																				<span>
																				</span>
																			</a>
																		</div>
																		<!-- 관리자일때만 보이게 작업 -->
																		<div class="setting member-setting">
																			<div class="dropdown">
																				<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																					<i class="bx bx-dots-vertical-rounded"></i>
																				</button>
																				<div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
																					<div class="setting-menu setting-menu-padding">
																						<div class="setting-line">
																							<a class="setting-anchor setting-fire">
																								<span class="setting-span setting-span-02">프로젝트 내보내기</span> 
																								<!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
																							</a>
																						</div>
																						<div class="setting-line">
																							<a class="setting-anchor setting-manager-hire">
																								<span class="setting-span setting-span-02">관리자 지정하기</span> 
																								<!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
																							</a>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li id="member-list-li">
																	<div class="modal-member-info">
																		<div class="modal-member-profile">
																			<img class="modal-memeber-img" src="../resources/project/img/projectboard/user1.jpg">
																		</div>
																		<div class="modal-member-name">
																			<a> 
																				<span class="modal-member-name-span">김혜원</span>
																			</a>
																		</div>
																		<div class="modal-member-role">
																			<a href="#" class="admin-invite-button-1 manager-badge">
																				<span></span>
																			</a>
																		</div>
																		<!-- 관리자일때만 보이게 작업 -->
																		<div class="setting member-setting">
																			<div class="dropdown">
																				<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																					<i class="bx bx-dots-vertical-rounded"></i>
																				</button>
																				<div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
																					<div class="setting-menu setting-menu-padding">
																						<div class="setting-line">
																							<a class="setting-anchor setting-fire">
																								<span class="setting-span setting-span-02">프로젝트 내보내기</span> 
																								<!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
																							</a>
																						</div>
																						<div class="setting-line">
																							<a class="setting-anchor setting-manager-hire">
																								<span class="setting-span setting-span-02">관리자 지정하기</span> 
																								<!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
																							</a>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li id="member-list-li">
																	<div class="modal-member-info">
																		<div class="modal-member-profile">
																			<img class="modal-memeber-img" src="../resources/project/img/projectboard/user2.jpg">
																		</div>
																		<div class="modal-member-name">
																			<a> 
																				<span class="modal-member-name-span">한혜진</span>
																			</a>
																		</div>
																		<div class="modal-member-role">
																			<a href="#" class="admin-invite-button-1 manager-badge">
																				<span></span>
																			</a>
																		</div>
																		<!-- 관리자일때만 보이게 작업 -->
																		<div class="setting member-setting">
																			<div class="dropdown">
																				<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																					<i class="bx bx-dots-vertical-rounded"></i>
																				</button>
																				<div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
																					<div class="setting-menu setting-menu-padding">
																						<div class="setting-line">
																							<a class="setting-anchor setting-fire">
																								<span class="setting-span setting-span-02">프로젝트 내보내기</span> 
																								<!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
																							</a>
																						</div>
																						<div class="setting-line">
																							<a class="setting-anchor setting-manager-hire">
																								<span class="setting-span setting-span-02">관리자 지정하기</span> 
																								<!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
																							</a>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li id="member-list-li">
																	<div class="modal-member-info">
																		<div class="modal-member-profile">
																			<img class="modal-memeber-img" src="../resources/project/img/projectboard/user6.jpg">
																		</div>
																		<div class="modal-member-name">
																			<a> 
																				<span class="modal-member-name-span">아이유</span>
																			</a>
																		</div>
																		<div class="modal-member-role">
																			<a href="#" class="admin-invite-button-1 manager-badge">
																				<span></span>
																			</a>
																		</div>
																		<!-- 관리자일때만 보이게 작업 -->
																		<div class="setting member-setting">
																			<div class="dropdown">
																				<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																					<i class="bx bx-dots-vertical-rounded"></i>
																				</button>
																				<div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
																					<div class="setting-menu setting-menu-padding">
																						<div class="setting-line">
																							<a class="setting-anchor setting-fire">
																								<span class="setting-span setting-span-02">프로젝트 내보내기</span> 
																								<!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
																							</a>
																						</div>
																						<div class="setting-line">
																							<a class="setting-anchor setting-manager-hire">
																								<span class="setting-span setting-span-02">관리자 지정하기</span> 
																								<!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
																							</a>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="modal-body-invite" style="display:none">
    												<div class="modal-content-wrapper">
        												<div class="modal-search-invite">
            												<div class="modal-search modal-search-invite-02">
                												<input class="modal-search-input" type="text" id="image-input" placeholder="이름으로 검색">
            												</div>
            												<div class="modal-search-memberlist">
            													<ul id="member-invite-ul">
            														<li class="member-invite-li">
            															<div class="modal-member-invite-img">
            																<img class="modal-invite-check" src="../resources/project/img/projectboard/icon_check.png">
            															</div>
            															<div class="modal-member-profile">
																			<img class="modal-memeber-img" src="../resources/project/img/projectboard/user3.jpg">
																		</div>
																		<div class="modal-member-name name-flex">
																			<a> 
																				<span class="modal-member-name-span" style="font-weight:520">옥진석</span>
																			</a>
																		</div>
            														</li>
            													</ul>
            												</div>
        												</div>
		
        												<div class="modal-invite-list">
        													<span class="invite-empty-span">대상을 선택해주세요.</span>
        												</div>
    												</div>

    													<div class="modal-bottom-invite">
        													<button type="button" class="modal-cancle-exit">취소</button>
        													<button type="button" class="modal-submit-exit">확인</button>
    													</div>
													</div>
												</div>
											</div>
                                    	</div>
                                    <!-- /invite -->

                                </div>
                            </div>
							<!-- Total Revenue -->
							<div
								class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list">
								<div class="card">

									<div class="card-body issue-list-card-body">
										<h3 style="margin-bottom: 30px; font-weight: 700;">간트차트</h3>
										
<div class="body-wrapper">
      <svg id="gantt"></svg>

      <div class="all-buttons">
        <button id="quarter-day" type="button" class="button">
          Quarter Day
        </button>
        <button id="half-day" type="button" class="button">Half Day</button>
        <button id="day" type="button" class="button">Day</button>
        <button id="week" type="button" class="button active">Week</button>
        <button id="month" type="button" class="button">Month</button>
        <button id="year" type="button" class="button">Year</button>
      </div>
    </div>

										<!-- GanttChart wrapper -->
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
	
	<script src="../resources/project/js/projectboard/projectboard_Header.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {

	var tasks = [
		  {
		    start: "2022-5-01",
		    end: "2022-5-08",
		    name: "JS 싫어요",
		    id: "Task 0",
		    progress: 20,
		    custom_class: "blue",
		    assignee: "Loveth"
		  },
		  {
		    start: "2022-5-03", // start date
		    end: "2022-5-06", // end date
		    name: "HTML 싫어요", // title
		    id: "Task 1", // unique id
		    progress: 30, // progress bar in %
		    dependencies: "Task 0", // Task 0 is the parent task
		    custom_class: "blue", //custom class name
		    assignee: "Bolu"
		  },
		  {
		    start: "2022-5-04",
		    end: "2022-5-08",
		    name: "CSS 싫어요",
		    id: "Task 2",
		    progress: 40,
		    dependencies: "Task 1",
		    custom_class: "pink",
		    assignee: "Stella"
		  },
		  {
		    start: "2022-5-08",
		    end: "2022-5-09",
		    name: "ㅇㅇㅇ",
		    id: "Task 3",
		    progress: 15,
		    dependencies: "Task 2",
		    custom_class: "purple",
		    assignee: "Stacy"
		  },
		  {
		    start: "2022-5-08",
		    end: "2022-5-10",
		    name: "ㄴㄴㄴ",
		    id: "Task 4",
		    progress: 80,
		    dependencies: "Task 2",
		    custom_class: "blue",
		    assignee: "Stacy"
		  },
		  {
		    start: "2022-5-11",
		    end: "2022-5-12",
		    name: "ㄱㄱㄱ!",
		    id: "Task 5",
		    progress: 5,
		    dependencies: "Task 4",
		    custom_class: "blue",
		    assignee: "Stella"
		  },
		  {
		    start: "2022-5-15",
		    end: "2022-5-18",
		    name: "New Project",
		    id: "Task 6",
		    progress: 0,
		    dependencies: "",
		    custom_class: "purple",
		    assignee: "Loveth"
		  }
		];
		var gantt = new Gantt("#gantt", tasks);

		//* Initial view mode
		// default view mode is Day
		// Other values are Quarter Day, Half Day, Day, Week, Month, Year
		gantt.change_view_mode("Week");

		// can also be written as
		// var gantt = new Gantt("#gantt", tasks).change_view_mode("Week");

		//* Change view mode on button click
		// buttons variables
		const QuarterDay = document.getElementById("quarter-day");
		const HalfDay = document.getElementById("half-day");
		const Day = document.getElementById("day");
		const Week = document.getElementById("week");
		const Month = document.getElementById("month");
		const Year = document.getElementById("year");

		// storing the buttons in a an array
		let AllModes = [QuarterDay, HalfDay, Day, Week, Month, Year];

		// function to change view mode on click
		function changeViewMode(mode) {
		  for (let modes of AllModes) {
		    modes.classList.remove("active");
		  }
		  gantt.change_view_mode(mode);
		}

		// adding event listeners to the buttons
		QuarterDay.addEventListener("click", () => {
		  changeViewMode("Quarter Day");
		  QuarterDay.classList.add("active");
		});
		HalfDay.addEventListener("click", () => {
		  changeViewMode("Half Day");
		  HalfDay.classList.add("active");
		});
		Day.addEventListener("click", () => {
		  changeViewMode("Day");
		  Day.classList.add("active");
		});
		Week.addEventListener("click", () => {
		  changeViewMode("Week");
		  Week.classList.add("active");
		});
		Month.addEventListener("click", () => {
		  changeViewMode("Month");
		  Month.classList.add("active");
		});
		Year.addEventListener("click", () => {
		  changeViewMode("Year");
		  Year.classList.add("active");
		});

		//* Adding options
		var gantt = new Gantt("#gantt", tasks, {
		  // event listeners
		  on_click: function (task) {
		    console.log(task);
		  },
		  on_date_change: function (task, start, end) {
		    console.log(task, start, end);
		  },
		  on_progress_change: function (task, progress) {
		    console.log(task, progress);
		  },
		  on_view_change: function (mode) {
		    console.log(mode);
		  },
		  // custom popup
		  custom_popup_html: function (task) {
		    // custom popup when th user clicks on any task.
		    // the task object will contain the updated dates and progress value
		    const start_date = task._start.toLocaleDateString();
		    const end_date = task._end.toLocaleDateString();
		    return `
		  		<div class="details-container">
		  		  <h5>${task.name}</h5>
		  		  <p>Started on ${start_date}</p>
		  		  <p>Expected to finish by ${end_date}</p>
		  		  <p>${task.progress}% completed!</p>
		  		  <p>Depended on ${task.dependencies}.</p>
		  		  <p>Assigned to ${task.assignee}.</p>
		  		</div>
		  	  `;
		  },
		  // other options
		  // header_height: 50, // height of the header of gantt chart
		  // column_width: 5,
		  // step: 24,
		  // view_modes: ["Quarter Day", "Half Day", "Day", "Week", "Month"],
		  bar_height: 40, // height of the task bar
		  bar_corner_radius: 20, // border radius of bar
		  arrow_curve: 10, // curve of the arrow
		  padding: 30 // padding of bar in gantt chart
		  // view_mode: "Day", // view mode of the  gantt chart
		  // date_format: "YYYY-MM-DD", // date format of gantt chart
		});

});
</script>
		<!-- common js -->
	<jsp:include page="../template/jsTemplate.jsp"></jsp:include>
	
</body>
</html>