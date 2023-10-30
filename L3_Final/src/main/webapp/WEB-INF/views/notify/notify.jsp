<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<article class="notify-layer">
    <div class="notify-menu-top">
        <strong class="notify-menu-txt">알림</strong>
        <button class="notify-menu-close-btn">
            <img src="../resources/chat/img/close.svg" alt="닫기">
        </button>
    </div>

    <div class="notify-list-area" style="background-color:white;">
        <ul class="notify-list">
            <c:forEach items="${notifications}" var="notification">
				<li data-post-id="${notification.id}"></li>
                <li class="notify-room" data-post-id="${notification.post_ID}">
                    <div class="user-latest">
                        <p class="notify-user-id">${notification.name}님이</p>
                        <p class="latest-notify">${notification.CONTENT}</p>
                    </div>
                    <div class="update-time-area">
                        <span class="update-time">${notification.NOTIFY_TIME}</span>
                    </div>
                </li>
                
            </c:forEach>
        </ul>
    </div>
</article>