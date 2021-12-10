<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set1</title>
</head>
<!-- 
	set태그	
		: 변수를 선언할 때 사용한다. JSP의 setAttribute()와 동일한 기능을 한다.
		4가지 영역에 새로운 속성을 추가한다.
	[속성정리]
		var : 속성명(변수명). 즉, 영역에 저장될 이름
		value : 속성값
		scope : 4가지 영역명을 지정. default-page영역
		target : set태그를 통해 생성된 자바빈즈 이름을 지정
		property : target으로 지정한 자바빈즈의 멤버변수(property)값 설정
 -->
<body>
	<!-- set태그 변수 선언 방법 -->
	<c:set var="directVar" value="100"/><!-- 1.일반값을 사용 -->
	<c:set var="elVar" value="${directVar mod 5 }"/><!-- 2.EL을 사용 -->
	<c:set var="expVar" value="<%= new Date() %>"/><!-- 3.표현식을 사용 -->
	<c:set var="betweenVar">변수값 여기설정</c:set><!-- 4.태그사이에 value 입력 -->
	<!-- scope속성을 지정하지 않았으므로 가장 작은영역인 page영역에 저장됨 -->
	
	<!-- 
	속성명이 중복되지 않는다면 영역을 표시하는 내장객체를 생략할 수 있다.
	 -->
	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${ pageScope.directVar }</li>
		<li>elVar : ${ elVar }</li>
		<li>expVar : ${ expVar }</li>
		<li>betweenVar : ${ betweenVar }</li>
	</ul>
	
	
	<h4>자바빈즈 생성 1 - 생성자 사용</h4>
	<c:set var="personVar1" value='<%= new Person("박문수",50) %>' scope="request"/>
	
	<ul><!-- 객체의 getter를 통해 멤버변수 값 출력 -->
		<li>이름 : ${requestScope.personVar1.name }
		<li>나이 : ${personVar1.age }
	</ul>
	
	<h4>자바빈즈 생성 2 - target, property 사용</h4>
	<!-- 자바빈을 request영역에 생성 -->
	<c:set var="personVar2" value="<%= new Person() %>" scope="request"/>
	<!-- 멤버변수 값 설정 -->
	<c:set target="${personVar2 }" property="name" value="정약용"/>
	<c:set target="${personVar2 }" property="age" value="60"/>
	
	<ul>
		<li>이름 : ${personVar2.name }
		<li>이름 : ${requestScope.personVar2.age }
	</ul>
</body>
</html>