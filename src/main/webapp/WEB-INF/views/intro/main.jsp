<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>지페어 코리아</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/intro.css">
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
                    <div class="map">home > 전시회 소개 > <strong>전시회 안내</strong> </div>
                    <h2 class="subName">전시회 안내</h2>
                </div>
                
                <div class="contentIn">
                    <div id="topmenu">
                        <p>전시회 안내</p> 
                        <span>About G-fair</span>
                    </div>
                    <div class="about_gfair">
                        <div class="about_gfair01">
                            <div class="about_gfair01_bg"></div>
                            <div class="about_gfair01_img">
                                <img src="/resources/img/kintexbg2.jpg" alt="kinteximg">
                            </div>
                            <div class="about_gfair01_info">
                                <ul>
                                    <li class="infolist_01">
                                        <span class="info_span01">명칭 :</span>
                                        <span class="infolist_01_01">G-FAIR KOREA</span>
                                    </li>
                                
                                    <li class="infolist_01">
                                        <span class="info_span01">장소 :</span>
                                        <span class="infolist_01_01">고양 KINTEX 제 1 전시장</span>
                                    </li>
                                </ul>
                                <ul>
                                    <li class="infolist_02">
                                        <span class="info_span01">기간 :</span>
                                        <span class="infolist_01_02">2021년 10월 28일 ~ 2021년 10 월 30일 </span>
                                    </li>
                                    <li class="infolist_02">
                                        <span class="info_span01">후원 :</span>
                                        <span class="infolist_01_02">산업통상자원부  중소벤처기업부  World-OKTA </span>
                                    </li>
                                    <li class="infolist_02">
                                        <span class="info_span01">주관 :</span>
                                        <span class="info_Institution">
                                            <img src="/resources/img/info_kotra.png" >
                                        </span> 
                                        <span class="info_Institution">
                                            <img src="/resources/img/info_ky.png" >
                                        </span>   
                                    </li>
                                </ul>

                            </div>
                        </div>
                        <div class="about_gfair02">
                            <ul>
                                <li class="title_box01">
                                    <div class="dia">
                                        <div class="diat">
                                            생활용품관
                                            <br>
                                            <br>
                                            유아+생활가전
                                         </div>
                                     </div>
                                </li>
                                <li class="title_box02">
                                    <div class="dia">
                                        <div class="diat">
                                            건강용품관
                                            <br>
                                            <br>
                                            헬스케어+레저
                                        </div>
                                    </div>
                                </li>
                                <li class="title_box03">
                                    <div class="dia">
                                        <div class="diat">
                                            주방용품관
                                            <br>
                                            <br>
                                            식품+주방용품
                                        </div>
                                    </div>
                                </li>
                                <li class="title_box04">
                                    <div class="dia">
                                        <div class="diat">
                                            뷰티용품관
                                            <br>
                                            <br>
                                            화장품+패션
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="about_gfair03">
                            <ul>
                                <li class="topbro">
                                    브로슈어 <span>DOWNLOAD</span>
                                </li>
                                <li class="picBro">
                                    <img src="/resources/img/brobookf.png" alt="brobook">
                                </li>
                            
                                <li class="downbro">
                                    국문브로슈어 
                                    <a href="/resources/pdf/G-FAIR KOREA 2021 브로슈어.pdf"><span class="down1">DOWNLOAD</span></a>
                                </li>
                                <li class="downbro">
                                    영문브로슈어 
                                    <a href="/resources/pdf/G-FAIR_KOREA_2021_Brochure.pdf"><span class="down1">DOWNLOAD</span></a>
                                </li>
                                <li class="downbro">
                                    2020년 결과보고서 
                                    <a href="/resources/pdf/G-FAIR KOREA 2020 결과보고서.pdf"><span class="down2">DOWNLOAD</span></a>
                                </li>
                            </ul>
                        </div>
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