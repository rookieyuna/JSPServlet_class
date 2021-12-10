<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 태그</title>
</head>
<body>
	<!-- 
	forEach 태그의 일반for문 형태
		[속성정리]
			begin : 시작값
			end : 종료값
			step : 증가치(제외할 경우 1로 고정)
			var : 반복 시 사용할 변수
	 -->
	<h4>일반 for문형태의 forEach 태그</h4>
	<!-- 총 3번 반복하는 문장 -->
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${i }입니다.</p>
	</c:forEach>
	
	<!-- 
	일반 for문에서의 varStatus속성
		: 반복과 관련된 정보를 추상화한 클래스를 통해 정보를 반환한다.
		-count : 실제 반복횟수(1~마지막)
		-index : 변수 i의 변화하는 값
		-first : loop의 처음에 true반환
		-last : loop의 마지막에 true반환
		-current : 현재 loop의 변수값(var속성에 지정된 변수값)
	 -->
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<tr>
			<td>count : ${loop.count }</td>
			<td>index : ${loop.index }</td>
			<td>current : ${loop.current }</td>
			<td>first : ${loop.first }</td>
			<td>last : ${loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<c:forEach begin="1" end="100" var="j">
		<c:if test="${ j mod 2 ne 0 }">
			<c:set var="sum" value="${sum+j }"/>
		</c:if>
	</c:forEach>
	1~100사이의 정수 중 홀수의 합은? ${sum }<br>
	
	
	<h4>연습문제01 : forEach태그</h4>
	<!-- 
	연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach문과 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
	-->
	<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:if test="${i==j}" var="result">1</c:if>
			<c:if test="${not result }">0</c:if>
		</c:forEach>
		<br>
	</c:forEach>
	
	
	<h4>연습문제02 : forEach태그</h4>
	<!-- 앞의 문제를 choose~when~otherwise문으로 변경하기 -->
	
	<c:forEach begin="1" end="5" var="i">
		<c:forEach begin="1" end="5" var="j">
			<c:choose>
				<c:when test="${i eq j}" >1</c:when>
				<c:otherwise>0</c:otherwise>
			</c:choose>	
		</c:forEach>
		<br>
	</c:forEach>
	
	
	
	
	<h4>연습문제03 : 구구단 출력</h4>
	<!-- 
	JSTL의 forEach문을 이용하여 구구단을 출력하시오.
		table태그를 사용해야 하고, 짝수행에 마우스 오버시 빨간색으로
		홀수행에 마우스 오버시 노란색으로 바뀌게 코드를 작성하시오.
	-->
	<table border="1">
	<c:forEach begin="2" end="9" var="i">
		<c:if test="${i mod 2 eq 0 }" var="result">
			<tr onmouseover="this.style.backgroundColor='red';"
				onmouseout="this.style.backgroundColor='white';">
		</c:if>
		<c:if test="${not result }">
			<tr onmouseover="this.style.backgroundColor='yellow';"
				onmouseout="this.style.backgroundColor='white';">
		</c:if>
		<c:forEach begin="1" end="9" var="j">
			<td>${i}*${j}=${i*j}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</table>	
</body>
</html>