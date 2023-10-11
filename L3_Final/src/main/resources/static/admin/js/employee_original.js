//tab 활성화



 $(function () {
            // 탭을 클릭할 때 이벤트 리스너 등록
            $(".nav-link").click(function () {
                // 클릭한 탭의 data-tab 속성 값을 가져옴
                var tabId = $(this).data("tab");

                // URL 변경 (해시 태그를 이용)
                window.location.hash = tabId;
            });

            // 페이지 로딩 시 URL에 따라 탭 활성화
            var initialTab = window.location.hash.substring(1); // URL에서 해시 태그 가져오기
            if (initialTab) {
                // 해당 탭 활성화
                $(".nav-link[data-tab='" + initialTab + "']").tab("show");
            }
        });

// [정상]탭에서 직원 상태 업데이트
 $(function() {
$(".user-stop").click(function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
	
	console.log(employeeNo);
	
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/updateEmployeeStatus",
        type: "POST",
        data: {
            employeeNo: employeeNo,
         
        },
        
        success: function(response) {
        	  if (response == 1) {
                alert("직원의 상태가 [이용중지] 되었습니다.");
                location.href="../admin/list";
            } else {
                alert("직원 상태 변경 실패");
            }
        },
        error: function() {
            alert("업데이트에 실패했습니다.");
        }
    });
  });
});

// [정상]탭에서 관리자 유무
 $(function() {
$(".auth-delete").click(function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
    var employeeAuth =  $(this).closest("td").find(".employee-auth-value").text().trim();
	console.log(employeeNo);
	console.log(employeeAuth);
	
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/employeeAuth",
        type: "POST",
        data: {
            employeeNo: employeeNo,
             employeeAuth: employeeAuth
        },
        
        success: function(response) {
        	  if (response == 1) {
                alert("관리자 상태가 변경되었습니다.");
                location.href="../admin/list";
            } else {
                alert("관리자 상태 변경 실패.");
            }
        },
        error: function() {
            alert("업데이트에 실패했습니다.");
        }
    });
});
});

//관리자 유무 표시
$(function() {
    $(".auth-delete").each(function() {
        var employeeAuth =  $(this).closest("td").find(".employee-auth-value").text().trim();// 직원 권한 값을 가져옴
        console.log(employeeAuth);
        
        if (employeeAuth === "Y") {
            $(this).text("[삭제]");
        } else if (employeeAuth === "N") {
            $(this).text("[등록]").css("color", "blue");
        }
    });
});

// [이용중지]탭에서 직원 상태 업데이트
 $(function() {
$(".user-use").click(function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
	
	console.log(employeeNo);
	
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/updateEmployeeStatus2",
        type: "POST",
        data: {
            employeeNo: employeeNo,
         
        },
        
        success: function(response) {
        	  if (response == 1) {
                alert("직원의 상태가 [정상]으로 변경되었습니다.");
               
               location.reload();
                    
            } else {
                alert("직원 상태 변경 실패");
            }
        },
        error: function() {
            alert("업데이트에 실패했습니다.");
        }
    });
  });
});

//[이용중지]탭에서 관리자 유무
 $(function() {
$(".auth-delete2").click(function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
    var employeeAuth =  $(this).closest("td").find(".employee-auth-value2").text().trim();
	console.log(employeeNo);
	console.log(employeeAuth);
	
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/employeeAuth2",
        type: "POST",
        data: {
            employeeNo: employeeNo,
             employeeAuth: employeeAuth
        },
        
        success: function(response) {
        	  if (response == 1) {
                alert("관리자 상태가 변경되었습니다.");
               location.reload();
            } else {
                alert("관리자 상태 변경 실패.");
            }
        },
        error: function() {
            alert("업데이트에 실패했습니다.");
        }
    });
});
});
//관리자 유무 표시
$(function() {
    $(".auth-delete2").each(function() {
        var employeeAuth =  $(this).closest("td").find(".employee-auth-value2").text().trim();// 직원 권한 값을 가져옴
        console.log(employeeAuth);
        
        if (employeeAuth === "Y") {
            $(this).text("[삭제]");
        } else if (employeeAuth === "N") {
            $(this).text("[등록]").css("color", "blue");
        }
    });
});
//프로필 사진
  const profile = this.user_photo;
	 let src = 'img/profile.png';
		if(profile){
			src='usrupload/' + profile;
		}

//검색
 $(function() {
		//검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
		let selectedValue = '${search_field}'
		if (selectedValue != '-1')
			$("#viewcount").val(selectedValue);
		
			
		const $input = $("input[name=search_word]")
	
		
		//검색 버튼 클릭한 경우
	       $("#searchBtn").click(function() {
	          //검색어  공백 유효성 검사합니다.
	          if ($input.val() == ''){
	             alert("검색어를 입력하세요.");
	             $input.focus();
	             return false;
	          }
	          
			});//button click end
	       
	     //  $("#searchBtn").change(function(){
	    	//   $search_field.val() === '4';
	       //})
			
	
			
			
	})//ready end
