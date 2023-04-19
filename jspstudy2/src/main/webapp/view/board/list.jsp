<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- /jspstudy2/src/main/webapp/view/board/list.jsp
	1.한 페이지 당 10건의 게시물을 출력하기.
	2.최근 등록된 게시물이 가장 위에 배치됨.
	3.db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력.
			게시물을 출력하는 부분.
			페이지 구분 출력 부분
	4.페이지별 게시물번호 출력하기(boardnum)
	5.첨부파일이 있는 경우 @ 표시하기
--%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>게시물 목록 보기</title>
</head><body>
<div class="w3-container">
<h2>${boardName}</h2>
<table class="w3-table-all">
<c:if test="${boardcount==0 }">
<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcount>0 }">
<tr><td colspan = "5" style="text-align:right">글개수:${boardcount}</td></tr>
<tr><th width = "8%">번호</th><th width = "50%">제목</th>
		<th width = "14%">작성자</th><th width ="17%">등록일</th>
		<th width = "11%">조회수</th></tr>
<c:forEach var = "b" items="${list}">
<tr><td>${boardnum}</td>
<c:set var = "boardnum" value="${boardnum - 1}"/>
<td style="text-align:left">
<%-- 첨부파일 @로 표시하기 --%>
<c:if test="${!empty b.file1}"> 
<a href = "../upload/board/${b.file1}">@</a></c:if> 
<c:if test="${empty b.file1}">&nbsp;&nbsp;&nbsp;</c:if>
<%-- 답글의 level 만큼 들여쓰기 --%>
<c:if test="${b.grplevel > 0}">
	<c:forEach var = "i" begin = "1" end = "${b.grplevel}">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach>└ 
</c:if>
<a href = "info?num=${b.num}">${b.title}</a>
<%-- 댓글 개수 뱃지로 표현  --%>
	<c:if test ="${b.commcnt > 0}">
	<a href="info?num=${b.num}#comment">
	<span class="w3-badge w3-green w3-small">${b.commcnt}</span>
	</a>
	</c:if></td>
<%-- 뱃지 끝 --%>	
<td>${b.writer}</td>
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="t"/>
<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd" var="r"/>
<td><c:if test="${t==r}">
	  <fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss"/>
		</c:if>
 		<c:if test="${t!=r}">
    <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm"/>
   </c:if></td>    
 <td>${b.readcnt}</td></tr>    
</c:forEach>
<%-- 페이지 처리하기 --%>
<tr><td colspan="5">
		<c:if test="${pageNum <= 1}">[이전]</c:if>
		<c:if test="${pageNum > 1}">
		<a href = "list?pageNum=${pageNum - 1}">[이전]</a>
		</c:if>
		<c:forEach var = "a" begin="${startpage}" end ="${endpage}">
			<c:if test="${a == pagenum}">[${a}] </c:if>
			<c:if test="${a != pagenum}">
				<a href = "list?pageNum=${a}">[${a}]</a>
			</c:if>
	</c:forEach>
		<c:if test="${pagenum >= maxpage}">[다음]</c:if>
		<c:if test="${pagenum < maxpage}">
		<a href = "list?pageNum=${ pageNum +1}">[다음]</a></c:if>
	</td></tr>
</c:if>	
	<tr><td colspan="5" style="text-align:right">
<c:if test="${boardid != '1' || sessionScope.login == 'admin' }">
		<p align = "right"><a href = "writeForm">[글쓰기]</a></p>
</c:if>
</td></tr>
</table></div>
</body>
</html>