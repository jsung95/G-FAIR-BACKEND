<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>질문게시판</title>

        <style>
            *{
                margin: 0 auto;
            }
            #wrapper{
                width: 1000px;
                display: flex;
                flex-direction: column;
            }
            table {
                width: 900px;

                border: 1px ridge rgb(46, 118, 252);
                border-collapse: collapse;
                
                text-align: center;
            }

            th {
                padding: 10px;

                color: white;
                background-color: cornflowerblue;

                font-size: 16px;
            }

            td{
                padding: 3px;
            }

   
        </style>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function () {
            	
            	var result = '${__RESULT__}';

                if(result.length>0){
                	console.log("event trigered");
                    alert(result);
                }//if
                
                $('#listBtn').on('click',function () {
                   location.href="/question/list?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}" 
                });//onclick

                $('#modifyBtn').on('click', function () {
                   location.href="/question/modify?bno=${__LIST__.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
                });//onclick.

                $('#retrieveBtn').on('click',function () {
                    location.href="/question/retrieve?bno=${__LIST__.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}"
                })//onclick ret

       
            }); //.jq
        </script>
    </head>
    <body>
        <div id="wrapper">

           

                <form action="/question/list">
                    <input type="hidden" name="currPage">
                    <input type="hidden" name="amount">
                    <input type="hidden" name="pagesPerPage">
                    
                    <table border="1" id="board">


                      
                           
                           

                        <c:choose>
                            <c:when test="${__LIST__.public_tf == 'T'}">
                                
                                <tbody>
                    
                                    <tr>
                                        <td>글번호 : ${__LIST__.bno}</td>
                                        <td>작성자 : ${__LIST__.memberid}</td>
                                        <td>작성일 : ${__LIST__.insert_ts}</td>
                                    </tr>
                    
                                    <tr>
                                        <td colspan='3'>제목: ${__LIST__.title}</td>
                                    </tr>
                    
                                    <tr>
                                        <td>내용</td>
                                        <td colspan='2'>${__LIST__.content}</td>
                                    </tr>

                                    <c:if test="${__FILE__.fid>0}">
                                        <tr>
                                            <td>첨부파일</td>
                                            <td colspan='2'><img src="${__FILE__.fpath}${__FILE__.frename}" alt="" width="600" height="400" ></td>
                                        </tr>
                                    </c:if>
                                    
                                    
                                </tbody>

                            </c:when>
                           
                            <c:otherwise>
                                <tbody>
                                    <tr>
                                        <td>
                                            <h5>비공개 글입니다.</h5>
                                        </td>
                                    </tr>
                                </tbody>
                            </c:otherwise>
                        </c:choose>
                    </table>

                    <button type="button" id="listBtn">LIST</button>
                    <button type="button" id="modifyBtn">MODIFY</button>
                    <button type="button" id="retrieveBtn">RETRIEVE</button>
                </form>
                <p>&nbsp;</p>
                <hr>

                <c:if test="${__LIST__.public_tf != 'F'}" >
                    <form action="/question/replyRegister" method="POST">
                        <table border="1" id="reply">
                            <tr>
                            
                                <td colspan="2"> 
                                    <input type="hidden" name="bno" value="${__LIST__.bno}">
                                    <textarea name="recontent" id="recontent" cols="50" rows="3" placeholder="댓글 내용을 입력하세요">
                                    </textarea>
                                </td>
                                
                                <td><input type="text" name="memberid" size="10" placeholder="작성자"></td>
                                <td><button type="submit" id="replyRegisterBtn">등록</button></td>
                            </tr>
                          
                        </table>
                    </form>

                      <!-- 이미 작성된 댓글  -->
                    <form action="/question/replyRemove" method="POST">
                        <table>
                            <tr>
                                <c:forEach items="${__REPLY__}" var="re">
                                    <tr>
                                        <td>
                                            <input type="hidden" name="bno" value="${re.bno}">
                                            <input type="hidden" name="reno" value="${re.reno}">
                                        </td>
                                        <td colspan="2">${re.recontent}</td>
                                        <td>${re.memberid}</td>
                                        <td>${re.redate}</td>
                                        <td><button type="submit" id="replyRemoveBtn">삭제</button></td>
                                        
                                    </tr>
                                </c:forEach>
                            </tr>
                        </table>
                    </form>
                </c:if>
           
        </div>
      
    </body>
</html>