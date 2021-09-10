<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>내가 쓴 댓글 관리</title>
		
		<link rel="stylesheet" href="/resources/css/mypage_replymanage.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function () {
                
                var result='${__RESULT__}';

                if(result.length>0){
                    alert(result);
                }//if

                $('a.prev, a.next').on('click' , function (e) {
                    console.debug();
                    console.log('\t + this:', this);

                    e.preventDefault(); // Event 에 의한 선택된 요소의 기본 동작을 금지! 

                    var paginationForm = $('#paginationform');

                    paginationForm.attr('action', '/mypage/replymanage');
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

        <script src="/resources/js/mypage_replymanage.js"></script>
    </head>
    <body>

        <div id="content">
            <div id="con_reply">
                <form action="/mypage/replydelete" method="POST" id="replyForm">
                    <div id="form_header">
                        <!-- <input type="hidden" name="currPage"        value="1">
                        <input type="hidden" name="amount"          value="${__PAGE__.cri.amount}">
                        <input type="hidden" name="pagesPerPage"    value="${__PAGE__.cri.pagesPerPage}"> -->

                        <input type="hidden" name="type" value="C">
                        <input type="text" id="recontent" name="keyword" value="${__PAGE__.cri.keyword}" placeholder="검색할 댓글 내용을 입력하세요">
                        <button type="button" id="searchBtn">검색</button>
                        <button type="submit">삭제</button>
                    </div>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>선택</th>
                                
                                <th>
                                    <select name="bname" id="bname">
                                        <option>게시판</option>
                                        <option value="question"    ${ ("question"  eq __PAGE__.cri.bname) ? "selected" : ""}>질문게시판</option>
                                        <option value="anony"       ${ ("anony"     eq __PAGE__.cri.bname) ? "selected" : ""}>고객의소리</option>
                                        <option value="free"        ${ ("free"      eq __PAGE__.cri.bname) ? "selected" : ""}>자유게시판</option>
                                        <option value="notice"      ${ ("notice"    eq __PAGE__.cri.bname) ? "selected" : ""}>공지사항</option>
                                        <option value="news"        ${ ("news"      eq __PAGE__.cri.bname) ? "selected" : ""}>보도자료</option>
                                        <option value="event"       ${ ("notice"    eq __PAGE__.cri.bname) ? "selected" : ""}>이벤트게시판</option>
                                    </select>
                                </th>
                                
                                <th>댓글내용</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${__REPLY__}" var="reply">
                                <tr>
                                    <td><input type="checkbox" name="reno" value="${reply.reno}"></td>
                                    <td>${reply.bname}</td>
                                    <td><a href="/${reply.bname}/get?bno=${reply.bno}">${reply.recontent}</a></td>
                                    <td><fmt:formatDate value="${reply.redate}" type="date"/></td>
                                   
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>   
            </div> 
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
                            href="/mypage/replymanage?currPage=${pageNum}&amount=${__PAGE__.cri.amount}&pagesPerPage=${__PAGE__.cri.pagesPerPage}">
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