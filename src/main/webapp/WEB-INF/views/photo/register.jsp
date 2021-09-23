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
    .btn {
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
    

    #writer{
        line-height: 40px;
        height: 40px;
        margin-top: 10px;
        font-size: 20px;
    }

    #title_input{
        line-height: 40px;
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
        
        $('#listBtn').on('click',function(){

        location.href = "/photo/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";

});//regBtn
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
                    <div id="register_area">
                        
                        <form action="/photo/register" method="POST" id="register" enctype="multipart/form-data">
                            <div id="content_input">
                                <input type="hidden" name="currPage" value='${cri.currPage}' >
                                <input type="hidden" name="amount" value='${cri.amount}' >
                                <input type="hidden" name="pagesPerPage" value='${cri.pagesPerPage}' >

                                <input type="hidden" name="content" value="$이미지파일첨부">
                                <input type="hidden" name="memberid" value="${__LOGIN__.memberid}">
                                <input type="hidden" name="bname" value="포토게시판">
                            </div>

                            <div id="writer">
                                작성자 : ${__LOGIN__.memberid}</h1>
                            </div>

                            <div id="title_input">
                                <input type="text" name="title" placeholder="제목을 입력하세요" required>
                            </div> 

                            <!-- 파일첨부 -->
                            <div class="uploadDiv">
                                <label class="custom-file-upload">
                                    파일선택<input class="buttonstyle" type="file" name="uploadFile" accept="image/*">
                                </label>
                            </div>
                            <br>
                                

                            <button type="submit" class="btn" id="uploadBtn">등록</button>
                            <button type="button" class="btn" id="listBtn">목록</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>