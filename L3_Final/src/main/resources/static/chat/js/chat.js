$(document).ready(function(){
    const chattingLayer = $('.chatting-layer');
    const chattingRoom = $('.chatting-room');
    const CreateChat = $('.create-chat-icon').attr('src');
    const backBtn = $('.back-btn');
    
    $('.chat-icon').click(function(){
        if (chattingLayer.css('display') === 'none' && chattingRoom.css('display') === 'none'){
            chattingLayer.fadeIn(100);
            $('.on').removeClass('on');
        		$('.chat-on').addClass('on');
        		
        		$('.chat-contact-area').hide();
        		$('.chat-list-area').show();
        } else {
            chattingLayer.fadeOut(100);
            chattingRoom.fadeOut(100);
        }
    }); // chat-icon click end
    

    $('.chat-menu-close-btn').click(function() {
        chattingLayer.fadeOut(100);
        chattingRoom.fadeOut(100);
    });
    
    $('#contactbtn').click(function(){
        $('.chat-on').removeClass('on');
        $('.contact').addClass('on');
        $('.chat-contact-area').show();
        $('.chat-list-area').hide();
    });

    $('#chatbtn').click(function(){
        $('.on').removeClass('on');
        $('.chat-on').addClass('on');
        $('.chat-contact-area').hide();
        $('.chat-list-area').show();
    });
    
     $('.create-chat-icon').hover(
			function() {
				if (CreateChat === '../resources/mainboard/assets/img/chat-lightgrey.svg') {
					$(this).attr('src', '../resources/mainboard/assets/img/chat-hover.svg');
				 }
				},
			function() {
				$(this).attr('src', '../resources/mainboard/assets/img/chat-lightgrey.svg');
				}
			);

		$('.create-chat-icon, .chat-room').click(function(){
		
		//var roomId = $(this).data('room-id');
		//나중에 ajax로 불러올 때 해당 채팅방 기본 키를 이용해 불러오기 위해 사용(태그에 다 적혀 있음)
		
			chattingLayer.css('display', 'none');
			chattingRoom.css('display', 'block');
		}); // chattingRoom open click end
		
		
  
  
  	const chatWriteInput = $('#chat-write-input');

    chatWriteInput.text('shift+enter는 줄바꿈, enter는 입력입니다.');

    chatWriteInput.on('blur', function() {
        if ($(this).text() === '') {
            $(this).text('shift+enter는 줄바꿈, enter는 입력입니다.');
        }
    });

    chatWriteInput.on('focus', function() {
        if ($(this).text() === 'shift+enter는 줄바꿈, enter는 입력입니다.') {
            $(this).text('');
        }
    });


  
  	chatWriteInput.on('keydown', function(e) {
    	if (e.keyCode === 13 && !e.shiftKey) {
      	e.preventDefault(); 
      	var inputText = $(this).text();
      	console.log(inputText);
      	$(this).text('');
    	}
  	});
		
		backBtn.click(function(){
			chattingRoom.css('display', 'none');
			chattingLayer.css('display', 'block');
		}); //backbtn click end
});
