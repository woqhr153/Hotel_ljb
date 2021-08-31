<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
#re input, #re select{
    height: 35px;
    
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
    margin-left: 20px;
    text-align: right;
    border: none;    
}
#insert input{
    
    text-align: center;
    font-size: 20px;
    padding: 5px;   
    margin-bottom: 8px;
    width: 62%;
}
a:link { color: black; }
a:visited { color: black; }
 
</style>

<body>
<div id='btn' style= "text-align: right; "><input type="button" value="로그아웃" style="border: none; width:90px; margin-right:100px;"onclick="location.href='/app/logout'"></div>
    <div id="h">
		<a href="/app/booking" style="text-decoration:none;">
			객실관리
		</a>
		<a href="/app/room">
			예약관리
		</a>
    </div>
    
    <div>
        <div id="bo">

            <table id="t1">
                <tr>
                    <td>
                        <div id="re">                       
                            숙박기간
                            <input type="date">~<input type="date"><br>
                            객실분류                        
                            <select  style="width: 245px; font-size: 20px; margin-top: 10px;">
                                <option>All</option>
                                <option>Single</option>
                                <option>Double</option>
                                <option>Family</option>
                                <option>Domitory</option>
                            </select>
                            <input type="button" value="조회" id="btnr">                                                
                        </div>
                        
                        <div id="h2" style="padding-top: 20px; border: none; font-weight: bold; font-size: 30px;">예약가능객실</div>
                        
                        <div style="padding-bottom: 100px;">
                            <table id="t2">                                
                                    <tr><td>객실이름</td><td>객실분류</td><td>수용인원</td><td>숙박비</td></tr>
                                    <tr><td>한라산</td><td>Family</td><td>5</td><td>30000원</td></tr>
                                    <tr><td>금강산</td><td>Family</td><td>5</td><td>30000원</td></tr>
                                    <tr><td>백두산</td><td>Single</td><td>2</td><td>15000원</td></tr>
                                    <tr><td>광덕산</td><td>Double</td><td>3</td><td>25000원</td></tr>                                   
                                    <tr><td>계룡산</td><td>Family</td><td>5</td><td>30000원</td></tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <div id="insert" style="border: none;">
                            객실이름 <input type="text"><br>
                            숙박기간 <input type="date"><br>
                            ~ <input type="date"><br>
                            숙박인원 <input type="number"><br>
                            1박비용 <input type="number"><br>
                            총 숙박비 <input type="text"><br>
                            예약자   <input type="text"><br>
                            전화번호 <input type="tel"><br>
                       </div>
                       <div id='btn' style=" border: none;text-align: center; margin-left: 70px;">
                        <input type="button" value="등록" >
                        <input type="button" value="취소">
                        <input type="button" value="지우기">
                       </div>
                    </td>
                    <td>
                    	
                        <div id="h2" style="margin-left: 70px; border: none; font-weight: bold; font-size: 30px; padding: 0px; padding-bottom: 35px;">예약된 객실</div>
                        <div style="margin-left: 70px; text-align: center;">
                            <table id="t2" style="padding-bottom: 200px;">
                                <tr><td>객실이름</td><td>객실분류</td><td>수용인원</td><td>숙박비</td></tr>
                                <tr><td>가야산</td><td>Family</td><td>5</td><td>30000원</td></tr>
                                <tr><td>성치산</td><td>Family</td><td>5</td><td>30000원</td></tr>
                                <tr><td>속리산</td><td>Single</td><td>2</td><td>15000원</td></tr>
                                <tr><td>장료산</td><td>Single</td><td>2</td><td>15000원</td></tr>
                                <tr><td>장태산</td><td>Double</td><td>3</td><td>20000원</td></tr>
                            </table>
                        </div>
                    </td>
                </tr>
                
                
            </table>
            <div>
                
            </div>
        </div>
    </div>
</body>
</html>