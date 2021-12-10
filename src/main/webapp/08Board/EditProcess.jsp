<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
//수정페이지에서 전송한 폼값 받기
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//DTO객체에 입력값 추가하기
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DB연결
BoardDAO dao = new BoardDAO(application);
//수정처리
int affected = dao.updateEdit(dto);
//자원해제
dao.close();

if (affected ==1){
	//수정에 성공한 경우 해당글의 상세보기로 돌아가기
	response.sendRedirect("View.jsp?num=" + dto.getNum());
}
else{
	///실패한 경우에는 다시 수정페이지(뒤)로 이동
	JSFunction.alertBack("글 수정에 실패하였습니다.", out);
}
%>