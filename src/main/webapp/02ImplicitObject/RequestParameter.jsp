<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<%
//post방식으로 전송된 한글이 깨지는 현상 처리
request.setCharacterEncoding("UTF-8");

/*
gerParameter() : input태그중 text, radio타입처럼 하나의 값이 전송될 경우 사용한다. 
	받은 값은 String타입으로 저장된다.
getParameterValues() : input태그 중 checkbox 타입처럼 복수의 값이 전송될 경우 사용한다.
	받은 값은 String타입의 배열로 저장된다.
*/

String id = request.getParameter("id");
String sex = request.getParameter("sex");
String[] favo  = request.getParameterValues("favo");
String favoStr = "";
if(favo != null){
	//String배열이므로 크기(checkbox 선택한 갯수)만큼 반복한다.
	for(int i=0; i<favo.length; i++){
		favoStr += favo[i] + " ";
	}
}
/*
textarea는 두 줄 이상 입력이 가능하므로 엔터키는 \r\n으로 저장된다.
따라서 화면에 출력시에는 <br>태그로 변경해야한다.
*/
String intro = request.getParameter("intro").replace("\r\n","<br/>");
%>
<ul>
<li>아이디 : <%= id %></li>
<li>성별 : <%= sex %></li>
<li>관심사항 : <%= favoStr %></li>
<li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>