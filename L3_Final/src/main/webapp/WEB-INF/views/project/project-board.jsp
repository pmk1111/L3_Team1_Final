<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>WidUs - 대시보드</title>
    <meta name="description" content="" />
    <meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>

    <!-- ProjectBaord CSS -->
    <link href="../resources/project/css/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/project/css/projectboard/style.css" rel="stylesheet">
    <link href="../resources/project/css/projectboard/projectboard_Header.css" rel="stylesheet">
    <link href="../resources/project/css/projectboard/projectboard_chart.css" rel="stylesheet">
    <link href="../resources/project/css/projectboard/board_activity.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">    
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
    	body {
    		font-family: 'Nanum Gothic', sans-serif;
    	}
    	
		#member-list-li:hover {
		    background-color: #e6e7ff;
		}
		
		.modal-member-name-span {
			font-weight: 600;
			font-size: 13px;
		}    	
		
		.modal-search-memberlist{
			height: 300px;
			width: 99%;	
			overflow-y: auto;
		    overflow-x: hidden;		
		}
		
		.member-invite-li {
			padding : 15px 5px 15px 5px;
		}
		
		.member-invite-li:hover {
			background-color: #e6e7ff;
		}
		
		.invite-box {
			display: grid;
    		grid-template-columns: repeat(2, 1fr);
		}
		
		.invite-you {
			margin: 20px 7px 5px 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    background-color: #9F7AB0;
		    color: #fff;
		    height: 35px;
			border-radius: 12px;
		    width: 95px;
		    font-size:14px;		    
		    max-height:45px;
		    padding:3px 0 3px 0;
		}
		
		.empty-emp{
			display: flex;
		    height: 225px;
		    justify-content: center;
		    align-items: center;
		    padding-right: 25px;
		    opacity: 0;
    		animation: fadeIn 0.5s ease-in-out 0.1s forwards;			
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
                <!-- /Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">

                    <!-- Content -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">
                            <div class="col-lg-8 mb-4 order-0 welcome-message">
                                <div class="card project-info">

                                    <!-- Project Information -->
                                    <div class="project-left">
                                        <a class="select-color" style="background-color: ${project.COLOR};"></a>

                                        <!-- 색 선택 모달 -->
                                        <div id="modal-background">
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
                                                    <img class="star favorite-star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="${project.ID}">
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
                                                                <em id="detailSettingProjectSrno">${project.ID}</em>
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
                                                                    <a class="setting-anchor setting-delete" data-project-id="${project.ID}">
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
                                                    <span class="project-name-span">${project.TITLE}</span>
                                                </div>
                                            </div>
                                            <div class="discription">
                                                <span>${project.SUBTITLE}</span>
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
                                                        <button class="nav-link team-tab active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">목록</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link invite-tab" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">초대</button>
                                                    </li>
                                                </ul>
                                                <div class="modal-search-list">
                                                    <div class="modal-search">
                                                        <input class="modal-search-input" type="text" id="image-input" placeholder="이름으로 검색">
                                                    </div>
                                                    <div class="modal-member-list">
                                                        <div class="member-list">
                                                            <ul id="member-list-ul">
                                                            	<c:forEach var="TEAM" items="${team}">
                                                            	<c:if test="${TEAM.EMP_STATUS eq 0 }">
                                                                <li id="member-list-li">
                                                                    <div class="modal-member-info">
                                                                        <div class="modal-member-profile">
                                                                        	<c:choose>
                                                                            	<c:when test="${empty TEAM.PIC}">
                                                                                	<img class="modal-memeber-img" src="../resources/user/img/profile.png">
                                                                                </c:when>
                                                                             	<c:otherwise>
                                                                             		<img class="modal-memeber-img" src="../resources/project/img/projectboard/team/${TEAM.PIC}">
                                                                              	</c:otherwise>
                                                                             </c:choose>                                                                        
                                                                        </div>
                                                                        <div class="modal-member-name">
                                                                            <a>
                                                                                <span class="modal-member-name-span">${TEAM.NAME}</span>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-member-role">
															                <c:choose>
															                    <c:when test="${TEAM.AUTH eq 1}">
															                        <span class="modal-member-role-span" style="color: #fff">관리자</span>
															                    </c:when>
															                    <c:otherwise>
															                        <a href="#" class="admin-invite-button-1 manager-badge">
															                            <span></span>
															                        </a>
															                    </c:otherwise>
															                </c:choose>
                                                                        </div>
                                                                        <div class="setting member-setting">
                                                                            <div class="dropdown">
                                                                                <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                                </button>
                                                                                <div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
                                                                                    <div class="setting-menu setting-menu-padding">
                                                                                        <div class="setting-line">
																						   <c:if test="${TEAM.USER_ID eq TEAM.MY_ID}">
																						   	<a class="setting-anchor setting-exit">
																						       <span class="setting-span setting-span-02">프로젝트 나가기</span>
																						    </a>    
																						   </c:if>
																						   <c:if test="${TEAM.MY_AUTH eq 1 and TEAM.MY_ID ne TEAM.USER_ID}">
																						   	<a class="setting-anchor setting-fire">
																						       <span class="setting-span setting-span-02">프로젝트 내보내기</span>
																						   	</a>
																						   </c:if>
                                                                                         </div>
                                                                                        <div class="setting-line">
                                                                                        	<c:if test="${TEAM.MY_AUTH eq 1 and TEAM.AUTH eq 1}">
                                                                                             <a class="setting-anchor setting-manager-fire">
                                                                                                <span class="setting-span setting-span-02">관리자 해제</span>
                                                                                             </a>
                                                                                            </c:if>
                                                                                            <c:if test="${TEAM.MY_AUTH eq 1 and TEAM.AUTH eq 0}">
                                                                                             <a class="setting-anchor setting-manager-hire">
                                                                                                <span class="setting-span setting-span-02">관리자 지정하기</span>
                                                                                             </a>                                                                                             
                                                                                            </c:if>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                </c:if>
                                                                </c:forEach>
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
							                                </ul>
							                              </div>                                                        
                                                        </div>

                                                        <div class="modal-invite-list">
                                                        	<div class="modal-invite-empty" style=" display: flex; align-items: center; justify-content: center; widht:100%; height:100%;">
                                                            	<span class="invite-empty-span">대상을 선택해주세요.</span>
                                                            </div>
                                                            <div class="invite-box"> 
                                                            </div>
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

                            <!-- 완료 카드 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 project-schedule">
                                <div class="card project-schedule-card">
                                    <div class="project-schedule-box">
                                        <div class="round">
                                            <img class="round-icons" src="../resources/project/img/projectboard/ok.svg">
                                        </div>
                                        <div class="project-schedule-text">
                                            <div>
                                                <span>최근 7일 이내에</span>
                                            </div>
                                            <span>${doneCount} 개 완료</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 업데이트 카드 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 project-schedule">
                                <div class="card project-schedule-card">
                                    <div class="row row-bordered g-0">
                                        <div class="project-schedule-box">
                                            <div class="round">
                                                <img class="round-icons" src="../resources/project/img/projectboard/feather.svg">
                                            </div>
                                            <div class="project-schedule-text">
                                                <div>
                                                    <span>최근 7일 이내에</span>
                                                </div>
                                                <span>${updateCount} 개 업데이트</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 만듦 카드 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 project-schedule">
                                <div class="card project-schedule-card">
                                    <div class="row row-bordered g-0">
                                        <div class="project-schedule-box">
                                            <div class="round">
                                                <img class="round-icons" src="../resources/project/img/projectboard/plus.svg">
                                            </div>
                                            <div class="project-schedule-text">
                                                <div>
                                                    <span>최근 7일 이내에</span>
                                                </div>
                                                <span>${createCount} 개 만듦</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 기한초과 카드 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 project-schedule">
                                <div class="card project-schedule-card">
                                    <div class="row row-bordered g-0">
                                        <div class="project-schedule-box">
                                            <div class="round">
                                                <img class="round-icons" src="../resources/project/img/projectboard/calendar.svg">
                                            </div>
                                            <div class="project-schedule-text">
                                                <div>
                                                    <span>최근 7일 이내에</span>
                                                </div>
                                                <span>${criticalCount } 개 크리티컬</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 상태 개요 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 width-50">
                                <div class="card h-300">
                                    <div class="row row-bordered g-0">
                                        <h5 class="card-header m-0 me-2 pb-3" style="font-weight: bold">상태 개요</h5>
                                        <div id="trafficChart" style="min-height: 310px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); position: relative; right: 80px;" class="echart" _echarts_instance_="ec_1695722972106">

                                            <div style="position: relative; width: 458px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: default; min-height:350px">
                                                <canvas data-zr-dom-id="zr_0" width="458" height="400" style="position: absolute; left: 0px; top: 0px; width: 458px; min-height:350px !important; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
                                            </div>

                                            <div class="Chart Access">
                                                <div style="margin: 0px 0 0; line-height: 1;">
                                                    <div style="font-size: 14px; color: #666; font-weight: 400; line-height: 1;">Access From</div>
                                                    <div style="margin: 10px 0 0; line-height: 1;">
                                                        <div style="margin: 0px 0 0; line-height: 1;">
                                                            <span style="display: inline-block; margin-right: 4px; border-radius: 10px; width: 10px; height: 10px; background-color: #ee6666;"></span>
                                                            <span style="font-size: 14px; color: #666; font-weight: 400; margin-left: 2px">Union Ads</span>
                                                            <span style="float: right; margin-left: 20px; font-size: 14px; color: #666; font-weight: 900">484</span>
                                                            <div style="clear: both"></div>
                                                        </div>
                                                        <div style="clear: both"></div>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /상태 개요 -->

                            <!-- 우선순위 개요 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 width-50">
                                <div class="card h-300">
                                    <div class="row row-bordered g-0">
                                        <h5 class="card-header m-0 me-2 pb-3" style="font-weight: bold">우선 순위</h5>
                                        <div id="barChart" style="min-height: 320px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);" class="echart" _echarts_instance_="ec_1695779430973">
                                            <div style="position: relative; width: 720px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: pointer;">
                                                <canvas data-zr-dom-id="zr_0" width="720" height="400" style="position: absolute; left: 0px; top: 0px; width: 720px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- / 우선순위 개요 -->

                            <!-- 최근 이슈 테이블 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 width-50">
                                <div class="card h-300">
                                    <div class="row row-bordered g-0">
                                        <div>
                                            <h5 class="card-header m-0 me-2 pb-3" style="font-weight: bold; display: inline-block">최근 이슈 <span style="color: #899bbd; font-size: 14px; font-weight: 500;"><a href="../issue/issue-list?projectId=${projectId}" style="cursor:pointer; color:#392a85;"> | 바로가기</a></span>
                                            </h5>
                                            <div class="datatable-search" style="display: inline-block; float: right; margin-right: 14px;">
                                                <input id="searchInput" class="datatable-input form-control" placeholder="Search..." type="search" title="Search within table" style="margin-top: 18px;">
                                            </div>
                                        </div>
                                        <div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns" style="margin-top: 23px;">
                                            <div class="datatable-container">

                                                <table id="myTable" class="table table-borderless datatable datatable-table" style="min-height:270px">
                                                    <thead>
                                                        <tr>
                                                            <th data-sortable="true" style="width: 7.703363914373089%;"><button class="datatable-sorter">타입</button></th>
                                                            <th data-sortable="true" style="width: 14%;"><button class="datatable-sorter">작성자</button></th>
                                                            <th data-sortable="true" style="width: 47.793028299636045%;"><button class="datatable-sorter">글 제목</button></th>
                                                            <th data-sortable="true" style="width: 18.780835881753312%; text-align: center;"><button class="datatable-sorter">우선 순위</button></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody style="min-height:230px">
													     <c:choose>
													        <c:when test="${not empty issuelist}">                                                   
			                                                    <c:forEach var="issue" items="${issuelist}" begin="0" end="4">
			                                                        <tr data-index="0" >
			                                                            <td style="vertical-align: middle; text-align: center;">
																            <c:choose>
																                <c:when test="${issue.type eq '에픽'}">
																                    <img src="../resources/issue/img/epic.svg" class="issuetype-icon">
																                </c:when>
																                <c:when test="${issue.type eq '작업'}">
																                    <img src="../resources/issue/img/task.svg" class="issuetype-icon">
																                </c:when>
																              	<c:otherwise>  
																                 	<img src="../resources/issue/img/bug.svg" class="issuetype-icon"> 
																             	</c:otherwise>  
																            </c:choose>
			                                                            </td>
			                                                            <td style="vertical-align: middle;">${issue.create_user_name }</td>
			                                                            <td style="vertical-align: middle;"><a style="color:#392a85 !important;" href="../issue/issue-detail?num=${issue.id}" class="text-primary post-title">${issue.subject }</a></td>
			                                                            <td style="vertical-align: middle; text-align: center;">
																            <c:choose>
																                <c:when test="${issue.priority eq 'critical'}">
																                    <span class="badge bg-danger">${issue.priority }</span>
																                </c:when>
																                <c:when test="${issue.priority eq 'high'}">
																                    <span class="badge bg-info">${issue.priority }</span>
																                </c:when>
																                <c:when test="${issue.priority eq 'middle'}">
																                    <span class="badge bg-success">${issue.priority }</span>
																                </c:when>
																                <c:otherwise>  
																                 	<span class="badge bg-warning">${issue.priority}</span> 
																             	</c:otherwise>  
																            </c:choose> 
															            </td>
			                                                        </tr>
			                                                   </c:forEach>
			                                                 </c:when>
												        <c:otherwise>
												            <tr>
												                <td colspan="4" style="padding-top:90px; text-align:center; font-weight:700; opacity: 0; animation: fadeIn 0.5s ease-in-out 0.3s forwards;	">최근 이슈가 없습니다.</td> 
												            </tr> 
												        </c:otherwise>
												    </c:choose>	                                                 
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <!-- 푀근 활동 -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 width-50">
                                <div class="card h-300">
                                    <div class="row row-bordered g-0">

                                        <h5 class="card-header m-0 me-2 pb-3" style="font-weight: bold">최근 활동<span style="color: #899bbd; font-size: 16px; font-weight: 400;"></span>
                                        </h5>

                                        <div class="activity" style="margin-left:6%; margin-top:4%">

                                            <div class="activity-item d-flex">
                                                <div class="activite-label">32 min</div>
                                                <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                                                <div class="activity-content">JJOCK - 'Lowest'으로 우선 순위 변경 : <a href="#" class="fw-bold text-dark">프로젝트 생성/수정/삭제 페이지 제작 계획</a> </div>
                                            </div><!-- End activity item-->

                                            <div class="activity-item d-flex">
                                                <div class="activite-label">56 min</div>
                                                <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                                                <div class="activity-content">[공지] 즐거운 추석 보내세요!</div>
                                            </div><!-- End activity item-->

                                            <div class="activity-item d-flex">
                                                <div class="activite-label">2 hrs</div>
                                                <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                                                <div class="activity-content"> Voluptates corrupti molestias voluptatem</div>
                                            </div><!-- End activity item-->

                                            <div class="activity-item d-flex">
                                                <div class="activite-label">1 day</div>
                                                <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                                                <div class="activity-content">Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati voluptatem</a> tempore </div>
                                            </div><!-- End activity item-->

                                            <div class="activity-item d-flex">
                                                <div class="activite-label">2 days</div>
                                                <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                                                <div class="activity-content">Est sit eum reiciendis exercitationem</div>
                                            </div><!-- End activity item-->

                                            <div class="activity-item d-flex">
                                                <div class="activite-label">4 weeks</div>
                                                <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
                                                <div class="activity-content">Dicta dolorem harum nulla eius. Ut quidem quidem sit quas</div>
                                            </div><!-- End activity item-->

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                (주)WidUs
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

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    
    <script src="https://cdn.jsdelivr.net/npm/echarts@latest/dist/echarts.min.js"></script>
    
    <script src="../resources/project/js/projectboard/simple-datatables.js"></script>
    <script src="../resources/project/js/projectboard/tinymce.min.js"></script>
    <script src="../resources/project/js/projectboard/main.js"></script>

	<!-- ProjectBoard JS -->
    <script src="../resources/project/js/projectboard/projectboard_Header.js"></script>
    <script src="../resources/project/js/projectboard/projectboard_table.js"></script>
    
    <script src="../resources/project/js/projectboard/team_Ajax.js"></script>
    	
    <script>

    $('.setting-delete').click(function(event) {
        event.preventDefault();
        
        var projectId = $(this).data('projectId');  // 프로젝트 ID 가져오기
	    let token = $("meta[name='_csrf']").attr("content");
	    let header = $("meta[name='_csrf_header']").attr("content");	

        swal({
                title: "정말 프로젝트를 삭제하시겠습니까?",
                text: "삭제된 프로젝트는 복구가 불가능합니다.",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willExit) => {
    	        if (willExit) {
    	            $.ajax({
    	                url: `../project/delete?projectId=${projectId}`,  // DELETE 요청 URL 구성
    	                type: 'DELETE',
				        beforeSend : function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
					           xhr.setRequestHeader(header, token);
					    },
    	                success: function(data) {  // 성공적으로 삭제되었을 경우
    	                        swal("완료", '프로젝트 삭제가 완료되었습니다.', "success")
    	                        .then(() => {
    	                            location.href="../project/project-list";  // 페이지 이동
    	                        });
    	                },
    	                error: function(jqXHR, textStatus, errorThrown) {  // 실패했을 경우
    	                    swal("실패", jqXHR.responseJSON.message || textStatus, "error");
    	                }
    	            });
    	        }
            });
    });
    
    var todoCount = ${todoCount};
    var progressCount = ${progressCount};
    var doneCount = ${doneCount};
    var resolveCount = ${resolveCount};

    document.addEventListener("DOMContentLoaded", () => {
        var myChart = echarts.init(document.querySelector("#trafficChart"));

        var option = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                top: 'middle',
                left: 'right',
                orient: 'vertical',
                align: 'left',
                textStyle: {
                    color: '#666',
                    fontSize: '14',
                }
            },
            series: [{
                name: '상태',
                type: 'pie',
                radius: ['40%', '70%'],
                avoidLabelOverlap: false,
                labelLine: {
                    show: false
                },
                label: {
                    show: false,
                    position: 'center',
                    formatter: '{b}' // b refers to the name of the data item
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: '18',
                        fontWeight: 'bold'
                    }
                },
                data: [{
                        value: todoCount,
                        name: 'To Do'
                    },
                    {
                        value: progressCount,
                        name: 'Progress'
                    },
                    {
                        value: doneCount,
                        name: 'Done'
                    },
                    {
                        value: resolveCount,
                        name: 'Resolve'
                    }
                ]
            }]
        };

        myChart.setOption(option);
    });
    
    var allCriticalCount = ${allCriticalCount};
    var highCount = ${highCount};
    var middleCount = ${middleCount};
    var lowCount = ${lowCount};
    
    document.addEventListener("DOMContentLoaded", () => {
        echarts.init(document.querySelector("#barChart")).setOption({
            xAxis: {
                type: 'category',
                data: ['Critical', 'High', 'Middle', 'Low'],
                axisLabel: {
                    fontWeight: 'bold' // 글꼴 굵게 설정
                }
            },
            yAxis: {
                type: 'value',
                interval: 1
            },
            series: [{
                data: [allCriticalCount, highCount, middleCount, lowCount],
                type: 'bar',
                itemStyle: {
                    color: function(params) { // 각 막대마다 다른 색상을 반환하는 함수
                        var colors = ['#EE6666', '#5470C6', '#91CC75', '#FACB58']; // 원하는 색상 배열
                        return colors[params.dataIndex];
                    }
                }
            }]
        });
    });
    </script>
</body>

</html>