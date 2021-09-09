<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method="post" action="/app/signin">
이름: <input type="text" name="name"><br>
ID: <input type="text" name="uid"><br>
PW: <input type="password" name="pw"><br>
PW 확인: <input type="password" name="pwCheck"><br><br>
<input type="button" onclick="location.href='/app'" value="취소">
<input type="button" value="등록" id="btnAdd">
</form>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnAdd',function(){
	if($('input[name=name]').val()=='') {
		alert('이름을 입려가시오')
		return false
	}
	if($('input[name=uid]').val()=='') {
		alert('아이디를 입려가시오')
		return false
	}
	if($('input[name=pw]').val()=='') {
		alert('비밀번호를 입려가시오')
		return false
	}
	if($('input[name=pw]').val()==$('input[name=pwCheck]').val()) {
		$("form").submit()
	} else {
		alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.')
	}
})
</script>
</body>
</html>