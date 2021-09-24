<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>지페어 코리아</title>

    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/sub.css" rel="stylesheet" type="text/css" />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>

</head>

<script>
	$(function(){
		var obj = $('form');
		obj.attr('action', '/admin/memberList')
		obj.attr('method', 'get')
		
		obj.append('<input type="hidden" name="membertype" value="개인"');

	});//end jq
</script>

<style>

</style>

<script>
    $(function(){
    	var tmp;
    	
        var subName = $('.subName').text();
        
        $('.chk').each(function(index,obj){
            var t = index;
            var o = $(this).text();
            console.log(t + ':' + o)
            if(o == subName) {
            	tmp = t;
            }
        });

        console.log(tmp)
        
        $('#parent').children().eq(tmp).children().css({
            'font-size': '18px',
            'font-weight':'bold',
            'background':'url(/resources/img/side_li_bg.jpg) no-repeat',
            'background-position': 'right center'
        });
        

    })//end jq
</script>
<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">관리페이지</h2>
                <ul id="parent">
                    <li><a class="chk" href="/admin/memberList">회원관리</a></li>
                    <li><a class="chk" href="/admin/memberBoard">회원글관리</a></li>
                    <li><a class="chk" href="/admin/memberReply">회원댓글관리</a></li>
                    <li><a class="chk" href="/admin/apply">참가기업관리</a></li>
                    <li><a class="chk" href="/exhibition/list">전시일정관리</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 관리페이지 > 회원관리 </div>
                    <h2 class="subName"></h2>
                </div>
                <div class="contentIn">
                	
                	<div id="board">
                		
                		<div id="table">
                			<select id="selectBox">
                				<option value="">=회원구분=</option>
                				<option value="개인">개인회원</option>
                				<option value="기업">기업회원</option>
                			</select>
                		
                			<table>
                				<thead>
                					<tr>
                						<th><input type="checkbox" /></th>
                						<th>구분</th>
                						<th>회원ID</th>
                						<th>회원명</th>
                						<th>주소</th>
                						<th>연락처</th>
                						<th>이메일</th>
                						<th>가입일</th>
                						<th>탈퇴여부</th>
                						<th>탈퇴일</th>
                						
                					</tr>
                				</thead>
                				
                				<c:forEach items="${members}" var="member">
                				<tbody>
                					<tr>
                						<td><input type="checkbox" /></td>
                						<td>${member.membertype}</td>
                						<td>${member.memberid}</td>
                						<td>${member.membername}</td>
                						<td>${member.memberaddress}</td>
                						<td>${member.phone}</td>
                						<td>${member.email}</td>
                						<td>${member.signdate}</td>
                						<td>${member.drop_tf}</td>
                						<td>${member.dropdate}</td>
                					</tr>
                				
                				</tbody>
                				</c:forEach>
                			
                			</table>
                		
                		</div>
                		
                	</div>
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>