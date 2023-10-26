$(document).ready(function() {
    const notifyLayer = $('.notify-layer');
    const notifyListArea = $('.notify-list-area');
    const notreadNotifyArea = $('.notify-contact-area');
    const backBtn = $('.back-btn');

    let isActive = true; // 페이지 활성화 여부를 추적

    // 페이지가 활성화된 경우 또는 알림 레이어를 열 때
    window.addEventListener("focus", function() {
        if (notifyLayer.is(':visible')) {
            // 알림 레이어가 열린 상태에서 활성화되면 업데이트
            getNotifications();
        }
    });

    // 알림 아이콘 클릭 시, 알림 레이어 열기
    $('.alarm-icon').click(function() {
        notifyLayer.fadeIn(100);
        $('.on').removeClass('on');
        $('.notify-on').addClass('on');
        notifyListArea.show();
        notreadNotifyArea.hide();
        // 알림 레이어가 열릴 때 업데이트
        getNotifications();
    });

    // 알림 레이어 닫기
    $('.notify-menu-close-btn').click(function() {
        notifyLayer.fadeOut(100);
    });

    $('#notreadbtn').click(function() {
       $('.on').removeClass('on');
        $('.notread').addClass('on');
       notreadNotifyArea.show();
        notifyListArea.hide();
    });

    $('#notifybtn').click(function() {
        $('.on').removeClass('on');
        $('.notify-on').addClass('on');
        notreadNotifyArea.hide();
        notifyListArea.show();
    });

    function getNotifications() {
        if (isActive) {
            // 페이지가 활성화된 경우에만 업데이트 요청
            $.ajax({
                url: "/myhome/getNotifications", // 알림을 가져올 JSP 페이지의 경로
                type: 'GET',
                success: function(data) {
                    console.log(data);
                    // 서버에서 받은 알림 데이터를 동적으로 업데이트
                    var notificationList = notifyListArea.find('ul.notify-list');
                    notificationList.empty(); // 기존 목록을 비우고 다시 추가
                       if (data.length === 0) {
                       
                    notificationList.append('<div class="no-notification"><h6>알림이 없습니다.</h6></div>');
                } else {
                    for (var i = 0; i < data.length; i++) {
                        var notification = data[i];
                        var notificationItem = `
                            <li class="notify-room">
                                <div class="user-latest">
                                    <p class="notify-user-id">${notification.mentioned_BY}님이</p>
                                    <p class="latest-notify">${notification.content}</p>
                                </div>
                                <div class="update-time-area">
                                    <span class="update-time">${notification.notify_TIME}</span>
                                </div>
                            </li>
                        `;
                        notificationList.append(notificationItem);
                    }
                   }
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                }
            });
        }
    }

    // 페이지 로드 후 초기 알림 목록 업데이트
    getNotifications();
});
