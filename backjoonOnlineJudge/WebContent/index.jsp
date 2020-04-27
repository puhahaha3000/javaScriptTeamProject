<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BackJoon Online Judge</title>

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
</style>
	
<script type="text/javascript">
	window.onload = function(){
		
		idCount = 3;
		idList = ['admin', 'test1', 'test2'];
		pwdList = ['admin123', 'test1123', 'test2123'];
		emailList = ['admin@naver.com', 'test1@naver.com', 'test2@naver.com'];
		
		var dataStr = '';
		dataStr += dataToString(idList, 'id');
		dataStr += dataToString(pwdList, 'pwd');
		dataStr += dataToString(emailList, 'email');

		var locStr = '';
		locStr += './login_1.jsp?';
		locStr += dataStr;
		location.href = locStr;
	}
	
	function dataToString(data, dataName){
		var str = dataName + '=';
		for (var i = 0; i < data.length; i++) {
			str += ((i == 0) ? '' : ',') + data[i];
		}
		str += '&';
		return str;
	}
	
	function stringToData(str){
		str = str.substring(str.indexOf('?') + 1);
		var rawData = str.split('&');
		var data = new Array();
		
		for (var i = 0; i < rawData.length; i++) {
			rawData[i] = rawData[i].substring(rawData.indexOf('='));
			data[i] = rawData.split(',');
		}
		
		return data;
	}
</script>

</head>

<body>

	<div id="topNavDiv">
<!-- 		원래크기 524*120 -->
		<a href="./index.jsp" style="text-decoration: none">
			<img id="navLogo" src="./image/logo.png" style="vertical-align: bottom;">
		</a>
		<a href="./board_1.jsp">
			<input class="navBtn" type="button" value="게시판">
		</a>
	</div>
	
	<div id="midTitleBar">
		<div style="width: 1024px; margin: auto; font-size: 20px; line-height: 60px;">
			내용
		</div>
	</div>
	
	<div id="midDiv">
		
	</div>
</body>
</html>