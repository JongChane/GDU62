<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- /jspstudy2/src/main/webapp/view/member/idchk.jsp
		1. 

--%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검색</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
   .able { color:green; font-size: 15px;}
   .disable { color:red; font-size: 20px;}
</style>
<body><table> <tr><td>아이디</td><td>${param.id}</td></tr>
  <tr><td colspan="2"><div id="msg">${msg}</div></td></tr>
  <tr><td colspan="2"><input type="button" class="btn btn-dark" value="닫기"  
      onclick="self.close()"></td></tr>
</table>
<script>
  if (${able}) {
	//joinForm.jsp 페이지 아이디 부분의 글자색을 초록색으로
	opener.document.f.id.style.color="green"
	//id="msg" 태그에 class 속성 등록
	document.querySelector("#msg").setAttribute("class","able")
  } else {
	//joinForm.jsp 페이지 아이디의 입력값 초기화
	opener.document.f.id.value=""
	document.querySelector("#msg").setAttribute("class","disable")
  }
</script>    
</body></html>