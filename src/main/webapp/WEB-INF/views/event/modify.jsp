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

    .clear{
        clear: both;
    }
    #title_area{
        border-bottom: 1px solid rgb(201, 201, 201);
        border-top: 1px solid #6f2b89;
        height: 40px;
        line-height: 40px;
        font-size: 20px;
    }
    
    #title_input{
        width: 40%;
    }

    #textarea{
        margin-top: 10px;
        margin-bottom: 10px;
        width: 40%;
    }
    #writer{
        float: right;
        width: 20%;
    }

    .uploadDiv{
        width: 40%;
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

    input[type="file"]{
        display: none;
    }

    .custom-file-upload {
        float: right;
        background-color: #005bbb;
        padding: 6px 12px;
        cursor: pointer;

        font-size: 20px;
        color: #fff;
        border-radius: 4px;
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
                    <li><a class="chk" href="#">보도자료</a></li>
                    <li><a class="chk" href="#">질문게시판</a></li>
                    <li><a class="chk" href="#">자주묻는질문</a></li>
                    <li><a class="chk" href="#">고객의소리</a></li>
                    <li><a class="chk" href="#">자유게시판</a></li>
                    <li><a class="chk" href="/event/listPerPage">이벤트</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > 공지사항 </div>
                    <h2 class="subName">공지사항</h2>
                </div>
                <div class="contentIn">
                	
                    <!-- 여기에 게시판 넣으면 됩니다. -->
                    <form action="/event/modify" method="POST">
                        <!-- <input type="hidden" name="bno" value="${board.bno}"> -->
                        <input type="hidden" name="currPage" value="${cri.currPage}">
                        <input type="hidden" name="amount" value="${cri.amount}">
                        <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                        <input type="hidden" name="fid" value="${file.fid}">
                        
                        <!-- 제목변경 -->
                        <div id="title_area">
                            <input type="text" name="title" id="title_input" placeholder="변경할 제목을 입력하세요">
                            <span id="writer">작성자 &nbsp;&nbsp; ${__LOGIN__.memberid}</span>
                        </div>
                        
                        <div id="original_img_area">
                            <img src="/resources/img/${file.fpath}${file.frename}">
                        </div>
                        <div>
                            <textarea  
                                name="content" 
                                id="textarea" 
                                cols="48" 
                                rows="10" 
                                placeholder="변경할 내용을 입력하세요"></textarea>
                                
                        </div>

                        <div class="uploadDiv">
                            <label class="custom-file-upload">
                                이미지변경<input class="buttonstyle" type="file" name="uploadFile" accept="image/*">
                            </label>
                        </div>
                        <button type="submit" class="btn1" id="submitBtn">수정하기</button>
        
                        <button type="button" class="btn1" id="removeBtn">삭제</button>
                        <button type="button" class="btn1" id="listBtn">목록보기</button>
                    </form>
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>