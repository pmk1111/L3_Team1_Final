<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="issue-modal">
	<div class="modal-overlay"></div>
	<form method="post">
		<div class="issue-modal-content">

			<div class="create-issue-text">
				<h3>이슈 생성하기</h3>
			</div>
			<div class="modal-content-wrap">
				<div class="select-project-wrap">
					<div class="text">
						<span>프로젝트</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<div class="issue-create-custom-selected">전사관리</div>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option" data-value="전사관리">전사관리</div>
							<div class="issue-create-custom-option" data-value="버그수정">버그수정</div>
							<div class="issue-create-custom-option" data-value="일정관리">일정관리</div>
							<div class="issue-create-custom-option" data-value="배포준비">배포준비</div>
						</div>
					</div>

				</div>

				<div class="select-type-wrap">
					<div class="text">
						<span>유형</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<div class="issue-create-custom-selected">에픽</div>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option" data-value="에픽">에픽</div>
							<div class="issue-create-custom-option" data-value="작업">작업</div>
							<div class="issue-create-custom-option" data-value="버그">버그</div>
						</div>
					</div>

				</div>

				<div class="select-status-wrap">
					<div class="text">
						<span>상태</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<div class="issue-create-custom-selected">To Do</div>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option" data-value="전사관리">To
								Do</div>
							<div class="issue-create-custom-option" data-value="버그수정">In
								Progress</div>
							<div class="issue-create-custom-option" data-value="일정관리">Resolved</div>
							<div class="issue-create-custom-option" data-value="배포준비">Done</div>
						</div>
					</div>

				</div>


				<div class="issue-title-wrap">
					<input type="text" class="issue-title-area"
						placeholder="제목을 입력하세요.">
				</div>

				<div class="issue-content-wrap">
					<textarea class="issue-content" placeholder="내용을 입력하세요."></textarea>
				</div>

				<div class="issue-reporter-wrap">
					<div class="text">
						<span>보고자</span><sup>*</sup>
					</div>
					<input class="issue-reporter" type="text" readonly>
				</div>

				<div class="issue-assigned-wrap">
					<div class="text">
						<span>담당자</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<div class="issue-create-custom-selected">직원 1</div>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option" data-value="전사관리">직원
								1</div>
							<div class="issue-create-custom-option" data-value="버그수정">직원
								2</div>
							<div class="issue-create-custom-option" data-value="일정관리">직원
								3</div>
							<div class="issue-create-custom-option" data-value="배포준비">직원
								4</div>
						</div>
					</div>

				</div>

				<div class="issue-priority-wrap">
					<div class="text">
						<span>중요도</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<div class="issue-create-custom-selected">low</div>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option" data-value="전사관리">low</div>
							<div class="issue-create-custom-option" data-value="버그수정">middle</div>
							<div class="issue-create-custom-option" data-value="일정관리">high</div>
							<div class="issue-create-custom-option" data-value="배포준비">critical</div>
						</div>
					</div>


					<div class="file-upload-wrap">
						<div class="text">
							<span>파일 첨부</span>
						</div>
							<input type="file" class="add-file" id="fileInput" style="display: none;">
    					<label for="fileInput">
        				<img class="file-img" src="../resources/issue/img/folder-add.svg" alt="파일 첨부 이미지">
        				<span id="fileNameDisplay">파일을 선택하세요.</span>
    					</label>
					</div>
					
	
		</div>
			</div>
			<div class="submit-reset-btn-wrap">
				<button type="reset" class="reset-btn">취소</button>
				<button type="button" class="submit-btn">생성하기</button>
			</div>
		</div>
	</form>
</div>