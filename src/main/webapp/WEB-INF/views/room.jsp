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
</head>
<style>
#h {
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


#t1 tr td div{
    padding: 10px 5px;
    border-color: rgb(105, 103, 103);
    border-style: solid;
    border-radius: 5px;
    font-size: 22px;
}
#roomList option{
    padding: 0px 50px;
    text-align: center;
    font-size: 30px;
}

#btn input{
    margin: 20px;
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

#btnr {
    
    width: 55px;
    border-radius: 5px;
    border: none;
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
    margin-left: 100px;
    text-align: right;
    border: none;    
}
#insert input, #insert select{
    
    text-align: center;
    font-size: 20px;
    padding: 5px;   
    margin-bottom: 20px;
    width: 62%;
}
a:link { color: black; }
a:visited { color: black; }
</style>

<body>
<div id='btn' style= "text-align: right; "><input type="button" value="로그아웃" style="border: none; width:90px; margin-right:100px;"onclick="location.href='/app/logout'"></div>
    <div id="h">
		<a href="/app/booking" >
			객실관리
		</a>
		<a href="/app/room" style="text-decoration:none;">
			예약관리
		</a>
    </div>

    <div>
        <div id="bo">

            <table id="t1">
                <tr>
                    <td>
                                              
          
                        <div id="h2" style="padding: 50px 0px; border: none; font-weight: bold; font-size: 30px;">객실목록</div>
                        
                        <div style="padding-bottom: 130px; border:none;">
                            <select size=10 id="roomList" >
                            	<c:forEach items="${list}" var="room">
                            		<option value="${room.roomcode}">
                            			${room.roomcode}, ${room.roomname}, ${room.typename}, ${room.howmany}, ${room.howmuch}
                            		</option>                 		
                            	</c:forEach>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div id="insert" style="border: none; padding-top: 80px;">
                            객실이름 <input type="text" id="txtName"><br>
                            
                            객실분류 <select style="width: 66%; text-align: left;" id="selType">
                                    <c:forEach items="${type}" var="type">
                            		<option value="${type.name}">
                            			${type.name}
                            		</option>                 		
                            	</c:forEach>
                                </select><br>
                            수용인원 <input type="number" id="txtNum"><br>
                            1박비용 <input type="number" id="txtPrice"><br>
                       </div>
                       <div id='btn' style=" border: none;text-align: center; margin-left: 100px;">
                        <input type="button" value="등록" >
                        <input type="button" value="삭제">
                        <input type="button" value="지우기">
                       </div>
                    </td>
                   
                </tr>
                
                
            </table>
            <div>
                
            </div>
        </div>
    </div>
    )
    <script src='https://code.jquery.com/jquery-3.5.0.js'></script>
    <c:forEach items="${list}" var="room">
 		<script>
	 	$(document)
	    .on('click','#roomList',function() {
	    	if($('#roomList').val()=="${room.roomcode}") {
	    			$("#selType").val("${room.typename}")   		
		    		$('#txtName').val("${room.roomname}")
		    		$('#txtNum').val("${room.howmany}")
		    		$('#txtPrice').val("${room.howmuch}")
	    	}	    	
	    })
	 	</script>
	 	
 	</c:forEach >
 	
</body>
</html>