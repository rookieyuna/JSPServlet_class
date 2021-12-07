<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - UseBean</title>
</head>
<body>
	<h3>액션 태그로 폼값 한 번에 받기</h3>
	<!-- 
	폼값을 전송하는 페이지에서 input태그의 name 속성과
	이를 저장할 DTO 객체의 멤버변수명이 반드시 일치해야학,
	또한 값설정을 위한 getter/setter 메서드가 
	 -->
	<!-- person 이라는 변수의 Person 객체를 생성한다 -->
	<jsp:useBean id="person" class="common.Person"/>
	
	<!-- DTO객체의 setter() 메서드를 통해 값 설정 -->
	<jsp:setProperty property="*" name="person"/>
	
	<!-- DTO객체의 getter() 메서드를 통해 값 출력 -->
	<ul>
		<li>이름 : <jsp:getProperty name="person" property="name"/>
		<li>나이 : <jsp:getProperty name="person" property="age"/>
	</ul>
</body>
</html>