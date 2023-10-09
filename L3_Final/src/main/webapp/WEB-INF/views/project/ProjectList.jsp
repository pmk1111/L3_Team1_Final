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

<!-- JQuery cdn -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<jsp:include page="../template/cssTemplate.jsp"></jsp:include>

<style>
.leftbar-close {
	background-color: #9F7AB0;
	border-radius: 50%;
}

/* project list */
.issue-list{width:100%;}

.issue-list-card-body{margin:30px 20px 30px 20px;}
.search-create{display: flex; justify-content: space-between;}

.issue-search{border:1px solid lightgrey; border-radius:3px; width:350px; height:35px; padding-left: 15px; color:#6a6192; font-weight: 700}
.issue-search::placeholder{color: #bababa;}

.create-issue{width: 100px; height: 35px; border:2px solid #9F7AB0; border-radius:3px; background-color: white; color:#9F7AB0;}
.create-issue:hover{cursor: pointer; background-color: #9F7AB0; color: white; transition:.3s;}

.search-title{position:relative; display:flex; justify-content: space-between; box-sizing:border-box; width:100%;}

.search-result-title{font-size:18px; font-weight: 700; margin-right: 10px}
.all-issue-count{font-size:15px; font-weight: 700; color:#999;}

.issue-filter{display:inline-block;}
.issue-filter:hover{cursor: pointer;}
.issue-filter > img{display:inline-block;}
.issue-filter > span{position:relative; top:1.5px; font-weight: 500; font-size: 15px; color:#697B8D;}
.issue-filter > img+span{margin-left: 2px}

.filter-dropdown {position: absolute; top: 100%; left: 75%; width: 300px; height: 130px; background-color: white; border: 1px solid lightgrey; border-radius: 3px; display: none; z-index: 9999;}

.dropdown-items{list-style: none; padding:0px 10px 0px 10px}
.dropdown-items li{display: flex; justify-content: space-between; align-items: center; height: 40px; margin: 15px 0px 15px 0px}
.dropdown-items span{font-size: 18px; font-weight: 600}

/* 프로젝트 li */
		.card { height:800px }
		
        .project-info {
			display:flex;
            flex-direction: row;
            justify-content: space-between
        }
        
        .project-left {
            display: flex;
            align-items: center;
        }
        
        .select-color {
            display: inline-block;
            height: 45px;
            width: 45px;
            background-color: orange;
            border-radius: 5px;
            border-color: orange;
            cursor: pointer;
        }

        .project-information {
            margin-left: 15px;
        }

        .project-information {
            display: inline-block;
        }

        .favorite-project,
        .setting,
        .project-name {
            display: inline-block;
        }

        .star {
            height: 25px;
            width: 25px;
        }
        
        .project-up {
            margin-top: 5px;
            margin-bottom: 5px
        }

        .project-name {
            position: relative;
            top: 1px;
        }

        .project-name-span {
            font-weight: bold;
            font-family: inherit;
        }
        
        .issue-area > ul {
        	list-style-type: none !important;
        	padding-left : 0;
        }
        
        .recent-modify {
        	display:flex;
    		align-items: center;
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
							<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list">
								<div class="card">
									<div class="card-body issue-list-card-body">
										<h3 style="margin-bottom: 30px; font-weight: 700;">프로젝트 리스트</h3>

										<form name="search-form" autocomplete="off" method="post">

											<div class="search-create">
												<div class="search-area">
													<input type="text" class="issue-search" id="searchInput"
														name="searchText" placeholder="프로젝트명을 입력하세요"> <input
														type="button" onclick="" value="검색">
												</div>
												<button type="button" class="create-issue">프로젝트 생성</button>
											</div>
										</form>
										<hr>
										<ul class="nav nav-tabs nav-justified">
											<li class="nav-item">
												<a class="nav-link active">참여 중인 프로젝트</a>
											</li>
											<li class="nav-item">
												<a class="nav-link">전체 프로젝트</a>
											</li>
										</ul>
										<div class="search-title">
											<span class="search-result-title">전체 
												<span class="all-issue-count"></span>
											</span>
											<div class="issue-filter">
												<img src="../resources/issue/img/filter.svg"> 
												<span>필터</span>
											</div>
											<div class="filter-dropdown" style="display: none;">
												<form name="filter-form" autocomplete="off" method="post">
													<ul class="dropdown-items">
														<li><span>최신순</span></li>
														<li><span>오름차순(ㄱ~ㅎ)</span></li>
														<li><span>내림차순(ㅎ~ㄱ)</span></li>
													</ul>
												</form>
											</div>
										</div>
										<div class="issue-area">
											<ul class="all-issue-list">
												<li class="list">
													<div class="project-info" style="min-height: 90px">
														<div class="project-left">
															<a class="select-color"></a>
															<div class="project-information">
																<div class="project-up">
																	<div class="favorite-project" style="">
																		<img class="star"
																			src="../resources/project/img/projectboard/icon_star.png">
																	</div>
																	<div class="setting">
																		<div class="dropdown">
																			<button class="btn p-0" type="button" id="cardOpt3"
																				data-bs-toggle="dropdown" aria-haspopup="true"
																				aria-expanded="false">
																				<i class="bx bx-dots-vertical-rounded"></i>
																			</button>
																			<div class="dropdown-menu" aria-labelledby="cardOpt3">
																				<div class="project-setup-header">
																					<span>프로젝트 번호</span> <em
																						id="detailSettingProjectSrno">1997</em>
																				</div>

																				<div class="setting-menu">
																					<div class="setting-line">
																						<a class="setting-anchor setting-exit"> <img
																							class="setting-img share"
																							src="../resources/project/img/projectboard/share.svg">
																							<span class="setting-span">프로젝트 나가기</span>
																						</a>

																						<div class="tooltip-container">
																							<img class="setting-info"
																								src="../resources/project/img/projectboard/info.svg">
																							<div class="tooltip-text">프로젝트 나가기 시, 프로젝트
																								목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
																						</div>
																					</div>

																					<div class="setting-line">
																						<a class="setting-anchor setting-edit"> <img
																							class="setting-img edit"
																							src="../resources/project/img/projectboard/edit.svg">
																							<span class="setting-span">프로젝트 수정</span>
																						</a>
																					</div>

																					<div class="setting-line">
																						<a class="setting-anchor setting-delete"> <img
																							class="setting-img bin"
																							src="../resources/project/img/projectboard/bin.svg">
																							<span class="setting-span">프로젝트 삭제</span>
																						</a>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="project-name">
																		<span class="project-name-span">[전사관리] 프로젝트 이름</span>
																		<img src="">
																		<span>1</span>
																	</div>
																</div>
															</div>
														</div>
														<div class="recent-modify">
															<div>
																<span>참여 중</span>
															</div>
															<span>현재시간 - 최종 수정시간</span> 
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- common js -->
	<jsp:include page="../template/jsTemplate.jsp"></jsp:include>

<script>
	$(document).ready(function() {
		$(".issue-filter").click(function() {
			if ($(".filter-dropdown").css("display") === "none") {
				$(".filter-dropdown").css('display', 'block').fadeIn(300);
			} else {
				$(".filter-dropdown").css('display', 'none').fadeOut(300);
			}
		});
	});
</script>
</body>
</html>