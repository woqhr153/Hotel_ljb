<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Hotel_LJB | Login</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/admin/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
  	<b>Hotel</b>LJB</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">로그인</p>

      <form action="/app/check_user" method="post">
        <div class="input-group mb-3">
          <input type="text" name="uid" class="form-control" placeholder="아이디" >
          <div class="input-group-append">
            <div class="input-group-text">
              <i class="fas fa-portrait"></i>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="pw" class="form-control" placeholder="비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <i class="fas fa-lock"></i>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div id="msg" class="icheck-primary" style="color:red; font-size:11px;">
            		${nonmember}			
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="button" class="btn btn-primary btn-block" id="btnAdd">로그인</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <p class="mb-0">
        <a href="newbie" class="text-center">회원가입</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnAdd',function(){
	let pstr= $.trim($('input[name=uid]').val())
	$('input[name=uid]').val(pstr)
	pstr= $.trim($('input[name=pw]').val())
	$('input[name=pw]').val(pstr)
	if($('input[name=uid]').val()==''||$('input[name=pw]').val()=='') {
		$('#msg').text('아이디와 비밀번호를 입력해주세요')
	} else {
		$("form").submit()
	}
})
</script>
</body>
</html>
