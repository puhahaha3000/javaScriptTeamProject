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
							<input type='text' value='' name="writer">
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Subject
						</td>
						<td>
							<input type='text' size='53' value='' name="subject">
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Email
						</td>
						<td>
							<input type="email" size='53' name='email'>
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Content
						</td>
						<td>
							<textarea rows="20" cols="45" name='content'></textarea>
						</td>
					</tr>
					<tr>
						<td class='textCenter'>
							Password
						</td>
						<td>
							<input type='password' value=''>
						</td>
					</tr>
					<tr>
						<td colspan="2" class='textCenter'>
							<input id='saveBtn' type='submit' value='Save'>
							<input type='reset' value='Reset'>
							<a href='' class='aTagBtn'>
								<input type='button' value='Go to Main'></a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>