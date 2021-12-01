<%@page import="common.MyClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%--
	선언부(Declaration) <%! %> : 스트립트릿이나 표현식에서 사용할 메서드를 
		선언할 때 사용한다. 선언부에서 선언된 메서드는 해당 jsp가 서블릿(Java)
		파일로 변환될 때 멤버메서드 형태로 기술된다.
 --%>
<%!
public int add(int num1, int num2){
	return num1 + num2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%--
	스트립트릿(scriptlet) <% %>  : 주로 JSP코드를 작성하고 실행할 때 사용하는 영역이다
		스크립트릿은 body, head 어디서든 사용할 수 있다. 또한 <script>, <style>
		태그 내부에서도 사용할 수 있다.
		여기에 기술된 코드는 _jspService() 메서드내에 포함된다.
		그러므로 해당영역에는 메서드를 선언할 수 없다.
	표현식(Expression) <%= %>: 변수를 웹브라우저상에 출력할 때 사용한다
		JS의 document.write()와 동일한 역할으르 한다. 표현식 사용시 주의할 점은
		문장 끝에 ;(세미콜론)를 쓰지 않는다.
	
 --%>
<%
int result = add(10,20);
%>
덧셈 결과 1 : <%= result %> <br/>
덧셈 결과 2 : <%= add(30,40) %>

<h2>내가만든 Java클래스의 메서드 호출하기</h2>
<%
	//해당메서드는 static이므로 객체생성 없이 즉시 호출 가능
	int sum = MyClass.myFunc(1,100);
	out.println("1~100까지의 합은~~: "+ sum); //웹에 출력
	System.out.println("1~100까지의 합은: "+ sum);//콘솔에 출력
%>
</body>
</html>