<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>북마크 리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bookmark/css/bookmark.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>

    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
        }

        .card {
            width: 100%;
            height: 800px;
            min-width: 0;
            min-height: 720px;
            position: relative;
            display: flex;
            flex-direction: column;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(30, 46, 80, .09);
            border-radius: 0.25rem;

        }
    </style>
    <script>
        $(function() {

            const $input = $("input[name=search_word]")

            //검색 버튼 클릭한 경우
            $(".search-btn-icon").click(function() {
                //검색어  공백 유효성 검사합니다.
                if ($input.val() == '') {
                    alert("검색어를 입력하세요.");
                    $input.focus();
                    return false;
                }


            }); //button click end


        }) //ready end
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
                    <jsp:include page="../chat/chat.jsp"></jsp:include>
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">
                            <div class="col-lg-12 mb-4 order-0 welcome-message">
                                <div class="card">
                                    <div class="card-body bookmark-list-card-body">
                                        <h3 style="font-size: 27px; font-weight: 800; color: #555; padding-bottom:14px;">북마크</h3>

                                        <!-- <form name="bookmark-search-form" class="bookmark-search" autocomplete="off" method="GET" action="bookmark-list"> -->
                                            <div class="search-bookmark">
                                                <div class="search-area">
                                                    <input type="text" class="bookmark-search" id="search_word" name="search_word" placeholder="검색어를 입력하세요" value="${search_word}">
                                                    <input type="button" id="search-btn">
                                                    <label for="search-btn" class="search-label">
                                                        <img class="search-btn-icon" src="../resources/project/img/projectboard/search.svg">
                                                    </label>
                                                </div>
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <!-- </form> -->
                                        <hr>

                                        <div class="search-title">
                                            <span class="search-result-title">전체 <span class="all-bookmark-count">${bookmarkCount}</span>
                                            </span>
                                        </div>

                                        <div class="bookmark-area">

                                            <ul class="all-bookmark-list">

                                                <c:choose>
                                                    <c:when test="${empty bookmarkList}">
                                                        <p class="no-bookmark-text">북마크가 없습니다.</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="bookmark" items="${bookmarkList}">
                                                            <li class="bookmark-list">
                                                                <div class="bookmark-wrap">
                                                                	<img src="../resources/bookmark/img/bookmark_purple.png" class="bookmark-icon" id="bookmark" alt="북마크" width=25px>
                                                                    <c:choose>
                                                                        <c:when test="${bookmark.type eq '버그'}">
                                                                            <img src="../resources/issue/img/bug.svg" class="issuetype-icon">
                                                                        </c:when>
                                                                        <c:when test="${bookmark.type eq '에픽'}">
                                                                            <img src="../resources/issue/img/epic.svg" class="issuetype-icon">
                                                                        </c:when>
                                                                        <c:when test="${bookmark.type eq '작업'}">
                                                                            <img src="../resources/issue/img/task.svg" class="issuetype-icon">
                                                                        </c:when>
                                                                    </c:choose>

                                                                    <span class="issuetype">${bookmark.type}</span>
                                                                    <span class="contentTitle">
                                                                        <a href="../issue/issue-detail?num=${bookmark.issue_id}">
                                                                            ${bookmark.subject}</a>
                                                <%--                         <p class="content-project">
                                                                            <em class="project-name">${bookmark.title}</em></p> --%>
                                                                    </span>
                                                                </div>
                                                                <div class="bookmark-list-right">
                                                                    <c:choose>
                                                                        <c:when test="${bookmark.priority == 'low'}">
                                                                            <span class="low">${bookmark.priority}</span>
                                                                        </c:when>
                                                                        <c:when test="${bookmark.priority == 'middle'}">
                                                                            <span class="middle">${bookmark.priority}</span>
                                                                        </c:when>
                                                                        <c:when test="${bookmark.priority == 'high'}">
                                                                            <span class="high">${bookmark.priority}</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="critical">${bookmark.priority}</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <span class="bookmark-list-name">${bookmark.name}</span>
                                                                    <span class="bookmark-list-date">


                                                                        <c:set var="timeDiff" value="${bookmark.currentTime}" />

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
                                                                            <span>${Integer.valueOf(timeDiff div (24*60))} 일
                                                                                전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (7*24*60))}
                                                                                주</span>
                                                                        </c:if>
                                                                    </span>
                                                                </div>

                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                        </div>
                                        </li>
                                        </ul>
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
                </div>
            </div>
        </div>
        
    </div>
    

    </div>



    <div class="content-backdrop fade"></div>
    

    <!-- / Layout page -->


    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/bookmark/js/bookmark.js"></script>

</body>

</html>