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
</head>
<style>
#h {
	position: absolute;
    padding: 35px 0px;
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


#re{
    padding: 10px 20px;
    border-color: rgb(105, 103, 103);
    border-style: solid;
    border-radius: 5px;
    font-size: 22px;
}

#btn input, #logout{
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
#btn{
	width:400px;
	text-align: center; 
	margin-left: 70px;
	position: absolute;
}
#re input, #re select{
    height: 35px;
    
}
#btnr {
    cursor: pointer;
    width: 55px;
    border-radius: 5px;
    border:none;
    background-color: rgb(48, 139, 214);
    color: white;
    font-weight: bold;
    font-size: 20px;
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
option{
    padding: 0px 10px;
    text-align: center;
    font-size: 20px;
}
</style>

<body>
<div style="text-align:right">
<input type="button" id="logout" value="로그아웃" style="width:90px; margin-right:100px;"onclick="location.href='/app/logout'">
</div>
    <div id="h">
		<a href="/app/booking" style="text-decoration:none;">
			예약관리
		</a>
		<a href="/app/room">
			객실관리
		</a>
    </div>
    
    <div style="padding-top:150px">
        <div id="bo">

            <table id="t1">
                <tr>
                    <td>
                        <div id="re" style="position: absolute;">                       
                            숙박기간
                            <input type="date" id="stdate">~<input type="date" id='enddate'><br>
                            객실분류                        
                            <select  id="typeList"style="width: 245px; font-size: 20px; margin-top: 10px;">
                                <c:forEach items='${type}' var='type'>
                                	
                                	<option value="${type.typecode}">
                            			${type.name}
                            		</option>  
                                </c:forEach>
                            </select>
                            <input type="button" value="조회" id="btnr">                                                
                        </div>
                        
                        <div id="h2" style="padding-top: 140px; padding-bottom: 10px; font-weight: bold; font-size: 30px;">예약가능객실</div>
                        
                        <div>
                            <select size=10 id="roomList" name="roomList" style='width:450px; height:400px'>
                           
                            </select>
                        </div>
                    </td>
                    <td>
                        <div id="insert">
                            객실이름 <input type="text" id="txtName" readonly><br>
                            <input type="hidden" id="bookcode">
                            <input type="hidden" id="roomcode">
                	객실분류 <input type="text" id="selType" readonly><br>
                            숙박기간 <input type="date" id="checkIn" readonly><br>
                            ~ <input type="date" id="checkOut" readonly><br>
                            숙박인원 <input type="number"id="person"><br>
                            최대인원 <input type="number"id="txtNum" readonly><br>
                            1박비용 <input type="number" id="txtPrice" readonly><br>
                            총 숙박비 <input type="number" id="totalPrice" readonly><br>
                            예약자   <input type="text" id="booker"><br>
                            전화번호 <input type="tel" id="mobile"><br>
                       </div>
                       <div id='btn' >
                        <input type="button" value="등록" id="btnAdd">
                        <input type="button" value="예약취소" id="btnCancle" style="width:100px">
                        <input type="button" value="지우기" id='btnEmpty'>
                       </div>
                    </td>
                    <td>
                    	
                        <div id="h2" style="margin-left: 70px; ; font-weight: bold; font-size: 30px; padding: 0px; padding-bottom: 15px;">예약된 객실</div>
                        <div style="margin-left: 70px; ; text-align: center;">
                            <select id="bookingList" size ="15" style='width:500px; height:525px'>
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
 				str='<option value="'+value['roomcode']+'">'+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
 				$('#roomList').append(str);
 				
 			})
 			
 		},'json')
 		$.post("http://localhost:8080/app/getBookList",{checkin:date1,checkout:date2,typecode:typecode},function(result){
 			$('#bookingList').empty()
 			console.log(result);
 			$.each(result,function(ndx,value){
 				str='<option value="'+value['bookcode']+'">'+value['roomname']+','+value['typename']+','+value['person']+'/'+value['howmany']+','+value['checkin']+'~'+value['checkout']+','+value['howmuch']+','+value['booker']+','+value['mobile']+'</option>';
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
 		$('#roomcode').val($(this).val())
 		$('#bookcode').val('')
 		let str=$(this).text() 		
 		let ar = str.split(',') 		
 		$('#txtName').val(ar[0])
 		$('#selType').val(ar[1])
 		$('#person').val(1)
 		$('#txtNum').val(ar[2])
 		$('#txtPrice').val(ar[3]) 		
 		$('#checkIn').val($('#stdate').val())
 		$('#checkOut').val($('#enddate').val())
 		$('input[type=date]').trigger('change');
 		
 	})
 	.on('click','#bookingList option:selected',function() {
 		$('#bookcode').val($(this).val())
 		let str=$(this).text() 		
 		let ar = str.split(',')  		
 		let n = ar[2].split('/')
 		let date =ar[3].split('~')		
 		$('#txtName').val(ar[0])
 		$('#selType').val(ar[1])
 		$('#person').val(n[0])
 		$('#txtNum').val(n[1])
 		
 		$('#checkIn').val(date[0])
 		$('#checkOut').val(date[1])
 		$('#txtPrice').val(ar[4]) 
 		$('#booker').val(ar[5])
 		$('#mobile').val(ar[6])
 		$('input[type=date]').trigger('change');
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
 	
</body>
</html>