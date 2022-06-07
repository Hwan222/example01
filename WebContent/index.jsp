<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<div>
<div>
<h1>메모장</h1>
</div>
<form action="add.jsp" method="post">
<div >
<table border="1">
<tr>
<td>이름</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>메모</td>
<td><input type="text" name="memo"><input type="submit" value="확인"></td>
</tr>
</table>
</div>
</form>
<div >
<br>
<br>
<br>
<%
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "example01";
	String pass = "1234";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(url, uid, pass);
	String sql = "select * from memo";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(sql);
	int id = 0;
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>메모</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<form action="delete.jsp" method="post">
			<td><%=rs.getInt("id")%></td>
			<%=id = rs.getInt("id")%>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("memo")%></td>
			<td><%=rs.getDate("day")%></td>
			<td><input type="submit" value="삭제"></td>
			</form>
		</tr>
		<%
		}
		con.close();
		rs.close();
		pstmt.close();
		%>
	</table>
</div>
</div>
</center>
</body>
</html>