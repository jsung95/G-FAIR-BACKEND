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
    #container1{
        width: 1200px;
        margin-top: 50px;
        font-weight: bold;
    }

    h1{
        font-size: 25px;
        font-weight: bold;
    }

    .btn1 {
        width: 100px;
        height: 40px;

        border: 0;
        
        text-align: center;
        background: #005bbb;
        color: #fff;
        font-size: 15px;
        
        border-radius: 4px;
        cursor: pointer;
    }
    table{
        margin: 0 auto;
        width: 100%;
        border-collapse: collapse;
    }

    .buttons{
        width: 770px;
        margin-left: 500px;
    }

    .background_color{
        width: 150px;
        background-color: #eee;
        
    }

    .info{
        width: 300px;
        line-height: 40px;
        height: 40px;
    }

    #exname{
        width: 448px;
        height: 40px;
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
        

        $("#quitBtn").on("click", function () {
            location.href = "/event/listPerPage";
        });


        $("#submitBtn").on("click", function () {
            let exhiname = $('#exname').val();
            let exno = 0;
            console.log('exhiname: ', exhiname);

            <c:forEach items="${__EXHI__}" var="ex">
                if('${ex.exname}' == exhiname){
                    console.log('exno', '${ex.exno}'),
                    exno = '${ex.exno}',
                    $('#exno').attr('value', exno)
                }
            </c:forEach>

            if(exhiname == 'selected'){
                alert('전시회를 선택해주세요')
            }else{
                let formObj = $('#form')

                // formObj.attr('action', "/pre/registerAction");
                // formObj.attr('method', "POST");
                formObj.submit();
                
                alert('사전예약이 완료되었습니다.')

            }//if - else
        });
    })//end jq
</script>
<<<<<<< HEAD
<style>
    .contentIn > div {
        margin-top: 20px;
    }
    .contentIn > p {
        margin-top: 30px;
        margin-bottom: 30px;
        font-size: 30px;
    }
    .contentIn > p {
        margin-left: 30px;
        background-image: url("/resources/img/guide_bul.jpg");
        background-repeat: no-repeat;
        height: 20px;
        line-height: 20px;
        padding-left: 23px;
    }
    .guideImg {
        width: 100%;
        height: 300px;
        padding: 30px;
        background-image: url("/resources/img/guide.jpg");
        background-repeat: no-repeat;
    }
    .guideWrap {
        margin-left: 60px;
        height: 800px;
    }
    .guideWrap > p:nth-child(2){
        font-size: 20px;
        font-weight: bold;
        margin-top: 30px;
    }
    .guideWrap > p:nth-child(3){
        font-size: 20px;
        color: red;
    }
</style>
=======
>>>>>>> parent of a2e3643 (jsp modify)
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
                    <div class="map">home > 관람정보 > 사전관람신청 </div>
                    <h2 class="subName">사전관람신청</h2>
                </div>
                <div class="contentIn">
<<<<<<< HEAD
                    <p>개별신청</p>
                    <div class="guideWrap">
                        <div class="guideImg"></div>
                        <p>사전등록 시 현장에서의 별도 등록절차가 없으므로 현장의 혼잡을 피할 수 있습니다.</p>
                        <p>※ 사전등록하신 분에 한하여, 현장 방문시 추첨을 통하여 다양한 경품을 드립니다.</p>
                    </div>
=======
                	
                    <!-- 여기에 게시판 넣으면 됩니다. -->
>>>>>>> parent of a2e3643 (jsp modify)
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>