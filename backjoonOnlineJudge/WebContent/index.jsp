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
		cursor: pointer;
	}
	
	/* 	공통부분 끝 */
</style>
	
<script type="text/javascript">
	window.onload = function(){
		//초기값을 지정한 후 로그인페이지로 이동한다
		idCount = 3;
		idList = ['id', 'admin', 'test1', 'test2'];
		pwdList = ['pwd', 'admin123', 'test1123', 'test2123'];
		emailList = ['email', 'admin@naver.com', 'test1@naver.com', 'test2@naver.com'];
		
		idInfoData = new Array();
		
		idInfoData[0] = idList;
		idInfoData[1] = pwdList;
		idInfoData[2] = emailList;
		
		var dataStr = dataToString(idInfoData);
		
		var locStr = '';
		locStr += './login_1.jsp';
		locStr += dataStr;
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
<!-- 		<a href="./board_1.jsp"> -->
<!-- 			<input class="navBtn" type="button" value="게시판"> -->
<!-- 		</a> -->
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