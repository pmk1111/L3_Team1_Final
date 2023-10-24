$(document).ready(function() {
    
	let check = 0;
	$("#formAccountSettings").submit(function(){
	
   	event.preventDefault();
	
	if(check == 0){
		const value = $('#pic').val();
		const html = "<input type='hidden' value='" + value + "' name='check'>";
		$(this).append(html);
	} 
		this.submit();


	}) //$("#formAccountSettings") end
     		
	$('#deleteUser').click(function() {
        if (!$('#agreeDelete').is(':checked')) {
            alert('동의버튼에 체크해주세요.');
            return false;
        } else {
        	alert('회원탈퇴 되었습니다. 홈으로 이동합니다');
        }
    }); //$('#deleteUser').click(function() { end
   $('#updateProfile').click(function(){
    	var phone=$("#phone").val();
   	    var regPhone=/^010-?([0-9]{4})-?([0-9]{4})$/;

        if(phone != "" && regPhone.test(phone) == false){
        	alert('전화번호를 형식에 맞게 입력해주세요');
        return false;
   		}
	}); // $('#updateProfile').click(function(){ end
})//document end