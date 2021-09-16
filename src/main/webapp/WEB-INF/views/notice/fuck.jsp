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
        $('a.prev, a.next, a.end').on('click', function(e) {
            e.preventDefault();
            
            var paginationForm = $('#paginationForm');
            
            paginationForm.attr('action', '/notice/list');
            paginationForm.attr('method', 'GET');
            
            paginationForm.find('input[name=currPage]').val($(this).attr('href'));
            paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
            paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');
            paginationForm.find('input[name=type]').val('${pageMaker.cri.type}');
            paginationForm.find('input[name=keyWord]').val('${pageMaker.cri.keyWord}');
            
            paginationForm.submit();
        });
    });
</script>

<style>
    #board {
        width: 1200px;

        margin-top: 20px;
        margin-bottom: 40px;
    }

    #title {
        border-bottom: 1px solid rgb(201, 201, 201);

        background-color: white;
        /* background-color: rgb(245, 245, 245); */
        height: 50px;
        font-size: 20px;
        border-top: 3px solid #6f2b89;

        text-indent: 20px;
        line-height: 50px;
    }
    









    table {
    	width: 100%;
    }

    table, th, td {
        border: 1px solid rgb(201, 201, 201);
        border-collapse: collapse;
    }

    th {
        background-color: rgb(245, 245, 245);
        height: 50px;
        font-size: 20px;
        border-top: 3px solid #6f2b89;

        text-align: left;
        text-indent: 20px;

    }
    td {
        height: 40px;
        font-size: 15px;
        text-align: center;
    }
    td:first-child {
        color: #005bbb;
    }

    caption {
        font-size: 16px;
        font-weight: bold;
        padding: 0;
    }

    #topmenu > li {
        float: left;
        text-align: center;
        line-height: 50px;
        list-style: none;

        width: 33%;
        height: 50px;
    }

    #regBtn {
        width: 150px;
        height: 40px;

        border: 0;

        font-size: 15px;
        font-weight: bold;

        color: white;
        background-color: red;

        cursor: pointer;
    }

    a, a:link, a:visited {
        text-decoration: none;
        color: black;
        cursor: pointer;
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
                <h2 class="asideMenu">고객센터</h2>
                <ul id="parent">
                    <li><a class="chk" href="/notice/list">공지사항</a></li>
                    <li><a class="chk" href="#">보도자료</a></li>
                    <li><a class="chk" href="#">질문게시판</a></li>
                    <li><a class="chk" href="#">자주묻는질문</a></li>
                    <li><a class="chk" href="#">고객의소리</a></li>
                    <li><a class="chk" href="#">자유게시판</a></li>
                    <li><a class="chk" href="#">이벤트</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > 공지사항 </div>
                    <h2 class="subName">공지사항</h2>
                </div>
                <div class="contentIn">
                	
                    <div id="board">

                        <div id="tables">

                            <div id="title">제목영역</div>
                            <div id="readCnt">조회수</div> <div id="date">날짜</div>
                            <div>작성자</div>
                            <div>내용</div>
                        
                        </div>
                
                        
                    </div>
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>