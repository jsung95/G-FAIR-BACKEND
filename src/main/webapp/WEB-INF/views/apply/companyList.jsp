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
    <link href="/resources/css/companyList.css" rel="stylesheet" type="text/css" />
    
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


        $('#listBtn').on('click',function(){

            location.href = "/apply/companyList?currPage=${page.cri.currPage}&amount=${page.cri.amount}&pagesPerPage=${page.cri.pagesPerPage}";

        });//listBtn
    
        // 페이징
        $('a.prev, a.next, a.end').on('click',function(e) {

            e.preventDefault();

            var paginationForm = $('#paginationForm');

            paginationForm.attr('action','/apply/companyList');
            paginationForm.attr('method','GET');

            paginationForm.find('input[name=currPage]').val($(this).attr('href'));
            paginationForm.find('input[name=amount]').val('${page.cri.amount}');
            paginationForm.find('input[name=pagesPerPage]').val('${page.cri.pagesPerPage}');

            paginationForm.find('input[name=applyname]').val('${applyname}');

            paginationForm.submit();

        })//onclick

        //항목별 검색조회
        $('#exOption').change(function(){//
           
           exVal = $(this).val();
           
           console.log('exVal값:',exVal);

           var exValForm = $('#exValForm');
           exValForm.attr('action','/apply/companyList');
           exValForm.attr('method','GET');

           exValForm.append('<input type="hidden" name="currPage" value="1">');
           exValForm.append('<input type="hidden" name="amount" value="${page.cri.amount}">');
           exValForm.append('<input type="hidden" name="pagesPerPage" value="${page.cri.pagesPerPage}">');
           exValForm.append('<input type="hidden" name="applyname" value="'+exVal+'">');
           exValForm.submit();

       })//boardOption
    })//.jq
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

                <!-- 게시판넣기 -->
                <div class="contentIn">
                    <p id="totalCount">전체 참여기업 수 : ${page.totalAmount}</p>
                    
                    <div class="selectDiv">
                        전시회별로 참가기업 조회하기
                        <form id="exValForm">
                            
                            <select name="applyname" id="exOption">
                                <option value=>전체보기</option>
                                <c:forEach items="${exList}" var="ex">
                                    <option value="${ex.exname}" ${(ex.exname eq applyname) ? 'selected' : ''}>${ex.exname}
                                        (<fmt:formatDate pattern="yyyy/MM/dd" value="${ex.exstart}"/> ~
                                        <fmt:formatDate pattern="yyyy/MM/dd" value="${ex.exend}"/>)
                                    </option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                    
                    <ul class="companyWrap">
                        <c:forEach items="${companyList}" var="company" >
                            <li>
                                <a href="/apply/companyInfo?applyno=${company.applyno}&currPage=${page.cri.currPage}&amount=${page.cri.amount}&pagesPerPage=${page.cri.pagesPerPage}">
                                    <div class="companyImg">
                                        <img src='/resources/img${company.fpath}/${company.frename}_${company.forname}'>
                                    </div>
                                    <!-- 업체명 -->
                                    <p class="ptitle">${company.applycompany}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="reg">
                        <button type="button" class="buttonstyle" id="listBtn">목록</button>
                    </div>
        
                    <div id="pagination">
                        <form action="/anony/list" id="paginationForm">
                            <input type="hidden" name="currPage">
                            <input type="hidden" name="amount">
                            <input type="hidden" name="pagesPerPage">
                            <input type="hidden" name="applyname">
                            
                            <ul>
                                <li class="start"><a href="/apply/companyList?applyname=${applyname}&currPage=1&amount=12&pagesPerPage=${page.cri.pagesPerPage}">첫페이지</a></li>

                                <c:if test="${!page.prev}">
                                    <li class="prev"><a href="/apply/companyList?applyname=${applyname}&currPage=1&amount=12&pagesPerPage=${page.cri.pagesPerPage}">이전</a></li>
                                </c:if>

                                <c:if test="${page.prev}">
                                    <li><a class="prev" href="${page.startPage-1}">이전</a></li>
                                </c:if>
                                
                                <c:forEach var="pageNum" begin="${page.startPage}" end="${page.endPage}">
                                    <li class="${page.cri.currPage == pageNum ? 'currPage' : ''}">
                                        <a href="/apply/companyList?applyname=${applyname}&currPage=${pageNum}&amount=${page.cri.amount}&pagesPerPage=${page.cri.pagesPerPage}">${pageNum}</a>
                                    </li>
                                </c:forEach>
                                
                                <c:if test="${page.next}">
                                    <li><a class="next" href="${page.endPage+1}">다음</a></li>
                                </c:if>

                                <c:if test="${!page.next}">
                                    <li><a class="next" href="${page.realEndPage}">다음</a></li>
                                </c:if>

                                <li><a class="end" href="${page.realEndPage}">끝페이지</a></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>