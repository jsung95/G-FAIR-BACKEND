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

    .buttonstyle{
        right: 0px;

        width: 100px;
        height: 40px;

        border: 0;
        
        text-align: center;
        background: #005bbb;
        color: #fff;
        font-size: 15px;
        
        cursor: pointer;
    }

    input[type="file"]{
        display: none;
    }

    .custom-file-upload {
        display: inline-block;
        background-color: #005bbb;
        padding: 6px 12px;
        cursor: pointer;

        font-size: 20px;
        color: #fff;
        font-weight: bold;
        border-radius: 4px;
    }

    #title_change{
        height: 40px;
    }

    #changeBtn{
        margin-left: 10px;
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
        console.clear();
        console.debug('jq started..!')
        $("#listBtn").on('click', function () {
            console.log('#listBtn button clicked.');

            
            location.href = "/photo/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
        }); // .onclick

        $("#removeBtn").on('click', function () {
            console.log('#removeBtn button clicked.');

            

            let formObj = $('#form');     //블록변수 => 지역변수
            formObj.attr('action', '/photo/remove');  //**
            formObj.attr('method', 'POST');

            formObj.submit(); //실제전송
            
        });

        $("#changeBtn").on('click', function () {
            console.log("changeBtn button clicked.");


        });

    })//end jq
</script>
<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">고객센터</h2>
                <ul id="parent">
                    <li><a class="chk" href="/photo/listPerPage">포토갤러리</a></li>
                    <li><a class="chk" href="#">영상자료실</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 미디어센터 > 포토갤러리 </div>
                    <h2 class="subName">포토갤러리</h2>
                </div>
                <div class="contentIn">
                	
                    <!-- 여기에 게시판 넣으면 됩니다. -->
                    <div id="modify_form">
                        <form action="/photo/modify" method="POST" id="form">

                            <!-- <input type="hidden" name="bno" value="${board.bno}"> -->
                            <input type="hidden" name="currPage" value="${cri.currPage}">
                            <input type="hidden" name="amount" value="${cri.amount}">
                            <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                            <input type="hidden" name="fid" value="${file.fid}">
                            <br>

                            <div id="title_change">
                                <label for="title">제목</label>
                                <input type="text" name="title" value="${board.title}">
                            </div>

                            <div id="img_change">
                                <img src="/resources/img/${file.fpath}${file.frename}">
                                <button 
                                    class="btn1" 
                                    type="file" 
                                    id="changeBtn" 
                                    name="changeFile" 
                                    accept="image/*">이미지변경</button>
                            </div>
                            <!-- <table border="1">
                                <tr>
                                    <td><label for="fid">fid</label></td>
                                    <td><input type="text" id="fid" name="fid" value="${file.fid}" readonly></td>
                                </tr>
                                <tr>
                                    <td><label for="title">title</label></td>
                                    <td><input type="text" id="title" name="title" value="${board.title}"></td>
                                </tr>
                                <tr>
                                    <td><label for="frename">frename</label></td>
                                    <td><input type="text" id="frename" name="frename" value="${file.frename}" readonly></td>
                                </tr>
                                <tr>
                                    <td><label for="fpath">fpath</label></td>
                                    <td><input type="text" id="fpath" name="fpath" value="${file.fpath}" readonly></td>
                                </tr>
                                <tr>
                                    <td><label for="forname">forname</label></td>
                                    <td><input type="text" id="forname" name="forname" value="${file.forname}" readonly></td>
                                </tr>
                                
                            </table> -->
                            <br>
                            <button class="btn1" type="submit" id="submitBtn">수정완료</button>
                            <button class="btn1" type="button" id="removeBtn">삭제</button>
                            <button class="btn1" type="button" id="listBtn">목록보기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>