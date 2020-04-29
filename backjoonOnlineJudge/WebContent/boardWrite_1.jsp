<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BackJoon Online Judge</title>

<style type="text/css">
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
	}
	
	.navBtn{
		width: 80px;
		height: 40px;
		background-color: #FFFFFF;
		border-style: none;
		cursor: pointer;
	}
	
	#headerDiv {
		text-align: center;
		font-size: 30px;
		font-weight: bold;
	}
	
	table{
		margin: 0px auto;
		border: 3px solid #BDBDBD;
		padding: 3px;
	}
	
	td {
		border: 1px solid #D8D8D8;
		padding: 3px;
	}
	
	.textCenter {
		text-align: center;
	}
	
	.aTagBtn {
		text-decoration: none;
		margin-right: 5px;
	}
	
</style>
	
<script type="text/javascript">

	
	//	array를 url로
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
	
	//	url을 array로
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
	
	function gogoFnc() {
		goBoard = decodeURIComponent(location.href).replace('boardWrite_1.jsp','board_1.jsp');
		
		location.href = goBoard;
	}
	
	function sendInfo() {
		
		email = document.getElementById('emailV').value;
		subject = document.getElementById('subjectV').value;
		contents = document.getElementById('contentsV').value;
		writer = document.getElementById('idV').value;
		pwdValue = document.getElementById('pwdV').value;

		if(checkFnc()){
			cnt = parseInt(dataList[3][dataList[3].length - 1]) + 1;
	
			dataList[3] = dataList[3].concat([cnt]);
			dataList[4] = dataList[4].concat([email]);
			dataList[5] = dataList[5].concat([subject]);
			dataList[6] = dataList[6].concat(['Y']);
			dataList[7] = dataList[7].concat([contents]);
			dataList[8] = dataList[8].concat([writer]);
			
			var infoSend = './board_1.jsp';
			infoSend += dataToString(dataList);
			
			location.href = infoSend;
		}
		
		
	}
	
	function checkFnc() {
		
		if (emailValue.value == email && pwdValue == pwd) {

			return true;
		}else {
			alert('이메일, 비밀번호가 다릅니다.');
			return false;
		}
	}
	
	window.onload = function() {
		dataList = stringToData(location.href);
		
		id = dataToArray(dataList, 'id');
		pwd = dataToArray(dataList, 'pwd');
		email = dataToArray(dataList, 'email');
		
		idValue = document.getElementById('idV');
		emailValue = document.getElementById('emailV');
		
		idValue.value = id;
		emailValue.value = email;
	}

</script>

</head>

<body>

	<div id="topNavDiv">
<!-- 		원래크기 524*120 -->
		<a href="./index.jsp" style="text-decoration: none">
			<img id="navLogo" src="./image/logo.png" style="vertical-align: bottom;">
		</a>
		<input onclick='gogoFnc();' class="navBtn" type="button" value="게시판">
	</div>
	
	<div id="midDiv">
		<div id='headerDiv'>
			Write
		</div>
		<div>
			<form action="./board_1.jsp" class='btnCenter'>
				<table>
					<tr>
						<td class='textCenter'>
							Writer
						</td>
						<td>
							<input id='idV' type='text' value='' name="writer">
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Subject
						</td>
						<td>
							<input id='subjectV' type='text' size='53' value='' name="subject">
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Email
						</td>
						<td>
							<input id='emailV' type="email" value="" size='53' name='email'>
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Content
						</td>
						<td>
							<textarea id='contentsV' rows="20" cols="45" name='content'></textarea>
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Password
						</td>
						<td>
							<input id='pwdV' type='password' value=''>
						</td>
					</tr>
					<tr>
						<td colspan="2" class='textCenter'>
							<input id='saveBtn' type='button' value='Save' onclick='sendInfo();'>
							<input type='reset' value='Reset'>
							<a class='aTagBtn'>
								<input onclick='gogoFnc();' type='button' value='Go to Main'></a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>