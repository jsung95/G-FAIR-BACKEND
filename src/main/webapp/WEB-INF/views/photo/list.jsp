<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>지페어 코리아</title>

    <!-- <link href="/resources/css/photo_list.css" rel="stylesheet" type="text/css" /> -->
    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/sub.css" rel="stylesheet" type="text/css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>
    <!-- <script src="/resources/js/photo_list.js"></script> -->

</head>

<style>

    A:link{text-decoration: none; color: #646464;}
    A:visited{text-decoration: none; color: #646464;}
    A:active{text-decoration: none; color: #646464;}
    A:hover{cursor: pointer;}

    #photo_area{
        margin: 0 auto;
        width: 1200px;

        font-family: 
            'Lucida Sans', 
            'Lucida Sans Regular', 
            'Lucida Grande', 
            'Lucida Sans Unicode', 
            Geneva, 
            Verdana, 
            sans-serif;
    }

    .thumbnail{
        width: 165px;
        height: 165px;
    }
    
    #thumb_title{
        margin-top: 5px;
        font-size: 15px;
        text-align: center;

    }
    
    #photo_zone > ul{
        display: flex;
        flex-wrap: wrap;
        
        list-style: none;
        
        justify-content: center;
    }
    
    #photo_zone > ul > li{
        display: flex;
        width: 250px;
        height: 230px;
        
        margin-bottom: 30px;

        justify-content: center;
        align-items: center;
        
    }


    #topmenu{
        height: 50px;   
        border-bottom: 1px solid #999;
        margin-bottom: 10px;
    }

    .btn {
        width: 100px;
        height: 40px;

        border: 0;
        
        text-align: center;
        background: #005bbb;
        color: #fff;
        font-size: 15px;
        
        cursor: pointer;
    }

    #regBtn{
        margin-top: 5px;
        float: right;
    }
    /* paging */
    #pagination {
        width: 95%;
        margin: 0 auto;
    }

    #pagination li{
        float:left;

        width: 30px;
        height: 30px;

        list-style: none;

        text-align: center;
        line-height: 30px;
        border: 1px dotted black;
    }

    #pagination ul {
        display: flex;
        justify-content: center;

    }

    #pagination li {
        width: 30px;
        height: 30px;
        display: flex;

        border-left: 1px solid #999;
        border-top: 1px solid #999;
        border-bottom: 1px solid #999;
        box-sizing: border-box;

        text-align: center;
        line-height: 28px;
        flex-direction: column
    }

    #pagination li:last-child {
        border-right: 1px solid #999;
    }

    .prev, .next {
        width: 40px !important;
        
        color: white;
        background-color: rgb(246, 246, 255);
    }

    .currPage{
        background-color: cornflowerblue;
        color: white;
    }

    #totalAmount{
        line-height: 50px;
        float: left;
    }

    #mmw {
        display: block;
        width: 30px;
        height: 30px;
    }

    #search_area {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    
    #searchBtn{
        width: 80px;
        height: 25px;

        border: 0;
        
        text-align: center;
        background: #005bbb;
        color: #fff;
        font-size: 15px;
        
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
        
        $("#regBtn").on("click", function () {
        console.debug("regBtn Clicked.");

        location.href="/photo/register";
        
    }); //onclick #regBtn
    })//end jq
</script>
<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">미디어센터</h2>
                <ul id="parent">
                    <li><a class="chk" href="/photo/listPerPage">포토갤러리</a></li>
                    <li><a class="chk" href="#">영상자료실</a></li>
                    
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 미디어센터 > 포토갤러리 </div>
                    <h2 class="subName">포토갤러리</h2>
                </div>
                <div class="contentIn">
                	
                    <!-- 여기에 게시판 넣으면 됩니다. -->
                    <div id="photo_area">
                        <div id="topmenu">
                            <p id="totalAmount">전체글 수 : ${pageMaker.totalAmount}</p>
                            <button class="btn" id="regBtn" type="button">사진업로드</button>
                            <br>
                            <br>
                        </div>
                        
                        <div id="photo_zone">
                            <ul>
                                <c:forEach items="${list}" var="photo">
                                    <li>
                                        <a href="/photo/getFile?fid=${photo.fid}">
                                            <img src="/resources/img/${photo.fpath}s_${photo.frename}" class="thumbnail" alt="">
                                            <p id="thumb_title">${photo.title}</p>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
            
                        <div id="pagination">
                            <form action="" id="paginationForm">
                                <!-- 어느화면에서든, 게시판 목록 페이지로 이동시, 반드시 아래 3개의 기준 전송파라미터를 전송시키기위해,
                                hiiden 값으로 설정 -->
                                <input type="hidden" name="currPage">
                                <input type="hidden" name="amount">
                                <input type="hidden" name="pagesPerPage">
                                <input type="hidden" name="type">
                                <input type="hidden" name="keyword">
                                <ul>
                                    <!-- <c:if test="${pageMaker.prev}">
                                        <li class="prev"><a class="prev" href="${pageMaker.startPage - 1}">Prev</a></li>
                                    </c:if> -->
                                    <li class="prev"><a class="start" href="/photo/listPerPage"><<</a></li>
                                    <li class="prev"><a class="prev" href="/photo/listPerPage?currPage=${pageMaker.startPage}"><</a></li>
                                    <!-- begin ~ end 까지 반복하고, 현재의 번호값은 var속성에 넣어준다 -->
                                    <c:forEach begin="${pageMaker.startPage}" 
                                                end="${pageMaker.endPage}" 
                                                var="pageNum">
                                        <li class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}">
                                            <a 
                                                id="mmw"
                                                class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}" 
                                                href="/photo/listPerPage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
                                                ${pageNum}
                                            </a>
                                        </li>
                                    </c:forEach>
            
                                    <!-- <c:if test="${pageMaker.next}">
                                        <li class="next"><a class="next" href="${pageMaker.endPage + 1}">Next</a></li>
                                    </c:if> -->
                                    <li class="next"><a class="next" href="/photo/listPerPage?currPage=${pageMaker.endPage}">></a></li>
                                    <li class="next"><a class="end" href="/photo/listPerPage?currPage=${pageMaker.realEndPage}">>></a></li>
                                </ul>
                            </form>
                        </div>

                        <div id="search_area">
                            <li>
                                <form action="/photo/listPerPage" method="GET" id="searchForm">
                                    <input type="hidden" name="currPage" value="1">
                                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                    <input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">

                                    <select name="type" id="search1">
                                        <option value="T" ${ ( "T" eq pageMaker.cri.type ) ? "selected" : ""}>제목</option>
                                        <option value="C" ${ ( "C" eq pageMaker.cri.type ) ? "selected" : ""}>내용</option>
                                        <option value="W" ${ ( "W" eq pageMaker.cri.type ) ? "selected" : ""}>작성자</option>
                                        <option value="TC" ${ ( "W" eq pageMaker.cri.type ) ? "selected" : ""}>제목+내용</option>
                                    </select>

                                    <input type="text" name="keyword" class="search2" value="${pageMaker.cri.keyword}">
                                    
                                    <button id="searchBtn">Search</button>
                                </form>
                            </li>
                        </div>
                    </div>
                </div>
            </div>
        </div>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>