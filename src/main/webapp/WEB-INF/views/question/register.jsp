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

    <!-- summernote -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
        
</head>

<style>
    #wrapper{
        width: 1200px;
    }

    #register{
        width: 100%;
        border-top: 5px solid #005bbb;
        margin-top: 50px;
    }

    #title{
        display: inline-block;
        width: 900px;
        height: 30px;

        border: none;
        border-bottom: 1px solid grey;
        
    }

    #memberid{
        display: inline-block;
        width: 100px;
        height: 30px;

        border: none;
    }



    button{
        border: none;
        width: 100px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        background: #005bbb;
        color: #fff;
        font-size: 15px;
    }
    #file{
        display: none;
    }
    .input-file-button{
        
        width: 100px;
        height: 40px;
        font-size: 15px;
        text-align: center;

        line-height: 40px;
        display: inline-block;
        background-color:white;
        /* border-radius: 4px; */
        color: #005bbb;
        cursor: pointer;

        border: 1px solid #005bbb;
    }

    td{
        padding: 5px;
    }

    #buttons{
        width:900px;
        display: flex;
        justify-content: space-between;
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
        
        $('#listBtn').on('click',function () {
            location.href="/question/list${cri.getPagingUri}" ; 
        
        });//onclick list

        $('#summernote').summernote({
        height: 300,
        width: 900,   
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']]
        ]
        });//summer note

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
                    <li><a class="chk" href="/news/listPerPage">보도자료</a></li>
                    <li><a class="chk" href="/question/list">질문게시판</a></li>
                    <li><a class="chk" href="/often/question">자주묻는질문</a></li>
                    <li><a class="chk" href="/anony/list">고객의소리</a></li>
                    <li><a class="chk" href="/free/board">자유게시판</a></li>
                    <li><a class="chk" href="/event/listPerPage">이벤트</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > 질문게시판 </div>
                    <h2 class="subName">질문게시판</h2>
                </div>
                <div class="contentIn">
                	
                    <div id="wrapper">

                        <form action="/question/register" method="POST" enctype="multipart/form-data">
                            
                            <table id="register">
                                <tr>
                                    <td>
                                        <input type="text" name="title" id="title" size="50" placeholder="제목을 입력하세요">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        작성자 <input type="text" name="memberid" id="memberid" size="20" value="${__LOGIN__.memberid}">
                                        <input type="radio" name="public_tf" value="T" checked>공개&nbsp;
                                        <input type="radio" name="public_tf" value="F">비공개
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <textarea id="summernote" name="editordata" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="file" class="input-file-button">파일업로드</label>
                                        <input type="file" name="file" id="file">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="buttons">
                                            <button type="submit" id="submitBtn">등록</button>
                                            <button type="button" id="listBtn">목록</button>

                                        </div>
                                    </td>
                                </tr>
                                
                            </table>

                        
                        </form>

                    </div>
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>