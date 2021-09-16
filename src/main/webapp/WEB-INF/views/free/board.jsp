<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    
    <script>
    $(function(){
        console.clear();
        console.debug('jq started');

        $('#regBtn').click(function(){
            console.debug('onClick on #regBtn clicked');

            location.href = "/free/write?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
            
        });

        $('a.prev , a.next').on('click', function(e) {
            console.debug('onclicked for a.next or a.prev');
            console.log('\t+ this:', this);

            e.preventDefault(); //Event에 의한 선택된 요소의 기본동작을 금지(무력화)

            var pagenationForm = $('pagenationForm');

            pagenationForm.attr('action','/free/listPerPage');
            pagenationForm.attr('method','GET');
            
            paginationForm.find('input[name=currPage]').val($(this).attr('href'));
            paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
            paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

            pagenationForm.submit();
        });
        
        
    });
    </script>
    
	<style>
 

    table{
        width: 1200px;

        border-bottom: 1px ridge black;
        border-collapse: collapse;

        text-align: center;
    }

    th{	
        padding: 10px;
        color: white;
        background-color: black;
        
    }

    td{
        padding: 3px;
    }

    #regBtn{
        width: 150px;
        height: 40px;

        cursor: pointer;

        border: 0;

        font-size: 15px;
        font-weight: bold;

        color: white;
        background-color: black;
    }

    tr:hover{
        background-color: rgb(239, 253, 226);
    }

    a, a:link, a:visited{
        text-decoration: none;
        color: black;
        cursor: pointer;
    }

    td:nth-child(3){
        text-align: left;

        width: 200px;
        padding-left: 10px;
    }
    
    .insertDate{
  	  width:170px;
    }
    
    .updateDate{
    	width:170px;
    }

    #pagination{
        width: 100%;
        margin: 0 auto; 
        position: relative;
    }

    #pagination .page{
    	width: 464px;
        margin: 10px auto;
        
    }

    #pagination li{
        float: left;

        width: 30px;
        height: 30px;
        border: 1px solid black;

        text-align: center;
        list-style: none;
        line-height: 30px;
        

    }


    .prev , .next {
        width: 70px!important;
        background-color: black;
        
    }

    .prev a, .next a {
        color: #fff;
        
    }

    .currPage{
        background-color: #999;
        color: #fff;
    }

	</style>
</head>

<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">고객센터</h2>
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">보도자료</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">자주묻는질문</a></li>
                    <li><a href="#">고객의소리</a></li>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">이벤트</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 고객센터 > <strong>자유게시판</strong> </div>
                    <h2 class="subName">자유게시판</h2>
                </div>
                <div class="contentIn">

		        <table border=1>
		            <thead>
		                <tr>
		                    <th>글번호</th>
		                    <th>원본글번호</th>
		                    <th>제목</th>
		                    <th>작성자</th>
		                    <th>등록일</th>
		                    <th>수정일</th>
		                    <th>조회수</th>
		                </tr>
		            </thead>
		            
		            <c:forEach items="${__LIST__}" var="list">
		                <tbody>
		                    <tr>
		                        <td>${list.bno}</td>
		                        <td>${list.repRoot}</td>
		                        <td><a href="read?bno=${list.bno}">${list.title}</a></td>
		                        <td>${list.memberId}</td>
		                        <td class="insertDate"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${list.insert_ts}" /></td>
			                    <td class="updateDate"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${list.update_ts}" /></td>
		                        <td>${list.readcnt}</td>
		                    </tr>
		                    
		                </tbody>
		            </c:forEach> 
		        </table>
		
		        
		        <div id="pagination">
		            <form action="" id="pagenationForm">
		            
		                <input type="hidden" name="currPage">
		                <input type="hidden" name="amount">
		                <input type="hidden" name="pagesPerPage">
		                
		                <ul class="page">
		                    <c:if test="${pageMaker.prev}">
		                        <li class="prev"><a href="/free/board?currPage=${pageMaker.startPage - 1}">Prev</a></li>
		                    </c:if>
		                    
		                    <c:forEach
		                    	 begin="${pageMaker.startPage}"
		                    	 end="${pageMaker.endPage}" 
		                    	 var="pageNum" >
		
		                         <li class="${pageMaker.cri.currPage == pageNum ? 'currPage':''}">
			                         <a href="/free/board?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
			                  		 ${pageNum}
			                  		 </a>
		                  		 </li>
		                    	 
							<!-- <a href="/board/board?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
		                    <li>${pageNum}</li>
		                    </a> -->
		
		                    </c:forEach>
		
		                    <c:if test="${pageMaker.next}">
		                        <li class="next"><a href="/free/board?currPage=${pageMaker.endPage + 1}">Next</a></li>
		                    </c:if>
		                    
		                </ul>
		            
		            </form>
		
		        </div>
				            <table>
		                <caption>
		                    <ul>
		                        <li>
		                            <form id="searchForm" action="/free/board" method="GET">
		                                <input type="hidden" name="currPage" value="1">
		                                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		                                <input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">
		
		                                <select name="type" class="search1">
		                                    <option value="T" ${ ("T" eq pageMaker.cri.type) ? "selected" : "" }>제목</option>
		                                    <option value="C" ${ ("C" eq pageMaker.cri.type) ? "selected" : "" }>내용</option>
		                                    <option value="W" ${ ("W" eq pageMaker.cri.type) ? "selected" : "" }>작성자</option>
		                                </select>
		
		                                <input type="text" name="keyword" class="search2" value="${pageMaker.cri.keyword}">
		                                <button class="search1">검색</button>
		                            </form>
		                        </li>
		                        <li>전체 게시글 수(${pageMaker.totalAmount})</li>
		                        <li><button id="regBtn" type="button">글쓰기</button></li>
		                    </ul>
		                </caption>
		            </table>
                
                </div>
            </div>
        </div>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>