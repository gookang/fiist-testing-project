<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rss = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	out.println("Driver search success!!");

	con = DriverManager.getConnection(
	"jdbc:mysql://localhost/member2?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "123456");
	out.println("connection success!!!");

	pstmt = con.prepareStatement("select * from mdata");
	rss = pstmt.executeQuery();
	
	String name = "",
			sex = "",
			pnumber = "",
			address = "",
			id2 = "",
			pw2 = "";
	int result = 0;
	while (rss.next()) {
		
		id2 = rss.getString(1);
		pw2 = rss.getString(2);
		name = rss.getString(3);
		sex = rss.getString(4);
		pnumber = rss.getString(5);
		address = rss.getString(6);
		
		if (id.equals(id2)) {
			if (pw.equals(pw2)) {
				result = 1;
				break;
			} // end of if pw
			else{
				result = -2;
			} // end of else
		} // end of if id
		else{
			result = -1;
		}// end of else
	} // end of while
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인중....</title>
<link rel="stylesheet" href="../jsp/csstest.css">
</head>
<body>
<%
	if(result==1){
		session.setAttribute("sName", name);
%>
	<div class="frame">
		<div class="header">
			<h2>로그인 성공!!</h2>
			<div class="logo">
				<%= name %>
				님 환영합니다~!
			</div>
		</div>
		<div class="container">
			<div class="content" style="bolder: 4px solid #aaa">
				<input type="button" value="홈페이지로 이동"
					onclick="location='../../index.jsp'" />
			</div>
		</div>
	</div>
<%
	}else{
%>

	<div class="frame">
		<div class="header">
			<h2>로그인 실패!!</h2>
			<div class="logo">아이디 또는 비밀번호가 다릅니다.</div>
		</div>
		<div class="container">
			<div class="content" style="bolder: 4px solid #aaa">로그인을 다시
				시도해주세요.</div>
		</div>
	</div>

	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>