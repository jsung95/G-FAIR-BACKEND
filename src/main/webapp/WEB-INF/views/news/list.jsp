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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
    <script>
    
    $(document).ready(function() {
    	  $('ul.dropdownmenu li ul').hide();

    	  $('ul.dropdownmenu').hover(
    	  function() { 
    	      $('ul.dropdownmenu li.menu ul').fadeIn('slow',function(){$(this).stop();});
    	      $('.header_wapper').animate({height:200},'fast').clearQueue();
    	      },
    	      function() {
    	      $('ul.dropdownmenu li.menu ul').fadeOut('fast');
    	      $('.header_wapper').animate({height:200},'fast').clearQueue();
    	      });
    	}); //화면 효과 

        $(function () {
            
            console.clear();
            console.debug("start ");
            
            $('#regBtn').on('click',function(){
            	location.href = "/news/register"
            });

            $('a.prev, a.next').on('click',function (e) {
                console.debug("onclicked a. next and a.prec ");
                console.log("/t+ this:"+ this);  

                e.preventDefault(); 

                var paginationForm = $('#paginationForm'); 
                paginationForm.attr('action','/listPerPage');
                paginationForm.attr('method','GET');   //버튼이 눌려서 가는 요청이 컨트롤러로 가도록 한다. 
        
                paginationForm.find('input[name=currPage]').val($(this).attr('href'));
                paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
                paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');
      
                            paginationForm.submit();
            // on  click prev / next 
    	
    		});
        
        });
    </script>
    
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/sub.css">
	 
	
    <style>
button {
    margin: 0;
}
button:hover {
   cursor: pointer;
}

.wrapper {
    height: 570px;
}
#wrap {
    margin: 0;
    width: 100%
    align-items: center;
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
    border-top: 3px solid #005bbb;
}

td {
    height: 40px;
    font-size: 15px;
    text-align: center;
}


tr:hover {
    background-color: #eee;
}

a, a:link, a:visited {
    text-decoration: none;
    color: black;
    cursor: pointer;
}

/* 제목 */
td:nth-child(2),td:nth-child(3) {
    text-align: center; 
    padding-left: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 200px;
}

/* 작성자 */
td:nth-child(3) {
    text-align: center; 
    padding-left: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 100px;
}

/* no, 조회수 */
td:nth-child(1),td:nth-child(5) {
    width: 70px;

}
/* 등록일 */
td:nth-child(4) {
    width: 60px;
}

}/* paging */
#pagination {
    width: 95%;
    margin: 0 auto;
    margin-top:5px;
}


#pagination ul {
     display: flex;
    justify-content: center;
    margin-top: -20px;
    margin-bottom: 55px;
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
    flex-direction: column;
    margin-top:5px;
}
#pagination li:last-child {
    border-right: 1px solid #999;
}

/* 하단 버튼 */
.reg {
    margin: 0;

    display: flex;
    justify-content: flex-end;
    width: 100%;
}

/* 페이징 버튼 */
.prev, .next, .end {
    width: 40px !important;
    color: white;
    background-color: rgb(235, 238, 232);
}

/* 현재페이지 버튼 */
.currPage {
    height: 29px!important;
    color: white;
    background-color: rgb(247, 247, 247);
    border-bottom: 1px solid #999;
    box-sizing: border-box;
}
/* 버튼CSS */
.buttonstyle {
    height: 40px;
    width: 100px;
    line-height: 40px;
    text-align: center;
    background-color: #005bbb;
    color: #fff;
    font-size: 15px;
    
}

  form#searchForm {
    position: relative;
    bottom: -560px;
    left: 454px;
}
    
#regBtn{
     position: relative;
    bottom: -538px;
    left: 1100px;
    height: 40px;
    width: 100px;
    line-height: 30px;
    text-align: center;
    background-color: #005bbb;
    color: #fff;
    font-size: 15px;
    }
    
    button.search1 {
    position: relative;
    left: 10px;
    height: 25px;
    width: 49px;
    line-height: 20px;
    text-align: center;
    background-color: #005bbb;
    color: #fff;
    font-size: 14px;
}

</style>

</head>
 <div id="wrap">
        <header>
            <div class="header_wrapper">
                <div class="top_wrap">
                    <div class="topNav">
                        <ul class="topMenu">
                            <li class="tm1"><a href="#">로그인</a></li>
                            <li class="tm1"><a href="#">회원가입</a></li>
                            <li class="tm1"><a href="#">원격지원</a></li>
                            <li class="tm2"><a href="https://blog.naver.com/g_fair_korea" target="blank"><img src="/resources/img/blog.png" alt=""></a></li>
                            <li class="tm2"><a href="https://www.facebook.com/gfairkr" target="blank"><img src="/resources/img/facebook.png" alt=""></a></li>
                            <li class="tm2"><a href="https://www.instagram.com/gfairkorea/" target="blank"><img src="/resources/img/instagram.png" alt=""></a></li>
                            <li class="tm2"><a href="#" target="blank"><img src="../publishing/img/mail.png" alt=""></a></li>
                        </ul>
                    </div>
                </div>
                <div class="gnb_wrapper">
                    <h1 class="logo"><a href="index.html">로고</a></h1>
                    <div id="nav">
                        <ul class="dropdownmenu">
                            <li class="menu"><h3><a href="#">전시회 소개</a></h3>
                                <ul>
                                    <li><a href="#">전시회안내</a></li>
                                    <li><a href="#">연혁</a></li>
                                    <li><a href="#">전시회일정</a></li>
                                    <li><a href="#">부대시설</a></li>
                                    <li><a href="#">찾아오시는길</a></li>
                                </ul>
                            </li>
                            <li class="menu"><h3><a href="#">미디어 센터</a></h3>
                                <ul>
                                    <li><a href="#">포토갤러리</a></li>
                                    <li><a href="#">영상자료실</a></li>
                                </ul>
                            </li>
                            <li class="menu"><h3><a href="#">참가안내</a></h3>
                                <ul>
                                    <li><a href="#">참가신청안내</a></li>
                                    <li><a href="#">참가신청</a></li>
                                    <li><a href="#">참가규정</a></li>
                                    <li><a href="#">부스안내</a></li>
                                    <li><a href="#">전시장배치도</a></li>
                                    <li><a href="#">참가기업목록</a></li>
                                </ul>
                            </li>
                            <li class="menu"><h3><a href="#">사전 신청</a></h3>
                                <ul>
                                    <li><a href="#">사전관람안내</a></li>
                                    <li><a href="#">사전관람신청</a></li>
                                    <li><a href="#">사전관람신청자</a></li>
                                </ul>
                            </li>
                            <li class="menu"><h3><a href="#">고객 센터</a></h3>
                                <ul>
                                    <li><a href="#">공지사항</a></li>
                                    <li><a href="#">보도자료</a></li>
                                    <li><a href="#">질문게시판</a></li>
                                    <li><a href="#">자주묻는질문</a></li>
                                    <li><a href="#">고객의소리</a></li>
                                    <li><a href="#">자유게시판</a></li>
                                    <li><a href="#">이벤트</a></li>
                                </ul>       
                            </li>
                        </ul>
                    </div>
                </div>
            </div> <!-- header_wrapper -->
        </header>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">고객센터</h2>
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">보도자료</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">자주묻는질문</a></li>
                    <li><a href="#">고객의소리</a></li>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">이벤트</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > <strong>보도 자료</strong> </div>
                    <h2 class="subName">보도 자료</h2>
                </div>
                <div class="contentIn">
                	<div class="wrapper">
<table border =1 >
            <caption>
                <ul id="topmenu">
                    <li>
                        <form id="searchForm" action="/news/listPerPage" method="GET">
                            <input type="hidden" name="currPage" value="1">
                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                            <input type="hidden" name="pagesPerPage"  value="${pageMaker.cri.pagesPerPage}">

                            <select name="type" id="search1">  <!--eq >> 동등비교 연산자 -->
                                <option value="T" ${ ("T" eq pageMaker.cri.type) ? "selected" : ""}>제목</option>
                                <option value="C" ${ ("C" eq pageMaker.cri.type) ? "selected" : ""}>내용</option>
                                <option value="W" ${ ("W" eq pageMaker.cri.type) ? "selected" : ""}>작성자</option>
                            </select>
                            <input type="text" name="keyword" class="search2" value="${pageMaker.cri.keyword}">
                            <button class="search1">찾기</button>
                        </form>
                        </li>
                        
                    </ul>
                </caption>


    <thead>
        <th>NO</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
    </thead>
            <c:set var="number" value="${pageMaker.totalAmount - (pageMaker.cri.currPage - 1) * pageMaker.cri.amount}"/>
            <c:forEach items="${list}" var="board" >
                <tr>                
                    <td>${number}</td>
                    <td><a href ="/news/get?bno=${board.bno}">
                    <c:out value="${board.title}"/></a></td>
                    <td><c:out value="${board.memberid}"/></td>
                    <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.insert_ts}"/></td>
                    <td><c:out value="${board.readcnt}"/></td>
       			 </tr>
          <c:set var="number" value="${number-1}"/>
        </c:forEach>
	<button type="button" id="regBtn"> 등록하기 </button></li>
</table>
</div>

<!--페이징 처리 -->
 
<div id="wrapper">
    <div id="pagination">
        <form id="paginationForm">
            <input type="hidden" name="currPage"> 
            <input type="hidden" name="amount">
            <input type="hidden" name="pagePerPage">
        
            <ul>  
                <c:if test="${pageMaker.prev}">                 
                    <li class="prev"><a class ="prev" href="${pageMaker.startPage -1 }">Prev</a></li>   <!--왜 클래스 사용했을까? 공통된 특성을 두군데 같이 중복 적용하기 위해서 -->
                </c:if>
                      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                
                    <li class="${pageMaker.cri.currPage == pageNum?'currPage' : ''}">
                        <a    
                        class="${pageMaker.cri.currPage == pageNum? 'currPage' : ''}"
                        href="/news/listPerPage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                        ${pageNum}
                        </a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="next"><a class ="next" href="${pageMaker.endPage +1}">next</a></li>
         
                </c:if>
            </ul>
        </form>
    </div>
</div>
                
                </div>
            </div>
        </div>

   

        <footer>
        <div id="footer_wrapper">
                <div class="footer_logo"><img src="/resources/img/footer_logo.png"></div>
                <div class="footer_info">         
                    <ul class="personal">
                        <li><a href="#">개인정보처리방침 | </a></li>
                        <li><a href="#">이메일주소 무단수집거부 | </a></li>
                        <li><a href="#">사이트맵</a></li>
                    </ul>

                    <ul class="address">
                        <li>경기도경제과학진흥원 경기도 수원시 영통구 광교로107(구,이의동 906-5)</li>
                        <li>TEL : 031-259-6531~4 FAX : 031-259-6258</li>
                        <li>copyright 2016 (c) GBSA All Rights Reserved.</li>
                    </ul>
                </div>
                <form name="#">
                    <input type="hidden">
                    <select name="#" id="#">
                        <option value="#">관련기관 선택</option>
                        <option value="www.naver.com">네이버</option>
                        <option value="www.kakaocorp.com">카카오</option>
                        <option value="www.daum.net">다음</option>
                        <option value="www.bitcapm.co.kr">비트캠프</option>
                    </select>
                </form>

            </div>

        </div>
    </footer>
    </div> <!--wrap-->
</body>

</html>