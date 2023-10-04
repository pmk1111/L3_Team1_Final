$(document).ready(function () {
      const issue_modal_btn = $('.create-issue');
			const issue_modal = $('.issue-modal');
			const overlay = $('.modal-overlay');

			issue_modal_btn.click(function() {
				issue_modal.fadeIn(200);
			}) //modal open click end

			overlay.click(function(){
				if($('.issue-modal').css('display')==='block'){
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
        if (scrollTop + containerHeight >= scrollHeight-1) {
          submitResetBtnWrap.css("border-top", "none");
        } else {
          // 스크롤 위치가 맨 밑으로 도달하지 않은 경우
          submitResetBtnWrap.css("border-top", "1px solid #ddd");
        }
      });




      $(".issue-create-custom-selected").click(function () {
        $(this).siblings(".issue-create-custom-options").fadeToggle(300);
      });

      // 커스텀 옵션을 클릭했을 때
      $(".issue-create-custom-option").click(function () {
        var value = $(this).attr("data-value");
        var text = $(this).text();
        $(this).closest(".issue-create-custom-select").find(".issue-create-custom-selected").text(text);
        // 원래의 select 요소의 값을 변경
        $(".issue-create-select-project").val(value);
        $(this).closest(".issue-create-custom-options").hide();
      });

      // 원래의 select 요소가 변경되었을 때
      $(".issue-create-select-project").change(function () {
        var selectedValue = $(this).val();
        // 커스텀 선택 상자의 값을 변경
        $(".issue-create-custom-selected").text(selectedValue);
      });



    $("#fileInput").change(function() {
        const selectedFile = this.files[0];

        if (selectedFile) {
            const fileName = selectedFile.name;
            $("#fileNameDisplay").text(fileName);

        } else {
            $("#fileNameDisplay").text("파일을 선택하세요.");
        }
    });


    }); //document end