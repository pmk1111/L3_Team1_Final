$(document).ready(function() {
    const notifyLayer = $('.notify-layer');
    const notifyListArea = $('.notify-list-area');
    const notreadNotifyArea = $('.notify-contact-area');
    const backBtn = $('.back-btn');

    $('.alarm-icon').click(function() {
        if (notifyLayer.css('display') === 'none') {
            notifyLayer.fadeIn(100);
            $('.on').removeClass('on');
            $('.notify-on').addClass('on');
            notifyListArea.show();
            notreadNotifyArea.hide();
        } else {
            notifyLayer.fadeOut(100);
        }
    });

    $('.notify-menu-close-btn').click(function() {
        notifyLayer.fadeOut(100);
    });

    $('#contactbtn2').click(function() {
       $('.on').removeClass('on');
        $('.contact2').addClass('on');
       $('.notify-contact-area').show();
        $('.notify-list-area').hide();
    });

    $('#notifybtn').click(function() {
        $('.on').removeClass('on');
        $('.notify-on').addClass('on');
        notreadNotifyArea.hide();
        notifyListArea.show();
    });

    backBtn.click(function() {
        notifyLayer.css('display', 'none');
    });
});
