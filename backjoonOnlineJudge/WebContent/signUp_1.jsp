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
		<form action="">
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
				<div id="formRow">
					<p>아이디</p>
					<input id="inputLong" type="text">
				</div>
				<div id="formRow">
					<p>상태메시지(다른 사람에게 보이고 싶은 한마디)</p>
					<input id="inputLong" type="text">
				</div>
				<div id="formRow">
					<div style="float: left;">
						<p>비밀번호</p>
						<input id="inputShort" type="text">
					</div>
					<div style="float: left; margin-left: 20px;">
						<p>비밀번호(확인)</p>
						<input id="inputShort" type="text">
					</div>
					<div style="clear: left;"></div>
				</div>
				<div id="formRow">
					<p>학교/회사 또는 소속</p>
					<input id="inputLong" type="text">
				</div>
				<div id="formRow">
					<p>이메일 주소</p>
					<input id="inputLong" type="email">
				</div>
				<hr style="margin: 30px 0px">
				<div id="formRow" style="text-align: right">
					<input id="submitBtn" type="submit" value="가입하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>