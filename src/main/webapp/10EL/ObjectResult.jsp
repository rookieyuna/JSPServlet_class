<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어(EL) - 객체 매개변수</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<!-- https://www.msn.com/ko-kr/money/watchlist?id=ajofdm
		영역에 저장된 속성에 EL로 접근할 때는 속성명이 중복되지 않는
		경우라면 EL내장객체 없이 속성명으로만 접근할 수 있다.
		즉 requestScope.personObj.name 형태로 기술하지 않아도 된다
	 -->
	<ul>
	<!--
		객체에 getter()메소드가 있다면 속성명.멤버변수로 기술하여
		getter()메소드를 호출함으로써 멤버변수의 값을 출력할 수 있다.
		※만약 Person클래스에서 getName()을 주석처리하면 에러가 발생한다!!
		또한 출력시 형변환이 자동으로 되므로 더운 편리하다
	 -->
		<li>Person객체 => 이름 : ${personObj.name},
						  나이 : ${personObj.age}</li>
	<!-- requestScope은 생략할 수 있다! -->
		<li>String 객체 => ${requestScope.stringObj}</li>
		<li>Integer 객체 => ${integerObj}</li>
	</ul>
	
	<h2>JSP내장객체를 통해 영역의 값 읽어오기</h2>
	<%
	//영역은 모든 객체를 저장할 수 있는 공간이므로 Object형으로 저장
	Object object = request.getAttribute("personObj");
	//영역에서 객체를 꺼내서 사용할 때는 원래형으로 형변환 해야함!!
	Person person = (Person)object;
	//출력시에는 getter()메서드 사용
	out.print("이름: " + person.getName() + "<br>");
	%>
	나이: <%=person.getAge() %>
	
	
	<!-- 
	파라미터로 전달된 값을 읽을 때 아래 3가지 모두 사용할 수 있다.
		param.파라미터명
		param['파라미터명']
		param["파라미터명"]
	
	 -->
	<h2>매개변수로 전달된 값 읽기</h2>
	<ul>
		<!-- EL에서는 산술연산이 가능하므로 아래에서는 30이 출력된다
		또한 파라미터로 전달된 문자열을 숫자로 자동변환 해준다.  -->
		<li>${param.firstNum + param['secondNum'] }</li>
		<!-- 단순한 출력이므로 10 + 20이 출력된다 -->
		<li>${param.firstNum} + ${param["secondNum"] }</li>
	</ul>
</body>
</html>