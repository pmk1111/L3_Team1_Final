<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>WidUs - ProjectList</title>
    <meta name="description" content="" />
    <meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

    <!-- JQuery cdn -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>

    <link href="../resources/project/css/projectboard/projectboard_Header.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
    	body {
    		font-family: 'Nanum Gothic', sans-serif;
    	}
        .row {
            justify-content: center;
        }

        /* project list */
        .project-list {
            width: 100%;
            height: 100%;

        }

        .project-list-card-body {
            margin: 30px 20px 20px 20px;
        }

        .search-proejct {
            display: flex;
            justify-content: space-between;
        }

        .project-search {
            border: 1px solid lightgrey;
            border-radius: 3px;
            width: 300px;
            height: 45px;
            padding-left: 10px;
            color: #6a6192;
            font-weight: 500;
            font-size:13.5px
        }

        .project-search::placeholder {
            color: #bababa;
        }

        .search-title {
            position: relative;
            display: flex;
            justify-content: space-between;
            box-sizing: border-box;
            width: 100%;
            padding-bottom: 10px;
        }

        .search-result-title {
            font-size: 18px;
            font-weight: 700;
            margin-right: 10px
        }

        .project-filter {
            display: inline-block;
            cursor: pointer;
        }

        .project-filter>img {
            display: inline-block;
        }

        .project-filter>span {
            position: relative;
            top: 1.5px;
            font-weight: 500;
            font-size: 15px;
            color: #697B8D;
        }

        .project-filter>img+span {
            margin-left: 2px
        }

        .filter-dropdown {
            position: absolute;
            top: 100%;
            left: 75%;
            width: 300px;
            height: 130px;
            background-color: white;
            border: 1px solid lightgrey;
            border-radius: 3px;
            display: none;
            z-index: 9999;
        }

        .dropdown-items {
            list-style: none;
            padding: 0px 10px 0px 10px
        }

        .dropdown-items li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 40px;
            margin: 15px 0px 15px 0px
        }

        .dropdown-items span {
            font-size: 18px;
            font-weight: 600
        }

        .jump {
            margin-top: 20px;
            border-bottom: 1px solid #555;
        }

        /* 프로젝트 li */
        .card {
            min-height: 800px
        }

        .project-info {
            display: flex;
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

        .project-area {
            overflow: scroll;
            max-height: 377px;
            padding:0 5px 0 5px;
        }
        
        .all-project {
        	max-height: 737px;
        }

        .project-area>ul {
            list-style-type: none !important;
            padding-left: 0;
        }

        .recent-modify {
            display: flex;
            align-items: center;
        }
        
        /* tabs */
        .tabs {
        	margin-top: 40px;
        	font-weight: 600;
        	font-size: 16px;
        	margin-bottom: 45px !important;
        }
        
        .part-tabs, .all-tabs {
        	width:140px;
        }
        
        .tabs li.is-active a {
   			color: #996ead !important;
   			border-bottom: 2px solid #996ead;
        }
        
        .tabs li {
        	color:#8f8f8f
        }
        
        /* favorit-project*/
        .favoritProject {
        	padding-bottom:0px;
        	position: relative;
        }
        
		.favoritProject::before {
		    content: "";
		    position: absolute;
		    bottom: 0;
		    left: 1%;
		    width: 98%;
		    border-bottom: 1px solid #9c9c9c30;
		}        
        
        
        /* part-project */
        .partProject {
        	padding-top: 25px;
        }
        
        /* 프로젝트 요소 */
        .select-color {
        	margin-left:10px !important;
        }
        .recent-modify {
        	margin-right:10px;
        	font-size:12px;
        	color :#999;
        }
        
		.star {
		    transition: opacity 0.5s ease-in-out;
		}        
		
		.select-color {
			cursor:auto;
		}
		
		.team-count-img {
			margin-left:5px;
			width:21px;
		}
		
		.team-count-span {
			font-size:13px;
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
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 project-list">
                                <div class="card">
                                    <div class="card-body project-list-card-body">
                                    	<div style="display:flex; justify-content:space-between; align-items: center;">
                                        <h3 style="font-size:27px; font-weight: 800; color:#555">프로젝트</h3>

										<div style="display:flex; align-items: center;">
										<img src="../resources/project/img/projectboard/search.svg" style="margin-right:7px; height:30px; opacity: 0.4;">
                                        <form name="project-search-form" autocomplete="off" method="post">
                                            <div class="search-project">
                                                <div class="search-area">
                                                    <input type="text" class="project-search" id="searchInput" name="searchText" placeholder="프로젝트명을 입력하세요">
                                                </div>
                                            </div>
                                        </form>
                                        </div>
                                        </div>
                                        
										<div class="tabs">
										  <ul>
										    <li class="part-tabs is-active"><a>참여 중</a></li>
										    <li class="all-tabs"><a>전체 프로젝트</a></li>
										  </ul>
										</div>
										
                                        <div class="personalProject">
                                            <div class="favoritProject">

                                                <div class="search-title">
                                                    <span class="search-result-title">즐겨찾기
                                                        <span class="all-project-count"></span>
                                                        <img id="favorit-arrow" src="../resources/project/img/arrow/chevron-down.svg">
                                                    </span>
                                                </div>

                                                <div class="project-area favorit-project">
                                                    <ul class="all-project-list">
                                                        <c:forEach var="favoritProject" items="${favoritProjectList}">
                                                            <li class="list">
                                                                <div class="project-info" style="min-height: 90px">
                                                                    <div class="project-left">
                                                                        <a class="select-color" style="background-color: ${favoritProject.COLOR};"></a>
                                                                        <div class="project-information">
                                                                            <div class="project-up">
                                                                                <div class="favorite-project" style="">
                                                                                    <img class="star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="${favoritProject.ID}">
                                                                                </div>
                                                                                <div class="setting">
                                                                                    <div class="dropdown">
                                                                                        <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="cardOpt3">
                                                                                            <div class="project-setup-header">
                                                                                                <span>프로젝트 번호</span>
                                                                                                <em id="detailSettingProjectSrno">${favoritProject.ID}</em>
                                                                                            </div>

                                                                                            <div class="setting-menu">
                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-exit"> <img class="setting-img share" src="../resources/project/img/projectboard/share.svg">
                                                                                                        <span class="setting-span">프로젝트 나가기</span>
                                                                                                    </a>

                                                                                                    <div class="tooltip-container">
                                                                                                        <img class="setting-info" src="../resources/project/img/projectboard/info.svg">
                                                                                                        <div class="tooltip-text">프로젝트 나가기 시, 프로젝트
                                                                                                            목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
                                                                                                    </div>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-edit"> <img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">
                                                                                                        <span class="setting-span">프로젝트 수정</span>
                                                                                                    </a>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-delete"> <img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">
                                                                                                        <span class="setting-span">프로젝트 삭제</span>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="project-name">
                                                                                    <a href="project?id=${favoritProject.ID}"><span class="project-name-span">${favoritProject.TITLE}</span></a>
                                                                                    <img class="team-count-img" src="../resources/project/img/person.svg">
                                                                                    <span class="team-count-span">${favoritProject.TEAMCOUNT}</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="recent-modify">
                                                                        <c:set var="timeDiff" value="${favoritProject.CURRENTTIME}" />

                                                                        <c:if test="${timeDiff lt 1}">
                                                                            <span>방금 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 1 and timeDiff lt 60}">
                                                                            <span>${timeDiff} 분 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 60 and timeDiff lt 1440}">
                                                                            <span>${Integer.valueOf(timeDiff div 60)} 시간 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (24*60) and timeDiff lt (7*24*60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (24*60))} 일 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (7*24*60))} 주</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="partProject">

                                                <div class="search-title">
                                                    <span class="search-result-title">참여 중
                                                        <span class="all-project-count"></span>
                                                        <img id="part-arrow" src="../resources/project/img/arrow/chevron-down.svg">                                                       
                                                    </span>
                                                </div>

                                                <div class="project-area part-project">
                                                    <ul class="all-project-list">
                                                        <c:forEach var="partProject" items="${partProjectList}">
                                                            <li class="list">
                                                                <div class="project-info" style="min-height: 90px">
                                                                    <div class="project-left">
                                                                        <a class="select-color" style="background-color: ${partProject.COLOR};"></a>
                                                                        <div class="project-information">
                                                                            <div class="project-up">
                                                                                <div class="favorite-project" style="">
                                                                                    <img class="star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="${partProject.ID}">
                                                                                </div>
                                                                                <div class="setting">
                                                                                    <div class="dropdown">
                                                                                        <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="cardOpt3">
                                                                                            <div class="project-setup-header">
                                                                                                <span>프로젝트 번호</span>
                                                                                                <em id="detailSettingProjectSrno">${partProject.ID}</em>
                                                                                            </div>

                                                                                            <div class="setting-menu">
                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-exit"> <img class="setting-img share" src="../resources/project/img/projectboard/share.svg">
                                                                                                        <span class="setting-span">프로젝트 나가기</span>
                                                                                                    </a>

                                                                                                    <div class="tooltip-container">
                                                                                                        <img class="setting-info" src="../resources/project/img/projectboard/info.svg">
                                                                                                        <div class="tooltip-text">프로젝트 나가기 시, 프로젝트
                                                                                                            목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
                                                                                                    </div>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-edit"> <img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">
                                                                                                        <span class="setting-span">프로젝트 수정</span>
                                                                                                    </a>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-delete"> <img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">
                                                                                                        <span class="setting-span">프로젝트 삭제</span>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="project-name">
                                                                                    <a href="project?id=${partProject.ID}"><span class="project-name-span">${partProject.TITLE}</span></a>
                                                                                    <img class="team-count-img" src="../resources/project/img/person.svg">
                                                                                    <span class="team-count-span">${partProject.TEAMCOUNT}</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="recent-modify">
                                                                        <c:set var="timeDiff" value="${partProject.CURRENTTIME}" />

                                                                        <c:if test="${timeDiff lt 1}">
                                                                            <span>방금 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 1 and timeDiff lt 60}">
                                                                            <span>${timeDiff} 분 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 60 and timeDiff lt 1440}">
                                                                            <span>${Integer.valueOf(timeDiff div 60)} 시간 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (24*60) and timeDiff lt (7*24*60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (24*60))} 일 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (7*24*60))} 주</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="allProject" style="display:none">

                                            <div class="search-title">
                                                <span class="search-result-title">전체
                                                    <span class="all-project-count"></span>
                                                </span>
                                            </div>

                                            <div class="project-area all-project">
                                                <ul class="all-project-list">
                                                    <c:forEach var="allProject" items="${allProjectlist}">
                                                        <li class="list">
                                                            <div class="project-info" style="min-height: 90px">
                                                                <div class="project-left">
                                                                    <a class="select-color" style="background-color: ${allProject.COLOR};"></a>
                                                                    <div class="project-information">
                                                                        <div class="project-up">
                                                                            <div class="favorite-project" style="">
                                                                                <img class="star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="${allProject.ID}">
                                                                            </div>
                                                                            <div class="setting">
                                                                                <div class="dropdown">
                                                                                    <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                        <i class="bx bx-dots-vertical-rounded"></i>
                                                                                    </button>
                                                                                    <div class="dropdown-menu" aria-labelledby="cardOpt3">
                                                                                        <div class="project-setup-header">
                                                                                            <span>프로젝트 번호</span>
                                                                                            <em id="detailSettingProjectSrno">${allProject.ID}</em>
                                                                                        </div>

                                                                                        <div class="setting-menu">
                                                                                            <div class="setting-line">
                                                                                                <a class="setting-anchor setting-exit"> <img class="setting-img share" src="../resources/project/img/projectboard/share.svg">
                                                                                                    <span class="setting-span">프로젝트 나가기</span>
                                                                                                </a>

                                                                                                <div class="tooltip-container">
                                                                                                    <img class="setting-info" src="../resources/project/img/projectboard/info.svg">
                                                                                                    <div class="tooltip-text">프로젝트 나가기 시, 프로젝트
                                                                                                        목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="setting-line">
                                                                                                <a class="setting-anchor setting-edit"> <img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">
                                                                                                    <span class="setting-span">프로젝트 수정</span>
                                                                                                </a>
                                                                                            </div>

                                                                                            <div class="setting-line">
                                                                                                <a class="setting-anchor setting-delete"> <img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">
                                                                                                    <span class="setting-span">프로젝트 삭제</span>
                                                                                                </a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="project-name">
                                                                                <a href="project?id=${allProject.ID}"><span class="project-name-span">${allProject.TITLE}</span></a>
                                                                                <img class="team-count-img" src="../resources/project/img/person.svg">
                                                                                <span class="team-count-span">${allProject.TEAMCOUNT}</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="recent-modify">
                                                                    <c:set var="timeDiff" value="${allProject.CURRENTTIME}" />

                                                                    <c:if test="${timeDiff lt 1}">
                                                                        <span>방금 전</span>
                                                                    </c:if>

                                                                    <c:if test="${timeDiff ge 1 and timeDiff lt 60}">
                                                                        <span>${timeDiff} 분 전</span>
                                                                    </c:if>

                                                                    <c:if test="${timeDiff ge 60 and timeDiff lt 1440}">
                                                                        <span>${Integer.valueOf(timeDiff div 60)} 시간 전</span>
                                                                    </c:if>

                                                                    <c:if test="${timeDiff ge (24*60) and timeDiff lt (7*24*60)}">
                                                                        <span>${Integer.valueOf(timeDiff div (24*60))} 일 전</span>
                                                                    </c:if>

                                                                    <c:if test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
                                                                        <span>${Integer.valueOf(timeDiff div (7*24*60))} 주</span>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
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
    </div>

    <!-- common js -->
    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>

    <script src="../resources/project/js/projectboard/projectboard_Header.js"></script>

    <script>
        $(document).ready(function() {
            // tabs active
			$('.tabs ul li').click(function() {
			    var $this = $(this);
			
			    $('.tabs ul li').removeClass('is-active');
			
			    $this.addClass('is-active');
			
			    if ($this.hasClass('part-tabs')) {
			        $('.personalProject').css('display', 'block');
			        $('.allProject').css('display', 'none'); 
			    } else if ($this.hasClass('all-tabs')) {
			        $('.personalProject').css('display', 'none');
			        $('.allProject').css('display', 'block');
			    }
			});
            
            // list-dropdown
            $('#favorit-arrow').click(function() {
            	  var src = $(this).attr('src');

            	  if (src == '../resources/project/img/arrow/chevron-down.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-up.svg');
            	    $('.favoritProject').css('padding-bottom','25px');
            	    $('.favorit-project').slideUp(500);
            	    
            	  } else if (src == '../resources/project/img/arrow/chevron-up.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-down.svg');
            	    $('.favoritProject').css('padding-bottom',0);
            	    $('.favorit-project').slideDown(500);
            	  }
            });
            
            // list-dropdown
            $('#part-arrow').click(function() {
            	  var src = $(this).attr('src');

            	  if (src == '../resources/project/img/arrow/chevron-down.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-up.svg');
            	    $('.partProject').css('padding-bottom','25px');
            	    $('.part-project').slideUp(500);
            	    
            	  } else if (src == '../resources/project/img/arrow/chevron-up.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-down.svg');
            	    $('.partProject').css('padding-bottom',0);
            	    $('.part-project').slideDown(500);
            	  }
            });
            
            $(".star").click(function(){
                var $this = $(this);
                var $targetList = $this.closest('li'); // 가장 가까운 상위의 li 찾기

                $targetList.hide();

                setTimeout(function() {
                    $targetList.fadeIn(500);
                }, 500);
            })
            
            $('#searchInput').on('keyup', function() {
                var value = $(this).val().toLowerCase();

                if (value === '') {
                    $('.list').show();
                } else {
                    var matchedItems = $('.list').filter(function() {
                        var projectName = $(this).find('.project-name-span').text().toLowerCase();
                        return projectName.indexOf(value) > -1;
                    });

                    $('.list').hide();
                    matchedItems.show();
                }
            });
        });
    </script>

</body>

</html>