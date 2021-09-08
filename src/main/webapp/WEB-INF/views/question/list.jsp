
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>질문게시판</title>
        
        <style>

            *{
                margin: 0 auto;
                padding: 0;
            }
            
            #wrapper {
                width: 1024px;

                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                font-size: 14px;
                
               
            }

            table {
                width: 95%;

                border: 1px ridge rgb(46, 118, 252);
                border-collapse: collapse;
                
               
            }

            th {
                padding: 10px;

                color: white;
                background-color: cornflowerblue;

                font-size: 16px;
            }

            td{
                padding: 3px;
            }

            tr:hover{
                background-color: paleturquoise;
            }

            a, a:link, a:visited {
                text-decoration: none;

                color: black;

                cursor: pointer;
            } 


            #pagination {
                width: 95%;
              
                margin: 0 auto;

                display: flex;
            }

         
            #pagination li{

                width: 30px;
                height: 30px;
                
                display: inline-block;

                text-align: center;
                line-height: 30px;

                border: 1px solid paleturquoise;
        
            }

            .prev, .next{
                width: 70px !important;
                height: 30px;
                color: white;
                background-color: cornflowerblue;
            }

            #top{
                width: 1000px;
                height: 50px;
                
                display: flex;
                flex-direction: row;

              
            }
       
            #searchForm{
                width: 700px;
                height: 50px;
            }
            #registerBtn{
                
                width: 100px;
                height: 30px;
                
                border: 1px cornflowerblue solid;
                background-color: darkcyan;

                cursor: pointer;

            }
            
            .currPage{
                background-color: darkslateblue;
            }
        </style>
		


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>

            $(function () {
                console.log("jq started..");
            	
            	var result = '${__RESULT__}';

                if(result.length>0){
                	console.log("event trigered");
                    alert(result);
                }//if

                $('#registerBtn').on('click',function () {
                    location.href="/question/register";
                });//onclick

                $('a.prev, a.next').on('click' , function (e) {
                    console.debug();
                    console.log('\t + this:', this);

                    e.preventDefault(); // Event 에 의한 선택된 요소의 기본 동작을 금지! 

                    var paginationForm = $('#paginationform');

                    paginationForm.attr('action', '/question/list');
                    paginationForm.attr('method', 'GET');

                                                            //a 태그의 href 속성을 끄집어내서
                    //input 태그의 Value 속성의 값으로 집어 넣음. 
                    paginationForm.find('input[name=currPage]').val( $(this).attr('href') );
                    paginationForm.find('input[name=amount]').val( '${__PAGE__.cri.amount}');
                    paginationForm.find('input[name=pagesPerPage]').val('${__PAGE__.cri.pagesPerPage}');

                    paginationForm.submit();

                }); //onclick for Prev, Next button

            });//.jq
            
        </script>
    </head>
    <body>
        <div id="wrapper">
            <div id="top">
                <form id="searchForm" action="/question/list" method="GET">

                    <input type="hidden" name="currPage"        value="1">
                    <input type="hidden" name="amount"          value="${__PAGE__.cri.amount}">
                    <input type="hidden" name="pagesPerPage"    value="${__PAGE__.cri.pagesPerPage}">
                    
                    <select name="type" class="search1">
                        <option>검색조건</option>
                        <option value="T" ${ ("T" eq __PAGE__.cri.type) ? "selected" : ""}>제목</option>
                        <option value="C" ${ ("C" eq __PAGE__.cri.type) ? "selected" : ""}>내용</option>
                        <option value="W" ${ ("W" eq __PAGE__.cri.type) ? "selected" : ""}>작성자</option>
                        <option value="TC" ${ ("TC" eq __PAGE__.cri.type) ? "selected" : ""}>제목+내용</option>
                    </select>

                    <input type="text" name="keyword" class="search2" value="${__PAGE__.cri.keyword}">

                    <button class="search1">SEARCH</button>
                </form>

                <button type="button" id="registerBtn">REGISTER</button>
            </div>
            <table border="1">
                
                <thead>
                    <tr>
                        <td>bno</td>
                        <td>reproot</td>
                        <td>repstep</td>
                        <td>title</td>
                        <td>readcnt</td>
                        <td>memberid</td>
                        <td>insert_ts</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${__LIST__}" var="list">
                        <tr>
                            <td>${list.bno}</td>
                            <td>${list.reproot}</td>
                            <td>${list.repstep}</td>
                            
                            <td>
                              <c:if test="${list.repindent>0}" >
                                <c:forEach begin ="1" end="${list.repindent}">
                                    <%= "&nbsp;&nbsp;" %>
                                </c:forEach>
                                RE:
                              </c:if>  
                                <a href="/question/get?bno=${list.bno}&currPage=${__PAGE__.cri.currPage}&amount=${__PAGE__.cri.amount}&pagesPerPage=${__PAGE__.cri.pagesPerPage}">${list.title}</a>
                            </td>
                            
                            <td>${list.readcnt}</td>
                            <td>${list.memberid}</td>
                            <td>${list.insert_ts}</td>
                        </tr>
    
                    </c:forEach>
                </tbody>
            </table>
           
            <div id="pagination">
                <form id="paginationform">
                    <input type="hidden" name="currPage">
                    <input type="hidden" name="amount">
                    <input type="hidden" name="pagesPerPage">

                    <ul>
                        <c:if test="${__PAGE__.prev}">
                            <li class="prev"><a class="prev" href="${__PAGE__.startPage-1}">Prev</a></li>
                        </c:if>

                        <c:forEach 
                            begin="${__PAGE__.startPage}" 
                            end="${__PAGE__.endPage}" 
                            var="pageNum">
                            <li class="${__PAGE__.cri.currPage == pageNum? 'currPage' : ''}">

                                <a 	class="${__PAGE__.cri.currPage == pageNum? 'currPage' : ''}" 
                                    href="/question/list?currPage=${pageNum}&amount=${__PAGE__.cri.amount}&pagesPerPage=${__PAGE__.cri.pagesPerPage}&type=${__PAGE__.cri.type}&keyword=${__PAGE__.cri.keyword}">
                                    ${pageNum}
                                </a>

                            </li>
                        </c:forEach>

                        <c:if test="${__PAGE__.next}" >
                            <li class="next"><a class="next" href="${__PAGE__.endPage+1}">Next</a></li>
                        </c:if>
                    </ul>
                </form>
            </div>

        </div>
  
    </body>
</html>