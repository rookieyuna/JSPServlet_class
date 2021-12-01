<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response</title>
</head>
<body>
<%
//request 내장객체의 getParameter()를 통해 전송된 폼값을 받는다.
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
/*문자열을 통한 단순 비교로 로그인 정보 확인 후 페이지 이동*/
if(id.equalsIgnoreCase("must")&&pwd.equalsIgnoreCase("1234")){
	response.sendRedirect("ResponseWelcome.jsp");
}
/*
로그인 실패시 메인페이지로 포워드한다.
포워드란 페이지이동과는 다르게 제어의 흐름을 전달하고자 할 때 사용한다.
웹브라우저의 주소줄에는 ResponseLogin.jsp가 보여지지만 실제 출력되는
내용은 ResponseMain.jsp의 내용이 출력된다.
아래 명령을 만나기 전까지의 모든 내용을 버퍼에서 제거한 후 아래 
페이지의 내용을 웹브라우저에 출력한다.
*/
else{
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
		.forward(request, response);
}
	
%>
</body>
</html>