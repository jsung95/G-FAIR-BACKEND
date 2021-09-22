<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>history</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/history.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
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
		});
</script>

<style>
  #container{
     
	    width: 1400px;
	    overflow: hidden;
	    margin: 0 auto;
	        position: relative;
    right: 242px
	
        }
</style>

    
</head>

<body>
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
                <h2 class="asideMenu">전시회 소개</h2>
                <ul>
                    <li><a href="/intro/main">전시회 안내</a></li>
                    <li><a href="/history/main">연 혁</a></li>
                    <li><a href="/exhibition/calendar">전시회 일정</a></li>
                    <li><a href="/facilities/main">부대시설</a></li>
                    <li><a href="/traffic/main">찾아오시는 길</a></li>
              
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 전시회 소개 > <strong>연혁</strong> </div>
                    <h2 class="subName">연혁</h2>
                </div>
                    <div class="contentIn">
                        <div id="topmenu">
                            <p>연 혁</p> 
                            <span>G-fair가 걸어온 길</span>
                        </div>

                        <div class="historyBox">
                            <ul class="historyList">

                                <div class="historyboxLine1">
                                    <li class="history2020">
                                        <img src="/resources/img/history_junsi2020.jpg"/>
                                            <p class="history_font">
                                                <span class="text_year">2020</span>
                                                대한민국 우수상품 전시회 
                                                <br>
                                                <span class="text_date"> 2020.10.21&lpar;수&rpar; ~ 10.23&lpar;금&rpar;</span>
                                            </p>
                                            <p class="historyBtn">상세보기</p>
                                    </li>     
                                    
                                    <li class="history2019">
                                        <img src="/resources/img/history_junsi2019.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2019</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2019.10.31&lpar;목&rpar; ~ 11.03&lpar;일&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li> 

                                    <li class="history2018">      
                                        <img src="/resources/img/history_junsi2018.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2018</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2018.10.24&lpar;수&rpar; ~ 11.27&lpar;토&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li>   
                                </div> <!-- box 1-->

                                <div class="historyboxLine1">
                                    <li class="history2020">
                                        <img src="/resources/img/history_junsi2017.jpg"/>
                                            <p class="history_font">
                                                <span class="text_year">2017</span>
                                                대한민국 우수상품 전시회 
                                                <br>
                                                <span class="text_date"> 2017.11.01&lpar;수&rpar; ~ 11.04&lpar;토&rpar;</span>
                                            </p>
                                            <p class="historyBtn">상세보기</p>
                                    </li>     
                                    
                                    <li class="history2019">
                                        <img src="/resources/img/history_junsi2016.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2016</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2016.10.26&lpar;수&rpar; ~ 10.29&lpar;토&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li> 

                                    <li class="history2018">      
                                        <img src="/resources/img/history_junsi2015.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2015</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2015.11.05&lpar;목&rpar; ~ 11.08&lpar;일&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li>   
                                </div> <!-- box 1-->

                                <div class="historyboxLine1">
                                    <li class="history2020">
                                        <img src="/resources/img/history_junsi2014.jpg"/>
                                            <p class="history_font">
                                                <span class="text_year">2014</span>
                                                대한민국 우수상품 전시회 
                                                <br>
                                                <span class="text_date"> 2014.10.01&lpar;수&rpar; ~ 10.04&lpar;토&rpar;</span>
                                            </p>
                                            <p class="historyBtn">상세보기</p>
                                    </li>     
                                    
                                    <li class="history2019">
                                        <img src="/resources/img/history_junsi2013.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2013</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2013.10.09&lpar;수&rpar; ~ 10.12&lpar;토&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li> 

                                    <li class="history2018">      
                                        <img src="/resources/img/history_junsi2012.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2012</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2012.10.17&lpar;수&rpar; ~ 10.20&lpar;토&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li>   
                                </div> <!-- box 1-->

                                <div class="historyboxLine1">
                                    <li class="history2020">
                                        <img src="/resources/img/history_junsi2011.jpg"/>
                                            <p class="history_font">
                                                <span class="text_year">2011</span>
                                                대한민국 우수상품 전시회 
                                                <br>
                                                <span class="text_date"> 2011.10.25&lpar;화&rpar; ~ 10.27&lpar;목&rpar;</span>
                                            </p>
                                            <p class="historyBtn">상세보기</p>
                                    </li>     
                                    
                                    <li class="history2019">
                                        <img src="/resources/img/history_junsi2009.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2010</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2010.10.26&lpar;수&rpar; ~ 10.29&lpar;금&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li> 

                                    <li class="history2018">      
                                        <img src="/resources/img/history_junsi2008.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2009</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2009.09.24&lpar;목&rpar; ~ 09.26&lpar;토&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li>   
                                </div> <!-- box 1-->

                                <div class="historyboxLine2">
                                    <li class="history2020">
                                        <img src="/resources/img/history_junsi2007.jpg"/>
                                            <p class="history_font">
                                                <span class="text_year">2008</span>
                                                대한민국 우수상품 전시회 
                                                <br>
                                                <span class="text_date"> 2008.10.29&lpar;수&rpar; ~ 10.31&lpar;금&rpar;</span>
                                            </p>
                                            <p class="historyBtn">상세보기</p>
                                    </li>     
                                    
                                    <li class="history2019">
                                        <img src="/resources/img/history_junsi2009.jpg" >
                                        <p class="history_font">
                                            <span class="text_year">2007</span>
                                            대한민국 우수상품 전시회 
                                            <br>
                                            <span class="text_date"> 2007.10.11&lpar;목&rpar; ~ 10.13&lpar;토&rpar;</span>
                                        </p>
                                        <p class="historyBtn">상세보기</p>
                                    </li> 

                                </div> <!-- box 1-->
                            </ul> <!--ul-->
                        </div> <!--historyBox -->
                    </div><!--contentin-->
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