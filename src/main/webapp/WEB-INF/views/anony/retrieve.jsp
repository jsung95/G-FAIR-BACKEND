<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>지페어 코리아</title>

    <link href="/resources/css/anonyRegPage.css" rel="stylesheet" type="text/css" />

    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/sub.css" rel="stylesheet" type="text/css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>

    <script src="/resources/js/uploadFile.js"></script>

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

        $('#listBtn').on('click',function(){

            location.href = "/anony/list?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";

        });//regBtn

    })//jq
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
                    <div class="map">home > 고객센터 > 고객의소리 </div>
                    <h2 class="subName">고객의소리</h2>
                </div>
                <div class="contentIn">
                    <div id="regPage">
                        <form action="/anony/retrieve" method="POST" id="Reg">
                            <div class="contentLine">
                                <input type="hidden" name="currPage" value='${cri.currPage}' >
                                <input type="hidden" name="amount" value='${cri.amount}' >
                                <input type="hidden" name="pagesPerPage" value='${cri.pagesPerPage}' >
                
                                <input type="hidden" name="bname" value="${board.bname}">
                                <input type="hidden" name="memberid" value="${__LOGIN__.memberid}">
                                <input type="hidden" name="reproot" value="${board.reproot}">
                                <input type="hidden" name="repstep" value="${board.repstep}">
                                <input type="hidden" name="repindent" value="${board.repindent}">
                                <input type="hidden" name="readcnt" value="0">
                                <input type="hidden" name="notice_tf" value="F">
                                <input type="hidden" name="reply_tf" value="F">
                
                                
                                <input type='hidden' name='forname'>
                                <input type='hidden' name='frename'>
                                <input type='hidden' name='fpath'>
                                <input type='hidden' name='filetype' value="false">
                
                
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p class='bnameSize'>고객의소리</p>
                                <p class="fontSize">&nbsp;원글제목 : ${board.title}</p>
                                <p>&nbsp;</p>
                                
                                <div><input class="fontSize" type="text" name="title" placeholder="제목을 입력해 주세요" required></div>
                                <p>&nbsp;</p>
                                <p class="fontSize">
                                    작성자&nbsp;&nbsp;${__LOGIN__.memberid}
                                    
                                    <input type="radio" name="public_tf" value="T" checked>공개
                                    <input type="radio" name="public_tf" value="F">비공개
                                </p> 
                                
                                <p>&nbsp;</p>
                                <div><textarea class="fontSize" name="content" cols="30" rows="10" placeholder="내용을 입력해 주세요" required></textarea></div>
                                <p>&nbsp;</p>
                
                            <!----------- 파일첨부 ----------->
                                <div class="uploadDiv">
                                    <!-- 파일 하나만 저장할 수 있게 만든다! -->
                                    <label class="custom-file-upload">파일업로드
                                        <input class="buttonstyle" type="file" name="uploadFile" accept="image/*">
                                    </label>
                                </div>
                        
                                <div class="uploadResult">
                                    <ul>
                                        <!-- 첨부된 파일 리스트.함수로 값 넣어준다 -->
                                    </ul>
                                </div>
                        
                                <div class="bigPictureWrapper">
                                    <div class='bigPicture'>
                                        <!-- 그림파일 원본으로 보여주기.함수로 값 넣어준다 -->
                                    </div>
                                </div>
                
                            </div>
                            
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                            
                            <button type="submit" class="buttonstyle" id="uploadBtn">등록</button>
                            <button type="button" class="buttonstyle" id="listBtn">목록</button>
                        </form>
                    </div>
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>