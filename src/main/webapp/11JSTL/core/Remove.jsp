<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 변수 선언(동일한 이름으로 4가지 영역에 저장) -->
<c:set var="scopeVar" value="Page Value"/>
<c:set var="scopeVar" value="Request Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - remove</title>
</head>
<body>
	<h4>출력하기</h4>
	<ul>
		<li>scopeVar : ${scopeVar }
		<li>scopeVar : ${requestScope.scopeVar }
		<li>scopeVar : ${sessionScope.scopeVar }
		<li>scopeVar : ${applicationScope.scopeVar }
	</ul>
	
	<h4>session영역에서 삭제하기</h4>
	<!-- 영역지정 후 속성 삭제 : 해당 영역에서만 삭제됨 -->
	<c:remove var="scopeVar" scope="session"/>
	<ul>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar }
	</ul>
	
	<h4>영역지정 없이 삭제하기</h4>
	<!-- 영역지정 없이 속성 삭제 : 동일한 이름의 속성이 모든 영역에서 삭제 -->
	<c:remove var="scopeVar"/>
	<ul>
		<li>scopeVar : ${scopeVar }
		<li>requestScope.scopeVar : ${requestScope.scopeVar }
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }
	</ul>
</body>
</html>