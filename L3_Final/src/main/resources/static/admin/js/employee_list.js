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
	$("body").on("click",".user-stop", function() {
    var employeeNo = $(this).data("employee_no"); // 직원 번호 가져오기
	var employeeStatus = $(this).data("employee_status");
    var tab = $(this).data("tab"); // 탭 정보 가져오기
    let removetr=$(this).parent().parent()
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
        
         async: false,
        success: function(response) {
        	 
        	 if (response == 1) {
                alert("직원 상태를 변경하였습니다.");
                
                if ( tab == "useruse" ){ 
                $.ajax({
                   url: "../admin/userstoplist",
                   data: {
                   		company_id: "1"
                	},
                	success: function(data){
                		let count=data.length;
                		console.log(count)
                		$('#head-tab > ul > li:nth-child(2) > a > small > b > span').text(count);
                		let output="";
                		if( count == 0){
                			output += '<tr><td colspan="10" style="border-bottom: none">조회된데이터가 없습니다.</td></tr>';
                		} else {
                			
                		$(data).each(function(index, item){
                			let img = '<img src="/img/profile.png" alt="프로필 사진" width="25" height="25">'
                			if(item.user_photo){
                				img = '<img src="/usrupload"' + item.user_photo + ' alt="프로필 사진" width="25" height="25">'
                				}
                		   output += '<tr><td>' + img + '</td>';
                		   output += '<td>' + item.employee_no + '</td>';
                		   output += '<td>' + item.user_name + '</td>';
                		   if(item.department ==null ||item.position == null){
                		   		item.department = '';
                		   		item.position  = '';
                		   }
                		   output += '<td>' + item.department + '</td>';
                		   output += '<td>' + item.position + '</td>';
                		   output += '<td>' + item.user_email + '</td>';
                		   output += '<td>' + item.user_phone + '</td>';
                		   output += '<td><p>정상</p><button class="user-stop" data-employee_no='+item.employee_no +' data-employee_status='+item.employee_status
									+ ' data-tab="useruse">[이용중지]</button> </td>';
							let color = "blue";
							let deleteAuth = "[등록]";
							console.log(item.employee_auth.trim());
							if(item.employee_auth.trim() == "Y"){
								color = "red"; 
								deleteAuth = "[삭제]";
								}	
						   output += '<td><span class="employee-auth-value=">' + item.employee_auth +'</span>'
										+ '<button class="auth-delete '+ color + '" data-employee_no="' +item.employee_no + '">'+ deleteAuth + '</button></td></tr>';
                		   
                		})//.each 끝
                		$('#userstop > table > tbody').html(output);
                		
                		removetr.remove();
                		console.log($('#head-tab > ul > li:nth-child(1) > a > small > b span').text());
                		let usecount = $('#head-tab > ul > li:nth-child(1) > a > small > b > span').text()-1;
                		$('#head-tab > ul > li:nth-child(1) > a > small > b > span').text(usecount);
                		
                		
       
                		} // else end
                		 
                	}
             
                	})
                } else if(tab == "userstop"){
                $.ajax({
                   url: "../admin/useruselist",
                   data: {
                   		company_id: "1"
                	},
                	success: function(data2){
                		let count2=data2.length;
                		console.log(count2)
                		$('#head-tab > ul > li:nth-child(1) > a > small > b > span').text(count2);
                		let output="";
                		if( count2 == 0){
                			output += '<tr><td colspan="10" style="border-bottom: none">조회된데이터가 없습니다.</td></tr>';
                		} else {
                			
                		$(data2).each(function(index, item){
                			let img = '<img src="/img/profile.png" alt="프로필 사진" width="25" height="25">'
                			if(item.user_photo){
                				img = '<img src="/usrupload"' + item.user_photo + ' alt="프로필 사진" width="25" height="25">';
                				}
                		   output += '<tr><td>' + img + '</td>';
                		   output += '<td>' + item.employee_no + '</td>';
                		   output += '<td>' + item.user_name + '</td>';
                		   if(item.department ==null ||item.position == null){
                		   		item.department = '';
                		   		item.position  = '';
                		   }
                		   output += '<td>' + item.department + '</td>';
                		   output += '<td>' + item.position + '</td>';
                		   output += '<td>' + item.user_email + '</td>';
                		   output += '<td>' + item.user_phone + '</td>';
                		   output += '<td><p>이용중지</p><button class="user-stop" data-employee_no='+item.employee_no + ' data-employee_status='+item.employee_status
									+ ' data-tab="userstop">[정상]</button> </td>';
						   let color = "blue";
						   let deleteAuth = "[등록]";
						   console.log(item.employee_auth.trim());
							if(item.employee_auth.trim() == "Y"){
								color = "red"; 
								deleteAuth = "[삭제]";
								}	
						   output += '<td><span class="employee-auth-value=">' + item.employee_auth +'</span>'
										+ '<button class="auth-delete '+ color + '" data-employee_no="' +item.employee_no + '">'+ deleteAuth + '</button></td></tr>';
				
                		   
                		})//.each 끝
                		$('#useruse > table > tbody').html(output);
                		removetr.remove();
                		
                		console.log($('#head-tab > ul > li:nth-child(2) > a > small > b > span').text());
                		let stopcount = $('#head-tab > ul > li:nth-child(2) > a > small > b > span').text()-1;
                		$('#head-tab > ul > li:nth-child(2) > a > small > b span').text(stopcount);
                	
                		
                		} // else end
                		 
                	}
             
                	})
                } //else if end
               
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





// 가입 승인
 $(function() {
 $("body").on("click",".approveUser", function() {
    var userid = $(this).data("userid"); 
	console.log(userid)
	
	let removetr=$(this).parent().parent()
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/regWait",
        type: "POST",
        data: {
            userid: userid,
            action: "approve"
        },
        async: false,
        success: function(response) {
        	 
        	 if (response == 1) {
                alert("가입이 승인되었습니다.");
                
                $.ajax({
                   url: "../admin/useruselist",
                   data: {
                   		company_id: "1"
                	},
                	success: function(data){
                		let count=data.length;
                		console.log(count)
                		$('#head-tab > ul > li:nth-child(1) > a > small > b span').text(count);
                		let output="";
                		if( count == 0){
                			output += '<tr><td colspan="10" style="border-bottom: none">조회된데이터가 없습니다.</td></tr>'
                		} else {
                			
                		$(data).each(function(index, item){
                			let img = '<img src="/img/profile.png" alt="프로필 사진" width="25" height="25">'
                			if(item.user_photo){
                				img = '<img src="/usrupload"' + item.user_photo + ' alt="프로필 사진" width="25" height="25">'
                				}
                		   output += '<tr><td>' + img + '</td>';
                		   output += '<td>' + item.employee_no + '</td>';
                		   output += '<td>' + item.user_name + '</td>';
                		   if(item.department ==null ||item.position == null){
                		   		item.department = '';
                		   		item.position  = '';
                		   }
                		   output += '<td>' + item.department + '</td>';
                		   output += '<td>' + item.position + '</td>';
                		   output += '<td>' + item.user_email + '</td>';
                		   output += '<td>' + item.user_phone + '</td>';
                		   output += '<td><p>정상</p><button class="user-stop" data-employee_no='+item.employee_no +' data-employee_status='+item.employee_status
									+ ' data-tab="userstop">[이용중지]</button> </td>';
						   let color = "blue";
							let deleteAuth = "[등록]";
							if(item.employee_auth.trim() == "Y"){
								color = "red"; 
								deleteAuth = "[삭제]";
								}	
						   output += '<td><span class="employee-auth-value=">' + item.employee_auth +'</span>'
										+ '<button class="auth-delete '+ color + '" data-employee_no="' +item.employee_no + '">'+ deleteAuth + '</button></td></tr>';
						   
                		   
                		})//.each 끝
                		$('#useruse > table > tbody').html(output);
                		removetr.remove();
                		console.log($('#head-tab > ul > li:nth-child(3) > a > small > b span').text());
                		let waitcount = $('#head-tab > ul > li:nth-child(3) > a > small > b span').text()-1;
                		$('#head-tab > ul > li:nth-child(3) > a > small > b span').text(waitcount);
                		
                	
                		
                		} // else 의 끝
                	}
             
                	})
               
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
    var userid = $(this).data("userid"); 
    console.log(userid);
   
    $.ajax({
        url: "../admin/regWait",
        type: "POST",
        data: {
            userid: userid,
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

 
	       
			