<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>list.jsp</title>
        <style>
            *{
                margin: 0 auto;
                padding: 0;
            }

            #container{
                width: 1024px;

                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                font-size: 14px;
            }

            table{
                width: 95%;

                border: 1px ridge green;
                border-collapse:collapse;

                text-align: center;

            }

            thead{
                padding: 10px;
                
                color: white;
                background-color: purple;

                font-size: 16px;
            }
            tr{
                padding: 10px;
                

                font-size: 16px;
            }
            td{
                padding: 3px;
            }

            caption{
                font-size: 16px;

                font-weight: bold;

                padding: 0;
            }

            #topmenu > li {
                float: left;

                text-align: center;
                list-style: none;

                width: 33%;
                height: 50px;
            }

            #regBtn{
                width: 150px;
                height: 40px;

                border: 0;

                font-size: 15px;
                font-weight: bold;

                color: white;
                background-color: red;

            }
            #regBtn:hover{
                cursor: pointer;

            }
            tbody > tr:hover {
                background-color: rgb(239,253,226);
            }

            a, a:link, a:visited{
                text-decoration: none;
                color: black;
                cursor: pointer;
            }

            th:nth-child(2){
                text-align: left;

                width: 40%;
                padding-left: 10px;
            }
            
            #pagination{
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
                background-color: green;
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

                location.href="/event/register";
                
            }); //onclick #regBtn
            
            $("a.prev, a.next").on("click", function (e) {
                console.debug("onclicked for a.next or a.prev ...");
                console.log("\t+ this: ", this);
                
                e.preventDefault();  //Event에 의한 선택된 요소의 기본 동작을 무력화시킴

                //아래 지역변수에는 Rvalue 선택자에 의해서 선택된 요소
                //(즉, form태그)가 저장됨.
                var paginationForm = $("#paginationForm");

                paginationForm.attr("action", "/event/listPerPage");
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
            <table border="1">
                <caption>
                    <ul id="topmenu">
                        <li><a href="/event/listPerPage"><h1>이벤트게시판 (${pageMaker.totalAmount})</h1></a></li>
                        <li><button id="regBtn" type="button">글쓰기</button></li>
                    </ul>
                </caption>

                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                        <th>조회</th>
                        <th>첨부</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${list}" var="event">
                        <tr>
                            <th><c:out value="${event.bno}"/></th>
                            <th>
                                <a 
                                href="/event/get?bno=${event.bno}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                                <c:out value="${event.title}"/></a>
                            </th>
                            <th><c:out value="${event.memberID}"/></th>
                            <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${event.insert_ts}" /></td>
                            <td><c:out value="${event.readcnt}"/></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>&nbsp;</p>

            <div id="pagination">

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
                                    href="/event/listPerPage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
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
        <p>${result}</p>
        </div>
    </body>
</html>