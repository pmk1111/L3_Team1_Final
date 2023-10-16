$(document).ready(function () {
  const issue_modal_btn = $('.create-issue');
  const issue_modal = $('.issue-modal');
  const overlay = $('.modal-overlay');
  let selectedFiles = [];

  issue_modal_btn.click(function () {
    issue_modal.fadeIn(200);
  });

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

    if (scrollTop > 0) {
      createIssueText.css("border-bottom", "1px solid #ddd");
    } else {
      createIssueText.css("border-bottom", "none");
    }

    if (scrollTop + containerHeight >= scrollHeight - 1) {
      submitResetBtnWrap.css("border-top", "none");
    } else {
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

    selectedInput.prop("value", text);
    customSelect.find(".issue-create-custom-selected").text(text);
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
    const issue_priority = $('.issue-priority').val();

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
    } else if (issue_assigned === "") {
      alert("담당자를 선택해주세요.");
      return false;
    } else if (issue_priority === "") {
      alert("중요도를 선택해주세요.");
      return false;
    }

    const issue_content_html = issue_content.replace(/\n/g, '<br>');

    $('.hidden-issue-content').val(issue_content_html);
    $('form[name="createIssue"]').submit();
  });

const fileInput = document.querySelector('.add-file');
const uploadedFilesContainer = $('.uploaded-files');
const maxSizePerFileInBytes = 10 * 1024 * 1024; // 10MB in bytes
const maxTotalSizeInBytes = 50 * 1024 * 1024; // 50MB in bytes
let totalSizeUploaded = 0; // 추적된 업로드된 파일 크기의 합

fileInput.addEventListener('change', handleFileSelection);

function handleFileSelection(event) {
  const files = event.target.files;
  let validFiles = [];

  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    const fileName = file.name;

    if (file.size > maxSizePerFileInBytes) {
      alert("파일 크기는 10MB를 초과할 수 없습니다.");
      continue; // 파일 크기가 초과하면 다음 파일로 넘어감
    }

    if (totalSizeUploaded + file.size > maxTotalSizeInBytes) {
      alert("파일 크기 합이 50MB를 초과할 수 없습니다.");
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
    alert("지원하지 않는 확장자입니다.");
    return false; // 확장자가 허용되지 않을 때 false 반환
  }
  return true; // 확장자가 허용될 때 true 반환
}


function createFileElement(file) {
  const originalFileName = file.name;
  const upfile = $('<div class="upfile" data-value="' + originalFileName + '"></div>');

  const fileName = $('<span class="file-name">' + truncateFileName(originalFileName, 25) + '</span>');

  const deleteButton = $('<button type="button" class="delete-file">x</button>');

  deleteButton.click(function () {
    // 업로드된 파일 목록과 선택한 파일 목록에서 제거
    const fileNameToDelete = upfile.data('value');
    upfile.remove();
    selectedFiles = selectedFiles.filter(existingFile => existingFile.name !== fileNameToDelete);
    totalSizeUploaded -= file.size; // 파일 크기를 빼서 업로드된 파일 크기 합을 업데이트
    updateUploadedFilesContainerHeight();
    // 파일 선택 input에서도 제거
    const dt = new DataTransfer();
    selectedFiles.forEach(existingFile => dt.items.add(existingFile));
    fileInput.files = dt.files;
  });

  upfile.append(fileName);
  upfile.append(deleteButton);
  uploadedFilesContainer.append(upfile);

  // 파일이 업로드된 경우에만 높이 업데이트.
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
  $('.close-btn').on("click", function () {
    if ($(".issue-modal").css('display') === 'block') {
      $(".issue-modal").fadeOut(200);
    }
  });
});
