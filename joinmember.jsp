<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#td1 {
	width: 100;
	margin: 0;
	align-content: center;
}

#td2 {
	width: 200;
	margin: 0;
	align-content: center;
}
</style>
</head>
<body>
	<table width="40%" align="center" border="0">
		<tr>
			<td align="center" valign="middle">
				<table width="90%" border="1" align="center">
					<form action="usingJDBC.jsp" method="post">

						<tr align="center">
							<td colspan="2"><font color="#000000"><b>회원가입</b></font></td>
						</tr>
						<tr>
							<td id="td1">ID</td>
							<td id="td2"><input name="id" type="text" size="15"></td>
						</tr>
						<tr>
							<td id="td1">PW</td>
							<td id="td2"><input name="pw" type="text" size="20"></td>
						</tr>
						<tr>
							<td id="td1">이름</td>
							<td id="td2"><input name="name" type="text" size="15"></td>
						</tr>

						<tr>
							<td id="td1">성별</td>
							<td id="td2"><input name="sex" type="radio" value="man"/>남자 
							<input name="sex" type="radio" value="gril" />여자</td>
						</tr>

						<tr>
							<td id="td1">핸드폰 번호</td>
							<td id="td2"><input name="Pnumber" size="20" /></td>
						</tr>

						<tr>
							<td id="td1">주소(시, 구 까지만 간단히)</td>
							<td id="td2"><input name="Address" size="20" /></td>
						</tr>

						<tr align="center">
							<td colspan="2"><input type="submit" value="회원가입"/>&nbsp; 
								<input type="reset" value="전체다시작성" /></td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>