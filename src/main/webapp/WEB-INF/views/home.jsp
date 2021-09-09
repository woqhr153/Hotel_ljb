<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form method="post" action="/app/check_user">

ID: <input type="text" name="uid"><br>
PW: <input type="password" name="pw"><br><br>

<input type="button" value="로그인" id="btnAdd">
<a href="newbie">회원가입</a>
</form>
<div style="color:red">${nonmember}</div><br>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnAdd',function(){
	let pstr= $.trim($('input[name=uid]').val())
	$('input[name=uid]').val(pstr)
	pstr= $.trim($('input[name=pw]').val())
	$('input[name=pw]').val(pstr)
	if($('input[name=uid]').val()==''||$('input[name=pw]').val()=='') {
		alert('ID와 비밀번호를 입력하세요')
	} else {
		$("form").submit()
	}
})

</script>
</body>
</html>