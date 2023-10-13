$(document).ready(function () {
  const issue_modal_btn = $('.create-issue');
  const issue_modal = $('.issue-modal');
  const overlay = $('.modal-overlay');

  issue_modal_btn.click(function () {
    issue_modal.fadeIn(200);
  }); //modal open click end

  overlay.click(function () {
    if ($('.issue-modal').css('display') === 'block') {
      issue_modal.fadeOut(200);
    }
  });

  var issueModalContent = $(".issue-modal-content");
  var createIssueText = $(".create-issue-text");
  var submitResetBtnWrap = $(".submit-reset-btn-wrap");

  issueModalContent.on("scroll", function () {
    var scrollTop = issueModalContent.scrollTop();
    var scrollHeight = issueModalContent[0].scrollHeight;
    var containerHeight = issueModalContent.innerHeight();

    // 스크롤이 발생한 경우
    if (scrollTop > 0) {
      createIssueText.css("border-bottom", "1px solid #ddd");
    } else {
      // 스크롤이 맨 위로 돌아갈 경우
      createIssueText.css("border-bottom", "none");
    }

    // 스크롤 위치가 맨 밑으로 도달한 경우
    if (scrollTop + containerHeight >= scrollHeight - 1) {
      submitResetBtnWrap.css("border-top", "none");
    } else {
      // 스크롤 위치가 맨 밑으로 도달하지 않은 경우
      submitResetBtnWrap.css("border-top", "1px solid #ddd");
    }
  });

  $(".issue-create-custom-selected").click(function () {
    $(this).siblings(".issue-create-custom-options").fadeToggle(300);
  });

  $(".issue-create-custom-option").click(function () {
    var text = $(this).text();
    $(this).closest(".issue-create-custom-select").find(".issue-create-custom-selected").text(text);
    $(this).closest(".issue-create-custom-options").hide();
  });

  $(".issue-create-custom-option").click(function () {
    var text = $(this).text();
    var customSelect = $(this).closest(".issue-create-custom-select");
    var selectedInput = customSelect.find("input");

    selectedInput.prop("value", text); // 선택한 값을 input의 value로 설정
    customSelect.find(".issue-create-custom-selected").text(text); // 선택한 값을 선택된 항목에 표시
    customSelect.find(".issue-create-custom-options").hide();
  });

  $('.submit-btn').click(function () {
    const project_name = $('.project-name').val();
    const issue_type = $('.issue-type').val();
    const issue_status = $('.issue-status').val();
    const issue_title_area = $('.issue-title-area').val();
    const issue_content = $('.issue-content').val();
    const issue_reporter = $('.issue-reporter').val();
    const issue_assigned = $(".issue-assigned").val();
    const issue_priority = $('.issue-priority').val()

    if (project_name === "") {
      alert("프로젝트를 선택해주세요.");
      return false;
    } else if (issue_type === "") {
      alert("이슈 유형을 선택해주세요.");
      return false;
    } else if (issue_status === "") {
      alert("이슈 상태를 선택해주세요.");
      return false;
    } else if (issue_title_area === "") {
      alert("제목을 입력해주세요.");
      return false;
    } else if (issue_content === "") {
      alert("내용을 입력해주세요.");
      return false;
    } else if (issue_reporter === "") {
      alert("보고자를 선택해주세요.");
      return false;
      // 보고자는 나중에 세션에서 사용자 id를 통해 사용자 명을 가져와 표시한다.
    } else if (issue_assigned === "") {
      alert("담당자를 선택해주세요.");
      return false;
    } else if (issue_priority === "") {
      alert("중요도를 선택해주세요.");
      return false;
    }

    // 줄바꿈 문자를 HTML 줄바꿈 태그 <br>로 변환
    const issue_content_html = issue_content.replace(/\n/g, '<br>');

    // issue_content_html를 폼의 hidden 필드에 저장
    $('.hidden-issue-content').val(issue_content_html);

    // 이후 폼을 서버로 제출
    $('form[name="createIssue"]').submit();
  });











   function initializeFileUpload() {
    const fileInput = $('.add-file');
    const uploadedFilesContainer = $('.uploaded-files');
    let fileCount = 0; // 초기 파일 갯수 변수
    const MAX_SINGLE_FILE_SIZE = 10 * 1024 * 1024; // 10MB
    const MAX_TOTAL_SIZE = 50 * 1024 * 1024; // 50MB
    let totalUploadedSize = 0;

    fileInput.on('change', handleFileUpload);

    function handleFileUpload(event) {
        const files = event.target.files;
        let canUpload = true;

        $.each(files, function(index, file) {

            if (file.size > MAX_SINGLE_FILE_SIZE) {
                alert("한 번에 최대 10MB의 파일만 업로드 할 수 있습니다.");
                canUpload = false;
                return false;
            }

            totalUploadedSize += file.size;
            if (totalUploadedSize > MAX_TOTAL_SIZE) {
                alert("최대 50MB까지 업로드 가능합니다.");
                canUpload = false;
                return false;
            }

            createFileElement(file);
            fileCount++; // 파일 추가 시 카운트 증가
        });

        if (!canUpload) {
            event.target.value = ''; // 파일 업로드 중단 시 파일 입력 필드 초기화
            return;
        }

        event.target.value = ''; // Clear the file input to allow re-uploading the same file.
        updateUploadedFilesContainerHeight();
    }

    function createFileElement(file) {
        const originalFileName = file.name; // 원본 파일 이름 저장
        const upfile = $('<div class="upfile" data-value="' + originalFileName + '"></div>');

        const fileName = $('<span class="file-name"></span>');
        fileName.text(truncateFileName(originalFileName, 25)); // 파일 이름을 25자로 제한

        const deleteButton = $('<button type="button" class="delete-file">x</button>');

        deleteButton.on('click', function() {
            upfile.remove();
            fileCount--; // 파일 삭제 시 카운트 감소
            updateUploadedFilesContainerHeight();
        });

        // 원본 파일 이름을 data-value 속성에 저장
        upfile.data('value', originalFileName);

        upfile.append(fileName);
        upfile.append(deleteButton);

        uploadedFilesContainer.append(upfile);
        updateUploadedFilesContainerHeight(); // 파일 추가 시 높이 조정
    }

    function updateUploadedFilesContainerHeight() {
        if (fileCount > 1) {
            uploadedFilesContainer.css('height', fileCount * 40 + 'px');
        } else if (fileCount === 1) {
            uploadedFilesContainer.css('height', '40px'); // 파일이 1개일 때 높이를 고정
        } else {
            uploadedFilesContainer.css('height', 'auto'); // 파일이 없을 때 "auto"
        }
    }

    function truncateFileName(fileName, maxLength) {
        if (fileName.length > maxLength) {
            const extension = fileName.split('.').pop(); // 파일 확장자 유지
            const truncatedName = fileName.substring(0, maxLength - 3);
            return truncatedName + '...' + extension;
        }
        return fileName;
    }

    // 초기화된 파일 업로드 기능을 반환
    return {
        initialize: initializeFileUpload,
    };
}

// 파일 업로드 초기화
const fileUpload = initializeFileUpload();
fileUpload.initialize();



  // issueModal close
  $('.close-btn').on("click", function () {
    if ($(".issue-modal").css('display') === 'block') {
      $(".issue-modal").fadeOut(200);
    }
  });
  

}); //document end
