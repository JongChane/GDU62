<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/logout.jsp
	1. session의 로그인 정보 제거
	2. 로그아웃 메세지 출력 후 loginForm.jsp로 페이지 이동    
--%>
<% 
	session.removeAttribute("login"); //login 속성정보 제거
	session.invalidate(); //새로운 session 객체로 변경. 이전에 등록된 속성들 전부 제거
	//	response.sendRedirect("loginForm.jsp"); 메세지 띄울 수가 없음. 서버에서 처리해주는 방식
%>
<script>
	alert("로그아웃 되었습니다.") //메세지 띄우고
	location.href="loginForm.jsp" //클라이언트에서 로그인 폼으로 이동.
</script>