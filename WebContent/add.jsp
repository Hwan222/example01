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
<%request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
String name = request.getParameter("name");
String memo = request.getParameter("memo");

String url = "jdbc:oracle:thin:@localhost:1521:XE";
String uid = "example01";
String pass = "1234";

String sql = "insert into memo values(no_id.nextval, ?, ?,sysdate)";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, uid, pass);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, memo);	
	pstmt.executeUpdate();
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(pstmt != null){pstmt.close();}
		if(conn != null){conn.close();}
	}catch(Exception e){
		e.printStackTrace();
	}
}

%>
<script>
	alert("등록완료");
	location.href="index.jsp";
</script>
</body>
</html>