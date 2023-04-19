<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/picture.jsp
	1.이미지 파일 업로드. request 객체 사용 불가
				이미지 파일 업로드의 위치 : 현재 폴더/picture 폴더로 설정
	2.opener 화면에 결과 전달 -> javascript
	3.현재화면 close() => javascript    
 --%>
 
 <%
//파일업로드 위치 : 현재폴더 : model1/member/+ picture/ 폴더 생성.
//
 	String path = application.getRealPath("") + "model1/member/picture/";
  String fname = null;
  File f= new File(path);
  if(!f.exists()){ f.mkdirs(); } //업로드 폴더가 없는 경우 폴더 생성.
  MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024,"utf-8");
  fname = multi.getFilesystemName("picture"); //업로드된 파일의 이름
 %>
 <script type = "text/javascript">
 	//opener : 현재 window를 open한 window => joinForm.jsp
 	//id="pic"인 태그 
  // <img src="" width="100" height="120" id="pic">
   img = opener.document.getElementById("pic");
   //img 태그의 src 속성
   img.src = "picture/<%=fname%>"; //=> joinForm.jsp 페이지에 이미지 보여짐
   //<input type = "hidden" name="picture" value= "">
   opener.document.f.picture.value="<%=fname%>";
   self.close(); //현재창 닫기
 </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>