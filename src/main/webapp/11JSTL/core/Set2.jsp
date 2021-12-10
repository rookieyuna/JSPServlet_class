<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
	<h4>List 컬렉션 이용하기</h4>
	<%
	//Person객체를 저장할 수 있는 List계열의 컬렉션 생성
	ArrayList<Person> pList = new ArrayList<Person>();
	//List에 객체추가
	pList.add(new Person("성삼문", 55));
	pList.add(new Person("박팽년", 665));
	%>
	<!-- request영역에 컬렉션 저장 -->
	<c:set var="personList" value="<%= pList %>" scope="request"/>
	<ul><!-- index 0번인 첫번째 객체 출력 -->
		<li>이름 : ${personList[0].name }<!-- List컬렉션이므로 index접근 가능 -->
		<li>나이 : ${personList[0].age }
	</ul>
	
	
	<h4>Map 컬렉션 이용하기</h4>
	<%
	//Key는 String, value는 Person 타입인 Map계열 컬렉션 생성
	Map<String, Person> pMap = new HashMap<String, Person>();
	//Map에 객체추가
	pMap.put("personArgs1", new Person("하위지", 65));
	pMap.put("personArgs2", new Person("지슈슈", 182));
	%>
	<!-- request영역에 속성 저장 -->
	<c:set var="personMap" value="<%= pMap %>" scope="request"/>
	<ul><!-- Map컬렉션이므로 Key값을 통해서 접근 var명.key명.변수명 -->
		<li>이름 : ${requestScope.personMap.personArgs2.name }
		<li>나이 : ${personMap.personArgs2.age }
	</ul>
	
</body>
</html>