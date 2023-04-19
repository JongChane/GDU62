<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/password.jsp
	1. 파라미터 저장(pass, chgpass)
	2. 비밀번호 변경은 로그인한 사용자만 가능. => 로그인부분 검증
		 로그아웃 상태 : 로그인 하세요 메세지 출력후 opener 창을 loginForm.jsp 페이지로 이동 후 현재페이지 닫기.
	3. 비밀번호 검증 : 현재비밀번호로 비교
		 비밀번호 오류 : 비밀번호 오류 메세지 출력 후 현재페이지를 passwordForm.jsp로 이동
	4. db에 비밀번호 수정
		 boolean MemberDao.updatePass(id, 변경비밀번호)
		 - 수정 성공 : 성공메세지 출력 후(로그아웃 되었습니다. 변경된 비밀번호로 다시 로그인하세요.)
		 								 opener 페이지 로그아웃 후 loginForm.jsp로 이동 현재 페이지 닫기.
		 										//info.jsp로 이동. 현재 페이지 닫기 
		 - 수정 실패 : 실패메세지 출력 후 opener 페이지 updateForm.jsp로 이동. 현재 페이지 닫기 		 
 --%>
 <%
 //1
 	String pass = request.getParameter("pass");
	String chgpass = request.getParameter("chgpass");
 //2
  String login = (String)session.getAttribute("login");
 	String msg = null;
 	String url = null;
 	boolean opener = true;

	if(login == null) { //로그아웃 상태
		msg =	"로그인 하세요";
		url = "loginForm";
		opener = true;
	 } else { //로그인 상태
		 MemberDao dao = new MemberDao();
		 Member dbmem = dao.selectOne(login);
		 //pass : 현재 비밀번호로 입력된 값
		 if(pass.equals(dbmem.getPass())) {
			 if(dao.updatePass(login,chgpass)) {
				 msg = "비밀번호 변경 완료. \\n다시 로그인하세요.";
				 session.invalidate();
				 url = "loginForm";
				 opener = true;
			 } else {
				 msg = "오류가 발생되었습니다.";
				 url = "updateForm?id="+ login;
				 opener = true;
			 }
		 } else {//비밀번호 오류
			 opener = false;
		   msg = "비밀번호 오류입니다.";
		   url = "passwordForm";
			 }
	 }	 
	%>
	 <script>
		alert("<%=msg%>")
		if(<%=opener%>){
			opener.location.href="<%=url%>"
			self.close()
		} else {
			location.href="<%=url%>"
		}
	</script>
