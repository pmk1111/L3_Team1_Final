//tab 활성화

 $(function () {
            // 탭을 클릭할 때 이벤트 리스너 등록
            $(".nav-link").click(function () {
                // 클릭한 탭의 data-tab 속성 값을 가져옴
                var tabHref = $(this).attr("href");

                // URL 생성
                var targetUrl = "../admin/list" + tabHref;
            });
          });

       

// 직원 상태 업데이트
 $(function() {
$(".user-stop").click(function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
	var employeeStatus = $(this).data("employee_status");
    var tab = $(this).data("tab"); // 탭 정보 가져오기
	console.log(employeeNo);
	console.log(employeeStatus);
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/updateEmployeeStatus",
        type: "POST",
        data: {
            employeeNo: employeeNo,
            employeeStatus: employeeStatus,
            tab: tab 
        },
        
        success: function(response) {
        	  if (response == 1) {
                alert("직원의 활동이 변경되었습니다.");
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

// 관리자 유무
 $(function() {
$(".auth-delete").click(function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
    var employeeAuth =  $(this).closest("td").find(".employee-auth-value").text().trim();
	var tab = $(this).closest("tr").find(".user-stop").data("tab"); // 탭 정보 가져오기
	console.log(employeeNo);
	console.log(employeeAuth);
	console.log(tab);
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/employeeAuth",
        type: "POST",
        data: {
            employeeNo: employeeNo,
             employeeAuth: employeeAuth,
             tab: tab
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

// 가입 승인
 $(function() {
$(".approveUser").click(function() {
    var userId = $(this).data("user_id"); 
	console.log(userId)
	
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/regWait",
        type: "POST",
        data: {
            userId: userId,
            action: "approve"
        },
        
        success: function(response) {
        	 
        	 if (response == 1) {
                alert("가입이 승인되었습니다.");
               
            } else {
                alert("가입 승인 실패.");
       		}
        },
        error: function() {
            alert("업데이트에 실패했습니다.");
        }
    });
});
});

// 가입 거절
 $(function(){	
$(".rejectUser").click(function () {
    var userId = $(this).data("user_id"); 
   
    $.ajax({
        url: "../admin/regWait",
        type: "POST",
        data: {
            userId: userId,
            action: "reject"
        },
        
        success: function(response) {
        	  
        	 if (response == 1) {
                alert("가입이 거절되었습니다.");
                
            } else {
                alert("가입 거절 실패.");
            }
        },
        error: function() {
            alert("업데이트에 실패했습니다.");
        }
    });
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
