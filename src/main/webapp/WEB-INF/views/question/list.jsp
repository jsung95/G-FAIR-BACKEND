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
 #wrapper {
        width: 1200px;
        height: 700px;
        font-size: 14px;
        
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        
    }

    input.search2{
        display: block;
        width: 300px;
        height: 30px;

        border: none;
        border-bottom: 1px solid grey;
        
    }

    .search1{
        display: block;
        width: 100px;
        height: 30px;

        border: 1px solid #ddd;
    }

    button.search1{
        color: black;
        background-color:  white;
    }

    select {
        margin-left: 0;
    }

    table {
        width: 95%;

        border: 1px ridge #ddd;;
        border-collapse: collapse;
        
        
    }

    thead {
        padding: 10px;

        color: black;
        background-color: #f4f6f7;

        font-size: 16px;
    }

    td{
        padding: 3px;
        
    }

    tr:hover{
        background-color: #f4f6f7;
    }

    a, a:link, a:visited {
        text-decoration: none;

        color: black;

        cursor: pointer;
    } 


    #pagination {
        width: 95%;
        height: 70px;
        margin: 0 auto;

        display: flex;
    }

    
    #pagination li{

        width: 30px;
        height: 30px;
        
        display: inline-block;

        text-align: center;
        line-height: 30px;

        border: 1px solid #ddd;

    }

    .prev, .next{
        width: 70px !important;
        height: 30px;
        color: white;
        background-color: #005bbb;
    }

    #top{
        width: 95%;
        height: 50px;
        
        display: flex;
        flex-direction: row;

        
    }

    #searchForm{
        width: 700px;
        height: 50px;

        display: flex;
        margin-left: 0;
    }
    #registerBtn{
        
        width: 100px;
        height: 30px;
        margin-right: 0;
        
        color: white;
        border: 1px cornflowerblue solid;
        background-color: #005bbb;;

        cursor: pointer;

    }
    
    .currPage{
        background-color: #005bbb;;
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
                    <div class="map">home > 고객센터 > 질문게시판 </div>
                    <h2 class="subName">질문게시판</h2>
                </div>
                <div class="contentIn">
                	
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
            
                                <button class="search1">검색</button>
                            </form>
            
                            <button type="button" id="registerBtn">글쓰기</button>
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
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>