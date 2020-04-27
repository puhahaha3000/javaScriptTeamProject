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
	}
	
</style>
	
<script type="text/javascript">

	function findBtnFnc() {
// // 		옵션 value
// 		var searchText = document.getElementById('selectBtn').value;
		
// // 		검색란 value
// 		var textCheck = document.getElementById('searchText').value;
		
// // 		검색 옵션 id로 찾을 경우
// 		if (searchText == 'id') {
// 			if(.indexOf(textCheck) != -1) {
				
// 			}
			
// //	 	검색 옵션 name로 찾을 경우
// 		} else if (searchText == 'name') {
// 			if(.indexOf(textCheck) != -1) {
				
// 			}
			
// //	 	검색 옵션 description로 찾을 경우
// 		} else if (searchText == 'description') {
// 			if(.indexOf(textCheck) != -1) {
				
// 			}
			
// //	 	검색 옵션 registrant로 찾을 경우
// 		} else if (searchText == 'registrant') {
// 			if(.indexOf(textCheck) != -1) {
				
// 			}
			
// 		}
	}
	
	window.onload = function() {
		
// 		<넘어온 값
// 		링크 값
		var link = decodeURIComponent(location.href).split("?");
		var infoText = link[1].split("&");
		var idx = 0;
		inputData = new Array(); 
		
		for (var i = 0; i < infoText.length; i++) {
			idx = infoText[i].indexOf('=');
			inputData[i] = infoText[i].substring(idx + 1);
		}
// 		넘어온 값>
		
// 		for (var i = 0; i < inputData.length; i++) {
// 			alert(inputData[i]);
// 		}
		
// 		검색 버튼
		var searchBtn = document.getElementById('findBtn');
		var cnt = 1;
		
// 		<테이블 생성
		var tableTag = document.getElementsByTagName('table')[0];
		
// 		td에 text 넣음
		var cntTextNode = document.createTextNode(cnt);
		var idTextNod = document.createTextNode(inputData[2]);
		var nameTextNod = document.createTextNode(inputData[1]);
		var yTextNode = document.createTextNode('Y');
		var desTextNode = document.createTextNode(inputData[3]);
		var writerTextNode = document.createTextNode(inputData[0]);
		
		createTrTag = document.createElement('tr');
		
// 		td 태그 배열 생성
		var tdList = new Array();
		
		for (var i = 0; i < 6; i++) {
				tdList[i] = document.createElement('td');
				createTrTag.appendChild(tdList[i]);
			if(i != 2) {
				tdList[i].setAttribute('class', 'tableText')
			}
// 			각 값을 넣음
			switch (i) {
				case 0:
					tdList[i].appendChild(cntTextNode);
					cnt++;
				case 1:
					tdList[i].appendChild(idTextNod);
				case 2:
					tdList[i].appendChild(nameTextNod);
				case 3:
					tdList[i].appendChild(yTextNode);
				case 4:
					tdList[i].appendChild(desTextNode);
				case 5:
					tdList[i].appendChild(writerTextNode);
			}	
		}
		
// 		테스트 start
		var createTrTag2 = document.createElement('tr');
		
		var cntTextNode2 = document.createTextNode(cnt);
		var idTextNod2 = document.createTextNode('ddd@ddd');
		var nameTextNod2 = document.createTextNode('abcabc');
		var yTextNode2 = document.createTextNode('Y');
		var desTextNode2 = document.createTextNode('글을 쓰는 곳입니다');
		var writerTextNode2 = document.createTextNode('글쓴이');
		
		var createTrTag2 = document.createElement('tr');
		
// 		td 태그 배열 생성
		tdList2 = new Array();
		
		for (var i = 0; i < 6; i++) {
				tdList2[i] = document.createElement('td');
				createTrTag2.appendChild(tdList2[i]);
			if(i != 2) {
				tdList2[i].setAttribute('class', 'tableText')
			}
// 			각 값을 넣음
			switch (i) {
				case 0:
					tdList2[i].appendChild(cntTextNode2);
					cnt++;
				case 1:
					tdList2[i].appendChild(idTextNod2);
				case 2:
					tdList2[i].appendChild(nameTextNod2);
				case 3:
					tdList2[i].appendChild(yTextNode2);
				case 4:
					tdList2[i].appendChild(desTextNode2);
				case 5:
					tdList2[i].appendChild(writerTextNode2);
			}	
		}
// 		테스트 end
		
		tableTag.getElementsByTagName('tbody')[0].appendChild(createTrTag);
		tableTag.getElementsByTagName('tbody')[0].appendChild(createTrTag2);
// 		테이블 생성 끝>
		
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
		<input class="navBtn" type="button" value="게시판">
	</div>
	
	<div id="midDiv">
		<div id='headerDiv'>
			List Sample
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
			<a href='./boardWrite_1.jsp'>
				<input class='btnSet' type='button' value='등록'>	</a>
		</div>
	</div>
</body>
</html>