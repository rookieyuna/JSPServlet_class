<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 컬렉션</title>
</head>
<body>
<h2>List 컬렉션</h2>
<%
//List컬렉션을 Object기반으로 생성
List<Object> aList = new ArrayList<Object>();
aList.add("청해진"); //String 객체 저장
aList.add(new Person("장보고", 28)); //Person객체 저장
pageContext.setAttribute("Ocean", aList); //page영역에 저장
%>

<ul>
 	<!-- String출력 -->
	<li>0번째 요소 : ${Ocean[0]}</li>
	<!-- Person 객체 출력. getter()메서드를 통해 출력됨-->
	<li>1번째 요소 : ${Ocean[1].name}, ${Ocean[1].age}</li>
	<!-- 데이터가 없음에도 nullpoint나 outofbound에러가 나지 않고 그냥 출력안됨 -->
	<li>2번째 요소 : ${Ocean[2]}</li>
</ul>

<h2>Map 컬렉션</h2>
<%
Map<String, String> map = new HashMap<String, String>();
map.put("한글","훈민정음"); //한글을 key로 값 설정
map.put("Eng","English"); //영문을 key로 값 설정
pageContext.setAttribute("King", map); //page영역에 저장
%>
<ul>
	<!-- key값이 영문인 경우 아래 3가지 방법 모두 가능하나
		한글인 경우 .(점)으로는 출력할 수 없다.  -->
	 <li>영문 key: ${King["Eng"] }, ${King['Eng'] }, ${King.Eng}</li>
	 <li>영문 key: ${King["한글"] }, ${King['한글'] }, \${King.한글}<!-- 에러발생 --></li>
	 <!-- El앞에 \(역슬러쉬)를 붙이면 글자 그대로 출력된다 -->
	 
</ul>
</body>
</html>