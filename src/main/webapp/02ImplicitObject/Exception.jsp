<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - exception</title>
</head>
<body>
<% 
//응답 객체를 통해 현재 서버의 상태를 정수형태로 얻어온다.
int status = response.getStatus();

//에러코드에 따라 적절한 메세지 출력
if(status == 404){
	out.print("404에러가 발생하였습니다.<br>");
	out.print("파일 경로를 확인해주세요.<br>");
}
else if(status == 405){
	out.print("405에러가 발생하였습니다.<br>");
	out.print("요청방식(method)을 확인해주세요.<br>");
}
else if(status == 500){
	out.print("500에러가 발생하였습니다.<br>");
	out.print("소스코드에 오류가 없는지 확인해주세요.<br>");
}
%>
<img alt="오류발생됨" src="../images/Error1.jpg" width="400">
</body>
</html>