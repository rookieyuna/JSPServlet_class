<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//1. 응답헤더에 추가할 값 준비

//get방식으로 전송된 폼값을 날짜형식을 통해 타임스템프로 변경한다
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date"+add_date);
//숫자형식으로 전송된 값을 정수로 변경한다 (겟파라미터로 받으면 문자타입됨)
int add_int = Integer.parseInt(request.getParameter("add_int"));
//<form>태그를 통해 전송되는 모든 값은 문자열 형태로 저장된다.
String add_str = request.getParameter("add_str");



//응답헤더에 값 추가
response.addDateHeader("myBirthday", add_date); //날짜형식의 응답헤더를 추가
response.addIntHeader("myNumber", add_int); //정수형식 : 8282
response.addIntHeader("myNumber", 1004); //정수형식 : 1004
response.addHeader("myName", add_str); //문자열형식 : 홍길동
/*
set계열의 메서드는 기존의 응답헤더값을 수정한다
*/
response.setHeader("myName", "안중근");//문자열형식을 안중근으로 변경
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답헤더 정보 출력하기</h2>
	<%
	//getHeaderNames() 메서드를 통해 응답헤더를 얻어온다
	Collection<String> headerNames = response.getHeaderNames();
	//확장된 for문을 통해 얻어온 갯수만큼 반복 
	for (String hName : headerNames) {
		//응답헤더 값을 얻어온다
		String hValue = response.getHeader(hName);
	%>
		<li><%= hName %> : <%= hValue %></li>
	<%
	}
	/*
	첫번째 출력결과에서는 myNumber라는 헤더명이 2번 출력되는데,
	동일한 값이 출력된다. 이것은 getHeader()메서드의 특성으로
	처음 입력한 헤더값만 출력된다.
	*/
	%>
	
	<h2>myNumber만 출력하기</h2>
	<%
	/*
	myNumber라는 헤더명으로 2개의 값을 추가했으므로 아래에서는
	각각의 값이 정상적으로 출력된다. 즉 add계열의 메서드는 헤더명을
	동일하게 사용하더라도 헤더값은 추가된다.
	*/
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
		<li><%= myNumber %> : <%= myNum %></li>
		<!-- 8282, 1004가 순서대로 출력된다 -->
	<%
	}
	%>
</body>
</html>