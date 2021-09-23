<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약관리</title>
    
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



#t2 tr td{
    padding-right: 18px;
    text-align: center;
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
 padding:10px;
 font-weight: bold;
}
#roomList option,#bookingList option {
	font-size:22px;
}
.input-group input{
	text-align:center;
}
</style>

<body class="hold-transition" style="background-color:#e9ecef">
	<div  style="width:99%; font-size:55px; text-align:center; margin-bottom:-50px">
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
                    
              </div>
                        <div id="re" class="card input-group" style="width:400px" >                    
                           	<div> 숙박기간
                            	<input type="date" id="stdate"class="form-control">~<input type="date" id='enddate'class="form-control"><br>
                            </div>  
                            <div >객실분류
	                            <select  id="typeList"  class="form-control">
	                                <c:forEach items='${type}' var='type'>
	                                	
	                                	<option value="${type.typecode}">
	                            			${type.name}
	                            		</option>  
	                                </c:forEach>
	                            </select>
                           
	                            <input type="button" value="조회" id="btnr" class="btn btn-primary btn-block" style="margin-top:10px"> 
                            </div>
                                                                           
                        </div>
                        <div style="width:400px">
	                        <p class="login-box-msg" style="font-size:30px;">예약가능 객실</p>
							<select class="form-control"  size=8 id="roomList" name="roomList" style='height:300px;'>
	                           
	                            </select>
	                       </div>
	                            
	                        
                    </td>
                    <td>
                        <div  id="re" class="card" style="margin-left:70px; width:450px;">
                        	<div>
                        		<p class="login-box-msg" style="font-size:22px">예약정보</p>
                        	</div>
                        <div class="input-group mb-3" > 객실이름 &nbsp;
                            <input type="text" id="txtName" class="form-control"  readonly><br>
                        </div>    
                        
                            <input type="hidden" id="bookcode" class="form-control">
                            <input type="hidden" id="roomcode" class="form-control">
                         <div class="input-group mb-3" > 객실타입    &nbsp;                     	
                            	<input type="text" id="selType" class="form-control" readonly><br>
                         </div> 
                         <div class="input-group mb-3" >숙박기간&nbsp;
                             <input type="date" id="checkIn" class="form-control"  readonly>~ <br>
                            <input type="date" id="checkOut" class="form-control" readonly><br>
                         </div>  
                         <div class="input-group mb-3" >숙박인원&nbsp;
                             <input type="number"id="person" class="form-control"><br>
                         </div>
                         <div class="input-group mb-3" >최대인원&nbsp;
                            <input type="number"id="txtNum"  class="form-control"readonly><br>
                         </div> 
                         <div class="input-group mb-3" >1박 비용  &nbsp;
                             <input type="number" id="txtPrice"  class="form-control"readonly><br>
                         </div>
                         <div class="input-group mb-3" >총숙박비&nbsp;
                             <input type="number" id="totalPrice" class="form-control"readonly><br>
                         </div>
                         <div class="input-group mb-3" >예약자명&nbsp;
                              <input type="text" id="booker" class="form-control"><br>
                          </div>
                          <div class="input-group mb-3" >  전화번호&nbsp;
                             <input type="tel" id="mobile" class="form-control"><br>
                       	</div>
	                       	<div>
	                        <input type="button" value="등록" id="btnAdd" class="btn btn-primary btn-block">
	                        <input type="button" value="예약취소" id="btnCancle"class="btn btn-primary btn-block">
	                        <input type="button" value="지우기" id='btnEmpty' class="btn btn-primary btn-block">
	                       </div>
                       </div>
                       
                       
                    </td>
                    <td>
                    	
                        <p class="login-box-msg" style="font-size:30px; margin-top:-10px">예약된 객실</p>
                        <div style="margin-left: 70px; ; text-align: center;">
                            <select class="form-control" id="bookingList" size ="15" style='width:500px; height:605px'>
                          <%--  <c:forEach items="${list}" var="list">
                            	<option value="${list.bookcode}">${list.roomname},${list.person}/${list.howmany},${list.checkIn}~${list.checkOut},${list.booker}</option>
                            </c:forEach> --%>
                            </select>
                        </div>
                    </td>
                </tr>
                
                
            </table>
            <div>
                
            </div>
        </div>
    </div>
    <script src='https://code.jquery.com/jquery-3.5.0.js'></script>
    <script>  
    
 	$(document)
 	.on('click','#btnr',function () {
 		let typecode = $('#typeList').val()
 		let date1 = $('#stdate').val()
 		let date2 = $('#enddate').val()
 		
 		
 		$.post("http://localhost:8080/app/getRoomList",{checkin:date1,checkout:date2,typecode:typecode},function(result){
 			$('#roomList').empty()
 			
 			$.each(result,function(ndx,value){
 				str='<option value="'+value['roomcode']+'">'+value['roomname']+'('+value['typename']+') '+value['howmany']+'명 '+value['howmuch']+'원</option>';
 				$('#roomList').append(str);
 				
 			})
 			
 		},'json')
 		$.post("http://localhost:8080/app/getBookList",{checkin:date1,checkout:date2,typecode:typecode},function(result){
 			$('#bookingList').empty()
 			console.log(result);
 			$.each(result,function(ndx,value){
 				str='<option value="'+value['bookcode']+'">'+value['booker']+' '+value['roomname']+'('+value['typename']+') '+value['person']+'명 총 '+value['total']+'원</option>';
 				$('#bookingList').append(str);
 				console.log(str);
 			})
 		},'json')
 	})
 	.on('change','input[type=date]',function() {
 			
	 		let date1 = new Date($('#stdate').val())
	 		let date2 = new Date($('#enddate').val())
	 		if(date1 > date2) {
	 			alert("체크인 날짜가 체크아웃 날짜보다 나중일 수 없습니다")
	 			return false
	 		}
	 		var diff = Math.abs(date1.getTime() - date2.getTime());
			diff = Math.ceil(diff / (1000 * 3600 * 24));
			$('#totalPrice').val(diff*$('#txtPrice').val())
		
 	})
 	
 	.on('click','#roomList option',function() {
 		
 		let str=$(this).text() 		
 		let ar = str.split(',') 		
 		$('#txtName').val(ar[0])
 		$('#selType').val(ar[1])
 		
 		$('#txtNum').val(ar[2])
 		$('#txtPrice').val(ar[3]) 		
 		
 		
 	})
 	
 	.on('click','#btnEmpty',function(){
 		$('#txtName').val('')
 		$('#selType').val('')
 		$('#person').val('')
 		$('#txtNum').val('')
 		$('#checkIn').val($('#stdate').val())
 		$('#checkOut').val($('#enddate').val())
 		$('#txtPrice').val('') 
 		$('#booker').val('')
 		$('#mobile').val('')
 		$('#totalPrice').val('');
 	})
 	.on('click','#btnAdd',function () { 
 		let date1 = $('#checkIn').val()
 		let date2 = $('#checkOut').val()
 		console.log(date1,date2)
 		if($('#txtName').val()=='' || $("#person").val()=='' ||$('#checkIn').val()=='' || $('#checkOut').val()==''|| $('#bookUser').val()==''|| $('#mobile').val()=='') {
	 			alert('값을 모두 입력하시오')
	 			return false
	 		}
 		
 		if(parseInt($("#person").val())>parseInt($('#txtNum').val())) { 
 			
 			alert("최대숙박인원을 초과하였습니다") 		
 			return false
 			}
 		if($('#bookcode').val()=='') { //insert
 			
			$.post("http://localhost:8080/app/addBook",{roomcode:$('#roomcode').val(),person:$('#person').val(),checkIn:date1,checkOut:date2,booker:$('#booker').val(),mobile:$('#mobile').val(),total:$('#totalPrice').val()},function(result){
				location.reload();
			},'text') 
 		} else { //update
 			$.post("http://localhost:8080/app/updateBook",{bookcode:$('#bookcode').val(),person:$('#person').val(),booker:$('#booker').val(),mobile:$('#mobile').val()},function(result){
 				location.reload();
			},'text') 	
 		}		
 		
 		
 		

 	})
 	.on('click','#btnCancle',function() {
 		$.post("http://localhost:8080/app/deleteBook",{bookcode:$('#bookcode').val()},function(result){
 			if(result=='ok') {
 				$('#btnEmpty').trigger('click');
 				$('#bookingList option:selected').remove();
 			}
 		},'text');		
 	})
 	</script>
 	<c:forEach items="${list}" var="room">
 		<script>
	 	$(document)
	    .on('click','#roomList',function() {
	    	if($('#roomList').val()=="${room.roomcode}") {
		    		$('#roomcode').val($(this).val())
		     		$('#bookcode').val('')
	    			$("#selType").val("${room.typename}")   		
		    		$('#txtName').val("${room.roomname}")
		    		$('#txtNum').val("${room.howmany}")
		    		$('#txtPrice').val("${room.howmuch}")
		    		$('#person').val(1)
		    		$('#checkIn').val($('#stdate').val())
 					$('#checkOut').val($('#enddate').val())
 					$('input[type=date]').trigger('change')
	    	}	    	
	    })
	 	</script>	 
	 		
 	</c:forEach >
 	<c:forEach items="${booklist}" var="book">
 		<script>
	 	$(document)
	    .on('click','#bookingList',function() {
	    	if($('#bookingList').val()=="${book.bookcode}") {
	    		$('#bookcode').val($(this).val())
	    		$('#txtName').val("${book.roomname}")
	    		$('#selType').val("${book.typename}")
	    		$('#person').val("${book.person}")
 				$('#txtNum').val("${book.howmany}")
 				$('#txtPrice').val("${book.howmuch}") 
 				$('#checkIn').val("${book.checkIn}")
 				$('#checkOut').val("${book.checkOut}")
 				$('#booker').val("${book.booker}")
 		 		$('#mobile').val("${book.mobile}")
 		 		$('input[type=date]').trigger('change');
	    	}	    	
	    })
	 	</script>	 
	 		
 	</c:forEach >
 	
</body>
</html>