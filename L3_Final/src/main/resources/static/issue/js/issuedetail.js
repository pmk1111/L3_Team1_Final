$(document).ready(function(){

console.log("게시글 번호 = " + $("#issue_id").val());
	
	const IssueSettingDropdown = $('.issue-setting-dropdown');
	const CopyUrlImg = $('.copy-url img');
	const IssueEdit = $('.issue-edit img');
	const IssueDelete = $('.issue-delete img');
	
	$('.issue-setting-icon').click(function(){
		if(IssueSettingDropdown.css('display') === 'none'){
			IssueSettingDropdown.fadeIn(200);
		} else{
			IssueSettingDropdown.fadeOut(200);
		}
	}) //setting-icon click
	
	$(document).click(function(e){
	    if (!$(e.target).hasClass('issue-setting-icon') && !$(e.target).hasClass('issue-setting-dropdown') && !$(e.target).is('li')){
	        IssueSettingDropdown.fadeOut(200);
	    }
	});//html click end
	
	$('.copy-url').hover(function(){
		CopyUrlImg.attr('src', '../resources/issue/img/copyurl-hover.svg');
	}, function(){
			CopyUrlImg.attr('src', '../resources/issue/img/copyurl.svg');
	}); //copy hover
	
	$('.issue-edit').hover(function(){
		IssueEdit.attr('src', '../resources/issue/img/edit-hover.svg');
	}, function(){
			IssueEdit.attr('src', '../resources/issue/img/edit.svg');
	}) //edit hover
	
	$('.issue-delete').hover(function(){
		IssueDelete.attr('src', '../resources/issue/img/trash-hover.svg');
	}, function(){
			IssueDelete.attr('src', '../resources/issue/img/trash.svg');
	}) //delete hover
	
	$('.issue-delete').click(function(){
		$('.issue-delete-modal').fadeIn(200);
	}) // issue-delete click
	
	$('.delete-cancel-btn').click(function(){
		$('.issue-delete-modal').fadeOut(200);
	}) //delete-cancel-btn	
	
	
	
	//status 동작
	console.log($('.this-status').val());
	const Status = $('.this-status').val();

	//현재 staatus 표시
	$('.status-btn').each(function(){
		let buttonStatus = $(this).data('value');
		if(buttonStatus === Status){
			$(this).addClass('current-status')
		}
	}); //현재 status end
	
// .status-btn 클릭 이벤트 처리
$('.status-btn').click(function() {
    if ($(this).hasClass('current-status')) {
        return;
    } else if ($(this).data('value') === 'Resolved') {
        // 클릭한 버튼의 data-value가 'Resolved'일 때 status-update-modal-resolved 모달을 열기
        $('.status-update-modal-resolved').fadeIn(200);
    } else {
        // 다른 경우에는 status-update-modal 모달을 열기
        $('.status-update-modal').fadeIn(200);
    }
});

$('.update-cancel-btn').click(function() {
    if($('.status-update-modal').css('display') === 'block'){
    	$('.status-update-modal').fadeOut(200);
    } else if($('.status-update-modal-resolved').css('display') === 'block'){
    	$('.status-update-modal-resolved').fadeOut(200);
    	
    }
});


// 모달 외부 클릭 시 모달 닫기
$(document).mouseup(function(e) {
    let modal = $('.status-update-modal');
    let modalResolved = $('.status-update-modal-resolved');
    
    if (modal.is(e.target) || modalResolved.is(e.target)) {
        modal.fadeOut(200);
        modalResolved.fadeOut(200);
    }
});

// 취소 버튼 클릭 시 모달 닫기
$('.update-cancel-btn').click(function() {
    const modal = $(this).closest('.status-update-modal');
    modal.fadeOut(200);
});

// .choose-assigner와 li 클릭 이벤트 중단
$('.choose-assigner, .select-assign-dropdown li').click(function(e) {
    e.stopPropagation(); // 클릭 이벤트 중단
});

$('.status-update-modal-overlay').click(function(){
	let modal = $('.status-update-modal');
  let modalResolved = $('.status-update-modal-resolved');
  
  if(modal.css('display') === 'block' || modalResolved.css('display') === 'block'){
  	modal.fadeOut(200);
  	modalResolved.fadeOut(200);
  }
}); //overlay click end


$('.choose-assigner').focus(function(){
	$('.select-assign-dropdown').fadeIn(100);
}); // focus end


// li 클릭 시 input에 해당 username 저장
$('.select-assign-dropdown li').click(function() {
    const username = $(this).find('.user-name').text(); // 또는 .user-id 등으로 변경해서 필요한 정보 가져오기
		const userId = $(this).find('.user-id').text();
    const splitUserId = userId.replace(/@/g, ''); // '@' 문자를 제거
       
    $('.choose-assigner').val(username);
    $('.choose-assignerrr').val(username);
    $('.selected-assigner-id').val(splitUserId);
    $('.select-assign-dropdown').fadeOut(100);
    
}); //li click end









// .status-btn 클릭 이벤트 처리
$('.status-btn').click(function() {
    const clickedButton = $(this); // 선택된 상태를 나타내는 버튼
    const newStatus = clickedButton.data('value'); // 선택된 버튼의 data-value
    
    console.log(newStatus);
    
    if (clickedButton.hasClass('current-status')) {
        return;
    }
    
    // 이벤트 핸들러 추가
    addStatusUpdateHandler(clickedButton, newStatus);
});

function addStatusUpdateHandler(clickedButton, newStatus, selectedUserName) {
		
    // .status-update-modal-btn 클릭 이벤트 처리
    $('.status-update-modal-btn').off('click'); // 이전에 추가된 클릭 이벤트 핸들러 제거
    
    $('.status-update-modal-btn').click(function() {
        $.ajax({
            url: "../issue/statusUpdate",
            method: "POST",
            data: {
                issueId: $("#issue_id").val(),
                status: newStatus,
                selectedUserName: $('.choose-assignerrr').val()
            },
            context: clickedButton,
            success: function(response) {
                if (response.status === 'success') {
                    $('.status-btn').removeClass('current-status'); // 모든 버튼에서 current-status 클래스 제거
                    clickedButton.addClass('current-status'); // 선택된 버튼에 current-status 클래스 추가
                    
                    $('.status-update-modal').fadeOut(200);
                    $('.status-update-modal-resolved').fadeOut(200);
                    if($('.choose-assignerrr').val()!=='' && $('.choose-assignerrr').val() === null){
                    	$('.issue-assigned').text($('.choose-assignerrr').val());
                    }
                    console.log("성공");
                    
                    
                } else {
                    console.error("상태 변경 실패");
                    console.log(response.message); // 오류 메시지 출력
                    
                    $('.status-update-modal').fadeOut(200);
                    $('.status-update-modal-resolved').fadeOut(200); 
                    
                }
            },
            error: function(error) {
                console.error("서버 요청 중 오류가 발생했습니다.");
                console.log(error);
            }
        });
    });
}








	
	
	
	//이슈 삭제 관련 로직
	$('.issue-delete-btn').click(function(){
	    $.ajax({
	        url: '../issue/issueDelete',
	        method: 'POST', 
	        data: {
	            issueId: $("#issue_id").val() 
	        },
	        success: function(response) {
	            if (response === 1) { 
	                console.log(response);
	                
	                $('.issue-delete-modal-content h4').text('삭제되었습니다');
	                $('.issue-delete-modal-content .issue-delete-btn-wrap').empty();

	                var returnToListBtn = $('<button>')
	                    .text('확인')
	                    .addClass('redirect-list');
	                
	                $('.issue-delete-modal-content .issue-delete-btn-wrap').append(returnToListBtn);
	                
	                returnToListBtn.click(function() {
	                    window.location.href = '../issue/issuelist';
	                });

	                $('.issue-delete-modal-content').fadeIn(200);
	            } else {
	                console.log(response);
	                console.error('삭제에 실패했습니다.');
	            }
	        },
	        error: function(error) {
	            console.error('서버 요청 중 오류가 발생했습니다.');
	        }
	    });
	});
	
	
	
});// document ready
	