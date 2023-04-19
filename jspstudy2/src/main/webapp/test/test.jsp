<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 이름 : ${param.name}<br>
 나이 : ${param.age}<br>
 성별 : ${param.gender == 1 ? "남":"여"}<br>
 출생년도 : ${param.year}<br>
 나이(2023년 기준) : 만${2023-param.year}<br>
</body>
</html>