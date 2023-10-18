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
    var employeeId = $(this).attr("data-employeeId"); // 직원 번호 가져오기
	var employeeStatus = $(this).attr("data-employeeStatus");
    var tab = $(this).data("tab"); // 탭 정보 가져오기
    let removetr=$(this).parent().parent()
	console.log(employeeId);
	console.log(employeeStatus);
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/update-employeeStatus",
        type: "POST",
        data: {
            employeeId: employeeId,
            employeeStatus: employeeStatus,
            tab: tab 
        },
        
         async: false,
        success: function(response) {
        	 
        	 if (response == 1) {
                alert("직원 상태를 변경하였습니다.");
                
                if ( tab == "useruse" ){ 
                $.ajax({
                   url: "../admin/user-stoplist",
                   type:"POST",
                   data: {
                   		companyId: 1
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
                			if(item.pic){
                				img = '<img src="/usrupload"' + item.pic + ' alt="프로필 사진" width="25" height="25">'
                				}
                		   output += '<tr><td>' + img + '</td>';
                		   output += '<td>' + item.id + '</td>';
                		   output += '<td>' + item.name + '</td>';
                		   if (item.department == null || item.position == null || item.phone == null) {
  									item.department = '';
  									item.position = '';
  									item.phone = '';
							}
                		   output += '<td>' + item.department + '</td>';
                		   output += '<td>' + item.position + '</td>';
                		   output += '<td>' + item.email + '</td>';
                		   output += '<td>' + item.phone + '</td>';
                		   output += '<td><p>정상</p><button class="user-stop" data-employeeId='+item.id +' data-employeeStatus='+item.status
									+ ' data-tab="useruse">[이용중지]</button> </td>';
							let color = "blue";
							let deleteAuth = "[등록]";
							console.log(item.auth);
							if(item.auth.trim() == "Y"){
								color = "red"; 
								deleteAuth = "[삭제]";
								}	
						   output += '<td><span class="employee-auth-value=">' + item.auth +'</span>'
										+ '<button class="auth-delete '+ color + '" data-employeeId="' +item.id + '">'+ deleteAuth + '</button></td></tr>';
                		   
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
                   url: "../admin/user-uselist",
                   type:"POST",
                   data: {
                   		companyId: 1
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
                			if(item.pic){
                				img = '<img src="/usrupload"' + item.pic + ' alt="프로필 사진" width="25" height="25">';
                				}
                		   output += '<tr><td>' + img + '</td>';
                		   output += '<td>' + item.id + '</td>';
                		   output += '<td>' + item.name + '</td>';
                		    if (item.department == null || item.position == null || item.phone == null) {
  									item.department = '';
  									item.position = '';
  									item.phone = '';
							}
                		   output += '<td>' + item.department + '</td>';
                		   output += '<td>' + item.position + '</td>';
                		   output += '<td>' + item.email + '</td>';
                		   output += '<td>' + item.phone + '</td>';
                		   output += '<td><p>이용중지</p><button class="user-stop" data-employeeId='+item.id + ' data-employeeStatus='+item.status
									+ ' data-tab="userstop">[정상]</button> </td>';
						   let color = "blue";
						   let deleteAuth = "[등록]";
						   console.log(item.auth.trim());
							if(item.auth.trim() == "Y"){
								color = "red"; 
								deleteAuth = "[삭제]";
								}	
						   output += '<td><span class="employee-auth-value=">' + item.auth +'</span>'
										+ '<button class="auth-delete '+ color + '" data-employeeId="' +item.id + '">'+ deleteAuth + '</button></td></tr>';
				
                		   
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
    var employeeId = $(this).attr("data-employeeId"); // 직원 번호 가져오기
    var employeeAuth =  $(this).closest("td").find(".employee-auth-value").text().trim();
	var tab = $(this).closest("tr").find(".user-stop").data("tab"); // 탭 정보 가져오기
	console.log(employeeId);
	console.log(employeeAuth);
	console.log(tab);
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/employee-auth",
        type: "POST",
        data: {
            employeeId: employeeId,
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
  //  var userId = $(this).data("userId"); 
    var userId = $(this).attr("data-userId");
	console.log(userId)
	
	let removetr=$(this).parent().parent()
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/wait-reg",
        type: "POST",
        data: {
            userId: userId,
            action: "approve"
        },
        async: false,
        success: function(response) {
        	 
        	 if (response == 1) {
                alert("가입이 승인되었습니다.");
                
                $.ajax({
                   url: "../admin/user-uselist",
                   type: "POST",
                   data: {
                   		companyId: 1
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
                			if(item.pic){
                				img = '<img src="/usrupload"' + item.pic + ' alt="프로필 사진" width="25" height="25">'
                				}
                		   output += '<tr><td>' + img + '</td>';
                		   output += '<td>' + item.id + '</td>';
                		   output += '<td>' + item.name + '</td>';
                		     if (item.department == null || item.position == null || item.phone == null) {
  									item.department = '';
  									item.position = '';
  									item.phone = '';
							}
                		   output += '<td>' + item.department + '</td>';
                		   output += '<td>' + item.position + '</td>';
                		   output += '<td>' + item.email + '</td>';
                		   output += '<td>' + item.phone + '</td>';
                		   output += '<td><p>정상</p><button class="user-stop" data-employeeId='+item.id +' data-employeeStatus='+item.status
									+ ' data-tab="userstop">[이용중지]</button> </td>';
						   let color = "blue";
							let deleteAuth = "[등록]";
							if(item.auth.trim() == "Y"){
								color = "red"; 
								deleteAuth = "[삭제]";
								}	
						   output += '<td><span class="employee-auth-value=">' + item.auth +'</span>'
										+ '<button class="auth-delete '+ color + '" data-employeeId="' +item.id + '">'+ deleteAuth + '</button></td></tr>';
						   
                		   
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
    var userId = $(this).attr("data-userId");
    console.log(userId);
   
    $.ajax({
        url: "../admin/reg-wait",
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
  const profile = this.userPhoto;
	 let src = 'img/profile.png';
		if(profile){
			src='usrupload/' + profile;
		}

 
	       
			