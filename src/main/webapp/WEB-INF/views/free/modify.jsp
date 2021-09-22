<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
   	<script src="//cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script>
   	
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
            console.clear();
            console.debug('jq started.');

            $('#listBtn').on('click', function(){
                console.log('listBtn button clicked...');

                location.href="/free/board";
                
            });//onclick
            
            $('#removeBtn').on('click', function(){
                console.log('removeBtn button clicked...');
				var obj = $('form')
                
				obj.attr('action','/free/remove');
				obj.attr('methood','POST');
				obj.submit();
            });//onclick
            
            

        }); //jq
    </script>

    <style>

    </style>
</head>
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
                    <div class="map">home > 고객센터 > 자유게시판 </div>
                    <h2 class="subName">자유게시판</h2>
                </div>
                <div class="contentIn">
			        <form action="/free/modify" method="post">
			        	<input type="hidden" name="bno" value="${__READ__.bno}">
			        	
		        		<div>글번호${__READ__.bno}</div>
			        		
				        
						
						
				        <span><label for="TITLE">제목</label></span>
				        <span><input type="text" name="title" id="TITLE" value="${__READ__.title}"></span>
				
				        <textarea id="editor" name="content">${__READ__.content}</textarea>
						
						<p><label for="MEMBERID">작성자</label>${__READ__.memberid}</p>
				        
				
						<p><label for="READCNT">조회수</label>${__READ__.readcnt}</p>
				        
			
				        <input type="submit" id="submitBtn" value="수정">
				        <button id="removeBtn" type="button">삭제</button>
				        <button id="listBtn" type="button">목록</button>
			        </form>
			        
			            <script>
				        CKEDITOR.replace( 'editor', {
				        	enterMode: CKEDITOR.ENTER_BR, //줄바꿈시에 P태그로 입력되는걸 -> </br> 태그로 치환
				        	width: '98%',
				        	height: '350'
				        });
				    	</script>
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>