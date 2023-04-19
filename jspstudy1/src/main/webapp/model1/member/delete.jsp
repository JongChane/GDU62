<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/delete.jsp
	1. 파라미터 정보 저장
	2. 로그인 정보 검증
			-로그아웃상태 : 로그인하세요 메세지 출력 후 loginForm.jsp로 페이지 이동
			-다른사람 탈퇴(관리자 제외) : 본인만 탈퇴 가능 메세지 출력 후 main.jsp로 페이지 이동
	3. 관리자 탈퇴 방지를 위한 검증. 관리자 탈퇴 시 : 관리자는 탈퇴가 불가능합니다 메세지. list.jsp로 페이지 이동
	4. 비밀번호 검증
			로그인 정보로 비밀번호 검증
			- 비밀번호 불일치 : 비밀번호 오류 메세지 출력. deleteForm.jsp로 페이지 이동
	5. db에서 delete 실행
				boolean MemberDao.delete(id)
			- 탈퇴성공 => 일반 사용자 : 로그아웃 실행. 탈퇴 완료 메세지 출력 후 loginForm.jsp로 페이지 이동
								  관리자    : 탈퇴 완료 메세지 출력 후 list.jsp로 페이지 이동
			- 탈퇴실패 => 일반 사용자 : 탈퇴 실패 메세지 출력 후 info.jsp로 페이지 이동
								  관리자    : 탈퇴 실패 메세지 출력 후 list.jsp로 페이지 이동
		
--%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String)session.getAttribute("login");
	String msg=null;
	String url=null;
	if(login == null) { //로갓상태
		msg="로그인 하세요";
		url= "loginForm.jsp";
 } else if(!id.equals(login) && !login.equals("admin")){
		msg="본인인 경우에만 탈퇴할 수 있습니다.";
		url="main.jsp";
 } else if(id.equals("admin")){
		msg="관리자는 탈퇴할 수 없습니다.";
		url="list.jsp";
 } else { 	 
		MemberDao dao = new MemberDao();
		Member dbmem = dao.selectOne(login); //로그인한 사용자의 정보 조회
	 if(pass.equals(dbmem.getPass())) {	//비밀번호 일치
		 //pass : 입력한 비밀번호 값
		 //getPass : db에 등록된 비밀번호
		 if(dao.delete(id)){ //탈퇴성공
	 		 msg =id + "고객님 탈퇴성공";
	 		 if(login.equals("admin")) {
	 		  	url = "list.jsp";
	 			 }else { //일반사용자 
	 			  session.invalidate();
	 			  url = "loginForm.jsp";
	 			 }
	   } else {//탈퇴 실패
	 			 msg = id+"고객님 탈퇴 실패";
	 			if(login.equals("admin")) {
		 			url = "list.jsp";
		 		} else { //일반사용자 
		 		  url = "info.jsp?id="+id;
	 		  }
	  }
	} else {
		msg = "비밀번호 오류";
		url = "deleteForm.jsp?id=" +id;
	}
 }
%>
<script type="text/javascript"> 
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>


