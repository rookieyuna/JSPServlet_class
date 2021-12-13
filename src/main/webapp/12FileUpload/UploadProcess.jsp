<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일이 저장될 디렉토리의 물리적 경로 얻어오기
String saveDirectory = application.getRealPath("/Uploads");
//업로드할 파일의 최대용량 설정(만약 파일이 2개라면 둘이 합친용량으로 설정!)
int maxPostSize = 1024 * 1000;
//인코딩 방식 설정
String encoding = "UTF-8";

try{
	/*
	앞에서 준비한 객체를 통해 MultipartRequest 객체를 생성한다.
	객체가 생성됨과 동시에 첨부한 파일은 서버에 업로드 된다.
	만약 예외가 발생된다면 에러이유는 용량 초과가 대부분이다
	*/
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	/*
	파일명이 한글인 경우 서버에서 문제를 일으키는 경우가 있으므로
	영문과 숫자로 변경하는 것이 좋다.
	아래에서 현재날짜시간을 통해 생성된 문자열을 파일명으로 변경한다.
	*/
	//mr객체를 통해 서버에 저장된 파일명을 불러온다.
	String fileName = mr.getFilesystemName("attachedFile");
	//파일명에서 .의 위치를 파악한 후 확장자를 따낸다.
	String ext = fileName.substring(fileName.lastIndexOf("."));
	//현재날짜와 시간 및 밀리세컨즈까지 이용해서 파일명으로 사용할 문자열 생성
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	//파일명과 확장자를 합쳐 저장할 파일명 생성
	String newFileName = now + ext;
	
	//기존의 파일명을 새로운 파일명으로 변경(File.separator - 경로구분기호)
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	//파일을 제외한 나머지 폼값을 받는다. 
	//이때 request 객체를 통해 받는것이 아니라 mr로 받고 있음을 주의해야한다.
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if(cateArray == null){
		cateBuf.append("선택 없음");
	}
	else{
		for(String s:cateArray){
			cateBuf.append(s + ", ");
		}
	}
	
	//DTO객체 생성 및 폼값 설정
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	//DAO객체 생성 및 insert처리
	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	dao.close();
	
	//문제가 없다면 파일리스트로 이동한다.
	response.sendRedirect("FileList.jsp");
}
catch(Exception e){
	e.printStackTrace();
	//문제가 있다면 request영역에 메세지를 저장한 후 메인으로 포워드한다.
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
</head>
<body>

</body>
</html>