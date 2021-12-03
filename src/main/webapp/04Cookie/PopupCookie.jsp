<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%
//팝업메인에서 전달한 파라미터를 받음
String chkVal = request.getParameter("inactiveToday");
//파라미터값이 1이라면 아래 내용 실행됨
if(chkVal != null && chkVal.equals("1")){
	Cookie cookie = new Cookie("PopupClose", "off");//쿠키생성
	cookie.setPath(request.getContextPath());	//경로설정
	cookie.setMaxAge(60*60*24);//유효기간 설정
	response.addCookie(cookie); //응답헤더에 쿠키정보 추가
	out.println("쿠키: 하루동안 열지 않음");
}
%>