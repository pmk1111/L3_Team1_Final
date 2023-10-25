<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.alarm-icon+.chat-icon{margin-left: 10px}
	.chat-icon{margin-right: 10px}
	
    .alarm-icon:hover, .chat-icon:hover { cursor: pointer; }
</style>
<script src="${pageContext.request.contextPath}/notify/js/notify.js"></script>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<nav class="layout-navbar container-xxl navbar navbar-expand-xl align-items-center bg-navbar-theme" id="layout-navbar">
  
	<div
		class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
		<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
			<i class="bx bx-menu bx-sm"></i>
		</a>
	</div>

	<div class="navbar-nav-right d-flex align-items-center"
		id="navbar-collapse">
		<!-- Search -->
		<div class="navbar-nav align-items-center">
			<div class="nav-item d-flex align-items-center">
				<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
					class="form-control border-0 shadow-none" placeholder="Search..."
					aria-label="Search..." />
			</div>
		</div>
		<!-- /Search -->

		<ul class="navbar-nav flex-row align-items-center ms-auto">
			<!-- Place this tag where you want the button to render. -->
			<li class="nav-item bell-chat-icon">
				<img alt="알림" src="../resources/mainboard/assets/img/bell.svg" class="alarm-icon">
				<img alt="채팅" src="../resources/mainboard/assets/img/chat.svg" class="chat-icon">
			</li>
	

			<!-- User -->
			<li class="nav-item navbar-dropdown dropdown-user dropdown"><a
				class="nav-link dropdown-toggle hide-arrow"
				href="javascript:void(0);" data-bs-toggle="dropdown">
					<div class="avatar avatar-online">
						<img src="../resources/mainboard/assets/img/avatars/1.png" alt
							class="w-px-40 h-auto rounded-circle" />
					</div>
			</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item" href="#">
							<div class="d-flex">
								<div class="flex-shrink-0 me-3">
									<div class="avatar avatar-online">
										<img src="../resources/mainboard/assets/img/avatars/1.png" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
								</div>
								<div class="flex-grow-1">
									<span class="fw-semibold d-block">John Doe</span> <small
										class="text-muted">Admin</small>
								</div>
							</div>
					</a></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li><a class="dropdown-item" href="../user/profile"> <i
							class="bx bx-user me-2"></i> <span class="align-middle">My
								Profile</span>
					</a></li>
					<li><a class="dropdown-item" href="#"> <i
							class="bx bx-cog me-2"></i> <span class="align-middle">Settings</span>
					</a></li>
					<li><a class="dropdown-item" href="#"> <span
							class="d-flex align-items-center align-middle"> <i
								class="flex-shrink-0 bx bx-credit-card me-2"></i> <span
								class="flex-grow-1 align-middle">Billing</span> <span
								class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
						</span>
					</a></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li><form action="${pageContext.request.contextPath}/user/logout" method ="post"
             style="margin-bottom:0px" name="logout">
             <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">
							<i class="bx bx-power-off me-2"></i> <span id="logout"class="align-middle">Log
								Out</span>
					</a>
					 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
					</li>
				</ul></li>
			<!--/ User -->
		</ul>
	</div>
		<jsp:include page="../notify/notify.jsp"></jsp:include>
</nav>
<script>

	$(document).ready(function(){
		const alarm = $('.alarm-icon').attr('src');
		const chat = $('.chat-icon').attr('src');
		
		$('.alarm-icon').hover(
				  function() {
				    if (alarm === '../resources/mainboard/assets/img/bell.svg') {
				      $('.alarm-icon').attr('src', '../resources/mainboard/assets/img/bell-hover.svg');
				    }
				  },
				  function() {
				    $('.alarm-icon').attr('src', '../resources/mainboard/assets/img/bell.svg');
				  }
				);
		
		$('.chat-icon').hover(
				  function() {
				    if (chat === '../resources/mainboard/assets/img/chat.svg') {
				      $('.chat-icon').attr('src', '../resources/mainboard/assets/img/chat-hover.svg');
				    }
				  },
				  function() {
				    $('.chat-icon').attr('src', '../resources/mainboard/assets/img/chat.svg');
				  }
				);
			$("#logout").click(function(event){
				event.preventDefault();
				$("form[name=logout]").submit();
			})
	}); // ready end
</script>