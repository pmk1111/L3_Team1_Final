$(document).ready(function() {
			
		    $('.star').each(function() {
		        var $this = $(this);
		        var projectId = $this.data('projectId');
		       /* var employeeId = $this.data('employeeId'); */
		        var employeeId = 1;
		        
		        $.ajax({
		            url: '../project/participate',
		            method: 'GET',
		            data: {
		                projectId: projectId,
		                employeeId: employeeId
		            },
		            success: function(response) {
		                if (response == -1) {
		                    $this.attr('src', '../resources/project/img/projectboard/icon_star.png');
		                } else {
		                    $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');
		                }
		            },
				    error: function(xhr, status, error) {
				        console.error('Error:', error);
				    }
		        });
		    });
		
			$('.star').click(function() {
			    var $this = $(this);
			    var projectId = $this.data('projectId');
			    /* var employeeId = $this.data('employeeId'); */
			    var employeeId = 1
		       let token = $("meta[name='_csrf']").attr("content");
		       let header = $("meta[name='_csrf_header']").attr("content");			    
			
			    $.ajax({
			        url: '../project/favorite',
			        method: 'POST',
			        data: {
			            projectId: projectId,
			            employeeId: employeeId
			        },
			         beforeSend : function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
			            xhr.setRequestHeader(header, token);
			         },
			        success: function(response) {
			            console.log(response);
			            if(response == -1) {
			
			                $this.attr('src', '../resources/project/img/projectboard/icon_star.png');
			
			                var listItem = $this.closest('.list');
			                listItem.hide();
			                $('.partProject .all-project-list').prepend(listItem);
			                listItem.fadeIn(500);
			
			            } else {
			                $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');
			
			                var listItem = $this.closest('.list');
			
						    listItem.hide();
						    $('.favoritProject .all-project-list').prepend(listItem); // prepend()
						    listItem.fadeIn(500);
						}
					},
					error: function(xhr, status, error) {
					   console.error('Error:', error);
				   }
			   });
			});

			
            $(".star").hover(function() {
                var src = $(this).attr("src");

                if (src === "../resources/project/img/projectboard/icon_star.png") {
                    $(this).attr("src", "../resources/project/img/projectboard/icon_star_hover.png");
                }
            }, function() {
                var src = $(this).attr("src");

                if (src === "../resources/project/img/projectboard/icon_star_hover.png") {
                    $(this).attr("src", "../resources/project/img/projectboard/icon_star.png");
                }
            });


            // 앵커 클릭 시 모달 보여주기
            $('.select-color').click(function(event) {
                event.preventDefault();
                $('#modal-background').fadeIn(300);
                $('#modal-background').css('display', 'block');


            });

            // 닫기 버튼 또는 취소 버튼 클릭 시 모달 숨기기 및 아이콘 복구 
            $('.modal-close, .modal-cancle').click(function(event) {
                event.preventDefault();
                $('#modal-background').css('display', 'none');

            });

            // radio
            $(".color-item").click(function() {
                // 현재 project-color-check-active-1 클래스가 적용된 요소에서 클래스 제거
                $(".project-color-check-active-1").removeClass("project-color-check-active-1");

                // 클릭된 요소에 project-color-check-active-1 클래스 추가
                $(this).addClass("project-color-check-active-1");
            });

            // 색상 변경
			$(".modal-submit").click(function() {
			    // .project-color-check-active-1 클래스가 적용된 요소의 부모 li 태그의 배경색을 가져옴
			    var activeColor = $(".project-color-check-active-1").closest('li').css("background-color");
				var id = parseInt($("#detailSettingProjectSrno").text());
				
			    $("#modal-background").css('display', 'none');
			    
			    $.ajax({
			        url: '../project/update-color',
			        type: 'GET',
			        data: { color:activeColor, id:id },
			        success: function(response) {
			        $(".select-color").css("background", activeColor);
			    }
			    });
			});

            /* 드롭다운 이미지 변경 */
            $('.setting-anchor').hover(
                function() { // mouseover event handler
                    const img = $(this).find('.setting-img');
                    let hoverImageSrc;
                    if (img.hasClass('share')) {
                        hoverImageSrc = '../project/img/projectboard/share-hover.svg';
                    } else if (img.hasClass('edit')) {
                        hoverImageSrc = '../project/img/projectboard/edit-hover.svg';
                    } else if (img.hasClass('bin')) {
                        hoverImageSrc = '../project/img/projectboard/bin-hover.svg';
                    }
                    img.attr('src', hoverImageSrc);
                },
                function() { // mouseout event handler
                    const img = $(this).find('.setting-img');
                    let originalImageSrc;
                    if (img.hasClass('share')) {
                        originalImageSrc = '../project/img/projectboard/share.svg';
                    } else if (img.hasClass('edit')) {
                        originalImageSrc = '../project/img/projectboard/edit.svg';
                    } else if (img.hasClass('bin')) {
                        originalImageSrc = '../project/img/projectboard/bin.svg';
                    }
                    img.attr('src', originalImageSrc);
                }
            );

            // setting-info hover
            $('.dropdown-menu').on('shown.bs.dropdown', function() {
                $('.setting-info').hover(
                    function() { // mouseover event handler
                        $('<p class="tooltip"></p>')
                            .text('프로젝트 나가기 시, 프로젝트 목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.')
                            .appendTo('body')
                            .fadeIn('slow');
                    },
                    function() { // mouseout event handler
                        $('.tooltip').remove();
                    }
                ).mousemove(function(e) {
                    $('.tooltip')
                        .css({
                            top: e.pageY + 10,
                            left: e.pageX + 20
                        })
                });
            });

            // 나가기
            $('.setting-exit').click(function(event){
                event.preventDefault();

                swal({
                    title: "정말 프로젝트를 나가시겠습니까?",
                    text: "더 이상 게시물 작성 및 수정이 불가합니다.",
                    icon: "info",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willExit) => {
                	if(willExit) {
                    	swal("완료", "프로젝트 나가기가 완료되었습니다.", "success");
                	}	
                });
            });
            
            // 내보내기
            $('.setting-fire').click(function(event){
                event.preventDefault();

                swal({
                    title: "팀에서 유저를 내보내시겠습니까?",
                    text: "해당 유저는 더 이상 프로젝트 활동이 불가합니다.",
                    icon: "info",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willExit) => {
                	if(willExit) {
                    	swal("완료", "프로젝트 내보내기가 완료되었습니다.", "success");
                	}	
                });
            });
            
            $('.setting-manager-fire').click(function(event){
                event.preventDefault();

                swal({
                    title: "관리자 권한을 해지하시겠습니까?",
                    icon: "info",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willExit) => {
                	if(willExit) {
                    	swal("완료", "관리자 해지가 완료되었습니다.", "success");
                	}	
                });
            });
            
            $('.setting-manager-hire').click(function(event){
                event.preventDefault();

                swal({
                	  title: "관리자 권한을 부여하시겠습니까?",
                	  text: "관리자 기능 및 접근 권한이 추가됩니다.",
                	  icon: "info",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willExit) => {
                	if(willExit) {
                    	swal("완료", "관리자 등록이 완료되었습니다.", "success");
                	}	
                });
            });
            
            // 프로젝트 삭제
            $('.setting-delete').click(function(event){
                event.preventDefault();

                swal({
                    title: "정말 프로젝트를 삭제하시겠습니까?",
                    text: "삭제된 프로젝트는 복구가 불가능합니다.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willExit) => {
                	if(willExit){
                    	swal("완료", "프로젝트 삭제가 완료되었습니다.", "success");
                	}
                });
            });

            // 친구 초대 모달
            $('.memberlist').click(function() {
                event.preventDefault();
                $('#modal-background-invite').fadeIn(300);
                $('#modal-background-invite').css('display', 'block');
            });

            $('.modal-close-invite, .modal-cancle-exit').click(function(event) {
                event.preventDefault();
                $('#modal-background-invite').css('display', 'none');

                $('.bi-circle-fill').removeClass("darker-icon");
                $('.activity-badge').removeClass("light-border");
                $('#layout-navbar').css('box-shadow', '3px 3px 10px 5px #f0f0f0');
            });

            $('.modal-member-role').each(function() {
                if ($(this).find('span').text().trim() === '') {
                    $(this).hide();
                    $(this).siblings('.modal-member-name').css('width', '269px');
                }
            });

            $('#image-input').on('keyup', function() {
                var searchTerm = $(this).val().toLowerCase();

                $('#member-list-ul li').each(function() {
                    var memberName = $(this).find('.modal-member-name-span').text().toLowerCase();

                    if (memberName.includes(searchTerm)) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            });

            $('#home-tab').on('click', function() {
                $('.modal-body-invite').hide(); // 초대 div 숨기기
                $('.modal-search-list').show(); // 목록 div 보이기
                $('.modal-content-invite').animate({ width: '434px' }, 250); // 너비 변경 애니메이션

            });

            $('#profile-tab').on('click', function() {
                $('.modal-search-list').hide(); // 목록 div 숨기기
                $('.modal-body-invite').show(); // 초대 div 보이기
                $('.modal-content-invite').animate({ width: '600px' }, 250); // 너비 변경 애니메이션
            });
			
            $('.modal-submit-exit').click(function(event) {
                event.preventDefault();
                $('#modal-background-invite').css('display', 'none');
            });
            
});