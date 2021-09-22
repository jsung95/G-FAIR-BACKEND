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

<style>
#wrap {
    margin: 0;
    width: 100%
    align-items: center;
    
}
body,input,textarea,select,button,table{
	font-family:'noto-sans';
	font-size:12px; 
	color:#333;
	}
.wraper {
    width: 1200px;
    margin-top: 50px;
    border-top: 2px solid #005bbb;
}

#table {
 
    width: 1200px;
}

#first{
    height:40px;
    text-align: left;
    font-size: 20px;
}

#first :nth-child(2){
    width: 150px;
}

#second{
    height: 40px;
    background-color: #eee;
    font-size:15px
}
tr#space{
    height: 10px;
    border-bottom: 2px solid #eee;
    border-top: 2px solid #eee;
}

tr#three td {
    padding: 30px 0 30px 10px;
    font-size: 15px;
    border-top: 1px solid #eee

}

div#btn {
    border-top: 1px solid #eee;
    margin-top: 5px;
    padding-top: 20px;
}

button {
    margin: 0;
}

#modifyBtn , #listBtn {
    height: 40px;
    width: 100px;
    text-align: center;
    background-color: #005bbb;
    color: #fff;
    font-size: 15px;
    
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
        
        $('#listBtn').on('click',function () {
            location.href= location.href="/news/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
        });
        
        $('#modifyBtn').on('click', function(){
          console.log("modifyBtn button clicked"); 
          
          location.href="/news/modify?bno=${board.bno}"
          
         });// .onclick  
    })//end jq
</script>

<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">고객센터</h2>
                <ul id="parent">
                    <li><a class="chk" href="/notice/list">공지사항</a></li>
                    <li><a class="chk" href="/news/listPerPage">보도자료</a></li>
                    <li><a class="chk" href="/question/list">질문게시판</a></li>
                    <li><a class="chk" href="/often/question">자주묻는질문</a></li>
                    <li><a class="chk" href="/anony/list">고객의소리</a></li>
                    <li><a class="chk" href="/free/board">자유게시판</a></li>
                    <li><a class="chk" href="/event/listPerPage">이벤트</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > 보도자료 </div>
                    <h2 class="subName">보도자료</h2>
                </div>
            <div class="contentIn">
                	<div class="wraper">
                        <form action="#">
                            <table id="table">
                                <tr id="first">
                                    <td colspan="2">&nbsp${board.title}</td>
                                    <td>작성자 :
                                    ${board.memberid}</td>
                                </tr>
                                <tr id="second">
                                    <td colspan="2">&nbsp&nbsp 등록일:
                                    <fmt:formatDate pattern="yyyy/MM/dd" value="${board.insert_ts}"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    수정일 :
                                    <fmt:formatDate pattern="yyyy/MM/dd" value="${board.update_ts}"/></td>

                                    <td>조회수 :
                                    ${board.readcnt}</td>
                                </tr>
                                 <tr id="space">
                                 
                                 </tr>
                                
                                <tr id="three">
                                     <td colspan="3">${board.content}</td>
                                </tr>
                                                     
                            </table>

                            <div id="btn">
                                <button type="button" id="modifyBtn">수정</button> 
                                <button type="button" id="listBtn">목록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>