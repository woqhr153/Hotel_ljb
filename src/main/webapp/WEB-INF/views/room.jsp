<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>객실관리</title>
    
      <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/admin/dist/css/adminlte.min.css">
</head>
<style>
#h {
	position: absolute;
    padding-top: 85px;
    }
#h a{
    font-size: 35px;
    font-weight:bold;
    padding: 20px;   
}

#bo {
    font-size: 17px;
    padding: 20px;
    padding-right: 15px;
}




#btn input{
    margin: 10px;
    margin-top: 30px;   
    height: 40px;
    width: 70px;
    border-radius: 5px;
    border:none;
    background-color: rgb(48, 139, 214);
    color: white;
    font-weight: bold;
    font-size: 20px;
    cursor: pointer;
}

#insert {
	
    margin-left: 20px;
    text-align: right;
   	width:400px;
}
#insert input{
    text-align: center;
    font-size: 20px;
    padding: 5px;   
    margin-bottom: 8px;
    width: 250px;
}
a:link { color: black; }
a:visited { color: black; }
#re {
 padding:20px;
 margin-top:80px;
 font-weight: bold;
}
.input-group input,.input-group select{
	text-align:center;
}
</style>

<body class="hold-transition" style="background-color:#e9ecef">
	<div style=" width:99%; font-size:55px; text-align:center; margin-bottom:-50px">
    	<b>Hotel</b>
    </div>
<div id="h">
		<a href="/app/booking"">
			예약관리
		</a>
		<a href="/app/room">
			객실관리
		</a>
		<input type="button" id="logout"  class="btn btn-primary" value="로그아웃" style="width:90px;"onclick="location.href='/app/logout'">		
    </div>
    
    <div style="padding-top:150px">
        <div id="bo">

            <table id="t1">
                <tr>
                    <td>      
                                             
                        <div style="marign-top:30px">
                        	<p class="login-box-msg" style="font-size:30px;">객실목록</p>
                            <select  size=7 id="roomList" class="form-control" name="roomList" style="width:420px; height:440px; font-size:22px;">
                            	<%-- <c:forEach items="${list}" var="room">
                            		<option value="${room.roomcode}">${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>                 		
                            	</c:forEach> --%>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div id="re" class="card" class="card" style="margin-left:120px; width:450px;">
	                        <div>
                        		<p class="login-box-msg" style="font-size:22px">객실정보</p>
                        	</div>
	                        <div class="input-group mb-3"> 객실이름&nbsp;  
	                             <input type="text" id="txtName" class="form-control"><br>
	                        </div>
	                            <input type="hidden" id="roomcode">
	                         <div class="input-group mb-3">객실분류&nbsp;    
	                            <select id="selType" class="form-control">
								<c:forEach items="${type}" var="type">
	                            		<option value="${type.typecode}">
	                            			${type.name}
	                            		</option>                 		
	                            </c:forEach>
	                       </select><br>
	                       </div>
	                       <div class="input-group mb-3">수용인원&nbsp; 
	                            <input type="number" id="txtNum" class="form-control"><br>
	                       </div>    
	                       <div class="input-group mb-3">1박 비용&nbsp;
	                             <input type="number" id="txtPrice" class="form-control"><br>
	                       </div>
	                       <input type="button" value="등록" id="btnAdd" class="btn btn-primary btn-block">
	                       <input type="button" value="삭제" id="btnDelete" class="btn btn-primary btn-block">
	                       <input type="button" value="지우기" id="btnEmpty" class="btn btn-primary btn-block">
                       </div>                    
                    </td>
                   
                </tr>
                
                
            </table>
            <div>
                
            </div>
        </div>
    </div>
    
    <script src='https://code.jquery.com/jquery-3.5.0.js'></script>
    
<c:forEach items="${list}" var="room">
 		<script>
	 	$(document)
	    .on('click','#roomList',function() {
	    	if($('#roomList').val()=="${room.roomcode}") {
	    			$("#selType").val("${room.typename}") 
	    			$('#selType option:contains("${room.typename}")').prop('selected',true)
		    		$('#txtName').val("${room.roomname}")
		    		$('#txtNum').val("${room.howmany}")
		    		$('#txtPrice').val("${room.howmuch}")
		    		$('#roomcode').val($(this).val())
	    	}	    	
	    })
	 	</script>	 	
 	</c:forEach >
 	<script>
 	$(document).ready(function () {
 		$.post("http://localhost:8080/app/getRoom_List",{},function(result){
 			console.log(result);
 			$.each(result,function(ndx,value){
 				str='<option value="'+value['roomcode']+'">'+value['roomname']+'('+value['typename']+') '+value['howmany']+'명 '+value['howmuch']+'원</option>';
 				$('#roomList').append(str);
 				console.log(str);
 			})
 			
 		},'json')
 	})
 	$(document)
 	.on('click','#btnEmpty',function() {
 		$("#selType").val("")		
		$('#txtName').val("")
		$('#txtNum').val("")
		$('#txtPrice').val("")
 	})
 	
 	.on('click','#btnDelete',function() {
 		$.post("http://localhost:8080/app/deleteRoom",{roomcode:$('#roomcode').val()},function(result){
 			console.log(result)
 			if(result=='ok') {
 				$('#btnEmpty').trigger('click');
 				$('#roomList option:selected').remove();
 			}
 		},'text');		
 	})
 	.on('click','#btnAdd',function() {
 		if($('#txtName').val()=='' || $("#selType").val()=='' ||$('#txtNum').val()=='' || $('#txtPrice').val()=='') {
 			alert('값을 모두 입력하시오')
 			return false
 		}
 		if($("#roomcode").val()=='') { // insert
 			$.post("http://localhost:8080/app/addRoom",
 				{roomname:$('#txtName').val(),roomtype:$("#selType").val(),howmany:$('#txtNum').val(),howmuch:$('#txtPrice').val()},function(result){
 			if(result=='ok') {
 				location.reload();
 			}
 			},'text')
 		} else {// update
 			$.post("http://localhost:8080/app/updateRoom",
 				{roomcode:$('#roomcode').val(),roomname:$('#txtName').val(),roomtype:$("#selType").val(),howmany:$('#txtNum').val(),howmuch:$('#txtPrice').val()},function(result){
 			if(result=='ok') {
 				location.reload();
 			}
 			},'text')
 		}
 		
 	})
 	</script>
</body>
</html>