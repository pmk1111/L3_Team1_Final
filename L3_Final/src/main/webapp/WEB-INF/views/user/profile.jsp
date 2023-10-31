<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import = "java.util.Enumeration" %>
<html class="light-style layout-menu-fixed" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>회원관리 - 회원수정 페이지</title>

    <meta name="description" content="" />

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>


    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
        }

        .changepassword {
            margin: 20px 0px 40px 0px
        }

        .changepwd {
            background-color: white;
            border: 1px solid #d9dee3;
            color: #697a8d;
            border-radius: 5px;

        }

        .pwdsubmit {
            border: 1px solid #d9dee3;
            background-color: white;
            color: #697a8d;
            box-shadow: none;
            border-radius: 5px;
        }

        #fileName {
            font-size: 13px;
        }

        .pb-JJ {
            padding-bottom: 0px !important;
            padding-top: 25px !important;
        }
    </style>
    <script>
        const result = "${result}";
        if (result == 'success') {
            alert("회원 정보가 수정되었습니다.")
        }
    </script>
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
                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <div class="container-xxl flex-grow-1 container-p-y">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-4" style=" display: flex; align-items: center;">
                                    <h4 class="fw-bold py-3 mb-4 pb-JJ">내 정보</h4>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <form id="formAccountSettings" method="POST" action="../user/update-process" enctype="multipart/form-data">
                                    <div class="card mb-4">
                                        <h5 class="card-header">프로필</h5>
                                        <!-- Account -->
                                        <div class="card-body profile-img">
                                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                                <c:choose>
                                                    <c:when test="${not empty userinfo.pic}">
                                                        <img src="${pageContext.request.contextPath}/upload${userinfo.pic}" alt="프로필 사진" class="d-block rounded" height="150" width="150" id="uploadedAvatar" />

                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/user/assets/img/avatars/profile.png" alt="기본 프로필 사진" class="d-block rounded" height="150" width="150" id="uploadedAvatar" />

                                                    </c:otherwise>
                                                </c:choose>

                                                <div class="mb-3 col-md-6">
                                                    <label for="name" class="form-label">이름</label>
                                                    <input class="form-control" type="text" name="name" id="name" value="${userinfo.name}" />
                                                </div>

                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="tel">휴대폰 번호</label>
                                                    <input type="text" id="phone" name="phone" class="form-control" placeholder="010 000 0000" value="${userinfo.phone}" />
                                                </div>

                                                <div class="mb-3 col-md-6">
                                                    <label for="email" class="form-label">이메일</label>
                                                    <input class="form-control" type="text" id="email" name="email" value="${userinfo.email}" required readOnly />
                                                </div>

                                                <div class="changepassword">
                                                    <button type="button" class="changepwd"><a href="${pageContext.request.contextPath}/user/change-pwd"> 비밀번호 변경</a></button>
                                                </div>

                                                <div class="button-wrapper">
                                                    <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                                        <span class="d-none d-sm-block">프로필 수정</span>
                                                        <i class="bx bx-upload d-block d-sm-none"></i>

                                                    </label>
                                                    <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                                                        <i class="bx bx-reset d-block d-sm-none"></i>
                                                        <span class="d-none d-sm-block">취소</span>
                                                    </button>

                                                    <div id="filename">
                                                        <input type="file" id="upload" name="uploadfile" value="${userinfo.pic}" class="account-file-input" accept="image/png, image/jpeg" style="display: none;" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <label for="company" class="form-label">회사</label>
                                                <input type="text" class="form-control" id="company" name="company" value="${userinfo.companyName}" required readOnly />
                                            </div>

                                            <div class="mb-3 col-md-6">
                                                <label for="company" class="form-label">부서</label>
                                                <input type="text" class="form-control" id="company" name="company" value="${userinfo.department}" required readOnly />
                                            </div>

                                            <div class="mb-3 col-md-6">
                                                <label for="company" class="form-label">직책</label>
                                                <input type="text" class="form-control" id="company" name="company" value="${userinfo.position}" required readOnly />
                                            </div>




                                            <div class="mt-2">
                                                <button type="submit" class="btn btn-primary me-2" id="updateProfile">저장</button>
                                                <button type="reset" class="btn btn-outline-secondary" onclick="history.back();">취소</button>
                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        
                        
                        <div class="card">
                            <h5 class="card-header">회원 탈퇴</h5>
                            <div class="card-body">
                                <div class="mb-3 col-12 mb-0">
                                    <div class="alert alert-warning">
                                        <h6 class="alert-heading fw-bold mb-1">정말로 탈퇴하시겠습니까?</h6>
                                        <p class="mb-0">탈퇴시 모든 정보를 더 이상 확인할 수 없습니다.</p>
                                    </div>
                                </div>
                                <form id="formAccountDeactivation" action="../user/delete" method="GET">
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" name="agreeDelete" id="agreeDelete" />
                                        <label class="form-check-label" for="accountActivation">동의합니다.</label>
                                    </div>

                                    <button type="submit" class="btn btn-danger deactivate-account" id="deleteUser">탈퇴</button>
                                </form>
                            </div>
                        </div>
                        
                    </div>
                </div>
			<div></div>
            <div class="content-backdrop fade"></div>
        </div>
    </div>
    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>

    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    <script src="../resources/user/js/profile.js"></script>


</body>

</html>