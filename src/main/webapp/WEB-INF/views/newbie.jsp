<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method="get" action="/app">
이름: <input type="text" name="name"><br>
ID: <input type="text" name="uid"><br>
PW: <input type="password" name="pw"><br>
PW 확인: <input type="password" name="pwCheck"><br>
모바일: <input type="tel" name="mobile"><br><br>
<input type="button" onclick="location.href='/app'" value="취소">
<input type="submit" value="등록">
</form>
</body>
</html>