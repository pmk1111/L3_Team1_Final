<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

 <link rel="stylesheet" href="../resources/user/css/join.css" />		
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../resources/user/js/join.js"></script>
</head>
<body>
   <main>
   <div class="formDiv" style="width: 50%; height: 80%;">


   <form id="joinform" name="joinform" action="joinProcess.net" method="post">
      <h1>개인회원</h1>
      <div class = "formDiv">
      	<div>
			<b class="bTxt">이메일 주소</b>
           	<input type="text" id="email"  class="email" name="email" maxLength="30"  placeholder="이메일을 입력하세요" required> 
    		<button  id="emailAuthBtn" type="button" name="send_verify">메일발송</button>
    		<p class="errMsg" id="email_message">오류메세지 영역</p>
      	</div>
      	<div>
      		<b class="bTxt">비밀번호</b>
           	<input type="password" id="password" placeholder="비밀번호를 입력하세요" class="pw" name="pass" required>
         	<p class="errMsg" id="pw_message">오류메세지 영역</p>
      	</div>
      	<div>
      		<b class="bTxt">비밀번호 확인</b>
           	<input type="password" id="confirmPassword"  placeholder="비밀번호를 한번 더 입력하세요" class="pw_check" name="passwd"   required>
        	<p class="errMsg" id="pw_check_message">오류메세지 영역</p>
      	</div>
      	<div>
      		<b class="bTxt">이름</b>
           	<input type="text" id="userName" class="name"  name="name" placeholder="이름을 입력하세요" maxLength="15" required>
           	<p class="errMsg" id="name_message">오류메세지 영역</p>
      	</div>
      	<div>
      		
      	</div>
      	<div>
      		<b class="bTxt">인증번호 입력</b>
    	   	<input id="verify" type="text" class="verify" name="verify" maxLength="6" placeholder="인증번호를 입력하세요" required> 
     		<button onclick ="chkAuthMailNum()" type="button" id="verify_check">인증하기</button>
     		<p class="errMsg" id="verify_message">오류메세지 영역</p>
      	</div>
    	  
    	<div class="mt10">
	   		<div>
	   			<input type="checkbox" id="policyCheckbox" class="policy" name="policy" value="필수">
	   			<label for="policy" class="policyLabel">  
	        		<b class="require">(필수)</b>&nbsp;
	        		<a href="Service.net" style="color:#7C00B6; text-decoration: dash ">
	        		서비스 이용약관</a>,<a href="PrivatePolicy.net" style="color:#7C00B6; text-decoration: dash ">개인정보 처리방침</a>에 동의합니다.
	           	</label>
			</div>
			<br>
			<div>
	          	<input type="checkbox" id="benefits" class="benefits" name="benefits" value="선택">
	            <label for="benefits" class="benefitsLabel">  
	            	<b>(선택)</b>&nbsp;혜택 수신에 동의합니다.
			    </label>
			</div>
    	</div>
      </div>
    
      <div class="clearfix">
         <button type="button" id="confirmBtn" class="submitbtn" onclick="validationcheck()"><strong>가입하기</strong></button>
      </div>
   </form>
   
    <input type="hidden" id = "authRandNum" name = "authRandNum" />
	<input type="hidden" id ="isChkPassword" name = "isChkPassword" value="N"/>
	<input type="hidden" id ="isChkPassword2" name = "isChkPassword2" value="N"/>
	<input type="hidden" id ="isChkName" name = "isChkName" value="N"/>
	<input type="hidden" id ="isChkEmail" name = "isChkEmail" value="N"/>
	<input type="hidden" id ="isChkverify" name = "isChkverify" value="N"/>
	<input type="hidden" id ="isChkpolicy" name = "isChkpolicy" value="N"/>
	</div>
   </main>
</body>


</html>