<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
#btnAdd,#btnCancle {
    margin: 10px;
    margin-top: 30px;   
    height: 40px;
    width: 70px;
    border-radius: 5px;
    border: none;
    background-color: rgb(48, 139, 214);
    color: white;
    font-weight: bold;
    font-size: 20px;
    cursor: pointer;
}
input {
	width: 250px;
	height: 30px;
	margin-top:5px;
}
#re{  
 	position: absolute;
    font-size: 15px;
    width:99%;
    padding-top:300px;
    text-align:center;
}
</style>
<body>
<div id="re">
<form method="post" action="/app/signin">
<input type="text" name="name" placeholder="이름" ><br>
<input type="text" name="uid" placeholder="아이디" ><br>
<input type="password" name="pw" placeholder="비밀번호" ><br>
<input ptype="password" name="pwCheck" placeholder="비밀번호 확인" ><br><br>
<input type="button" id="btnCancle" onclick="location.href='/app'" value="취소">
<input type="button" value="등록" id="btnAdd">
</form>
</div>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnAdd',function(){
	if($('input[name=name]').val()=='') {
		alert('이름을 입력하시오')
		return false
	}
	if($('input[name=uid]').val()=='') {
		alert('아이디를 입력하시오')
		return false
	}
	if($('input[name=pw]').val()=='') {
		alert('비밀번호를 입력하시오')
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