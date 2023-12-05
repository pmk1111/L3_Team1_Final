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
            $("#" + id).html(msg);
            $("#" + id).attr("style", "visibility : visible");
        }

        function checkEmail(obj) {

            if (!validateEmail(obj.value)) {
                printErrMsg("email_message", "유효한 이메일을 입력해주세요.");

                $("#email_message").addClass("errAction");
                $("#email").addClass("errId");
                $(".mail-text").addClass("Action");

                return;
            } else {
                var email = obj.value;
                $.ajax({
                    url: '../user/check-email',
                    type: 'POST',
                    data: {
                        email: email
                    },
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        if (response == 1) { // 동일한 이메일이 DB에 존재한다면
                            printErrMsg("email_message", "이미 사용중인 이메일입니다.");
                            $("#isChkEmail").val("N");
                            $("#hiddenEmail").val('');

                            $("#email_message").addClass("errAction");
                            $("#email").addClass("errId");
                            $(".mail-text").addClass("Action");

                        } else { // 동일한 이메일이 DB에 없다면
                            $("#email_message").attr("style", "visibility : hidden");
                            $("#isChkEmail").val("Y");
                            $("#hiddenEmail").val(email);

                            $("#email_message").removeClass("errAction");
                            $("#email").removeClass("errId");
                            $(".mail-text").removeClass("Action")
                        }
                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
            }
        }

        function checkUserName(obj) {
            if (obj.value.length < 2) {
                printErrMsg("name_message", "이름은 2글자 이상이어야 합니다.");
                $("#isChkName").val("N");

                $("#name_message").addClass("errAction");
                $("#userName").addClass("errId");
                $(".user-text").addClass("Action");
            } else {
                $("#name_message").attr("style", "visibility : hidden");
                $("#isChkName").val("Y");

                $("#name_message").removeClass("errAction");
                $("#userName").removeClass("errId");
                $(".user-text").removeClass("Action");
            }
        }

        function checkPassword(obj) {

            if (obj.value.length < 6) {
                printErrMsg("pw_message", "비밀번호는 6글자 이상이어야 합니다.");
                $("#isChkPassword").val("N");

                $("#pw_message").addClass("errAction");
                $("#password").addClass("errId");
                $(".pass-text").addClass("Action");

            } else {
                $("#pw_message").attr("style", "visibility : hidden");
                $("#isChkPassword").val("Y");

                $("#pw_message").removeClass("errAction");
                $("#password").removeClass("errId");
                $(".pass-text").removeClass("Action");
            }
        }

        function saveUser() {
            var userVerificationCode = $("#authNum").val();
            console.log("Server code: " + serverVerificationCode); // 로그 추가
            console.log("User code: " + userVerificationCode); // 로그 추가
            saveUser();
        }

        function closeModal() {
            $(".modalarea").css("display", "none");
        }

        var countdown; // 카운트다운 변수

        // 카운트다운 시작하는 함수
        function startCountdown() {
            var duration = 120;

            $("#timer").show();

            countdown = setInterval(function() {
                if (duration <= 0) {
                    clearInterval(countdown);

                    alert("인증 시간이 만료되었습니다. 다시 인증해주세요.");
                    closeModal();

                } else {
                    var minutes = Math.floor(duration / 60);
                    var seconds = duration % 60;

                    $("#timer").text(minutes + '분 ' + seconds + '초');
                }

                duration--;

            }, 1000);
        }

        function stopCountdown() {
            clearInterval(countdown);
            $("#timer").hide();
        }

        function openModal() {
            $(".modalarea").css("display", "block");
            startCountdown();
        }

        function closeModal() {
            $(".modalarea").css("display", "none");
            stopCountdown();
        }

        function confirmUser() {

            if (isSending == "Y") {
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

            $(".modalarea").css("display", "block");
            $(".authDescription").html('<strong>' + email + '</strong> 으로 <br> 6자리 인증코드가 전송되었습니다.');


            startCountdown();

            $.ajax({
                url: '../user/send-mail-auth-code',
                type: 'POST',
                data: {
                    email: email
                },
                beforeSend: function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
                    xhr.setRequestHeader(header, token);
                },
                success: function(response) {
                    if (response == 0) {
                        isSending = "N";
                    } else {
                        alert("인증번호 발송에 실패하였습니다.");
                        stopCountdown();
                        closeModal();
                        return;
                    }
                },
                error: function(error) {
                    console.error(error);
                    stopCountdown();
                    closeModal();
                }
            });
        }

        function checkAuthCode() {
            $.ajax({
                url: '../user/check-auth-code',
                type: 'POST',
                data: $("#joinform").serialize(),
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function(response) {
                    if (response == 0) {
                        alert("축하합니다! 회원가입이 완료되었습니다!");
                        location.href = "login"
                    } else {
                        alert("인증코드가 일치하지 않습니다. 인증코드를 다시 확인해주세요.");
                    }
                },
                error: function(error) {
                    console.error(error);
                }
            });
        }

        $('#password').keyup(function() {
            if ($(this).val() == '') {
                $('.eye').hide();
            } else {
                $('.eye').show();
            }
        });


        $('.eye').hover(function() {
                $('.eye').attr('src', '../resources/JJ/img/eye_black.svg');
                $('.pw').attr('type', 'text');
            },
            function() {
                $('.eye').attr('src', '../resources/JJ/img/eye_gray.svg');
                $('.pw').attr('type', 'password');
            }
        );