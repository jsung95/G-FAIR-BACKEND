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
<style>
    .guideImg {
        background-image: url();
    }
    .contentIn > p:nth-child(1){
        font-weight: bold;
    }
    .contentIn > p:nth-child(2){
        color: red;
    }
</style>
<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">관람정보</h2>
                <ul id="parent">
                    <li><a class="chk" href="/pre/guide">사전관람안내</a></li>
                    <li><a class="chk" href="/pre/agreement">사전관람신청</a></li>
                    <li><a class="chk" href="/pre/verify">사전관람신청확인</a></li>
                </ul>
            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 관람정보 > 사전관람안내 </div>
                    <h2 class="subName">사전관람안내</h2>
                </div>
                <div class="contentIn">
                	
                    <div class="guideImg"></div>
                    <p>사전등록 시 현장에서의 별도 등록절차가 없으므로 현장의 혼잡을 피할 수 있습니다.</p>
                    <p>※ 사전등록하신 분에 한하여, 현장 방문시 추첨을 통하여 다양한 경품을 드립니다.</p>
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>