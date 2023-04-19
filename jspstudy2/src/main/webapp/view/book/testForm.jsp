<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--/jspstudy2/src/main/webapp/view/book/testForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 글쓰기 화면</title>
<script type="text/javascript">
   function inputcheck(f) {
       if(f.writer.value == '') {
		   alert("방문자를 입력하세요");
		   f.writer.focus();
		   return false;
       }
       if(f.title.value == '') {
		   alert("제목 입력하세요");
		   f.title.focus();
		   return false;
       }
       if(f.content.value == '') {
		   alert("내용 입력하세요");
		   f.content.focus();
		   return false;
       }
       return true;
   }
</script>
</head>
<body>
<form action="test1" method="post" 
      onsubmit="return inputcheck(this)">
<table class="w3-table w3-border"><caption>방명록쓰기</caption>
<tr><td>방문자</td><td><input type="text" name="writer" class="w3-input"></td></tr>
<tr><td>제목</td><td><input type="text" name="title" class="w3-input"></td></tr>
<tr><td>내용</td>
    <td><textarea rows="10" cols="60" name="content" class="w3-input"></textarea></td></tr>
<tr><td colspan="2" align="center">
     <button class="w3-button w3-block" type="submit" class="w3-input">글쓰기</button></td></tr>    
</table></form></body></html>