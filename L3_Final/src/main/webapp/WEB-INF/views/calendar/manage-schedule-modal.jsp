  <!-- 일정 추가 모달 창 -->
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  
  <div class="manage-schedule-modal">
  <div class="modal-overlay"></div>
    <div class="modal-content">
      <span class="close">&times;</span>
      <h2>일정 관리</h2>
      <form id="scheduleForm" action="update-schedule" method="post">
      <input type="hidden" class="update-target" name="scheduleId" value="">
        <label for="eventTitle">일정 제목:</label>
        <input type="text" id="eventTitle" class="schedule-title" name="subject" required>
				
				<label for="select-color">색상 구분:</label>
				<input type="color" id="select-color" class="select-color" name=color value="#9F7AB0">
				
        <label for="eventStartDate">시작일:</label>
        <input type="datetime-local" id="eventStartDate" class="schedule-start" name="startDate" onchange="setMinValue()" required >

        <label for="eventEndDate">마감일:</label>
        <input type="datetime-local" id="eventEndDate" class="schedule-end" name="endDate" required>
  
        <label for="eventLocation">장소:</label> 
        <input type="text" id="eventLocation" class="schedule-place" name="place">
  
        <label for="eventCategory">일정 구분</label> 
        <select id="eventCategory" name="category" class="schedule-category">
          <option value="1">업무</option>
          <option value="2">일정</option>
          <option value="0">선택 안함</option>
        </select>

        <label for="eventDescription">설명:</label>
        <textarea id="eventDescription" name="content" class="schedule-describe"></textarea>

				<div class="btn-wrap">
	        <button class="modify" type="submit">수정</button>
  	      <button class="remove" type="button">삭제</button>
    		</div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </form>
    </div>
  </div>
  
  <script>
  
  </script>