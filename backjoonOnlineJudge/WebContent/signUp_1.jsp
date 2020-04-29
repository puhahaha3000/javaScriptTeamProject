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
		font-family: dotumche;
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
	
	#midTitleBar{
		height: 60px;
		border-style: solid none solid none;
		border-width: 1px;
		border-color: #CCCCCC;
		background-color: #EEEEEE;
	}

	.navBtn{
		width: 80px;
		height: 40px;
		background-color: #FFFFFF;
		border-style: none;
	}

/* 	공통부분 끝 */
	
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
		cursor: pointer;
	}
</style>
	
<script type="text/javascript">

	
	window.onload = function() {
		//주소창을 통해 값을 받아옴
		var data = stringToData(decodeURIComponent(location.href));
		
		idList = dataToArray(data, 'id');
		pwdList = dataToArray(data, 'pwd');
		emailList = dataToArray(data, 'email');
		idCount = idList.length;
		
		//각각의 태그를 변수로 지정하여 이벤트를 부여함
		idObj = document.getElementsByName('id')[0];
		messageObj = document.getElementsByName('message')[0];
		pwdObj = document.getElementsByName('pwd')[0];
		pwdRepeatObj = document.getElementsByName('pwdRepeat')[0];
		schoolOrOfficeObj = document.getElementsByName('schoolOrOffice')[0];
		emailObj = document.getElementsByName('email')[0];
		submitObj = document.getElementById('submitBtn');
		loginObj = document.getElementById('loginBtn'); 
		
		idObj.addEventListener('change', idChkFnc);
		messageObj.addEventListener('change', messageChkFnc);
		pwdObj.addEventListener('change', pwdChkFnc);
		pwdRepeatObj.addEventListener('change', pwdRepeatChkFnc);
		emailObj.addEventListener('change', emailChkFnc);
		submitObj.addEventListener('click', finalChkFnc);
		loginObj.addEventListener('click', loginLinkFnc);
	}

	//아이디 유효성 검사
	//이후의 유효성 검사의 형태는 동일하다
	function idChkFnc(){
		var idStr = idObj.value;
		var idChk = false;
		var resultStr = '';
		
		//조건문
		if (idStr.length == 0){
			resultStr = '아이디를 입력해 주세요';
		} else if(idStr.length < 3) {
			resultStr = '아이디는 3자 이상입니다';
		} else if(idUniqueChkFnc(idStr)){
			resultStr = '이미 등록되어 있는 아이디 입니다';
		} else{
			idChk = true;
		}
		
		//결과에 따라 에러를 나타낼 태그의 값을 수정하고 테두리 색을 바꾼다
		var errObj = document.getElementById('idErr');
		errObj.innerHTML = resultStr;
		errObj.style.color = 'red';
		borderColorFnc(idObj, idChk);
		
		//idChk값이 True일 경우 올바른 ID
		return idChk;
	}
	
	//아이디 중복을 체크하는 함수
	function idUniqueChkFnc(str){
		for (var i = 0; i < idCount; i++) {
			if(idList[i] == str){
				return true;
			}
		}
		return false;
	}
	
	//상태메시지 유효성 검사
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
	
	//비밀번호 유효성 검사
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

	//비밀번호 재입력 유효성 검사
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
	
	//이메일 유효성 검사
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
	
	//이메일 중복 검사
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
	
	//회원가입을 할때 최종적으로 실행되는 함수
	function finalChkFnc(){
		//모든 유효성검사를 한번씩 실시하여 리턴값을 저장한다
		var idChk = idChkFnc();
		var messageChk = messageChkFnc();
		var pwdChk = pwdChkFnc();
		var pwdRepeatChk = pwdRepeatChkFnc();
		var emailChk = emailChkFnc();
		var locStr = "";
		var data = new Array();
		
		//유효성 결과의 모든 값이 참일 경우 회원가입을 진행한다
		if(idChk && messageChk && pwdChk && pwdRepeatChk && emailChk){
			idList[idCount] = idObj.value;
			pwdList[idCount] = pwdObj.value;
			emailList[idCount++] = emailObj.value;

			alert('회원가입을 축하합니다');
			
			data[0] = ['id'].concat(idList);
			data[1] = ['pwd'].concat(pwdList);
			data[2] = ['email'].concat(emailList);
			
			locStr += './login_1.jsp';
			locStr += dataToString(data);
			location.href = locStr;
		}
	}
	
	//로그인 버튼을 누를경우 현재 있는 회원정보를 모두 지니고 로그인페이지로 이동한다
	function loginLinkFnc(){
		var data = new Array();
		var locStr = '';
		
		data[0] = ['id'].concat(idList);
		data[1] = ['pwd'].concat(pwdList);
		data[2] = ['email'].concat(emailList);
		
		locStr += './login_1.jsp';
		locStr += dataToString(data);
		location.href = locStr;
	}
	
	function dataToString(data){
		
		var str = '?';
		
		for (var i = 0; i < data.length; i++) {
			str += data[i][0] + '=';
			for (var j = 1; j < data[i].length; j++) {
				str += ((j == 1) ? '' : ',') + data[i][j];
			}
			str += '&';
		}
		
		str = str.substring(0, str.length - 1);
		return str;
	}
	
	function stringToData(str){
		str = decodeURIComponent(str);
		if(str.indexOf('?') == -1){
			
		}else{
			str = str.substring(str.indexOf('?') + 1);
		}
		
		var rawData = str.split('&');
		var data = new Array();
		
		for (var i = 0; i < rawData.length; i++) {
			var idx = rawData[i].indexOf('=');
			dataName = new Array();
			dataName[0] = rawData[i].substring(0, idx); 
			rawData[i] = rawData[i].substring(idx + 1);
			data[i] = dataName.concat(rawData[i].split(','));
		}
		
		return data;
	}
	
	function dataToArray(data, str){
		var result = new Array();
		for (var i = 0; i < data.length; i++) {
			if(str == data[i][0]){
				for (var j = 1; j < data[i].length; j++) {
					result[j - 1] = data[i][j];
				}
			}
		}
		return result;
	}
</script>

</head>

<body>

	<div id="topNavDiv">
<!-- 		원래크기 524*120 -->
		<a href="./index.jsp" style="text-decoration: none">
			<img id="navLogo" src="./image/logo.png" style="vertical-align: bottom;">
		</a>
<!-- 		<a href="./board_1.jsp" style="text-decoration: none"> -->
<!-- 			<input class="navBtn" type="button" value="게시판"> -->
<!-- 		</a> -->
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
					<p>계정이 이미 있는 경우에는 <input id="loginBtn" type="button" value="로그인" style="background-color: white; border-style: none; color: blue; cursor: pointer;">해주세요.</p>
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