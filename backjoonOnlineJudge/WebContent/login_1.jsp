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
	
	#formRow{
		padding: 0px 15px;
	}
	
	#formRow p{
		font-weight: bold;
	}
	
	#inputLong{
		width: 436px;
		height: 20px;
		padding: 6px 12px;
		border: 1px solid #DDDDDD;
	}
	
	#inputShort{
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
		border-color: #357EBD;
	}
</style>
	
<script type="text/javascript">
	
	window.onload = function() {
		
		var tag = document.getElementsByTagName('input')[3];
		
		tag.addEventListener('click', checkFnc, false);
	}
	
	function checkFnc() {
		
		var inputTag = document.getElementsByTagName('input');
		
		var idValue = inputTag[0].value;
		
		var pwdValue = inputTag[1].value;
		
		if (idValue.length >= 3 && pwdValue.length >= 6) {
			location = "./index.jsp";
		}else{
			var pTag = document.getElementById('mistake');
			pTag.innerHTML = '아이디 / 이메일 또는 비밀번호가 잘못되었습니다.';
			pTag.setAttribute('style', 'color : red');
		}
		
		
		
		
	}
	
</script>

</head>

<body>

	<div id="topNavDiv">
		<a href="./index.jsp" style="text-decoration: none">
			<img id="navLogo" src="./image/logo.png" style="vertical-align: bottom;">
		</a>
		<a href="./board_1.jsp" style="text-decoration: none">
			<input class="navBtn" type="button" value="게시판">
		</a>
	</div>
	
	<div id="midTitleBar">
		<div style="width: 1024px; margin: auto; font-size: 20px; line-height: 60px;">
			로그인
		</div>
	</div>
	
	<div id="midDiv">
		
		<div id="formHeader">
		
			<div style="border: 1px solid black; width: 400px; height: 460px; margin: auto;">
	
				<div style="border: 1px solid white; width: 360px; height: 340px;
					margin: 0 auto; margin-top: 18px;" >
					<div style="width: 360px; height: 50px; border-bottom : 1px solid gray;
						margin: auto;" >
						<div style="font-size: 24px;">
							로그인
						</div>
					</div>
					
					<div style="margin-top: 30px; height: 30px;">
						<div>
							<img style="width: 30px; height: 30px; border: 1px solid #BDBDBD;
							float: left;" alt="" src="./image/login_1이미지.JPG">
						</div>
						
						<input style="width: 324px; height: 26px; float: left;" type="text" 
							placeholder="아이디 / 이메일">
					</div>
					
					<div style="margin-top: 20px; height: 30px;">
						<div>
							<img style="width: 30px; height: 30px; border: 1px solid #BDBDBD;
							 float: left;" alt="" src="./image/login_1이미지2.JPG">
						</div>
						
						<input style="width: 324px; height: 26px; float: left;" type="password" 
							placeholder="비밀번호">
					</div>
					
					<div style="margin-top: 30px;">
						
							<input style="margin-top: 3px; float: right; background-color: #6799FF;
								color: white; width: 70px; height: 30px; text-align: center;" type="text" value="로그인">
					</div>
					
					<div style="width: 360px; height: 50px; border-bottom : 1px solid gray;
						margin: auto; margin-top: 60px;">
					</div>
					
					<div style="font-size: 12px; margin-top: 50px; text-align: left;">
						<div>
							<p id="mistake"></p>
							<p>회원 가입은, <a href="./signUp_1.jsp">여기</a>에서 할 수 있습니다.</p> 
						</div>
					</div>
				</div>
		
			</div>

		</div>
				
	</div>
	
	
</body>
</html>