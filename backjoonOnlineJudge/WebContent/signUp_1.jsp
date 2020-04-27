<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>

<style type="text/css">
/* 	공통부분 시작 */
	*{
		font-style: dotumche;
		font-size: 14px;
	}
	
	#topNavDiv{
		width: 1024px;
		height: 60px;
		margin: auto;
	}
	
	#navLogo{
		width: 262px;
		height: 60px;
	}
	
	#midDiv{
		width: 1024px;
		margin: auto;
		padding: 30px;
	}
	
	.navBtn{
		width: 80px;
		height: 40px;
		background-color: #FFFFFF;
		border-style: none;
	}
/* 	공통부분 끝 */
	
	#midTitleBar{
		height: 60px;
		border-style: solid none solid none;
		border-width: 1px;
		border-color: #CCCCCC;
		background-color: #EEEEEE;
	}
	
	#formContainer{
		width: 493px;
		padding: 30px;
		border: 1px solid #CCCCCC;
		margin: auto;
	}
	
	#formHeader{
		text-align: center;
	}
	
	.formRow{
		padding: 0px 15px;
	}
	
	.formRow p{
		font-weight: bold;
	}
	
	.inputLong{
		width: 436px;
		height: 20px;
		padding: 6px 12px;
		border: 1px solid #DDDDDD;
	}
	
	.inputShort{
		width: 195px;
		height: 20px;
		padding: 6px 12px;
		border: 1px solid #DDDDDD;
	}
	
	#submitBtn{
		width: 80;
		height: 30px;
		color: #FFFFFF;
		background-color: #428BCA;
		border-style: none;
		border-color: #357EBD;
	}
</style>
	
<script type="text/javascript">

	idCount = 0;
	idList = new Array();
	pwdList = new Array();
	emailList = new Array();
	
	window.onload = function() {
		idObj = document.getElementsByName('id')[0];
		messageObj = document.getElementsByName('message')[0];
		pwdObj = document.getElementsByName('pwd')[0];
		pwdRepeatObj = document.getElementsByName('pwdRepeat')[0];
		schoolOrOfficeObj = document.getElementsByName('schoolOrOffice')[0];
		emailObj = document.getElementsByName('email')[0];
		submitObj = document.getElementById('submitBtn');
		
		idObj.addEventListener('change', idChkFnc);
		messageObj.addEventListener('change', messageChkFnc);
		pwdObj.addEventListener('change', pwdChkFnc);
		pwdRepeatObj.addEventListener('change', pwdRepeatChkFnc);
		emailObj.addEventListener('change', emailChkFnc);
		submitObj.addEventListener('click', finalChkFnc);
	}

	function idChkFnc(){
		var idStr = idObj.value;
		var idChk = false;
		var resultStr = '';
		
		if (idStr.length == 0){
			resultStr = '아이디를 입력해 주세요';
		} else if(idStr.length < 3) {
			resultStr = '아이디는 3자 이상입니다';
		} else if(idUniqueChkFnc(idStr)){
			resultStr = '이미 등록되어 있는 아이디 입니다';
		} else{
			idChk = true;
		}
		
		var errObj = document.getElementById('idErr');
		errObj.innerHTML = resultStr;
		errObj.style.color = 'red';
		borderColorFnc(idObj, idChk);
		
		return idChk;
	}
	
	function idUniqueChkFnc(str){
		for (var i = 0; i < idCount; i++) {
			if(idList[i] == str){
				return true;
			}
		}
		return false;
	}
	
	function messageChkFnc(){
		var messageStr = messageObj.value;
		var messageChk = false;
		var resultStr = '';
		
		if(messageStr.length == 0){
			resultStr = '상태 메시지를 입력해주세요';
		} else{
			messageChk = true;
		}
		
		var errObj = document.getElementById('messageErr');
		errObj.innerHTML = resultStr;
		errObj.style.color = 'red';
		borderColorFnc(messageObj, messageChk);
		
		return messageChk;
	}
	
	function pwdChkFnc(){
		var pwdStr = pwdObj.value;
		var pwdChk = false;
		var resultStr = '';
		
		if(pwdStr.length < 6){
			resultStr = '비밀번호는 6자 이상입니다';
		} else{
			pwdChk = true;
		}
		
		var errObj = document.getElementById('pwdErr');
		errObj.innerHTML = resultStr;
		errObj.style.color = 'red';
		borderColorFnc(pwdObj, pwdChk);
		
		return pwdChk;
	}

	function pwdRepeatChkFnc(){
		var pwdStr = pwdObj.value;
		var pwdRepeatStr = pwdRepeatObj.value;
		var pwdRepeatChk = false;
		var resultStr = '';
		
		if(pwdRepeatStr == pwdStr){
			pwdRepeatChk = true;
		} else{
			resultStr = '비밀번호가 일치하지 않습니다';
		}
		
		var errObj = document.getElementById('pwdRepeatErr');
		errObj.innerHTML = resultStr;
		errObj.style.color = 'red';
		borderColorFnc(pwdRepeatObj, pwdRepeatChk);
		
		return pwdRepeatChk;
	}
	
	function emailChkFnc(){
		var emailStr = emailObj.value;
		var emailChk = false;
		var resultStr = '';
		
		if (emailStr.length == 0){
			resultStr = '이메일을 입력해 주세요';
		} else if(emailStr.indexOf('@') == -1){
			resultStr = '올바른 이메일 주소를 입력해 주세요';
		} else if(emailUniqueChkFnc(emailStr)){
			resultStr = '이미 등록되어 있는 이메일입니다'
		} else{
			emailChk = true;
		}
		
		var errObj = document.getElementById('emailErr');
		errObj.innerHTML = resultStr;
		errObj.style.color = 'red';
		borderColorFnc(emailObj, emailChk);
		
		return emailChk;
	}
	
	function emailUniqueChkFnc(str){
		for (var i = 0; i < idCount; i++) {
			if(emailList[i] == str){
				return true;
			}
		}
		return false;
	}
	function borderColorFnc(obj, chk){
		if(chk){
			obj.style.borderColor = "#DDDDDD";
		} else{
			obj.style.borderColor = "red";
		}
	}
	
	function finalChkFnc(){
		var idChk = idChkFnc();
		var messageChk = messageChkFnc();
		var pwdChk = pwdChkFnc();
		var pwdRepeatChk = pwdRepeatChkFnc();
		var emailChk = emailChkFnc();
		
		if(idChk && messageChk && pwdChk && pwdRepeatChk && emailChk){
			idList[idCount] = idObj.value;
			pwdList[idCount] = pwdObj.value;
			emailList[idCount++] = emailObj.value;
			alert('가입완료');
		}
	}
</script>

</head>

<body>

	<div id="topNavDiv">
<!-- 		원래크기 524*120 -->
		<a href="./index.jsp" style="text-decoration: none">
			<img id="navLogo" src="./image/logo.png" style="vertical-align: bottom;">
		</a>
		<a href="./board_1.jsp" style="text-decoration: none">
			<input class="navBtn" type="button" value="게시판">
		</a>
	</div>
	
	<div id="midTitleBar">
		<div style="width: 1024px; margin: auto; font-size: 20px; line-height: 60px;">
			회원가입
		</div>
	</div>
	
	<div id="midDiv">
		<form action="./login.jsp">
			<div id="formContainer">
				<div id="formHeader">
					<h2 style="font-size: 18px">회원가입</h2>
					<p>계정이 이미 있는 경우에는 <a href="./login_1.jsp">로그인</a>해주세요.</p>
					<p>가입을 하면 백준 온라인 저지의 이용약관, 개인정보취급방침 및 개인정보3자제공에 동의하게 됩니다.</p>
					<p>아이디가 구글 검색에 노출되는 것을 원치않는 분은 다른 곳에서 사용하지 않는 아이디를 사용해주세요.</p>
					<p>아이디의 구글 검색 노출은 회원가입 후 정보 수정에서 변경할 수 있습니다.</p>
					<p>가입 후 아이디는 변경할 수 없습니다.</p>
				</div>
				<hr>
				<div class="formRow">
					<p>아이디</p>
					<input class="inputLong" type="text" name="id">
					<p id="idErr"></p>
				</div>
				<div class="formRow">
					<p>상태메시지(다른 사람에게 보이고 싶은 한마디)</p>
					<input class="inputLong" type="text" name="message">
					<p id="messageErr"></p>
				</div>
				<div class="formRow">
					<div style="float: left;">
						<p>비밀번호</p>
						<input class="inputShort" type="password" name="pwd">
						<p id="pwdErr"></p>
					</div>
					<div style="float: left; margin-left: 20px;">
						<p>비밀번호(확인)</p>
						<input class="inputShort" type="password" name="pwdRepeat">
						<p id="pwdRepeatErr"></p>
					</div>
					<div style="clear: left;"></div>
				</div>
				<div class="formRow">
					<p>학교/회사 또는 소속</p>
					<input class="inputLong" type="text" name="schoolOrOffice">
				</div>
				<div class="formRow">
					<p>이메일 주소</p>
					<input class="inputLong" type="email" name="email">
					<p id="emailErr"></p>
				</div>
				<hr style="margin: 30px 0px">
				<div class="formRow" style="text-align: right">
					<input id="submitBtn" type="button" value="가입하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>