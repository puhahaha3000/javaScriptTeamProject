<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>

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
	
	.navBtn{
		width: 80px;
		height: 40px;
		background-color: #FFFFFF;
		border-style: none;
		cursor: pointer;
	}
	#midTitleBar{
		height: 60px;
		border-style: solid none solid none;
		border-width: 1px;
		border-color: #CCCCCC;
		background-color: #EEEEEE;
	}
	
/* 	공통부분 끝 */
	
	
	#formHeader{
		text-align: center;
	}
	
	#loginStartDiv{
		width: 400px;
		height: 460px;
		margin: auto;
		border: 1px solid black;
	}
	
	#secondDiv{
		width: 360px;
		height: 340px;
		margin: 0 auto;
		margin-top: 18px;
	}
	
	#lineDiv{
		width: 360px;
		height: 50px;
		margin: auto;
		border-bottom: 1px solid gray;
	}
	
	#lineSecondDiv{
		width: 360px;
		height: 50px;
		margin: auto;
		margin-top : 60px;
		border-bottom: 1px solid gray;
	}
	
	#idEmailDiv{
		height: 30px;
		margin-top: 30px;
	}
	
	#idEmailSecondDiv{
		height: 30px;
		margin-top: 20px;
	}

	.image{
		width: 30px;
		height: 30px;
		border: 1px solid #BDBDBD;
		float: left;
	}
	
	.textInput{
		width: 324px;
		height: 26px;
		float: left;
	}
	
	#loginBtn{
		width: 70px;
		height: 30px;
		margin-top: 3px;
		background-color: #6799FF;
		color : white;
		text-align: center;
		float: right;
	}
	
	#lastDiv{
		margin-top: 50px;
		text-align: left;
	}
	
	#signUpBtn{
		background-color: white;
		border-style: none;
		color: #428BCA;
	}
	
</style>
	
<script type="text/javascript">
	
	window.onload = function() {
		
		var tag = document.getElementById('loginBtn');
		
		tag.addEventListener('click', checkFnc, false);
		
		var signUpBtnObj = document.getElementById('signUpBtn');
		
		signUpBtnObj.addEventListener('click', signUpFnc, false);
	}
	
	function signUpFnc() {
		var str = decodeURIComponent(location.href);
		location.href = './signUp_1.jsp?' + str.substring(str.indexOf('?') + 1);
	}
	
	function checkFnc() {
		
		var inputTag = document.getElementsByTagName('input');
		
		var idValue = inputTag[0].value;
		
		var pwdValue = inputTag[1].value;
		
		//0 : ID, 1 : pwd, 2 : email
		var data = stringToData(decodeURIComponent(location.href));
		var idList = dataToArray(data, 'id');
		var pwdList = dataToArray(data, 'pwd');
		var emailList = dataToArray(data, 'email');
		
		if(idValue.indexOf('@') == -1){
			//이메일이 아닌경우
			for (var i = 0; i < idList.length; i++) {
				if(idList[i] == idValue){
					if(pwdList[i] == pwdValue){
						//로그인성공
						var infoSend = '';
						infoSend += './board_1.jsp?';
						infoSend += 'id=' + idList[i] + '&';
						infoSend += 'pwd=' + pwdList[i] + '&';
						infoSend += 'email=' + emailList[i];
	
						location.href = infoSend; 
					} else{
						//비밀번호 틀림
						var pTag = document.getElementById('mistake');
						pTag.innerHTML = '아이디 / 이메일 또는 비밀번호가 잘못되었습니다.';
						pTag.setAttribute('style', 'color : red');
						
						inputTag[1].value = '';
					}
				}
			}
		} else{
			//이메일인 경우
			for (var i = 0; i < emailList.length; i++) {
				if (emailList[i] == idValue ) {
					if (pwdList[i] == pwdValue) {
						//로그인 성공
						var infoSend = '';
						infoSend += './board_1.jsp?';
						infoSend += 'id=' + idList[i] + '&';
						infoSend += 'pwd=' + pwdList[i] + '&';
						infoSend += 'email=' + emailList[i];
	
						location.href = infoSend;
					}else{
						//비밀번호 틀림
						var pTag = document.getElementById('mistake');
						pTag.innerHTML = '아이디 / 이메일 또는 비밀번호가 잘못되었습니다.';
						pTag.setAttribute('style', 'color : red');
						
						inputTag[1].value = '';
					}
				}				
			}
		
		}
		
		// 아이디가 없는 경우
		for (var i = 0; i < idList.length; i++) {
			
			if (idList[i] != idValue || emailList[i] != idValue) {
				
				for (var i = 0; i < idList.length; i++) {
					if(idList[i] == idValue  || emailList[i] == idValue){
						return true;
					}
				}
				
				var pTag = document.getElementById('mistake');
				pTag.innerHTML = '아이디 / 이메일 또는 비밀번호가 잘못되었습니다.';
				pTag.setAttribute('style', 'color : red');
				
				inputTag[0].value = '';
				inputTag[1].value = '';
			}
		}
			
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
	
	
// 	function dataToString(data, dataName){
// 		var str = dataName + '=';
// 		for (var i = 0; i < data.length; i++) {
// 			str += ((i == 0) ? '' : ',') + data[i];
// 		}
// 		str += '&';
// 		return str;
// 	}
	
// 	function stringToData(str){
// 		str = str.substring(str.indexOf('?') + 1);
// 		var rawData = str.split('&');
// 		var data = new Array();
		
// 		for (var i = 0; i < rawData.length; i++) {
// 			rawData[i] = rawData[i].substring(rawData[i].indexOf('=') +1);
// 			data[i] = rawData[i].split(',');
// 		}
		
// 		return data;
// 	}
	
	
	
</script>

</head>

<body>

	<div id="topNavDiv">
		<a href="./index.jsp" style="text-decoration: none">
			<img id="navLogo" src="./image/logo.png" style="vertical-align: bottom;">
		</a>
	</div>
	
	<div id="midTitleBar">
		<div style="width: 1024px; margin: auto; font-size: 20px; line-height: 60px;">
			로그인
		</div>
	</div>
	
	<div id="midDiv">
		
		<div id="formHeader">
		
			<div id="loginStartDiv">
	
				<div id="secondDiv">
					<div id="lineDiv" >
						<div style="font-size: 24px;">
							로그인
						</div>
					</div>
					
					<div id="idEmailDiv">
						<div>
							<img class="image" alt="" src="./image/login_1이미지.JPG">
						</div>
						
						<input class="textInput" type="text" 
							placeholder="아이디 / 이메일">
					</div>
					
					<div id="idEmailSecondDiv">
						<div>
							<img class="image" alt="" src="./image/login_1이미지2.JPG">
						</div>
						
						<input class="textInput" type="password" 
							placeholder="비밀번호">
					</div>
					
					<div style="margin-top: 30px;">
						
							<input id="loginBtn" type="submit" value="로그인" style="cursor: pointer;">
					</div>
					
					<div id="lineSecondDiv">
					</div>
					
					<div id="lastDiv">
						<div>
							<p id="mistake"></p>
							<p>회원 가입은, <input id="signUpBtn" type="button" value="여기" style="cursor: pointer">에서 할 수 있습니다.</p> 
						</div>
					</div>
				</div>
		
			</div>

		</div>
				
	</div>
	
	
</body>
</html>