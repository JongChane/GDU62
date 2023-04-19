<%@page import="model.Book"%>
<%@page import="model.BookDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jspstudy2/src/main/webapp/view/book/testlist.jsp : 방명록 목록 조회하기
   1. db에서 방명록 목록 조회하기
   2. 조회된 내용 화면에 출력하기
   3. 다른 템플릿을 이용하여 layout 추가하기
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록</title>
</head>
<body>
<table class="w3-table w3-bordered w3-hoverable"><caption>회원목록</caption>
<tr><th>방문자</th><th>제목</th><th>내용</th><tr>
<c:forEach var="book" items="${list}">
  <tr>
    <td>${book.getWriter()}</td>
    <td>${book.getTitle()}</td>
    <td>${book.getContent()}</td>
  </tr>
</c:forEach>
</tr>
<tr><td colspan="3" align="center">
<a href = "testForm" style="text-decoration : none"><button class="w3-button w3-block" type="submit" class="w3-input">글쓰기</button></a>
</td></tr></table></body></html>