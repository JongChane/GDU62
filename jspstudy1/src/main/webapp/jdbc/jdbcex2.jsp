<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy1/src/main/webapp/jdbc/jdbcex2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 테이블 읽어 화면에 출력하기</title>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
<%
	//Driver 선택
	Class.forName("org.mariadb.jdbc.Driver");
	//Connection 객체 생성 : db와 연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/gdudb","gdu","1234");
	//SQL 명령어 전달 객체.
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from student");
	ResultSetMetaData rsmt = rs.getMetaData();
%>
<table><tr>
<%
	for(int i =1; i<=rsmt.getColumnCount();i++){ %>
	<th><%=rsmt.getColumnName(i) %></th>
	<%} %></tr>
	<% while(rs.next()) { %>
	<tr>
		<%
		for(int i =1; i<=rsmt.getColumnCount();i++){ %>
		<th><%=rs.getString(i) %></th>
			<%} %>
			</tr>
	<%} %>

</table>

</body>
</html>