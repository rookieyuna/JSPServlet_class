<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 2</title>
</head>
<body>
	<c:set var="today" value="<%= new java.util.Date() %>"/>
	
	<h4>날짜 포맷</h4><!-- 날짜만 출력 시 사용 -->
	full : <fmt:formatDate value="${today }" type="date" dateStyle="full"/>
	<br>
	short : <fmt:formatDate value="${today }" type="date" dateStyle="short"/>
	<br>
	long : <fmt:formatDate value="${today }" type="date" dateStyle="long"/>
	<br>
	default : <fmt:formatDate value="${today }" type="date" dateStyle="default"/>
	
	
	<h4>시간 포맷</h4>
	full : <fmt:formatDate value="${today }" type="time" timeStyle="full"/>
	<br>
	short : <fmt:formatDate value="${today }" type="time" timeStyle="short"/>
	<br>
	long : <fmt:formatDate value="${today }" type="time" timeStyle="long"/>
	<br>
	default : <fmt:formatDate value="${today }" type="time" timeStyle="default"/>
	
	
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	<br>
	<!-- 출력할 포맷을 patter으로 지정한다. -->
	<fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
	
	
	<h4>타임존 설정</h4>
	<!-- 
	fmt:timeZone태그
		[value속성]
		"GMT" : 세계 표준시로 영국의 그리니치 천문대를 기준 설정 -->
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone><br>
	
	<!-- 
	 	"America/Chicago": 미 중부로 설정
	 -->
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone><br>
	
	<!-- 
	 	"GMT+9": KST(대한민국표준시) 설정 (혹은 Asia/Seoul 입력)
	 -->
	<fmt:timeZone value="GMT+9">
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>


	
	<h4>timezone에 사용할 수 있는 문자열 구하기</h4>
	<c:forEach var="ids" items="<%=java.util.TimeZone.getAvailableIDs()%>">
		${ids }<br>
	</c:forEach>
	
	
	
</body>
</html>