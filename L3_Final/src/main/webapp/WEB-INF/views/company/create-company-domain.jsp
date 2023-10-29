<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>WidUs-join</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="../resources/user/css/create-company-domain.css" />
    <!-- Favicons -->
    <link href="../resources/home/assets/img/favicon.png" rel="icon">
    <link href="../resources/home/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!-- Vendor CSS Files -->
    <link href="../resources/home/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../resources/home/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <!-- Template Main CSS File -->
    <link href="../resources/home/assets/css/home.css" rel="stylesheet">
    <!-- ======================================================== * Template Name: Arsha * Updated: Jul 27 2023 with Bootstrap v5.3.1
     * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ * Author: BootstrapMade.com *
      License: https://bootstrapmade.com/license/ ======================================================== -->
    <style type="text/css">
        .companyName,
        .eid {
            color: #333;
            font-size: 16px;
            padding: 0 0 0 20px;
            background: #FFFFFF;
            width: 640px;
            padding: 16px 20px;
            color: #333;
            border: 1px solid #ddd;
            -webkit-border-radius: 8px;
            border-radius: 8px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            margin-top: 10px;
        }

        .errMsg {
            text-align: left;
            margin-top: 10px;
            color: #ff6b6b;
            font-size: 14px;
            line-height: 21px;
        }

        .errMsg {
            margin-top: 5px;
            margin-bottom: 5px;
            visibility: hidden;
        }

        .btn-join {
            margin-top: 20px;
            margin-bottom: 100px;
        }
    </style>
</head>

<body>
    <jsp:include page="../user/header.jsp"></jsp:include>
	<form id="joinform" name="joinform" action="" method="post">
	    <div class="auth-section after-contets">
	        <div class="accont-wrap">
	            <div id="companyJoinMain" class="login-wrap">
	                <div class="login-text">새 회사 만들기</div>
	                <div class="login-company">회사 정보 입력 후, Widus 관리자로 시작해보세요.</div>
	                <div class="join-contets">
	                    <div>
	                        <b class="bTxt">회사명</b><br> <input type="text" id="name" class="companyName" name="name" placeholder="회사이름을 입력하세요" maxLength="30" required>
	                        <p class="errMsg" id="name_message">오류메세지 영역</p>
	                    </div>
	                    <p class="url-tit">회사 URL</p>
	                    <div class="url-wr">
	                        <span>https://</span> <input id="domain" onfocusout = "checkDuplicationDomain()" name="domain" type="text" class="companyDomain" autocomplete="off" placeholder="회사 URL" maxLength="30">
	                        <span>.widus.team</span>
<!-- 	                    </div> -->
	                    <p id="helpMsg" class="join-company-url" style="display: block;">
	                        회사URL 주소는 관리자를 통해 확인할 수 있습니다.
	                </div>
	
	                <div>
	                    <b class="bTxt">사업자 등록번호</b><br> <input type="number" maxlength="10"  oninput="maxLengthCheck(this)" id="RegistrationNo" class="eid" name="RegistrationNo" placeholder="-없이 10자리를 입력하세요" required>
	                    <p class="errMsg" id="eid_message">오류메세지 영역</p>
	                </div>
	                <button type="button" id="companyJoinBtn" onclick="companyJoin()" class="btn-join"><strong>회사 생성하기</strong></button>
	            </div>
	        </div>
	    </div>
		<input type="hidden" id="isChkDomain" name="isChkDomain" value="N" />
	    <input type="hidden" id="isChkEid" name="isChkEid" value="N" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>
    
    <div id="signupFooterArea" style="display: block;">
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <!-- Vendor JS Files -->
    <script src="../resources/home/assets/vendor/aos/aos.js"></script>
    <script src="../resources/home/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/home/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../resources/home/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../resources/home/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="../resources/home/assets/vendor/waypoints/noframework.waypoints.js"></script>
    <script src="../resources/home/assets/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script src="../resources/home/assets/js/main.js"></script>
   
</body>
<script type='text/javascript'>
 	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
    
	
	function validateURL(input){
        var re = /^[a-zA-Z0-9-]{3,30}$/;
        return re.test(input);
    }
	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	  }
	
	function checkDuplicationDomain(){
		var domain = $("#domain").val();
		
		if(domain == ''){
			$("#helpMsg").html("사용하실 도메인을 입력해주세요.");
			return;
		}
		
		if(validateURL($("#domain").val()) == false){
			$("#helpMsg").html("회사 URL은 3~30글자의 영문자/숫자/하이픈(-)으로만 입력해야 합니다.");
			return;
		}
		
		$.ajax({
       		url: '../company/check-duplication-domain',
	       	type: 'POST',
	       	data: $("#joinform").serialize() ,
	       	beforeSend: function(xhr) {
	           xhr.setRequestHeader(header, token);
	       	},
       		success: function(response) {
           		if (response == 0) {  
           			$("#helpMsg").html("사용가능한 도메인입니다.");
           			$("#isChkDomain").val('Y');
           		} else  { 
               		$("#helpMsg").html("이미 사용중인 도메인입니다. 다른 도메인을 입력해주세요.");
               		$("#isChkDomain").val('N');
           		}
       		},
       		error: function(error) {
           		console.error(error);
       		}
   		});
	}
	
	function companyJoin(){
		$.ajax({
       		url: '../company/create-company',
	       	type: 'POST',
	       	data: $("#joinform").serialize() ,
	       	beforeSend: function(xhr) {
	           xhr.setRequestHeader(header, token);
	       	},
       		success: function(response) {
           		if (response == 0) {  
           			alert("회사정보가 등록되었습니다.");
           			location.href="../mainboard/my-dashboard"
           		} else  { 
               		$("#helpMsg").html("회사정보 등록에 실패하였습니다.");
               		return;
           		}
       		},
       		error: function(error) {
           		console.error(error);
       		}
   		});
		
		
	}
	
</script>
</html>