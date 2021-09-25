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
		


	    
		var insertTr = "";

		
		$('#selectBox').on('change', function(){
			
			 
			if($("#selectBox option:selected").val() == '개인') {
				insertTr = "";
				$("#myTable > tbody").remove();
				
				insertTr += "<c:forEach items='${members}' var='member'>";
				insertTr += "<c:if test='${member.membertype == "개인"}'>"
			    insertTr += "<tbody>";
			    insertTr += "<tr>";
			    
			    insertTr += "<td><input type='checkbox' name='mno' value='${member.mno}' /></td>";
			    insertTr += "<td>${member.membertype}</td>";
			    insertTr += "<td>${member.memberid}</td>";
			    insertTr += "<td>${member.membername}</td>";
			    insertTr += "<td>${member.memberaddress}</td>";
			    insertTr += "<td>${member.phone}</td>";
			    insertTr += "<td>${member.email}</td>";
			    insertTr += "<td>${member.cbno}</td>";
			    insertTr += "<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.signdate}"/></td>";
			    insertTr += "<td>${member.drop_tf}</td>";
			    insertTr += "<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.dropdate}"/></td>";
			    
			    insertTr += "</tr>";
			    insertTr += "</tbody>";
			    insertTr += "</c:if>";
			    insertTr += "</c:forEach>";
				
				$("#myTable").append(insertTr);
			} 
			else if($("#selectBox option:selected").val() == '기업') {
				insertTr = "";
				$("#myTable > tbody").remove();
				
				insertTr += "<c:forEach items='${members}' var='member'>";
				insertTr += "<c:if test='${member.membertype == "기업"}'>"
			    insertTr += "<tbody>";
			    insertTr += "<tr>";
			    
			    insertTr += "<td><input type='checkbox' name='mno' value='${member.mno}' /></td>";
			    insertTr += "<td>${member.membertype}</td>";
			    insertTr += "<td>${member.memberid}</td>";
			    insertTr += "<td>${member.membername}</td>";
			    insertTr += "<td>${member.memberaddress}</td>";
			    insertTr += "<td>${member.phone}</td>";
			    insertTr += "<td>${member.email}</td>";
			    insertTr += "<td>${member.cbno}</td>";
			    insertTr += "<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.signdate}"/></td>";
			    insertTr += "<td>${member.drop_tf}</td>";
			    insertTr += "<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.dropdate}"/></td>";
			    
			    insertTr += "</tr>";
			    insertTr += "</tbody>";
			    insertTr += "</c:if>";
			    insertTr += "</c:forEach>";
				
				$("#myTable").append(insertTr);	
				
			} 
			
			else if($("#selectBox option:selected").val() == '전체') {
				insertTr = "";
				$("#myTable > tbody").remove();
				
				insertTr += "<c:forEach items='${members}' var='member'>";
				
			    insertTr += "<tbody>";
			    insertTr += "<tr>";
			    
			    insertTr += "<td><input type='checkbox' name='mno' value='${member.mno}' /></td>";
			    insertTr += "<td>${member.membertype}</td>";
			    insertTr += "<td>${member.memberid}</td>";
			    insertTr += "<td>${member.membername}</td>";
			    insertTr += "<td>${member.memberaddress}</td>";
			    insertTr += "<td>${member.phone}</td>";
			    insertTr += "<td>${member.email}</td>";
			    insertTr += "<td>${member.cbno}</td>";
			    insertTr += "<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.signdate}"/></td>";
			    insertTr += "<td>${member.drop_tf}</td>";
			    insertTr += "<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.dropdate}"/></td>";
			    
			    insertTr += "</tr>";
			    insertTr += "</tbody>";
			    
			    insertTr += "</c:forEach>";
				
				$("#myTable").append(insertTr);	
				
			} 

		});
		
		$('#memberDelBtn').on('click', function(e){
			//e.preventDefault();
			
			if($('input[name=mno]:checked').length > 0) {
				var result = confirm('정말 삭제하시겠습니까?');
				
				if(result) {
					
					var checkboxDelForm = $('#checkboxDelForm');
					
                    checkboxDelForm.attr('action','/admin/delMember');
                    checkboxDelForm.attr('method','POST');
                    
                    checkboxDelForm.submit();
				} else {
					e.preventDefault();
				}//if-else
			} else {
				alert('탈퇴시킬 이용자를 먼저 선택해주세요.');
			}//if-else
			
		});
		
		
	});//end jq
</script>

<style>

	#board {
		margin-top: 50px;
		margin-bottom: 20px;
	}

	table {
		border-collapse: collapse;
	}
	table thead tr th {
		border-top: 3px solid #005bbb;
	}
	tr {
		height: 40px;
	}
	td {
		text-align: center;
	}
	td:nth-child(5) {
		text-align: justify;
	}
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
                    <h2 class="subName">회원관리</h2>
                </div>
                <div class="contentIn">
                	
                	<div id="board">
                	
                		<div id="table">
                			<select id="selectBox">
                				<option value="전체">전체회원</option>
                				<option value="개인">개인회원</option>
                				<option value="기업">기업회원</option>
                			</select>
                		
                			<table id="myTable">
                				<thead>
                					<tr>
                						<th width="2%"><input type="checkbox" /></th>
                						<th width="4%">구분</th>
                						<th width="*">회원ID</th>
                						<th width="8%">회원명</th>
                						<th width="20%">주소</th>
                						<th width="*">연락처</th>
                						<th width="10%">이메일</th>
                						<th width="*">사업자번호</th>
                						<th width="*">가입일</th>
                						<th width="5%">탈퇴여부</th>
                						<th width="*">탈퇴일</th>
                						
                					</tr>
                				</thead>
                				
                				<form id="checkboxDelForm">
	                 				<c:forEach items="${members}" var="member">
	                					
		                				<tbody>
		                					
		                					<tr>
		                						<td><input type="checkbox" name="mno" value="${member.mno}" /></td>
		                						<td>${member.membertype}</td>
		                						<td>${member.memberid}</td>
		                						<td>${member.membername}</td>
		                						<td>${member.memberaddress}</td>
		                						<td>${member.phone}</td>
		                						<td>${member.email}</td>
		                						<td>${member.cbno}</td>
		                						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.signdate}"/></td>
		                						<td>${member.drop_tf}</td>
		                						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${member.dropdate}"/></td>
		                					</tr>
		                						                				
		                				</tbody>
		                					
	                				</c:forEach>
                				</form>
                			
                			</table>
                			
                			<div><button id="memberDelBtn" type="button">탈퇴처리</button></div>
                		
                		</div>
                		
                	</div>
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>