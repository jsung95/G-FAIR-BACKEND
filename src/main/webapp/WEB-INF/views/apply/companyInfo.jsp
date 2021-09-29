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
    <link rel="stylesheet" href="/resources/css/companyGetPage.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>
    <script src="/resources/js/top.js" type="text/javascript"></script>
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
    $(function(){
     
        //목록보기
        $('#exListBtn').on('click',function(){

            location.href = "/apply/companyList?applyname=${applyname}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";

        });//listBtn

    })
</script>

<script>
    // ==== 진성 좋아요 기능 ==== //
    // ==== 진성 좋아요 기능 ==== //
    // ==== 진성 좋아요 기능 ==== //

    $(function(){


        // if(getCookie('cp_img') != "") {
        //     var cp_img_arr = getCookie('cp_img').split(',');

        //     for(var i = 0; i < cp_img_arr.length; i++) {
        //         InputHtml(i);
        //         $('#cookie_img' + i + "").attr('src', cp_img_arr[i]);
        //     }
        // }

        
        $('#hide_cp_img').val($('#companyImg').attr('src')); //참여기업 이미지 경로 가져오기


    	var cp_img = $('#hide_cp_img').val();
        var cp_img_arr = getCookie('cp_img').split(',');

        $('#cp_append').html("");

        for(var i = 0; i < cp_img_arr.length; i++) {

            if(cp_img_arr[0].trim() == "") {
                break;
            }

            if(cp_img == cp_img_arr[i]) {
                $('#cp_h_img').attr('src', '/resources/img/ico_h_on.png');
            }

            InputHtml(i);
            $('#cookie_img' + i).attr('src', cp_img_arr[i]);

        }
        
    })//end jq

    function setCookie(name, value, exp) {
        var date = new Date();
        date.setTime(date.getTime() + exp*24*60*60*1000);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
    }

	function getCookie(key) {

        var cookie = document.cookie;
        var cookie_arr = cookie.split(";");
        var cookie_json = {};

        if (cookie) {
            for (var i = 0, j = cookie_arr.length; i < j; i++) {

                var arr = cookie_arr[i].split("=");
                var _key = arr[0].trim();
                var _value = arr[1].trim();
                cookie_json[_key] = _value;

            }
        }

        if (cookie_json[key]) {

            return cookie_json[key];

        }

        return "";

    }

       // 쿠키 입력
    function insCookie(key, value, days) {

        var cookie_value = getCookie(key);
        var cookie_arr = cookie_value.split(',');
        var cookie_arr = (cookie_value||'').split(',');

        if (!cookie_value || !cookie_arr.length) {
            cookie_arr = [];
        }

        // 3개 이상일때
        if (cookie_arr.length >= 3) {
            cookie_arr.push(value);
            cookie_arr.splice(0, 1);
        } else {
            cookie_arr.push(value);
        }

        var exdate = new Date();
        exdate.setDate(exdate.getDate() + days);
        //설정 일수만큼 현재시간에 만료값으로 지정
        var path = '/';
        var cookie = cookie_arr.join(",") + ((days == null) ? '' : ';    expires=' + exdate.toUTCString() + '; path=' + path);
        document.cookie = key + '=' + cookie;
        //alert(document.cookie);

    }


       // 쿠키 삭제
    function delCookie(key, value, days) {

        var cookie_value = getCookie(key);
        var cookie_arr = cookie_value.split(",");

        if (!cookie_arr.length) {
            cookie_arr = [];
        }

        for (var i = 0, j = cookie_arr.length; i < j; i++) {

            if (cookie_arr[i] == value) {
                cookie_arr.splice(i, 1);
            }

        }

        var exdate = new Date();
        exdate.setDate(exdate.getDate() + days);
        //설정 일수만큼 현재시간에 만료값으로 지정
        var path = '/';
        var cookie = cookie_arr.join(",") + ((days == null) ? '' : ';    expires=' + exdate.toUTCString() + '; path=' + path);
        document.cookie = key + '=' + cookie;

    }


    function h_imgChange() {
        var cp_img = $('#hide_cp_img').val();
        var cp_h_img = $('#cp_h_img').attr('src');
        var cp_no = $('#cp_no').val();

        if(cp_h_img == "/resources/img/ico_h_on.png") { //on 일때
            $('#cp_h_img').attr('src', "/resources/img/ico_h_off.png"); //off로 바꿈
            delCookie('cp_img', cp_img, 1);
            delCookie('cp_no', cp_no, 1);
        } else { //off일때
            $('#cp_h_img').attr('src', "/resources/img/ico_h_on.png"); //on으로 바꿈
            insCookie('cp_img', cp_img, 1);
            insCookie('cp_no', cp_no, 1);
        }

        var cp_img_arr = getCookie('cp_img').split(',');
        $('#cp_append').html("");

        for(var i =0; i < cp_img_arr.length; i++) {

            if(cp_img_arr[0].trim() == "") {
                break;
            }
            InputHtml(i);
            $('#cookie_img' + i + "").attr('src', cp_img_arr[i]);

        }

    }

    function InputHtml(seq) {
        var html = "<li id='list_" + seq + "'>" +
            "<a href='javascript: showCpImg("+ seq +");' id='cp_no" + seq + "'>" +
            "<img src='../images/sub/bg_n.png' width='100px' height='100px' id='cookie_img" + seq + "'/> " +
            "</a>" +
            "<em class='ico_c1'>기업</em>" +
            "</li>";

        $('#cp_append').append(html);
    }

    function showCpImg(seq) {
        var cp_no_arr = getCookie('cp_no').split(',');

        if(seq == 0) {
            location.href = "/apply/companyInfo?applyno=" + cp_no_arr[0];
        } else if(seq == 1) {
            location.href = "/apply/companyInfo?applyno=" + cp_no_arr[1];
        } else if(seq == 2) {
            location.href = "/apply/companyInfo?applyno=" + cp_no_arr[2];
        }
    }

</script>

<style>
    /* ==== 진성 좋아요 기능 ==== */
    #cp_h_img {
        width: 27px;
        height: 22px;
    }

    .fav_box {
        position: fixed;
        top: 443px;
        right: 20px;
        height: 200px;
    }

    .fav_box ul li {
        width: 100%;
        position: relative;
        border: 1px solid #ddd;
        height: 100px;
        overflow: hidden;
        text-align: center;
        line-height: 100px;
        overflow: hidden;
        margin-top: 10px;

        border-bottom: 1px solid #ddd !important;
        margin-top: -1px !important;
    }
</style>

<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">참가안내</h2>
                <ul id="parent">
                    <li><a class="chk" href="/apply/info">참가신청안내</a></li>
                    <li><a class="chk" href="/apply/app">참가신청</a></li>
                    <li><a class="chk" href="/apply/applystatus">참가신청확인</a></li>
                    <li><a class="chk" href="/apply/rule">참가규정</a></li>
                    <li><a class="chk" href="/apply/booth">부스안내</a></li>
                    <li><a class="chk" href="/apply/map">전시장배치도</a></li>
                    <li><a class="chk" href="/apply/companyList">참가기업목록</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 참가안내 > 참가기업목록 </div>
                    <h2 class="subName">참가기업목록</h2>
                </div>
                <div class="contentIn">
                    <div id="exWrapper">
                        
                        <div id="getPage">
                           <div class="subjectLine">
                                <!-- 글제목 -->
                                <div class="subject">
                                    <p>참가전시회명 : ${company.applyname}</p>
                                </div>
                               
                                <!-- 등록일 / 수정일 / 조회수-->
                                <div class="regDate">
                                    &nbsp;&nbsp;&nbsp;참가신청일:<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${company.applydate}"/>
                                </div>
                           </div>
                           <!-- 내용 -->
                            <div class="content">
                                <div class="companyImg"><img id="companyImg" src='/resources/img${company.fpath}/${company.frename}_${company.forname}'></div>
                                <table class="companyTable">
                                    <tbody>
                                        <tr>
                                            <th>업체명</th>
                                            <td>
                                                <p>
                                                    ${company.applycompany}
                                                    <a href="#" onclick="h_imgChange()">
                                                        <img src="/resources/img/ico_h_off.png" id="cp_h_img" >
                                                        <input type="hidden" id="hide_cp_img" value="">
                                                        <input type="hidden" id="cp_no" value="${param.applyno}">
                                                    </a>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>대표자</th>
                                            <td><p>${company.membername}</p></td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td><p>${company.email}</p></td>
                                        </tr>
                                        <tr>
                                            <th>홈페이지</th>
                                            <td><a href="#">http://www.bitcamp.org</a></td>
                                        </tr>
                                        <tr>
                                            <th>주소</th>
                                            <td><p>${company.memberaddress}</p></td>
                                        </tr>
                                        <tr>
                                            <th>소개</th>
                                            <td><p>우수한 상품 판매</p></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="reg">
                                <button type="button" class="buttonstyle" id="exListBtn">목록</button>
                            </div>
                        </div>
                    </div>


                    <!-- ==== 진성 좋아요 기능 ==== -->
                    <div class="fav_box">
                        <p>관심 기업 및 제품"</p>
                        <ul id="cp_append">
                            <!-- 여기에 기업 이미지, 정보가 생성됨 -->
                        </ul>
                    
                    </div>
                    <!-- ==== 진성 좋아요 기능 ==== -->


                </div>
            </div>
        </div>

        <span id="top_btn">top</span>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>