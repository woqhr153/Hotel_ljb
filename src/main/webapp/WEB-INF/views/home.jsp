<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
#btnAdd {
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
<form method="post" action="/app/check_user">
<input type="text" name="uid" placeholder="아이디"><br>
<input type="password" name="pw" placeholder="비밀번호" ><br><br>
<input type="button" value="로그인" id="btnAdd">
<a href="newbie">회원가입</a>
</form>
<div style="color:red">${nonmember}</div><br>
</div>
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