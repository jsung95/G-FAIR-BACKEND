<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>list1.jsp</title>

        <style>
            *{
                margin: 0 auto;
                padding: 0;
                list-style: none;
            }
            A:link{text-decoration: none; color: #646464;}
            A:visited{text-decoration: none; color: #646464;}
            A:active{text-decoration: none; color: #646464;}
            A:hover{cursor: pointer;}

            #container{
                margin: 0 auto;
                width: 1024px;

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
                

                width: 150px;
                height: 150px;

                
            }
            #thumb_title{
                font-size: 14px;
                text-align: center;
            }

            #photo_zone > ul{
                display: flex;
                flex-wrap: wrap;
                
                list-style: none;
                
            }
            
            #photo_zone > ul > li{
                display: flex;
                width: 280px;
                height: 230px;

                margin-bottom: 10px;
                
                border-bottom: solid 1px  cyan;

                justify-content: space-around;
            }

            
            #topmenu > h1{
                display: inline;
            }
            #regBtn{
                margin-top: 5px;
                float: right;

                width: 100px;
                height: 30px;
            }

            #searchForm{
                float: right;
            }

            #pagination{
                clear: both;
                width: 95%;
                margin: 0 auto;
            }

            #pagination ul{
                float: right;
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
            
            .prev, .next{
                width: 70px!important;

                color: white!important;
                background-color: blue;
            }

            .currPage{
                background-color: cornflowerblue;
                color: white;
            }

        </style>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

        <script>
            $(function () {
                console.clear();
                console.debug("jq started.");
                
                $("#regBtn").on("click", function () {
                    console.debug("regBtn Clicked.");

                    location.href="/photo/register";
                    
                }); //onclick #regBtn
                
                $("a.prev, a.next").on("click", function (e) {
                    console.debug("onclicked for a.next or a.prev ...");
                    console.log("\t+ this: ", this);
                    
                    e.preventDefault();  //Event에 의한 선택된 요소의 기본 동작을 무력화시킴

                    //아래 지역변수에는 Rvalue 선택자에 의해서 선택된 요소
                    //(즉, form태그)가 저장됨.
                    var paginationForm = $("#paginationForm");

                    paginationForm.attr("action", "/board/listPerPage");
                    paginationForm.attr("method", "GET");
                    paginationForm.find("input[name=currPage]").val($(this).attr("href"));
                    paginationForm.find("input[name=amount]").val("${pageMaker.cri.amount}");
                    paginationForm.find("input[name=pagesPerPage]").val("${pageMaker.cri.pagesPerPage}");

                    paginationForm.submit();
                });  // onclick
            }); //jq

        </script>
    </head>
    <body>
        <div id="container">
            <div id="topmenu">
                <h1><a href="/photo/listPerPage">포토갤러리(${pageMaker.totalAmount})</a></h1>
                <button id="regBtn" type="button">사진업로드</button>
                <br>
                <hr>
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



            <div id="search">
                <ul>
                    <li>
                        <form id="searchForm" action="/photo/listPerPage" method="GET">
                            <input type="hidden" name="currPage" value="1">
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                            <input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">
    
                            <li>&nbsp;</li>
                            <select name="type" id="search1">
                                <option value="T" ${ ( "T" eq pageMaker.cri.type ) ? "selected" : ""}>제목</option>
                                <option value="C" ${ ( "C" eq pageMaker.cri.type ) ? "selected" : ""}>내용</option>
                                <option value="W" ${ ( "W" eq pageMaker.cri.type ) ? "selected" : ""}>작성자</option>
                            </select>
    
                            <input type="text" name="keyword" class="search2" value="${pageMaker.cri.keyword}">
                            <button class="search1">Search</button>
                        </form>
                    </li>
                </ul>
            </div>

            <div id="pagination">
                <br>
                <form action="" id="paginationForm">
                    <!-- 어느화면에서든, 게시판 목록 페이지로 이동시, 반드시 아래 3개의 기준 전송파라미터를 전송시키기위해,
                    hiiden 값으로 설정 -->
                    <input type="hidden" name="currPage">
                    <input type="hidden" name="amount">
                    <input type="hidden" name="pagesPerPage">
                    
                    <ul>
                        <c:if test="${pageMaker.prev}">
                            <li class="prev"><a class="prev" href="${pageMaker.startPage - 1}">Prev</a></li>
                        </c:if>

                        <!-- begin ~ end 까지 반복하고, 현재의 번호값은 var속성에 넣어준다 -->
                        <c:forEach begin="${pageMaker.startPage}" 
                                    end="${pageMaker.endPage}" 
                                    var="pageNum">
                            <li class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}">
                                <a 
                                    class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}" 
                                    href="/photo/listPerPage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
                                    ${pageNum}
                                </a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next}">
                            <li class="next"><a class="next" href="${pageMaker.endPage + 1}">Next</a></li>
                        </c:if>

                    </ul>
                </form>
            </div>
        </div>

    </body>
</html>