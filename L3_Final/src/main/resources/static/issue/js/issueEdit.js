	$('.issue-edit').click(function(){
	
		if($('.issue-setting-dropdown').css('display') === 'block'){
			$('.issue-setting-dropdown').fadeOut(200);
		}
		
		if($('.issue-edit-modal').css('display') === 'none'){
			$('.issue-edit-modal').fadeIn(200);
		}
	
	}) //issue-edit


$('modal-overlay').click(function () {
    if ($('.issue-edit-modal').css('display') === 'block') {
      $('.issue-edit-modal').fadeOut(200);
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
    const project_name = $('.project-name-seleted').val();
    const issue_type = $('.issue-type-selected').val();
    const issue_status = $('.issue-status-selected').val();
    const issue_title_area = $('.issue-title-area').val();
    const issue_content = $('.issue-content-txtarea').val();
    const issue_reporter = $('.issue-reporter-selected').val();
    const issue_assigned = $(".issue-assigned-selected").val();
    const issue_priority = $('.issue-priority-selected').val()

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

  // 파일 업로드 시 파일 명 영역 텍스트 변경
  $("#upfile").change(function () {
    const selectedFile = this.files[0];

    if (selectedFile) {
      const fileName = selectedFile.name;
      $("#fileNameDisplay").text(fileName);
    } else {
      $("#fileNameDisplay").text("파일을 선택하세요.");
    }
  });
  

 $('.submit-btn').click(function(){
 	console.log("게시글 번호 = " + $("#issue_id").val());
 })



  // issueModal close
  $('.close-btn').on("click", function () {
    if ($(".issue-edit-modal").css('display') === 'block') {
      $(".issue-edit-modal").fadeOut(200);
    }
  });
