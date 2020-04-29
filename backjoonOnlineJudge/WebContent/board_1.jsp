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
	
	hr {
		border: 1px solid #E6E6E6;
	}
	
	#headerDiv {
		font-weight: bold;
		font-size: 20px;
	}
	
	#firstLine {
		text-align: right;
		padding: 5px 0px 5px 0px;
	}
	
	#selectBtn {
		padding: 3px;
	}
	
	table {
		width: 1024px;
	}
	
	th {
		background: linear-gradient(to bottom, #EFFBF8, #CEE3F6);
		padding: 8px;
	}
	
	td {
		padding: 8px;
	}
	
	.tableText {
		text-align: center;
	}
	
	#numBtnDiv {
		text-align: center;
		padding: 8px 0px 8px 0px;
	}
	
	#numBtn {
		border: 0px;
		background-color: #FFFFFF;
	}
	
	.btnSet {
		background: linear-gradient(to bottom, #EFFBF8, #CEE3F6);
		border: 1px solid #E6E6E6;
		border-radius: 4px;
		padding: 3px;
		cursor: pointer;
	}
	
</style>
	
<script type="text/javascript">
	
	function notFnc() {
		mainDataFnc();
	}

	function findBtnFnc() {
// 		옵션 value
		var searchText = document.getElementById('selectBtn').value;
		
// 		검색란 value
		var textCheck = document.getElementById('searchText').value;
		
		searchEmail = dataToArray(dataList, 'tblEmail');
		searchSubject = dataToArray(dataList, 'tblSubject');
		searchContents = dataToArray(dataList, 'tblContents');
		searchWriter = dataToArray(dataList, 'tblWriter');
		var searchIdx = new Array();
		var searchCnt = 0;
		
// 		검색 옵션 id로 찾을 경우
		if (textCheck == '') {
			mainDataFnc();
		}

		if (searchText == 'id') {
			for (var i = 0; i < searchEmail.length; i++) {
				if (searchEmail[i].indexOf(textCheck) != -1) {
					searchIdx[searchCnt++] = i;
				} 
			}
		} else if (searchText == 'name') {
			for (var i = 0; i < searchSubject.length; i++) {
				if (searchSubject[i].indexOf(textCheck) != -1) {
					searchIdx[searchCnt++] = i;
				} 
			}
		} else if (searchText == 'description') {
			for (var i = 0; i < searchContents.length; i++) {
				if (searchContents[i].indexOf(textCheck) != -1) {
					searchIdx[searchCnt++] = i;
				} 
			}
		} else if (searchText == 'registrant') {
			for (var i = 0; i < searchWriter.length; i++) {
				if (searchWriter[i].indexOf(textCheck) != -1) {
					searchIdx[searchCnt++] = i;
				}
			}
		}
		
		var tblData = new Array();
		
		for (var i = 0; i < searchIdx.length; i++) {
			tblData[i] = [[tblCnt[searchIdx[i]]], [tblEmail[searchIdx[i]]],
						  [tblSubject[searchIdx[i]]], [tblYN[searchIdx[i]]],
						  [tblContents[searchIdx[i]]], [tblWriter[searchIdx[i]]]];
		}
		
		
		
		createTableFnc(tblData);
	}
	
	function createTableFnc(tblData) {
// 테이블 데이터 배열 생성
		tableTag = document.getElementsByTagName('table')[0];

		tbodyTag = tableTag.getElementsByTagName('tbody')[0];
		removeTrTag = tbodyTag.children;
		
		for (var i = removeTrTag.length - 1; i > 0; i--) {
			removeTrTag[i].remove();
		}
		
		tdList = new Array();
// 		<테이블 생성
		
		for (var i = 0; i < tblData.length; i++) {
			createTrTag = document.createElement('tr');
			for (var j = 0; j < tblData[i].length; j++) {
				createTdTag = document.createElement('td');
				if(j != 2){
					createTdTag.setAttribute('class', 'tableText');
				}			
				createTdTag.appendChild(document.createTextNode(tblData[i][j]));
				createTrTag.appendChild(createTdTag);
			}
			tableTag.getElementsByTagName('tbody')[0].appendChild(createTrTag);
		}
		
// 		테이블 생성 끝>
	}
	
	function sendInfoFnc() {
		
		var sendData = new Array();
		sendData[0] = ['id', id];
		sendData[1] = ['pwd', pwd];
		sendData[2] = ['email', email];
		
		sendData[3] = ['tblCnt'].concat(tblCnt);
		sendData[4] = ['tblEmail'].concat(tblEmail);
		sendData[5] = ['tblSubject'].concat(tblSubject);
		sendData[6] = ['tblYN'].concat(tblYN);
		sendData[7] = ['tblContents'].concat(tblContents);
		sendData[8] = ['tblWriter'].concat(tblWriter);
		
		
		var infoSend = './boardWrite_1.jsp';
		infoSend += dataToString(sendData);
		
		location.href = infoSend;
	}
	
// 	array를 url로
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
	
// 	url을 array로
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
	
	function mainDataFnc() {
		var tblData = new Array();
		
		for (var i = 0; i < tblCnt.length; i++) {
			tblData[i] = [tblCnt[i], tblEmail[i], tblSubject[i],
					   tblYN[i], tblContents[i].substring(0, 10), tblWriter[i]];
		}
		
		createTableFnc(tblData);
	}
	
	function logoutFnc(){
		var logOut = confirm('로그아웃 하시겠습니까?');
		
		if(logOut == true) {
			location.href = './index.jsp'; 
		}
	}
	
	window.onload = function() {
		
// 		<넘어온 값
// 		링크 값
		dataList = stringToData(location.href);
		
		id = dataToArray(dataList, 'id');
		pwd = dataToArray(dataList, 'pwd');
		email = dataToArray(dataList, 'email');
		
		tblCnt = new Array();
		tblEmail = new Array();
		tblSubject = new Array();
		tblYN = new Array();
		tblContents = new Array();
		tblWriter = new Array();
		
		if(dataList.length == 3){
			tblDefault = [['1', '2'],
				  ['test@test.com', 'test2@test.com'],
				  ['제목입니다', '두번째글'],
				  ['Y', 'Y'],
				  ['내용은10자까지만', '보여줍니다'],
				  ['작성자입니다', '두번째작성자']];
			tblCnt = tblDefault[0];
			tblEmail = tblDefault[1];
			tblSubject = tblDefault[2];
			tblYN = tblDefault[3];
			tblContents = tblDefault[4];
			tblWriter = tblDefault[5];
			
			dataList[3] = ['tblCnt'].concat(tblCnt);
			dataList[4] = ['tblEmail'].concat(tblEmail);
			dataList[5] = ['tblSubject'].concat(tblSubject);
			dataList[6] = ['tblYN'].concat(tblYN);
			dataList[7] = ['tblContents'].concat(tblContents);
			dataList[8] = ['tblWriter'].concat(tblWriter);
			
		} else{
			tblCnt = tblCnt.concat(dataToArray(dataList, 'tblCnt'));
			tblEmail = tblEmail.concat(dataToArray(dataList, 'tblEmail'));
			tblSubject = tblSubject.concat(dataToArray(dataList, 'tblSubject'));
			tblYN = tblYN.concat(dataToArray(dataList, 'tblYN'));
			tblContents = tblContents.concat(dataToArray(dataList, 'tblContents'));
			tblWriter = tblWriter.concat(dataToArray(dataList, 'tblWriter'));
		}
		
		
// 		검색 버튼
		var searchBtn = document.getElementById('findBtn');
		cnt = 1;
		
		var wirtBtn = document.getElementById('testBtn');
		wirtBtn.addEventListener('click', sendInfoFnc);
		
		mainDataFnc();
		
// 		검색 버튼 클릭시 이벤트 발생
		searchBtn.addEventListener('click', findBtnFnc);
	}

</script>

</head>

<body>

	<div id="topNavDiv">
<!-- 		원래크기 524*120 -->
		<a href="./index.jsp" style="text-decoration: none">
			<img id="navLogo" src="./image/logo.png" style="vertical-align: bottom;">
		</a>
		<input onclick='notFnc();' class="navBtn" type="button" value="게시판">
	</div>
	
	<div id="midDiv">
		<div id='headerDiv'>
			List Sample
			<input onclick='logoutFnc();' class='btnSet'
				style='float: right;' type='button' value='로그아웃'>
		</div>
		<hr>
		<div id='firstLine'>
			<select id='selectBtn' name='findValue'>
				<option value='id'>ID</option>
				<option value='name'>Name</option>
				<option value='description'>Description</option>
				<option value='registrant'>등록자</option>
			</select>
			<input id='searchText' type='text' value=''>
			<input id='findBtn' class='btnSet' type='button' value='검색'>
		</div>
		<div>
			<table>
				<tr>
					<th>
						No
					</th>
					<th>
						카테고리ID
					</th>
					<th>
						카테고리명
					</th>
					<th>
						사용여부
					</th>
					<th>
						Description
					</th>
					<th>
						등록자
					</th>
				</tr>
			</table>
		</div>
		<div id='numBtnDiv'>
			<input id='numBtn' type='button' value='1'>
		</div>
		<div>
			<input id='testBtn' class='btnSet' type='button' value='등록'>
		</div>
	</div>
</body>
</html>