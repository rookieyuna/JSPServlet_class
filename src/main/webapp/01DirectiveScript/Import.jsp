<!-- 필요한 외부 클래스를 임포트한다. Java에서와 같이 자동완성으로 기술한다 -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page지시어1 - import속성</title>
</head>
<body>
<%
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
String todayStr = dateFormat.format(today);
out.println("오늘 날짜 : "+ todayStr);
%>
</body>
</html>