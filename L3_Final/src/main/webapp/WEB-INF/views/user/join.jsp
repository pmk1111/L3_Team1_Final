<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>WidUs-join</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="stylesheet" href="../resources/user/css/join.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Favicons -->
    <link href="../resources/home/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
     * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ * Author: BootstrapMade.com
     * License: https://bootstrapmade.com/license/ ======================================================== -->
    <style>
        .modalarea {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
        }
        
        .modal {
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        
        .modal-content {
           background-color: #f4f4f4;
           padding: 20px;
           border-radius: 5px; 
           max-width: 400px;  
        }
        
        .close {
          color:#aaa ;
          float:right ;
          font-size :28px ;
          font-weight :bold ;
         }
        
         .close:hover,
         .close:focus{
             color:black ;
             text-decoration:none ; 
             cursor:pointer ; 
         }  

        .authDescription {
            text-align: center;
            width: 100%;
            margin-bottom: 20px;
        }
    </style>

</head>

<body>

    <jsp:include page="header.jsp"></jsp:include>

    <form id="joinform" name="joinform" action="login" method="get">

        <div class="auth-section after-contets">
            <div class="accont-wrap">
                <div class="account">개인회원</div>
                <div class="formDiv">
                    <div>
                        <b class="bTxt">이메일 주소</b>
                        <br>
                        <input type="text" id="email"  class="email" name="email" maxLength="30" onfocusout = "checkEmail(this)" placeholder="이메일을 입력하세요" required >
                        <p class="errMsg" id="email_message">오류메세지 영역</p>
                    </div>
                    <div>
                        <b class="bTxt">이름</b>
                        <br>
                        <input type="text" id="userName" class="name" name="name" onfocusout = "checkUserName(this)" placeholder="이름을 입력하세요" maxLength="15" required>
                        <p class="errMsg" id="name_message">오류메세지 영역</p>
                    </div>
                    <div>
                        <b class="bTxt">비밀번호</b>
                        <br>
                        <input type="password" id="password" placeholder="비밀번호를 입력하세요" onfocusout="checkPassword(this)" class="pw" name="password" required>
                        <p class="errMsg" id="pw_message">오류메세지 영역</p>
                    </div>

                    <div class="mt10">
                        <div>
                            <input type="checkbox" id="policyCheckbox" class="policy" name="policy" value="필수">
                            <label for="policy" class="policyLabel">
                                <b class="require">(필수)</b>&nbsp;
                                <a href="Service.net" style="color: #7C00B6; text-decoration: dash">서비스 이용약관</a>,
                                <a href="PrivatePolicy.net" style="color: #7C00B6; text-decoration: dash">개인정보 처리방침</a>에 동의합니다.
                            </label>
                        </div>
                        <br>
                        <div>
                            <input type="checkbox" id="benefits" class="benefits" name="benefits" value="선택">
                            <label for="benefits" class="benefitsLabel">
                                <b>(선택)</b>&nbsp;혜택 수신에 동의합니다.
                            </label>
                        </div>
                    </div>
                </div>
				
				<!-- submitbtn 클래스명 수정 -->
                <div class="clearfix">
                    <button type="button" class="submitbtn" id="confirmBtn" onclick="confirmUser()">
                        <strong>가입하기</strong>
                    </button>
                </div>

                <input type="hidden" id="authRandNum" name="authRandNum" />
                <input type="hidden" id="isChkPassword" name="isChkPassword" value="N" />
                <input type="hidden" id="isChkName" name="isChkName" value="N" />
                <input type="hidden" id="isChkEmail" name="isChkEmail" value="N" />
                <input type="hidden" id="isChkpolicy" name="isChkpolicy" value="N" />
            </div>

        </div>
        
        <div class="modalarea">
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">&times;</span>
                    
                    <!-- 입력한 이메일 데이터값 -->
                    <input type="hidden" id="hiddenEmail" name="hiddenEmail">
                    
                    <strong style="padding-left: 40px; padding-bottom: 20px;">인증번호 입력</strong>
                    <label for="authDescription" class="authDescription"></label><br>

                    <input type="text" id="authNum" class="authNum" name="authNum" placeholder="인증번호를 입력하세요" maxLength="6" required>
                    <p class="errMsg" id="auth_message">오류메세지 영역</p>

                    <button type="button" class="save" onclick="checkAuthCode()">확인</button>
                </div>
            </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>

    <div id="signupFooterArea" style="display: block;">
        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h3>WidUs</h3>
                            <p>
                                서울 종로구 율곡로10길 <br> 105 디아망 4층<br> 봉익동 10-1 03134<br>
                                <br> <strong>Phone:</strong> 010-1234-1234<br> <strong>Email:</strong>
                                WidUs1004@naver.com<br>
                            </p>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>다음으로 이동</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">홈</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">소개</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">솔루션</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">서비스
                                        약관</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">개인정보
                                        이용약관</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Services</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web
                                        Design</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web
                                        Development</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Product
                                        Management</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
                                        Design</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>SNS</h4>
                            <p>WidUs 팀원들의 SNS 계정을 방문해 보세요.</p>
                            <div class="social-links mt-3">
                                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="container footer-bottom clearfix">
            
                <div class="copyright">
                    &copy; Copyright <strong><span>WidUs</span></strong>. All Rights
                    Reserved
                </div>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you purchased the pro version. -->
                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ -->
                    Designed by <a href="https://bootstrapmade.com/">JHTA_L3_1</a>
                </div>
            </div>
        </footer>
        <!-- End Footer -->
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
    
<script type="text/javascript">
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    
    var isSending = "N";
    
    //이메일 유효성 검사    
    function validateEmail(email) {
        var re = /\S+@\S+\.\S+/;
        return re.test(email);
    }

    // 오류 메세지 출력
    function printErrMsg(id, msg) {
        $("#"+id).html(msg);
        $("#"+id).attr("style","visibility : visible");
    }
    
    function checkEmail(obj){

    	if (!validateEmail(obj.value)) {
              printErrMsg("email_message", "유효한 이메일을 입력해주세요.");
              return;
          } else {
              var email = obj.value;
              $.ajax({
                  url: '../user/check-email',
                  type: 'POST',
                  data: { email: email },
                  beforeSend: function(xhr) {
                      xhr.setRequestHeader(header, token);
                  },
                  success: function(response) {
                      if (response == 1) {  // 동일한 이메일이 DB에 존재한다면
                          printErrMsg("email_message", "이미 사용중인 이메일입니다.");
	                      $("#isChkEmail").val("N");
                          $("#hiddenEmail").val('');
                      } else {  // 동일한 이메일이 DB에 없다면
                    	  $("#email_message").attr("style","visibility : hidden");
                          $("#isChkEmail").val("Y");
                          $("#hiddenEmail").val(email);
                      }
                  },
                  error: function(error) {
                      console.error(error);
                  }
              });
          }
    }
    
    function checkUserName(obj){
        if (obj.value.length < 2) {
            printErrMsg("name_message", "이름은 2글자 이상이어야 합니다.");
            $("#isChkName").val("N");
        } else {
      	  $("#name_message").attr("style","visibility : hidden");
          $("#isChkName").val("Y");
        }
    }
    
    function checkPassword(obj){

        if (obj.value.length < 6) {
            printErrMsg("pw_message", "비밀번호는 6글자 이상이어야 합니다.");
            $("#isChkPassword").val("N");
        } else {
        	$("#pw_message").attr("style","visibility : hidden");
			$("#isChkPassword").val("Y");
        }
    }
    
    function saveUser(){
	    var userVerificationCode = $("#authNum").val();
	    console.log("Server code: " + serverVerificationCode);  // 로그 추가
	    console.log("User code: " + userVerificationCode);  // 로그 추가
	    saveUser();
    }
    
    function closeModal(){
    	$(".modalarea").css("display", "none");
    }
    
    function confirmUser(){

    	if(isSending == "Y"){
    		alert("현재 이메일이 발송중입니다. 잠시만 기다려주세요");
    		return;
    	}
    	
		// 모든 필드의 유효성을 확인
		if (!($("#isChkEmail").val() === "Y")) {
		    alert("이메일을 확인해주세요.");
		    return;
		}
		if (!($("#isChkName").val() === "Y")) {
		    alert("이름을 확인해주세요.");
		    return;
		}
		if (!($("#isChkPassword").val() === "Y")) {
		    alert("비밀번호를 확인해주세요.");
		    return;
		}
	   	if ($("#policyCheckbox").is(":checked")) {
			$("#isChkpolicy").val('Y');
		} else {
			alert('서비스 이용약관 동의는 필수입니다.');
            return;
            $("#isChkpolicy").val('N');
            $("#policyCheckbox").focus();
        }
		
      
        var email = $("#hiddenEmail").val();
        isSending = "Y";
        $.ajax({
            url: '../user/send-mail-auth-code',
            type: 'POST',
            data: { email: email },
            beforeSend: function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
            	if(response == 0){
            		$(".authDescription").html(email + '으로 <br> 6자리 인증번호가 전송되었습니다.');
           		   	$(".modalarea").css("display", "block");
           		 	isSending = "N";
            	}else{
            		alert("인증번호 발송에 실패하였습니다.");
            		return;
            	}
            },
            error: function(error) {
                console.error(error);
            }
        });
    }
    
    function checkAuthCode(){
    	 $.ajax({
             url: '../user/check-auth-code',
             type: 'POST',
             data: $("#joinform").serialize() ,
             beforeSend: function(xhr) {
                 xhr.setRequestHeader(header, token);
             },
             success: function(response) {
                 if (response == 0) {  
                	 $("#joinform").submit();
                	 alert("회원가입이 완료되었습니다 로그인을 해주세요.");
                 } else  { 
                     alert("인증코드가 일치하지 않습니다. 인증코드를 다시 확인해주세요.");
                 }
             },
             error: function(error) {
                 console.error(error);
             }
         });
    }
	
</script>
 
</body>
</html>