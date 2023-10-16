<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="issue-edit-modal">
	<div class="modal-overlay"></div>
	<form action="issueUpdate" name="issueUpdate" method="post">
	  	<input type="hidden" name="num" value="${param.num}" >
	
		<div class="issue-modal-content">

			<div class="create-issue-text">
				<h3>이슈 수정하기</h3>
			</div>
			<div class="modal-content-wrap">
				<div class="select-project-wrap">
					<div class="text">
						<span>프로젝트</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
    				<input type="text" class="issue-create-custom-selected project-name-seleted" name="project_name" value="" readonly>
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
						<input type="text" class="issue-create-custom-selected issue-type-selected" name="issue_type" value="${issuedata.issue_type }" readonly>
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
						<input type="text" class="issue-create-custom-selected issue-status" name="issue_status" value="${issuedata.issue_status}" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">To Do</div>
							<div class="issue-create-custom-option">In Progress</div>
							<div class="issue-create-custom-option">Resolved</div>
							<div class="issue-create-custom-option">Done</div>
						</div>
					</div>

				</div>


				<div class="issue-title-wrap">
					<input type="text" class="issue-title-area" name="issue_subject" value="${issuedata.issue_subject}" placeholder="제목을 입력하세요.">
				</div>

				<div class="issue-content-wrap">
					<textarea class="issue-content-txtarea" name="issue_content" placeholder="내용을 입력하세요.">${issuedata.issue_content}</textarea>
				</div>

				<div class="issue-reporter-wrap">
					<div class="text">
						<span>보고자</span><sup>*</sup>
					</div>
					<input class="issue-reporter-selected" type="text" name="issue_reporter" value="${issuedata.issue_reporter}" readonly>
				</div>

				<div class="issue-assigned-wrap">
					<div class="text">
						<span>담당자</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-assigned" name="issue_assigned" value="${issuedata.issue_assigned}">
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
						<input type="text" class="issue-create-custom-selected issue-priority-selected" name="issue_priority" value="${issuedata.issue_priority}" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">low</div>
							<div class="issue-create-custom-option">middle</div>
							<div class="issue-create-custom-option">high</div>
							<div class="issue-create-custom-option">critical</div>
						</div>
					</div>
					</div>


					<div class="file-upload-wrap">
						<div class="text">
							<span>파일 첨부</span>
						</div>
							<input type="file" class="add-file" id="upfile" name="uploadfile" style="display: none;">
    					<label for="upfile">
        				<img class="file-img" src="../resources/issue/img/folder-add.svg">
        				<span id="fileNameDisplay">파일을 선택하세요.</span>
<%--         				<span id="fileNameDisplay">${issuedata.issue_file}</span>--%>
    					</label>
					</div>
				

	
		</div>
			</div>
			<div class="submit-reset-btn-wrap">
				<button type="button" class="close-btn">취소</button>
				<button type="submit" class="submit-btn">제출</button>
			</div>
			</div>
			</form>
		</div>