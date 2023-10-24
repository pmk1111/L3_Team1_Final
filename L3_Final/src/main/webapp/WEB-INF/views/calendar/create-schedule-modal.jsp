  <!-- 일정 추가 모달 창 -->
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  
  <div class="create-schedule-modal">
  <div class="modal-overlay"></div>
    <div class="modal-content">
      <span class="close">&times;</span>
      <h2>일정 등록</h2>
      <form id="scheduleForm" action="create-schedule" method="post" name="create-schedule">
        <label for="eventTitle">일정 제목:</label>
        <input type="text" id="eventTitle" name="subject" required>
        
        <label for="select-color">색상 구분:</label>
				<input type="color" id="select-color" class="select-color" name=color value="#9F7AB0">
        
        <label for="eventStartDate">시작일:</label>
        <input type="datetime-local" id="eventStartDate" class="schedule-start" name="startDate" required>
        
        <label for="eventEndDate">마감일:</label>
        <input type="datetime-local" id="eventEndDate" class="schedule-end" name="endDate" required>
        
        <label for="eventLocation">장소:</label> 
        <input type="text" id="eventLocation" name="place">
        
<!--         <label for="eventAlarm">알람:</label> 
        <select id="eventAlarm" name="eventAlarm">
          <option value="15">15분 전</option>
          <option value="30">30분 전</option>
          <option value="60">1시간 전</option>
          <option value="0">없음</option>
        </select> -->
        
        <label for="eventCategory">일정 구분</label> 
        <select id="eventCategory" name="category">
          <option value="1">업무</option>
          <option value="2">일정</option>
          <option value="0">선택 안함</option>
        </select>
         
        <label for="eventDescription">설명:</label>
        <textarea id="eventDescription" name="content"></textarea>
        <br>

				<div class="btn-wrap">
					<button class="save" type="submit">등록하기</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </form>
    </div>
  </div>