

$(document).ready(function () {
    const issue_modal_btn = $('.create-issue');
    const issue_modal = $('.issue-modal');
    const overlay = $('.modal-overlay');
    let selectedFiles = []; // 선택한 파일 목록
    let totalSizeUploaded = 0; // 추적된 업로드된 파일 크기의 합
    

    issue_modal_btn.click(function () {
        issue_modal.fadeIn(200);
    });

    overlay.click(function () {
        if (issue_modal.css('display') === 'block') {
            issue_modal.fadeOut(200);
        }
    });

    var issueModalContent = $('.issue-modal-content');
    var createIssueText = $('.create-issue-text');
    var submitResetBtnWrap = $('.submit-reset-btn-wrap');

    issueModalContent.on('scroll', function () {
        var scrollTop = issueModalContent.scrollTop();
        var scrollHeight = issueModalContent[0].scrollHeight;
        var containerHeight = issueModalContent.innerHeight();

        createIssueText.css('border-bottom', scrollTop > 0 ? '1px solid #ddd' : 'none');
        submitResetBtnWrap.css('border-top', scrollTop + containerHeight >= scrollHeight - 1 ? 'none' : '1px solid #ddd');
    });
		
		var isToggled = false;
		var lastClicked = null;

		$('.issue-create-custom-selected').click(function () {
    	var customOptions = $(this).siblings('.issue-create-custom-options');

    	if (lastClicked !== this) {
        // 다른 요소가 클릭되었을 때, 이전 요소를 숨김
        $('.issue-create-custom-options').fadeOut(300);
        isToggled = false;
        lastClicked = this;
    	}

    	customOptions.fadeToggle(300);
    	isToggled = !isToggled;
	});

    // 이벤트 위임을 사용하여 document에 클릭 이벤트 핸들러를 추가
    $(document).on('click', '.issue-create-custom-option', function () {
        var text = $(this).text();
        var userId = $(this).data('value');
        var customSelect = $(this).closest('.issue-create-custom-select');
        var selectedInput = customSelect.find('input[type="hidden"]');

        selectedInput.val(userId);
        customSelect.find('.issue-create-custom-selected').val(text);
        customSelect.find('.issue-create-custom-options').hide();

        console.log($('.issue-create-custom-selected').val());
    });


 $('.submit-btn').click(function () {
        const project_name = $('.project-name').val();
        const issue_type = $('.issue-type').val();
        const issue_status = $('.issue-status').val();
        const issue_title_area = $('.issue-title-area').val();
        const issue_content = $('.issue-content').val();
        const issue_reporter = $('.issue-reporter').val();
        const issue_assigned = $('.issue-assigned').val();
        const issue_priority = $('.issue-priority').val();
     
      	var issue_tag = ''; 
      	
     const selectedOptionValue = $('#inputnotionchoice').val().trim();

    if (selectedOptionValue != '' && $('#notionchoice option[value="' + selectedOptionValue + '"]').length === 0) {
        alert('항목에 있는 값만 고르세요');
        return false;
    }




        if (project_name === '') {
            alert('프로젝트를 선택해주세요.');
            return false;
        } else if (issue_type === '') {
            alert('이슈 유형을 선택해주세요.');
            return false;
        } else if (issue_status === '') {
            alert('이슈 상태를 선택해주세요.');
            return false;
        } else if (issue_title_area === '') {
            alert('제목을 입력해주세요.');
            return false;
        } else if (issue_content === '') {
            alert('내용을 입력해주세요.');
            return false;
        } else if (issue_reporter === '') {
            alert('보고자를 선택해주세요.');
            return false;
        } else if (issue_assigned === '') {
            alert('담당자를 선택해주세요.');
            return false;
        } else if (issue_priority === '') {
            alert('중요도를 선택해주세요.');
            return false;
        }

        const issue_content_html = issue_content.replace(/\n/g, '<br>');
       
        $('.hidden-issue-content').val(issue_content_html);
        
          user_id = $("#notionchoice option").data("id");
          if(user_id == undefined)
          user_id = 0;
           
       

          
          
         
        $('form[name="createIssue"]').append('<input type="hidden" name="user_id" value="' + user_id + '">');


        $('form[name="createIssue"]').submit();
    });
    const fileInput = document.querySelector('.add-file');
    const uploadedFilesContainer = $('.uploaded-files');
    const maxSizePerFileInBytes = 10 * 1024 * 1024; // 10MB in bytes
    const maxTotalSizeInBytes = 50 * 1024 * 1024; // 50MB in bytes

    fileInput.addEventListener('change', handleFileSelection);

    function handleFileSelection(event) {
        const files = event.target.files;

        // 기존 업로드 파일 엘리먼트 모두 제거
        uploadedFilesContainer.empty();

        let validFiles = [];

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const fileName = file.name;

            if (file.size > maxSizePerFileInBytes) {
                alert('파일 크기는 10MB를 초과할 수 없습니다.');
                continue; // 파일 크기가 초과하면 다음 파일로 넘어감
            }

            if (totalSizeUploaded + file.size > maxTotalSizeInBytes) {
                alert('파일 크기 합이 50MB를 초과할 수 없습니다.');
                continue; // 파일 크기 합이 초과하면 다음 파일로 넘어감
            }

            if (isFileExtensionValid(fileName)) {
                validFiles.push(file);
                totalSizeUploaded += file.size;
            }
        }

        // 파일 선택(input)에서 유효하지 않은 확장자를 가진 파일을 제외하고, 유효한 파일만을 업로드
        const dt = new DataTransfer();
        validFiles.forEach(file => dt.items.add(file));
        fileInput.files = dt.files;

        // 나머지 코드는 유효한 파일에 대한 처리입니다.
        for (let i = 0; i < validFiles.length; i++) {
            createFileElement(validFiles[i]);
        }
        updateUploadedFilesContainerHeight();
    }

    function isFileExtensionValid(fileName) {
        const fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'svg', 'bmp', 'txt', 'zip', 'tar', 'xlsx', 'xls', 'xlsm', 'xlsb', 'xltx', 'log', 'hwp', 'pptx', 'pptm', 'ppt', 'pdf'];
        const extension = fileName.split('.').pop().toLowerCase();
        if (!fileExtension.includes(extension)) {
            alert('지원하지 않는 확장자입니다.');
            return false; // 확장자가 허용되지 않을 때 false 반환
        }
        return true; // 확장자가 허용될 때 true 반환
    }

    function createFileElement(file) {
        const originalFileName = file.name;
        const upfile = $('<div class="upfile" data-value="' + originalFileName + '"></div>');

        const fileName = $('<span class="file-name">' + truncateFileName(originalFileName, 25) + '</span>');

        upfile.append(fileName);
        uploadedFilesContainer.append(upfile);

        if (selectedFiles.length > 0) {
            updateUploadedFilesContainerHeight();
        }
    }

    function updateUploadedFilesContainerHeight() {
        const fileCount = selectedFiles.length;

        if (fileCount > 1) {
            uploadedFilesContainer.css('height', fileCount * 40 + 'px');
        } else if (fileCount === 1) {
            uploadedFilesContainer.css('height', '40px');
        } else {
            uploadedFilesContainer.css('height', 'auto');
        }
    }

    function truncateFileName(fileName, maxLength) {
        if (fileName.length > maxLength) {
            const extension = fileName.split('.').pop();
            const truncatedName = fileName.substring(0, maxLength - 3);
            return truncatedName + '...' + extension;
        }
        return fileName;
    }

    // issueModal close
    $('.close-btn').on('click', function () {
        if (issue_modal.css('display') === 'block') {
            issue_modal.fadeOut(200);
        }
    });
 //혜원
$("#inputnotionchoice").on("input", function() {
    var textarea = $(this);
    var text = textarea.val();

  
    var mentionPattern = /@([\w가-힣]+)/g;
    var matches = text.match(mentionPattern);

    if (matches && matches.length > 0) {
       
        var mention = matches[0];

        
        sendDataToServer(mention);
    }
});


function sendDataToServer(mention) {
    
   
    var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
    $.ajax({
        type: "POST",
        url: "../user/issue-mention",
        data: mention,
        contentType: "application/json; charset=UTF-8",
        dataType: "JSON",
        beforeSend : function(xhr)
                 {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
                    xhr.setRequestHeader(header, token);         
                 },
        success: function(response) {
           
            console.log('데이터가 서버로 전송되었습니다.');
            console.log(response);
           
            output='';
           	if (response.length > 0) {
           	$(response).each(function(index,item){
           	
           	
           	 output += "<option value=@"+item.name + " data-id="+item.id+"></option>"
           	 
           	
           	
           	})
           	$("#notionchoice").html(output)
           	console.log(output);
           	inputdata = $("#inputnotionchoice").val()
           	console.log(inputdata);
          
           	
           	}
           	else{
           	$("#notionchoice").html(output)
              
        }},
        error: function(jqXHR, textStatus, errorThrown) {
            
            console.error('데이터 전송 중 오류가 발생했습니다:', errorThrown);
        }
    });
    
}


//혜원끝
});