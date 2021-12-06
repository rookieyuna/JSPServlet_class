<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그아웃 방법1 : 개별속성 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserName");

//로그아웃 방법2 : 전체속성 삭제
session.invalidate();

response.sendRedirect("LoginForm.jsp");
%>