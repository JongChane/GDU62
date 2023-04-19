<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy2/src/main/webapp/view/board/writeForm.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript">
	function inputcheck()	{
		f=document.f;
		if(f.writer.value == ""){
			alert("글쓴이를 입력하세요");
			f.writer.focus();
			return;
		}
		if(f.pass.value == ""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return;
		}
		if(f.title.value == ""){
			alert("제목을 입력하세요");
			f.title.focus();
			return;
		}
		/* if(f.content.value == ""){
			alert("내용을 입력하세요");
			f.content.focus();
			return;
		} */
		f.submit(); // submit 발생 => form의 action 페이지로 요청
	}
</script>
</head><body><form action="write" method="post" enctype="multipart/form-data" name="f">
<table class="w3-table w3-border"><caption>게시판 글쓰기</caption>
	<tr><td>글쓴이</td><td><input type="text" name="writer" class="w3-input"></td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="pass" class="w3-input"></td></tr>
	<tr><td>제목</td><td><input type="text" name="title" class="w3-input"></td></tr>
	<tr><td>내용</td><td><textarea rows="15" name="content" class="w3-input" id="content"></textarea></td></tr>
	<script>CKEDITOR.replace("content",{
		filebrowserImageUploadUrl : "imgupload"
	})</script>
	<tr><td>첨부파일</td><td><input type="file" name="file1"></td></tr>
	<tr><td colspan="2" >
		<a href="javascript:inputcheck()">게시물등록</a></td></tr>
</table></form></body></html>
