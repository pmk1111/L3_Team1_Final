$(document).ready(function () {
   const maxCharsPerLine = 50;
   const maxLines = 10;
   const CommentMaxLength = 500;

   $('#comment-textarea').on('input', function () {
      let lines = $(this).val().split('\n');

      if (lines.length > maxLines) {
         lines = lines.slice(0, maxLines);
      }

      lines = lines.map(function (line) {
         if (line.length > maxCharsPerLine) {
            return line.slice(0, maxCharsPerLine);
         }
         return line;
      });

      const formattedText = lines.join('\n');
      $(this).val(formattedText);

      if (formattedText.length > CommentMaxLength) {
         alert("500자 이내로 입력해주세요.");
      }
   });

   // Enter 키 눌렀을 때 줄바꿈 추가
   $('#comment-textarea').on('keydown', function (e) {
      if (e.key === 'Enter' && !e.shiftKey) {
         e.preventDefault(); // Enter 키의 기본 동작(새 줄 추가)을 막음
         var content = $('#comment-textarea').val() + '\n';
         $('#comment-textarea').val(content);
      }
   });

   function getCommentList() {
      $.ajax({
         type: "POST",
         url: "../comment/commentList",
         data: { "issue_id": $("#issue_id").val() },
         success: function (rdata) {
            if (rdata.length > 0) { // 배열에 데이터가 있는지 확인
               $('.comment-list').empty();
               $(rdata).each(function () {
                  let str = '';
                  str += '<div class="comments" data-comment-id="' + this.comment_id + '">';
                  str += '<img src="../resources/mainboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto comment-writer-img" />';
                  // 나중에 해당 유저의 사진 가져옴
                  str += '<span class="comment-writer">' + this.comment_user_name + '</span> <sup class="comment-created">' + this.comment_created + '</sup>';
                  str += '<sup class="comment-edit">수정</sup><sup class="comment-delete">삭제</sup>'
                  str += '<br><div class="comment-content">';
                  str += '<span>' + this.comment_content + '</span></div>';
                  str += '</div>';

                  $('.comment-list').append(str);
               });
            } else {
               // 댓글 데이터가 없을 경우 처리
               console.log('작성된 댓글이 없습니다.');
            }
         },
         error: function (error) {
            console.error("댓글 출력 오류: " + error);
         },
      });
   }

   getCommentList();

   $('.comment-submit-btn').click(function () {
      var content = $('#comment-textarea').val().replace(/\n/g, "<br>");

      // AJAX 요청을 보내기 전에 입력 데이터를 검증하거나 필요한 조치를 취할 수 있습니다.

      $.ajax({
         type: "POST",
         url: "../comment/commentAdd",
         data: {
            issue_id: $("#issue_id").val(),
            comment_content: content
         },
         success: function (rdata) {
            if (rdata == 1) {
               $("#comment-textarea").val('');
               alert("댓글이 등록되었습니다.");
               getCommentList();
            } else {
               alert("댓글 등록 실패");
            }
         },
         error: function (error) {
            console.error("댓글 생성 오류: " + error);
         }
      });
   });

   // 수정 버튼 클릭 시
   $(document).on('click', '.comment-edit', function () {
      var commentElement = $(this).closest('.comments'); // 댓글 엘리먼트 선택
      var commentId = commentElement.data('comment-id'); // 댓글 식별 번호 가져오기
      var commentContentElement = commentElement.find('.comment-content span'); // 댓글 내용 엘리먼트 선택
      var commentContent = commentContentElement.text();

      // <br> 태그를 줄바꿈으로 변환
      commentContent = commentContent.replace(/<br>/g, '\n');

      // 댓글 수정 양식을 생성하고 표시
      var editForm = `
        <div class="comments create-comment" style="border-bottom: 1px solid lightgrey">
            <img src="../resources/mainboard/assets/img/avatars/1.png" class="w-px-40 h-auto comment-writer-img" />
            <div class="comment-input-submit">
                <textarea id="edit-comment-textarea-${commentId}" class="comment-input" name="comment_content" maxlength="500" rows="10" cols="50" placeholder="댓글 내용을 입력하세요.">${commentContent}</textarea>
                <button type="button" class="comment-submit-btn" data-comment-id="${commentId}">댓글 수정</button>
            </div>
        </div>
    `;

      // 수정 요청을 받은 댓글 엘리먼트를 숨김
      commentElement.hide();

      // 수정 양식을 삽입
      commentElement.after(editForm);

      // 수정 버튼 클릭 시
      $('.comment-submit-btn').click(function () {
         var editedContent = $(`#edit-comment-textarea-${commentId}`).val();

         // 줄바꿈을 <br> 태그로 변환
         editedContent = editedContent.replace(/\n/g, "<br>");

         // 댓글 내용이 비어 있는지 확인
         if (editedContent.trim() === '') {
            alert("댓글 내용을 작성하세요.");
            return;
         }

         // AJAX 요청을 보내서 댓글 수정
         $.ajax({
            type: "POST",
            url: "../comment/commentUpdate",
            data: {
               comment_id: commentId,
               comment_content: editedContent
            },
            success: function (rdata) {
               if (rdata == 1) {
                  alert("댓글이 수정되었습니다.");

                  // 수정 양식을 숨김
                  $(`#edit-comment-textarea-${commentId}`).closest('.create-comment').remove();

                  // 수정 요청을 받은 댓글 엘리먼트를 다시 표시
                  commentElement.show();
                  getCommentList();
               } else {
                  alert("댓글 수정 실패");
               }
            },
            error: function (error) {
               console.error("댓글 수정 오류: " + error);
            }
         });
      });
   });

   // 댓글 삭제
   $(document).on('click', '.comment-delete', function () {
      var commentElement = $(this).closest('.comments'); // 댓글 엘리먼트 선택
      var commentId = commentElement.data('comment-id'); // 댓글 식별 번호 가져오기

      // 댓글 삭제를 확인하는 메시지 표시
      if (confirm("댓글을 삭제하시겠습니까?")) {
         $.ajax({
            type: "POST",
            url: "../comment/commentDelete",
            data: {
               "commentId": commentId,
            },
            success: function (rdata) {
               if (rdata === 1) {
                  alert("댓글이 삭제되었습니다.");
                  getCommentList();
               } else {
                  alert("댓글 삭제 실패");
               }
            },
            error: function (error) {
               console.error("댓글 삭제 오류: " + error);
            }
         });
      }
   }); // 댓글 삭제 
});
