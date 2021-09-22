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
    
        $(function() {
            console.clear();
            console.debug('jq started...');

            $('#listBtn').click(function() {
                console.log('onclick for #listBtn clicked...');

                location.href = '/free/board';
            });//onclick for #listBtn
            
            

        });//jq
        
	
        
    </script>
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
                    <div class="map">home > 고객센터 > 자유게시판 </div>
                    <h2 class="subName">자유게시판</h2>
                </div>
                <div class="contentIn">
                    <form action="/free/write" method="post">
                        <table>
                            <input type='hidden' name="bname"  value="자유게시판"/>
                            <input type='hidden' name="memberid" value="${__LOGIN__.memberid}"/>
                            
                            <tr>
                                <td><label for="TITLE">제목</label></td>
                                <td><input type="text" name="title" id="TITLE" size="50" placeholder="제목을 입력하세요"></td>
                            </tr>
                            
                            <tr>
                                <td><label for="CONTENT">내용</label></td>
                                <td><textarea name="content" id="CONTENT" cols="52" rows="10" placeholder="내용을 입력하세요"></textarea></td>
                            </tr>

                            <tr>
                                <button type="submit" id="submitBtn">글쓰기</button>
                                <button type="button" id="listBtn">목록</button>
                            </tr>
                            
                        </table>
                    </form>
                </div>
    
           	</div>
        </div>
            
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div><!-- wrap -->

</body>
</html>

    
</body>
</html>