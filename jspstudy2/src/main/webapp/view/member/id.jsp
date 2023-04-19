<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /jspstudy2/src/main/webapp/view/member/id.jsp
   1. 파라미터값 저장(email,tel)
   2. db에서 두개의 파라미터를 이용하여 id값 리턴해주는 함수
      id MemberDao.idSearch(email,tel)
   3. id 검증
       -id 존재 : 화면에 뒤쪽 2자만 ** 표시하여 화면에 출력하기.
       					 아이디 전송 버튼을 클릭하면 opener 윈도우에 id값 전달. 현재 화면 닫기
       -id 없음 : id가 없습니다. 메세지 출력후 현재화면을 idForm.jsp 페이지 이동    
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<script type="text/javascript">
	function idsend(id) {
   opener.document.f.id.value=id;
   self.close();
	}
</script>
</head>
<body>
<table>
 <tr><th>아이디</th><td>${id}**</td></tr>
 <tr><td colspan="2">
     <input type="button" value="아이디전송" onclick="idsend('${id}')">
 </td></tr>
</table>
</body>
</html>    
