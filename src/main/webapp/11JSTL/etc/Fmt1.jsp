<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 1</title>
</head>
<body>

	<!-- 
	국제화(Formatting) 태그
		-국가별로 다양한 언어,날짜,시간,숫자형식을 설정할 때 사용한다
		-접두어로는 fmt를 사용한다.
		-var 속성 지정시 즉시 출력되지 않고 원하는 위치에 EL을 통해 출력
	 -->
	<h4>숫자 포맷 설정</h4>
	<c:set var="number1" value="12345"/>
	<!-- 
	fmt:formatNumber 태그
	
	[var 속성]
	 	속성 미지정 시 즉시 출력/속성 지정 시 원하는 위치에 EL을 통해 출력
	[groupingUsed 속성]
		default값이 true이므로 미지정시 숫자 세자리마다 컴마를 출력한다.
	 -->
	콤마 O : <fmt:formatNumber value="${number1 }"/><br>
	콤마 X : <fmt:formatNumber value="${number1 }" groupingUsed="false"/><br>
	<!-- 
	[type 속성]
		currency - 현지 통화 기호로 출력 (currentSymbol속성으로 통화기호 변경가능_
		percent - value 속성값을 %단위로 변환해서 출력
	 -->
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum1" currencySymbol="$"/>
	통화기호 : ${printNum1 }<br>
	<fmt:formatNumber value="0.03" type="percent" var="printNum2"/>
	퍼센트 : ${printNum2 }
	
	<h4>문자열을 숫자로 변경</h4>
	<!-- 
	fmt:parseNumber 태그
		- Integer.parseInt()와 동일한 기능으로 문자열을 숫자로 변경한다.
		- pattern : 변환할 숫자의 패턴을 지정하여 파싱한다
			(00,000.00 => 정상 / 0,0.0 => 정상 / ,. 만 입력시 에러발생)
		- intergerOnly : 소수점 이하를 절삭하여 정수부분만 출력한다.
	 -->
	<c:set var="number2" value="6,789.01"/>
	<fmt:parseNumber value="${number2 }" pattern="00,000.00" var="printNum3"/>
	소수부분만 : ${printNum3 }
	<fmt:parseNumber value="${number2 }" integerOnly="true" var="printNum4"/>
	정수부분만 : ${printNum4 }
	
	
	<h4>Java코드로 1000단위 콤마 표시하기</h4>
	<%
	//page영역에 저장된 number1을 문자열로 변환 후 저장한다.
	String moneyStr = pageContext.getAttribute("number1").toString();
	//숫자로 변환한다
	int money = Integer.parseInt(moneyStr);
	//해당 클래스는 싱글턴패턴이 적용되어 있으므로 new로는 객체를 생성할 수 없다.
	NumberFormat nf = NumberFormat.getInstance();
	//format()메서드를 통해 세자리 컴마를 적용한다.
	String commaMoney = nf.format(money);
	out.print(commaMoney);
	%>
</body>
</html>