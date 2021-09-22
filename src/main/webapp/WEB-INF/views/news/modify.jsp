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
        $(function () {
            console.clear();
            console.debug("jq start")
   
   
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
	  
    	});

            $('#listBtn').on('click',function(){
                location.href= location.href="/news/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
             });

             $('#removeBtn').on('click',function(){
                alert("정말 삭제하시겠습니까?")
              });
             $('#removeBtn').on('click',function(){
                let formObj = $('form');
                 formObj.attr('action',"/news/remove");
                 formObj.attr('method',"post");
                 formObj.submit();
             });
        }); 
   
       </script>
    
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/common.css">
	 <link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/sub.css">
	 
<style>
	<style>
	#wrap {
    margin: 0;
    width: 100%
    align-items: center;
    
}
body,input,textarea,select,button,table{
	font-family:'noto-sans';
	font-size:12px; 
	color:#333;
	}
.wraper {
    width: 1200px;
    margin-top: 50px;
    border-top: 2px solid #005bbb;
}

label {
    width: 54px;
    display: inline-block;
    width: 115px;
    text-align: center;
    font-size: 20px;
    height: 30px;
    height: min-content;
}

input#title {
    height: 30px;
    font-size: 15px;
    width: 1074px;

    font-weight: 500;
}
	
textarea#content {
   position: relative;
    left: -21px;
    top: 4px;
    font-size: 15px;
    width: -6px;
}

#container #content {
    width: 1073px;
    margin: 0 0 10px 20px;
    float: left;
}
#modifyBtn,#listBtn, #removeBtn {
    height: 40px;
    width: 100px;
    line-height: 40px;
    text-align: center;
    background-color: #005bbb;
    color: #fff;
    font-size: 15px;
    left: 891px;
    top: 4px;
    position:relative;
}
    
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
                            <li class="tm2"><a href="#" target="blank"><img src="/resources/img/mail.png" alt=""></a></li>
                        </ul>
                    </div>
                </div>
                   <div class="gnb_wrapper">
                    <h1 class="logo"><a href="index.html">로고</a></h1>
                    <div id="nav">
                          <ul class="dropdownmenu">
                            <li class="menu"><h3><a href="#">전시회 소개</a></h3>
                               <ul>
                                    <li><a href="/intro/main">전시회안내</a></li>
                                    <li><a href="/history/main">연혁</a></li>
                                    <li><a href="/exhibition/calendar">전시회일정</a></li>
                                    <li><a href="/facilities/main">부대시설</a></li>
                                    <li><a href="/traffic/main">찾아오시는길</a></li>
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
                                    <li><a href="/notice/list">공지사항</a></li>
                                    <li><a href="/news/listPerPage">보도자료</a></li>
                                    <li><a href="/question/list">질문게시판</a></li>
                                    <li><a href="/often/question">자주묻는질문</a></li>
                                    <li><a href="/annoy/list">고객의소리</a></li>
                                    <li><a href="/free/board">자유게시판</a></li>
                                    <li><a href="/event/listPerPage">이벤트</a></li>
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
                 <li><a href="/notice/list">공지사항</a></li>
                <li><a href="/news/listPerPage">보도자료</a></li>
                <li><a href="/question/list">질문게시판</a></li>
                <li><a href="/often/question">자주묻는질문</a></li>
                <li><a href="/annoy/list">고객의소리</a></li>
                <li><a href="/free/board">자유게시판</a></li>
                <li><a href="/event/listPerPage">이벤트</a></li>
            </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > <strong>공지사항</strong> </div>
                    <h2 class="subName">공지사항</h2>
                </div>
                <div class="contentIn">
                	<div class="wraper">
                        <form action="/news/modify" method="POST">
        <table border="1">

            <input type="hidden" id="notice_tf" name="notice_tf" value="T">
            <input type="hidden" id="public_tf" name="public_tf"  value="T">
            <input type="hidden" id="reply_tf" name="reply_tf"  value="T">
            <input type="hidden" value="<c:out value='${board.bno}'/>"id = "bno" name="bno">
            <thead>
                
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" value="<c:out value='${board.title}'/>" id="title" name="title" readonly></td>
                    </tr>
                
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><input type="text" value="<c:out value='${board.content}'/>" id="content" name="content" ></>
                    </tr>
                    
         
           </thead>
        </table>
        
          <button type="submit" id="modifyBtn"> 수정완료</button>
          <button type="button" id="removeBtn"> 삭제</button>
          <button type="button" id="listBtn"> 목록으로</button>
    </form>
                    </div>
                
           
                
                </div>
            </div>
        </div>

   

        <footer>
        <div id="footer_wrapper">
                <div class="footer_logo"><img src="../publishing/img/footer_logo.png"></div>
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