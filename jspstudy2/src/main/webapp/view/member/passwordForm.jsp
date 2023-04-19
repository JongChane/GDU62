<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/passwordForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script type="text/javascript">
	function inchk(f) {
		if(f.pass.value.trim() == ""){
			alert("현재비밀번호를 입력하세요")
			f.pass.focus()
			return false;
		}
		if(f.chgpass.value.trim() == ""){
			alert("변경할 비밀번호를 입력하세요")
			f.chgpass.focus()
			return false;
		}
		if(f.chgpass2.value.trim() == ""){
			alert("변경할 비밀번호를 재입력 하세요")
			f.chgpass2.focus()
			return false;
		}
		if(f.chgpass.value.trim() != f.chgpass2.value.trim()){
			alert("변경할 비밀번호와 재입력된 비밀번호가 일치하지 않습니다.")
			f.chgpass2.vlaue="";
			f.chgpass2.focus();
			return false;
		}
		  return true;
	}
</script>
</head>

<body>
<div class="container">
<form action = "password" method="post" name="f"
			onsubmit = "return inchk(this)">
			<%-- 1. 모든 입력값 등록.
			 		 2. 변경 비밀번호 == 변경비밀번호재입력
			 		  --%>
			<table class="table table-hover">
			<tr><th>현재비밀번호</th>
					<td><input type="password" name="pass"></td></tr>
			<tr><th>변경비밀번호</th>
					<td><input type="password" name="chgpass"></td></tr>
			<tr><th>변경비밀번호재입력</th>
					<td><input type="password" name="chgpass2"></td></tr>
			<tr><td colspan="2">
			<input type="submit" value="비밀번호변경" class="btn btn-dark">
			<input type="reset" value="초기화" class="btn btn-dark"></td></tr>							
			</table></form></div></body></html>