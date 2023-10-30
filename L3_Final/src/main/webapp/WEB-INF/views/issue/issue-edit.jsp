<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="issue-edit-modal">
	<div class="modal-overlay"></div>
	<form action="issue-update" name="issueUpdate" method="post" enctype="multipart/form-data">
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
    				<input type="text" class="issue-create-custom-selected project-name-seleted" name="project_name" value="${issuedata.project_name}">
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
						<input type="text" class="issue-create-custom-selected issue-type-selected" name="type" value="${issuedata.type }" readonly>
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
						<input type="text" class="issue-create-custom-selected issue-status" name="status" value="${issuedata.status}" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">To Do</div>
							<div class="issue-create-custom-option">In Progress</div>
							<div class="issue-create-custom-option">Resolved</div>
							<div class="issue-create-custom-option">Done</div>
						</div>
					</div>

				</div>


				<div class="issue-title-wrap">
					<input type="text" class="issue-title-area" name="subject" value="${issuedata.subject}" placeholder="제목을 입력하세요.">
				</div>
					<!-- 혜원 -->
					<div>
					<label>언급</label>
				<input list="notionchoice" id="inputnotionchoice" name="notionchoice"  value="${issuedata.mentioned}"/>
				 <datalist id="notionchoice"></datalist>
				 
				</div>
				<!-- 혜원 -->

				<div class="issue-content-wrap">
					<textarea class="issue-content-txtarea" name="content" placeholder="내용을 입력하세요.">${issuedata.content}</textarea>
				</div>

				<div class="issue-reporter-wrap">
					<div class="text">
						<span>보고자</span><sup>*</sup>
					</div>
					<input class="issue-reporter-selected" type="text" value="${issuedata.create_user_name}" readonly>
					<input type="hidden" name="reporter" value="${issuedata.create_user}">
				</div>

				<div class="issue-assigned-wrap">
					<div class="text">
						<span>담당자</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-assigned" value="${issuedata.assigned_user_name}">
						<input type="hidden" name="assigned" value="${issuedata.assigned}">
						<div class="issue-create-custom-options user-info">
						</div>
					</div>

				<div class="issue-priority-wrap">
					<div class="text">
						<span>중요도</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-priority-selected" name="priority" value="${issuedata.priority}" readonly>
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
    			<input type="file" class="add-file" name="uploadfiles" multiple>
    		</label>
			</div>
			<input type="hidden" class="check-file-changed" name="check" value="false">
			<div class="uploaded-files">
				<c:choose>
					<c:when test="${empty filelist}">
					</c:when>
					<c:otherwise>
						<c:forEach var="f" items="${filelist}">
							<div class="upfile" data-value="${f.original_name}">
								<span class="file-name">${f.original_name}</span>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

	
		</div>
			</div>
			<div class="submit-reset-btn-wrap">
				<button type="button" class="close-btn">취소</button>
				<button type="submit" class="submit-btn">제출</button>
			</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>