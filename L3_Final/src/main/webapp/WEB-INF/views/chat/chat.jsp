<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<article class="chatting-layer">
	<div class="chat-menu-top">
		<strong class="chat-menu-txt">채팅</strong>
		<button class="chat-menu-close-btn">
			<img src="../resources/chat/img/close.svg" alt="닫기">
		</button>
	</div>

	<div class="chat-side-content">
		<div class="chat-menu-area">
			<ul>
				<li id="chatbtn"><span class="popup-tab chat-on chat-room-list on">채팅</span></li>
				<li id="contactbtn"><span class="contact">연락처</span></li>
			<!-- 	<button type="button" class="popup-btn new-chat">
					<img>새 채팅
				</button> -->
			</ul>
		</div>

		<div class="chat-search-area">
			<input type="text" class="search-chat">
		</div>

		
		<div class="chat-list-area">
			<ul class="chat-list">
				<!-- 
				
				<li class="chat-room" data-room-id="3">
					<div class="chat-img-user-latest">
						<img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt="">
					</div>

					<div class="user-latest">
						<p class="chat-user-id">JJok</p>
						<p class="latest-chat">오늘만 지나면 추석입니다.</p>
					</div>

					<div class="update-time-area">
						<span class="update-time">13:52</span>
					</div>
				</li>
				 -->
				
			</ul>

		</div>
		
		
		
		<div class="chat-contact-area">
			<ul class="contact-list">

			</ul>
			
		</div>
	</div>
	
</article>

<article class="chatting-room">
	<div class="chat-menu-top">
	<input type="hidden" class="msg-to" name="msgTo" value="">
	<!-- 내가 어떤 직원에게 메시지를 보낼 지 저장하는 항목이다 -->
	<button class="back-btn">
		<img class="back-to-chatting-layer" src="../resources/chat/img/leftArrow.svg">
	</button>
	<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" >
		<strong class="chat-user-txt">JJok</strong>
		<button class="chat-menu-close-btn">
			<img src="../resources/chat/img/close.svg" alt="닫기">
		</button>
	</div>
	
	<div class="chatting-list">
		<div class="wrap">
    </div>
			
	</div>
	
	<div class="chat-write-area">
		<div id="chat-write-input" contenteditable="true"></div>
		<button class="send-messagebtn" type="button">전송</button>
	</div>
</article>

<script>
//웹소켓으로 전송할 텍스트가 줄바꿈이 적용되게 함
var csrfToken = $("meta[name='_csrf']").attr("content");

$('.chat-icon, .chat-room').click(function () {
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/get-chat-room-list",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            $('.chat-list').empty();
            if (response.length > 0) {
                str = '<li class="chat-room" data-room-id="3">'
                str += '<div class="chat-img-user-latest">'
                str += '<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>'
                str += '<div class="user-latest">'
                str += '<p class="chat-user-id">JJok</p>'
                str += '<p class="latest-chat">' + response.resent_content + '</p></div>'
                str += '<div class="update-time-area">'
                str += '<span class="update-time">' + response.updated_at + '</span></div></li>'

                $('.chat-list').append(str);
                //수정 필요
            } else {
                str = '<h4 class="no-chat-room">채팅방이 없습니다.</h4>'
                $('.chat-list').append(str);
            }
        }, // success end
        error: function (error) {
            console.error("Error: " + error);
        }
    }) // ajax end
}) // .chat-icon, .chat-room click end

$('.contact').click(function () {
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/get-chat-employee-list",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            $('.contact-list').empty();
            if (response.length > 0) {
                response.forEach(function (item) {
                    let str = '<li class="contact-user">';
                    str += '<div class="chat-img-user-latest">';
                    str += '<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" alt="">';
                    str += '</div>';
                    str += '<input type="hidden" class="employee-id" name="employeeId" value="' + item.id + '">'
                    str += '<div class="contact-user-info">';
                    str += '<p class="chat-user-id">' + item.user_name + '</p>';
                    str += '<p class="chat-user-company">' + item.user_email + '</p></div>';
                    str += '<button class="create-chat">';
                    str += '<img class="create-chat-icon" src="../resources/mainboard/assets/img/chat-lightgrey.svg">';
                    str += '</button></li>'

                    $('.contact-list').append(str);

                }) // forEach
            }
        }, //success
        error: function (error) {
            console.error("Error: " + error);
        }
    })
}); // contact click end






function convertNewlinesToBr(inputText) {
    return inputText.replace(/\n/g, '<br>');
}
/*      $('button:eq(1)').prop('disabled', true);
 $('button:eq(2)').prop('disabled', true);  */


 //비동기 호출 값을 가져오기 위한 promise
 function getRoomNum(participantId) {
	    return new Promise((resolve, reject) => {
	        $.ajax({
	            type: "GET",
	            url: "${pageContext.request.contextPath}/get-room-num",
	            data: { participant: participantId },
	            beforeSend: function (xhr) {
	                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
	            },
	            success: function (result) {
	                resolve(result);
	            },
	            error: function (error) {
	                reject(error);
	            }
	        });
	    });
	}

var ws;
//채팅 생성 버튼을 클릭한 경우  
$(document).on('click', '.create-chat', async function () { // 비동기로 가져온 값을 path parameter로 넣기 위한 async
    //.chat-room 이벤트를 따로 넣어야 할 듯
    const chatUserName = $(this).parents('.contact-user').find('.chat-user-id');
    console.log(chatUserName.text());
    $('.chat-user-txt').text(chatUserName.text());

    $('.chatting-layer').css('display', 'none');
    $('.chatting-room').css('display', 'block');

    const participantId = $(this).parent('.contact-user').find('.employee-id').val();
    console.log("선택한 동료 정보 = " + $('.employee-id').val());
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/create-room",
        data: { participant: participantId },
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (result) {
            if (result == true) {
                console.log("채팅방이 생성되었습니다.");
            } else if (result == false) {
                console.log("이미 개설된 채팅방입니다.");
            }

            $('.msg-to').val(participantId);
        },
        error: function (error) {
            console.error("Error: " + error);
        }
    }) // create room ajax end  
    
    let roomNum;

    try {
        roomNum = await getRoomNum(participantId);
        console.log("roomNum값은...? = " + roomNum);

        getChatList(participantId); // 채팅 리스트 호출

        if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
            console.log("WebSocket is already opened.");
            return;
        }

        var url = "ws://" + location.host + "${pageContext.request.contextPath}/echo.do?roomNum=" + {roomNum};
        // 여기 url에 roomnumber 붙여서 보내기
        ws = new WebSocket(url);
        console.log(url);

        ws.onopen = function (event) {
            console.log('연결되었습니다.')
            console.log('연결정보' + event);
        };
        ws.onmessage = function (event) {
            console.log('전송 이벤트 발생.')
            console.log("onmessage로 찍힌 값 = " + event.data);
            writeResponse(event.data);
        }

        ws.onclose = function (event) {
            console.log("Connection closed!!");
            $('.create-chat').prop('disabled', false);
            $('.send-messagebtn').prop('disabled', true)
        };
    } catch (error) {
        console.error("방 번호 가져오기 실패: " + error);
    }

}); //contact-list click end

function getYyyyMmDd(date) {
    let year = date.getFullYear();
    let month = '' + (date.getMonth() + 1);
    let day = '' + date.getDate();
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
    let formattedDateParse = year + '-' + month + '-' + day;
    return formattedDateParse;
}

function formatKoreanDateWithDay(dateString) {
		let date = new Date(dateString);
    let year = date.getFullYear();
    let month = '' + (date.getMonth() + 1);
    let day = '' + date.getDate();

    return year + '년' + month + '월' + day + '일 ';
}


function getChatList(participantId) {
	let previousMessageDate = null; // 이전 메시지의 날짜를 저장할 변수
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/get-chat-list",
        data: { msgTo: participantId },
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            $('.wrap').empty();
            let nowDate = new Date();
            let nowDateParse = getYyyyMmDd(nowDate);
            console.log("파싱된 오늘 날짜는 = " + nowDateParse);

            response.forEach(function (item) {
                let msgCreateDate = new Date(item.created_at);
                let msgCreateDateParse = getYyyyMmDd(msgCreateDate);
                console.log("파싱된 메시지 작성일 = " + msgCreateDateParse);

                // 날짜 구분 표시를 위한 비교
                if (previousMessageDate !== msgCreateDateParse) {
                    let formattedDateWithDay = formatKoreanDateWithDay(msgCreateDateParse);
                    let dateDisplay = '<div class="chat-date"><span class="chat-date-txt">' + formattedDateWithDay + '</span></div>';
                    $('.wrap').append(dateDisplay);
                    previousMessageDate = msgCreateDateParse; // 이전 메시지의 날짜 업데이트
                }

                let sendTime = new Date(item.created_at);
                let hours = sendTime.getHours();
                let minutes = sendTime.getMinutes();
                let period = "오전";

                if (hours === 0) {
                    hours = 12; // 오전 12시를 00으로 표시
                } else if (hours === 12) {
                    period = "오후";
                } else if (hours > 12) {
                    period = "오후";
                    hours -= 12;
                }

                // 시간과 분을 두 자리로 표시하기
                let formattedHours = hours < 10 ? '0' + hours : hours;
                let formattedMinutes = minutes < 10 ? '0' + minutes : minutes;
                let MsgsendTime = period + " " + formattedHours + ":" + formattedMinutes;

                if (item.msg_from == participantId) {
                    let str = '<div class="chat not-me">';
                    str += '<div class="icon">';
                    str += '<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>';
                    str += '<input type="hidden" class="receiver" value="' + participantId + '">'
                    str += '<div class="textbox">' + item.content + '</div>';
                    str += '<div class="chat-read-send">';
                    str += '<span class="read-count">1</span>';
                    str += '<span class="send-time">' + MsgsendTime + '</span></div></div>'
                    $('.wrap').append(str);
                } else {
                    let str = '<div class="chat me">';
                    str += '<div class="icon">';
                    str += '<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>';
                    str += '<input type="hidden" class="receiver" value="' + item.msg_from + '">'
                    str += '<div class="textbox">' + item.content + '</div>';
                    str += '<div class="chat-read-send">';
                    str += '<span class="read-count">1</span>';
                    str += '<span class="send-time">' + MsgsendTime + '</span></div></div>'
                    $('.wrap').append(str);
                }
            }); // forEach end
        },
        error: function (error) {
            console.error("Error: " + error);
        }
    }); //ajax end
}; // getChatList end





//send를 클릭한 경우
$('.send-messagebtn').click(send);

$("#chat-write-input").on("keydown", function (event) {
    if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault();
        send();
    }
});


function send() {
    if ($("#chat-write-input").text().trim() == '') {
        alert("메시지를 입력하세요");
        $("#chat-write-input").focus();
        return false;
    } else {
    	
        let msgCreateDate = new Date();
        let msgCreateDateParse = getYyyyMmDd(msgCreateDate);
    	
    	var chatCnt = $('.wrap').children().length;
    	if(chatCnt == 0){
            let formattedDateWithDay = formatKoreanDateWithDay(msgCreateDateParse);
            let dateDisplay = '<div class="chat-date"><span class="chat-date-txt">' + formattedDateWithDay + '</span></div>';
            $('.wrap').append(dateDisplay);
    	}
            
            
            
        var text = $("#chat-write-input").text() + "," + '${name}';
        var lastIndexComma = text.lastIndexOf(',');
        var resultText = text.substring(0, lastIndexComma);

        let msgTo = $('.msg-to').val();
        console.log("메시지 보낼 사람 = " + msgTo);
        //insert chat into db
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/insert-chat",
            data: {
                resultText: resultText,
                msgTo: msgTo
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: function (result) {
                if (result == true) {
                    console.log("메시지 db 저장 완료!!");
                } else {
                    console.log("메시지 db 저장 실패!!");
                }
            },
            error: function (error) {
                console.error("Error: " + error);
            }
        }); // ajax end

        console.log('전송한 메시지' + text);
        ws.send(text);//웹 소켓으로 text를 보냅니다.보내는 형식(내용,보낸사람)




        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();

        var meridian = "오전";
        if (hours >= 12) {
            meridian = "오후";
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        hours = (hours < 10) ? "0" + hours : hours;
        minutes = (minutes < 10) ? "0" + minutes : minutes;

        var formattedTime = meridian + " " + hours + ":" + minutes;

        let str = '<div class="chat me">';
        str += '<div class="icon">';
        str += '<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>';
        str += '<div class="textbox">' + resultText + '</div>';
        str += '<div class="chat-read-send">';
        str += '<span class="read-count">1</span>';
        str += '<span class="send-time">' + formattedTime + '</span></div></div>'
        $('.wrap').append(str);

        $("#chat-write-input").text('');

    }
}


function writeResponse(rtext) {
	

	
	
    let msgCreateDate = new Date();
    let msgCreateDateParse = getYyyyMmDd(msgCreateDate);
	
	var chatCnt = $('.wrap').children().length;
	if(chatCnt == 0){
        let formattedDateWithDay = formatKoreanDateWithDay(msgCreateDateParse);
        let dateDisplay = '<div class="chat-date"><span class="chat-date-txt">' + formattedDateWithDay + '</span></div>';
        $('.wrap').append(dateDisplay);
	}
	
	
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();

    var meridian = "오전";
    if (hours >= 12) {
        meridian = "오후";
        if (hours > 12) {
            hours = hours - 12;
        }
    }

    hours = (hours < 10) ? "0" + hours : hours;
    minutes = (minutes < 10) ? "0" + minutes : minutes;

    var formattedTime = meridian + " " + hours + ":" + minutes;

    var firstGreaterThanIndex = rtext.indexOf('>');

    if (firstGreaterThanIndex >= 0) {
        var resultTxt = rtext.substring(firstGreaterThanIndex + 1);
    }

    let str = '<div class="chat not-me">';
    str += '<div class="icon">';
    str += '<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>';
    str += '<div class="textbox">' + resultTxt + '</div>';
    str += '<div class="chat-read-send">';
    str += '<span class="read-count">1</span>';
    str += '<span class="send-time">' + formattedTime + '</span></div></div>'
    $('.wrap').append(str);
};

	 

</script>

