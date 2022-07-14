<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String Pnumber = request.getParameter("pNumber");
String address = request.getParameter("Address");

response.setCharacterEncoding("UTF-8");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rss = null;

int counter = 0;
try {
	
	con = DriverManager.getConnection(
	"jdbc:mysql://localhost/member2?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "root", "123456");
	// connection 생성
	pstmt = con.prepareStatement(
	"insert into mdata (m_id, m_pw, m_name, m_sex, m_pnumber, m_address) values (?, ?, ?, ?, ?, ?)");
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setString(4, sex);
	pstmt.setString(5, Pnumber);
	pstmt.setString(6, address);
	int r = pstmt.executeUpdate();
	if (r <= 0)
		out.println("data insert fail....");
	else
		out.println("data insert sucess!!");

	String id2 = "";
	String pw2 = "";
	String name2 = "";
	String sex2 = "";
	String Pnumber2 = "";
	String address2 = "";	
	
	pstmt = con.prepareStatement("select * from mdata where m_id = ?");
	pstmt.setString(1, id);
	rss = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 진행중</title>
</head>
<body bgcolor="#FFFFCC">

	<h2>회원가입 진행중...</h2>
	<br />
	<h3>회원정보</h3>

	<table border="1">
		<tr>
			<td><strong>ID</strong></td>
			<td><strong>PW</strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>SEX</strong></td>
			<td><strong>PNUMBER</strong></td>
			<td><strong>ADDRESS</strong></td>
		</tr>

		<%
		if (rss != null) {
			while (rss.next()) {
				id2 = rss.getString("m_id");
				pw2 = rss.getString("m_pw");
				name2 = rss.getString("m_name");
				sex2 = rss.getString("m_sex");
				Pnumber2 = rss.getString("m_pnumber");
				address2 = rss.getString("m_address");
		%>

		<tr>
			<td><%=id2%></td>
			<td><%=pw2%></td>
			<td><%=name2%></td>
			<td><%=sex2%></td>
			<td><%=Pnumber2%></td>
			<td><%=address2%></td>
			<%
			counter++;
			} // end of while
			} //end of if
			%>
		</tr>

	</table>
	<br /> total records :
	<%=counter%>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	if (rss != null)
		try {
			rss.close();
		} catch (SQLException e) {
		}
	if (pstmt != null)
		try {
			pstmt.close();
		} catch (SQLException e) {
		}
	if (con != null)
		try {
			con.close();
		} catch (SQLException e) {
		}
	}
	%>
	
	<button onclick="location='../index.jsp'">let's go for login!!</button>
</body>
</html>