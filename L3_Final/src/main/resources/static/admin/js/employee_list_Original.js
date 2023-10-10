//tab 활성화

let key = "${param.key}";
if(key === "useruse"){
	
	$("#user-stop").removeClass("active");
	$("#user-wait").removeClass("active");
	$("#user-use").addClass("active");
	
	$("#userstop").removeClass("show active");
	$("#userwait").removeClass("show active");
	$("#useruse").addClass("show active");
	
}else if(key === "userstop"){
	
	$("#user-wait").removeClass("active");
	$("#user-use").removeClass("active");
	$("#user-stop").addClass("active");
	
	$("#useruse").removeClass("show active");
	$("#userwait").removeClass("show active");
	$("#userstop").addClass("show active");
	
}else if(key === "userwait"){
	
	$("#user-use").removeClass("active");
	$("#user-stop").removeClass("active");
	$("#user-wait").addClass("active");
	
	$("#userstop").removeClass("show active");
	$("#useruse").removeClass("show active");
	$("#userwait").addClass("show active");
	
}

// 직원 상태 업데이트
 $(function() {
$(".user-stop").click(function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
	var employeeStatus = $(this).data("employee_status");
	console.log(employeeNo);
	console.log(employeeStatus);
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/updateEmployeeStatus",
        type: "POST",
        data: {
            employeeNo: employeeNo,
            employeeStatus: employeeStatus
         
        },
        
        success: function(response) {
        	  if (response == 1) {
                alert("직원의 활동이 변경되었습니다..");
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

// 관리자 유무
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
