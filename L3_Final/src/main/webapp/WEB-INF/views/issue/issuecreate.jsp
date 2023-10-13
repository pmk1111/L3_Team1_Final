<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="issue-modal">
	<div class="modal-overlay"></div>
	<form action="issue_add" name="createIssue" method="post">
		<div class="issue-modal-content">

			<div class="create-issue-text">
				<h3>이슈 작성하기</h3>
			</div>
			<div class="modal-content-wrap">
				<div class="select-project-wrap">
					<div class="text">
						<span>프로젝트</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
    				<input type="text" class="issue-create-custom-selected project-name" name="project_name" value="" readonly>
    				<div class="issue-create-custom-options">
        		<div class="issue-create-custom-option">전사관리</div>
        		<div class="issue-create-custom-option">버그수정</div>
        		<div class="issue-create-custom-option">일정관리</div>
        		<div class="issue-create-custom-option">배포준비</div>
   		 		</div>
				</div>

				</div>

				<div class="select-type-wrap">
					<div class="text">
						<span>유형</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-type" name="issue_type" value="" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">에픽</div>
							<div class="issue-create-custom-option" >작업</div>
							<div class="issue-create-custom-option">버그</div>
						</div>
					</div>

				</div>

				<div class="select-status-wrap">
					<div class="text">
						<span>상태</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-status" name="issue_status" value="" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">To Do</div>
							<div class="issue-create-custom-option">In Progress</div>
							<div class="issue-create-custom-option">Resolved</div>
							<div class="issue-create-custom-option">Done</div>
						</div>
					</div>

				</div>


				<div class="issue-title-wrap">
					<input type="text" class="issue-title-area" name="issue_subject"
						placeholder="제목을 입력하세요.">
				</div>

				<div class="issue-content-wrap">
					<textarea class="issue-content" name="issue_content" placeholder="내용을 입력하세요."></textarea>
				</div>

				<div class="issue-reporter-wrap">
					<div class="text">
						<span>보고자</span><sup>*</sup>
					</div>
					<input class="issue-reporter" type="text" name="issue_reporter">
				</div>

				<div class="issue-assigned-wrap">
					<div class="text">
						<span>담당자</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-assigned" name="issue_assigned" value="" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option" data-value="전사관리">직원1</div>
							<div class="issue-create-custom-option" data-value="버그수정">직원2</div>
							<div class="issue-create-custom-option" data-value="일정관리">직원3</div>
							<div class="issue-create-custom-option" data-value="배포준비">직원4</div>
						</div>
					</div>

				<div class="issue-priority-wrap">
					<div class="text">
						<span>중요도</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-priority" name="issue_priority" value="" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">low</div>
							<div class="issue-create-custom-option">middle</div>
							<div class="issue-create-custom-option">high</div>
							<div class="issue-create-custom-option">critical</div>
						</div>
					</div>
					</div>


			<!-- HTML -->
			<div class="file-upload-wrap">
    		<div class="text">
        	<span>파일 첨부</span>
    		</div>
    		
    		<label class="custom-file-upload">파일첨부
    			<input type="file" class="add-file" name="issue_file">
    		</label>
    		<!-- <button type="button" class="deleteFileBtn">삭제</button> -->
			</div>
			<div class="uploaded-files"></div>

				

	
		</div>
			</div>
			<div class="submit-reset-btn-wrap">
				<button type="button" class="close-btn">취소</button>
				<button type="submit" class="submit-btn">제출</button>
			</div>
			</div>
			</form>
		</div>