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
                                <div class="companyImg"><img src='/resources/img${company.fpath}/${company.frename}_${company.forname}'></div>
                                <table class="companyTable">
                                    <tbody>
                                        <tr>
                                            <th>업체명</th>
                                            <td><p>${company.applycompany}</p></td>
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
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>