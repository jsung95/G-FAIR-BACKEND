<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>비밀번호변경</title>

    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/sub.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/mypage_replymanage.css" rel="stylesheet"  type="text/css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>

</head>

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

<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">마이페이지</h2>
                <ul id="parent">
                    <li><a class="chk" href="/mypage/modifypassword">비밀번호변경</a></li>
                    <li><a class="chk" href="/mypage/myInfo">회원정보변경</a></li>
                    <li><a class="chk" href="/myBoard/list?memberid=${__LOGIN__.memberid}">내가쓴글</a></li>
                    <li><a class="chk" href="/mypage/replymanage">내가쓴댓글</a></li>
                    <li><a class="chk" href="/mypage/dropauth">회원탈퇴</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 마이페이지 > 내가쓴댓글</div>
                    <h2 class="subName">내가쓴댓글</h2>
                </div>

                <div class="contentIn">
                    <div id="wrapper">
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
                                                <td><fmt:formatDate value="${reply.redate}" pattern="yyyy/MM/dd"/></td>
                                               
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
                </div>

            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>