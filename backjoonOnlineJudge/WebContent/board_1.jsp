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
// 		var searchText = document.getElementById('selectBtn').children.value;
		
// // 		검색란 value
// 		var textCheck = document.getElementById('searchText').value;
		
// // 		검색 옵션 id로 찾을 경우
// 		if (searchText == 'id') {
// 			if(.indexOf(textCheck) !=-1) {
				
// 			}
// //	 	검색 옵션 name로 찾을 경우
// 		} else if (searchText == 'name') {
		
// //	 	검색 옵션 description로 찾을 경우
// 		} else if (searchText == 'description') {
		
// //	 	검색 옵션 registrant로 찾을 경우
// 		} else if (searchText == 'registrant') {
			
// 		}
	}
	
	window.onload = function() {
		
// 		넘어온 값
		
// 		검색 버튼
		var searchBtn = document.getElementById('findBtn');
		var cnt = 1;
		
// 		<테이블 생성
		var tableTag = document.getElementsByTagName('table')[0];
		
		var textNod = document.createTextNode(cnt);
		
		var createTrTag = document.createElement('tr');
		
		var tdList = new Array();
		
		for (var i = 0; i < 6; i++) {
				tdList[i] = document.createElement('td');
				createTrTag.appendChild(tdList[i]);
			if(i != 2) {
				tdList[i].setAttribute('class', 'tableText')
			}
			switch (i) {
				case 0:
					tdList[i].appendChild(textNod);
				case 1:
					
				case 2:
				
				case 3:
				
				case 4:
				
				case 5:
				
			}			
		}
		
		tableTag.getElementsByTagName('tbody')[0].appendChild(createTrTag);
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
			<a href="./login_1.jsp">
				<input style="float: right" type="button" value="로그아웃">
			</a>
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
			<input class='btnSet' type='button' value='등록'>
		</div>
	</div>
</body>
</html>