<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function() {
	//$.ajax메서드에서 반복적으로 사용되는 속성을 묶어 정의한다.
	$.ajaxSetup({
		url : "../NaverSearchAPI.do", //요청URL(서버측)
		type : "get", //전송방식
		contentType : "text/html;charset:utf-8;",//전송방식에 따른 컨텐츠타입

		dataType : "json",//콜백데이터의 형식
		success : sucFuncJson,//성공했을 때 호출할 콜백메서드
		error : errFunc //실패했을때 호출할 콜백메서드
	});
	/*
	앞의 $.ajaxSetup()메서드에서 설정이 완료된 속성은 아래에서 중복으로
	설정하지 않아도 된다. 설정할 내용이 없는 경우 생략도 가능하다.
	*/
	$('#searchBtn').click(function(){
		$.ajax({
			//버튼을 클릭했을 때 요청
			data : { //서버로 전송하는 파라미터(JSON타입으로 만들어야함)
				keyword : $('#keyword').val(), //검색어
				startNum : $('#startNum option:selected').val() //페이지번호
			}
		});
	});
	$('#startNum').change(function() {
		$.ajax({
			//셀렉트 박스를 선택했을 때 요청
			data : { //서버로 전송하는 파라미터(JSON타입으로 만들어야함)
				keyword : $('#keyword').val(), //검색어
				startNum : $('#startNum option:selected').val() //페이지번호
			}
		});
	});
});
//성공 시 콜백 메소드
function sucFuncJson(d) {
	console.log("성공",d);//로그로 출력
	var str = "";
	
	//콜백된 JSON데이터는 객체이므로 "매개변수명.키값" 형태로 파싱할 수 있다.
	console.log("검색결과", d.total);
	
	//items키값의 데이터는 배열이므로 개수만큼 반복이 가능하다.
	/*
		$.each(배열데이터, function(반복 index반환, 반복시 해당 객체 반환)
		반복된 요소들은 하나의 문자열로 만들어준다.
	*/
	$.each(d.items, function(index, item){
		str+="<ul>";
		str+="	<li>"+(parseInt($('#startNum option:selected').val())+index)+"</li>";
		str+="	<li>"+item.title+"</li>";
		str+="	<li>"+item.description+"</li>";
		str+="	<li>"+item.bloggername+"</li>";
		str+="	<li>"+item.bloggerlink+"</li>";
		str+="	<li>"+item.postdate+"</li>";
		str+="	<li><a href='"+item.link+"' target='_blank'> 바로가기<a/></li>";
		str+="</ul>";
	});
	//앞에서 생성된 문자열을 화면에 출력한다
	$('#searchResult').html(str);
}
function errFunc(e) {
	alert("실패: "+e.status);
}
</script>
<style>
	ul{
		border: 2px #cccccc solid;
	}
</style>
</head>
<body>
<div class="container">
	<!-- 
	ajax를 통해 비동기 통신을 구현할 때는 반드시 요청한 페이지에서
	콜백할 데이터가 정상적으로 출력되는지 직접 확인해야한다 (매우중요★★★)
	 -->
	<div class="row">
		<a href="../NaverSearchAPI.do?keyword=한국소프트웨어인재개발원&startNum=1">
			네이버검색정보JSON바로가기
		</a>
	</div>	
	<div class="row">
		<form id="searchFrm">			
			한페이지에 20개씩 노출됨 <br />
			
			<select id="startNum">
				<option value="1">1페이지</option>
				<option value="21">2페이지</option>
				<option value="41">3페이지</option>
				<option value="61">4페이지</option>
				<option value="81">5페이지</option>
			</select>
			
			<input type="text" id="keyword" size="30" value="한국소프트웨어인재개발원" tabindex="1"/>
			<button type="button" class="btn btn-info" id="searchBtn" tabindex="2">
				Naver검색API요청하기
			</button>		
		</form>	
	</div>
	
	<div class="row" id="searchResult">
		요기에 정보가 노출됩니다
	</div>		
</div>
</body>
</html>