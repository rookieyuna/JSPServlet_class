<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate()사용)</h2>
	<%
	//JDBC를 통한 DB연결
	JDBConnect jdbc = new JDBConnect();
	
	//입력할 회원데이터 (하드코딩)
	String id = "test4";
	String pass ="4444";
	String name= "난테스트4";
	
	//쿼리문 준비(동적쿼리를 위한 인파라미터 사용)
	String sql = "INSERT INTO member VALUES (?, ?, ?, sysdate)";
	
	//동적쿼리 실행을 위한 prepared 객체 생성
	jdbc.psmt = jdbc.con.prepareStatement(sql);
	//인파라미터 설정(인덱스는 1부터 시작)
	jdbc.psmt.setString(1, id);
	jdbc.psmt.setString(2, pass);
	jdbc.psmt.setString(3, name);
	
	//행에 영향을 주는 update, delete, insert문을 실행할 때 사용하는 메서드
	int inResult = jdbc.psmt.executeUpdate();//반환값은 적용된 행의 개수이므로 int
	out.println(inResult + "행이 입력되었습니다.");
	
	//자원해제(객체소멸)
	jdbc.close();
	%>
</body>
</html>