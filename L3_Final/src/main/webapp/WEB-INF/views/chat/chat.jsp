<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<article class="chatting-layer">
	<div class="chat-menu-top">
		<strong class="chat-menu-txt">채팅</strong>
		<button class="chat-menu-close-btn">
			<img src="../resources/chat/img/close.svg" alt="닫기">
		</button>
	</div>

	<div class="chat-side-content">
		<div class="chat-menu-area">
			<ul>
				<li id="chatbtn"><span class="popup-tab chat-on on">채팅</span></li>
				<li id="contactbtn"><span class="contact">연락처</span></li>
			<!-- 	<button type="button" class="popup-btn new-chat">
					<img>새 채팅
				</button> -->
			</ul>
		</div>

		<div class="chat-search-area">
			<input type="text" class="search-chat">
		</div>

		
		<div class="chat-list-area">

			<ul class="chat-list">
				<li class="chat-room" data-room-id="1">
					<div class="chat-img-user-latest">
						<img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt="">
					</div>

					<div class="user-latest">
						<p class="chat-user-id">JJok</p>
						<p class="latest-chat">오늘만 지나면 추석입니다.</p>
					</div>

					<div class="update-time-area">
						<span class="update-time">13:52</span>
					</div>
				</li>

				
				<li class="chat-room" data-room-id="2">
					<div class="chat-img-user-latest">
						<img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt="">
					</div>

					<div class="user-latest">
						<p class="chat-user-id">JJok</p>
						<p class="latest-chat">오늘만 지나면 추석입니다.</p>
					</div>

					<div class="update-time-area">
						<span class="update-time">13:52</span>
					</div>
				</li>
				
				<li class="chat-room" data-room-id="3">
					<div class="chat-img-user-latest">
						<img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt="">
					</div>

					<div class="user-latest">
						<p class="chat-user-id">JJok</p>
						<p class="latest-chat">오늘만 지나면 추석입니다.</p>
					</div>

					<div class="update-time-area">
						<span class="update-time">13:52</span>
					</div>
				</li>
				
				
			</ul>

		</div>
		
		
		
		<div class="chat-contact-area">
			<ul class="contact-list">
				<li class="contact-user">
					<div class="chat-img-user-latest">
						<img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt="">
					</div>

					<div class="contact-user-info">
						<p class="chat-user-id">JJok</p>
						<p class="chat-user-company">JHTA</p>
					</div>
					
					<button class="create-chat">
						<img class="create-chat-icon" src="../resources/mainboard/assets/img/chat-lightgrey.svg">
					</button>

				</li>

				<li class="contact-user">
					<div class="chat-img-user-latest">
						<img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt="">
					</div>

					<div class="contact-user-info">
						<p class="chat-user-id">JJok</p>
						<p class="chat-user-company">현대 모비스</p>
					</div>
					
					<button class="create-chat">
						<img class="create-chat-icon" src="../resources/mainboard/assets/img/chat-lightgrey.svg">
					</button>
					
				</li>
				
				

			</ul>
			
		</div>
	</div>
	
</article>

<article class="chatting-room">
	<div class="chat-menu-top">
	<button class="back-btn">
		<img class="back-to-chatting-layer" src="../resources/chat/img/leftArrow.svg">
	</button>
	<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" >
		<strong class="chat-user-txt">JJok</strong>
		<button class="chat-menu-close-btn">
			<img src="../resources/chat/img/close.svg" alt="닫기">
		</button>
	</div>
	
	<div class="chatting-list">
		   <div class="wrap">
		   
		   <div class="chat-date">
		   	<span class="chat-date-txt">2023년 9월 27일(수)</span>
		   </div>
		   
        <div class="chat not-me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">이번 주 특근 가능하신가요?.</div>
        </div>
        <div class="chat me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">당신은 누군데 사장인 나에게 특근을 하라고 하는 겁니까?</div>
        </div>
        <div class="chat not-me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">그쪽 회사 주식 50%를 가지고 있는 주주올시다.</div>
        </div>
        <div class="chat me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">니가 주주면 다야? 이 건방진 자식이 감히 내가 30년 간 피땀 흘려 일으킨 회사를 고작 주식 좀 가지고 있다고 이래라 저래랴야</div>
        </div>
        <div class="chat me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">옥상으로 따라와</div>
        </div>
         <div class="chat not-me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">ㅇㅋ 내일이 주총인데 기대하겠습니다.</div>
        </div>
        
        <div class="chat-date">
		   		<span class="chat-date-txt">2023년 9월 28일(목)</span>
		   	</div>
        
        <div class="chat me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">선생님 말로 하시죠 제가 생각이 짧았습니다.</div>
        </div>
         <div class="chat not-me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">ㅗㅗ</div>
        </div>
        <div class="chat not-me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">ㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗ</div>
            <div class="chat-read-send">
							<span class="read-count">1</span>
							<span class="send-time">오전 9:38</span>            
            </div>
        </div>
        
         <div class="chat me">
            <div class="icon"><img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt=""></div>
            <div class="textbox">adhlgalghlah</div>
            <div class="chat-read-send">
							<span class="read-count">1</span>
							<span class="send-time">오전 9:38</span>            
            </div>
           
        </div>
    </div>
			
	</div>
	
	<div class="chat-write-area">
		<div id="chat-write-input" contenteditable="true"></div>
		<button class="send-messagebtn" type="button">전송</button>
	</div>
	
</article>