<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- /jspstudy2/src/main/webapp/view/board/updateForm.jsp --%> 
<!DOCTYPE html><html><head></head><meta charset="UTF-8">
<title>게시판 수정 화면</title>
<script>
	function file_delete(){
		document.f.file2.value = "";
		file desc.style.display = "none";
	}
</script>
</head><body>
<form action="update" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="num" value="${b.num}" class="w3-input">
<input type="hidden" name="file2" value="${empty b.file1?'':b.file1}" class="w3-input">
<div class="w3-container w3-center">
<h2 class="w3-center">${boardName} 수정</h2>
<table class="w3-table w3-border">
<tr><td>글쓴이</td><td>
<input type="text" name="writer" value="${b.writer}" class="w3-input"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass" class="w3-input"></td></tr>
<tr><td>제목</td><td>
<input type="text" name="title" value="${b.title}" class="w3-input"></td></tr>
<tr><td>내용</td><td>
<textarea rows="15" name="content" class="w3-input" id="content">${b.content}</textarea></td></tr>
	<script>CKEDITOR.replace("content",{
		filebrowserImageUploadUrl : "imgupload"
	})</script>
<tr><td>첨부파일</td><td style="text-align:left">
<c:if test="${!empty b.file1}"> 
<div id= "file_desc">${b.file1}
	<a href = "javascript:file_delete()">[첨부파일 삭제]</a></div>
</c:if>		
<input type = "file" name="file1"></td></tr>
<tr><td colspan ="2">
<a href = "javascript:document.f.submit()">[게시물수정]</a></td></tr>
</table>
</div>
</form>
</body>
</html>