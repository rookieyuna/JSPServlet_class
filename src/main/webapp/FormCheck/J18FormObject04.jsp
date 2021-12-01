<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J18FormObject04.jsp</title>
    <script>
        //매개변수를 통해 form태그의 DOM객체 사용 가능
        var isValidate = function(frm){
            //아이디: 입력값이 있는지 검증. 빈값이면 경고창
            if(frm.id.value==''){
                alert('아이디를 입력하세요');
                frm.id.focus();
                return false;
            }
            if(!frm.pwd.value || !frm.pwd2.value){
                alert('패스워드를 입력하세요');
                return false;
            }
            //비밀번호 입력값이 동일한지 검증. 틀리면 경고창+기존입력value삭제
            if(frm.pwd.value != frm.pwd2.value){
                alert('입력한 패스워드가 다릅니다.');
                frm.pwd.value="";
                frm.pwd2.value="";
                frm.pwd.focus();
                return false;
            }
            /*
            checkbox와 radio는 기본적으로 value속성값을 가지고 있으므로
            입력 값에 대한 검증 아니라, 선택여부에 대한 검증
            */
            var isGender = false;
            //라디오 갯수만큼 반복한다. DOM을 통해 갯수를 알 수 있다.
            for(var i=0; i<frm.gender.length; i++){
                //체크된 항목이 있는지 확인..
                if(frm.gender[i].checked==true){
                    //있다면 true로 값 변경 후 루프 탈출
                    isGender=true;
                    //radio는 하나만 선택할 수 있으므로 추가확인 불필요
                    break;
                }
            }
            //성별을 체크하지 않았다면 경고창
            if(isGender != true){
                alert("성별을 선택해 주세요");
                //라디오에는 여러항목이 있으므로 focus()를 사용할 때 인덱스 사용
                frm.gender[0].focus();
                return false
            }
            /*
            checkbox는 여러 개를 선택할 수 있으므로 체크된 항목을
            카운트하여 검증한다.
            */
            var checkCount = 0;
            for(var i=0; i<frm.inter.length; i++){
                if(frm.inter[i].checked==true){
                    //체크된 항목을 확인하면 1증가시킨다.
                    checkCount++;
                }
            }
            if(checkCount<2){
                alert("관심사항을 2개 이상 선택해주세요");
                frm.inter[0].focus();
                return false;
            }
            /*
            select태그의 경우
                defalut가 value 값이 있을 때
                    => selectedIndex를 사용하여 체크한다.
                defalut가 value 값이 없을 때
                    => input과 동일하게 value속성으로 빈값을 체크한다.
            */
            if(frm.grade1.selectedIndex==0){
                alert("학력을 선택하세요");
                frm.grade1.focus();
                return false;
            }
            
            if(frm.grade2.value==""){
                alert("학력을 선택하세요");
                frm.grade2.focus();
                return false;
            }

            if(frm.userfile.value==""){
                alert("첨부파일을 선택하세요");
                frm.userfile.focus();
                return false;
            }
            /*
            textarea는 자체적인 value속성을 입력하면 텍스트로 입력되지 않으나,
            JS에서 DOM객체를 통해 입력값에 접근할때는 value 속성을 사용한다.
            */
            if(frm.intro.value==""){
                alert("자기소개를 입력하세요");
                frm.intro.focus();
                return false;
            }
        }
        //아이디 중복확인 버튼 클릭시 
        function idCheck(fn){
            //아이디가 입력되지 않은 상태라면
            if(fn.id.value===""){
                alert("아이디를 입력 후 중복 확인 누르슈");
                fn.id.focus();
            }
            else {
                /*
                중복확인 후 검증된 id를 수정할 수 없도록 readOnly 속성 추가
                사용자는 중복확인창 script를 통해서만 수정이 가능하다.
                */
                fn.id.readOnly = true; 
                /*
                부모창에서 입력된 아이디를 파라미터로 팝업창 전달
                이때 파라미터명(name)은 id이고 전달되는 값은 입력한 value값이다
                */
                window.open("./id_overapping.jsp?id="+fn.id.value, 
                    "idover", "width=500,height=400");
            }
        }
    </script>
</head>
<body>
<h2>회원가입 페이지</h2>
<form name="registFrm" onsubmit="return isValidate(this);">
<!-- table>tr*9>td*2 -->
<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td>아이디</td>
		<td>
            <input type="text" name="id" size="20" />
            <button type="button" onclick="idCheck(this.form);">아이디중복확인</button>
		</td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td>
            <input type="password" name="pwd" size="25" />
		</td>
	</tr>
	<tr>
		<td>패스워드확인</td>
		<td>
            <input type="password" name="pwd2" size='25' />
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
            <input type="radio" name="gender" value="man" />남
            <input type="radio" name="gender" value="woman"/>여
            <input type="radio" name="gender" value="trans" />트랜스젠더
		</td>
	</tr>
	<tr>
		<td>관심사항(2개선택)</td>
		<td>
            <label>
            <input type="checkbox" name="inter" value="pol" />정치
            </label>

            <input type="checkbox" name="inter" value="eco" 
                id="ec"/><label for="ec">경제</label>

            <input type="checkbox" name="inter" value="spo" 
                id="sp"/><label for="sp">스포츠</label>

            <input type="checkbox" name="inter" value="ent" 
                id="en"/><label for="en">연예</label>
		</td>
	</tr>
	<tr>
		<td>최종학력</td>
		<td>
        <select name="grade1">
            <option value="noValue">--선택하세요(값있음)--</option>
            <option value="ele">초등학교</option>
            <option value="mid">중학교</option>
            <option value="high">고등학교</option>
            <option value="uni">대학교</option>
        </select>		
        &nbsp;
        <select name="grade2">
            <option value="">--선택하세요(값없음)--</option>
            <option value="ele">초등학교</option>
            <option value="mid">중학교</option>
            <option value="high">고등학교</option>
            <option value="uni">대학교</option>
        </select>
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
            <input type="file" name="userfile" size="40"/>		
		</td>
	</tr>
	<tr>
		<td>자기소개</td>
		<td>
            <textarea name="intro" cols="30" rows="10" value="나는 누구? 나는 내용??"></textarea>	
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<button type="submit">회원가입하기</button>
			&nbsp;&nbsp;
			<button type="reset">RESET</button>
		</td>
	</tr>
</table>
</form>
</body>

</html>