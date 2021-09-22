<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>modify.jsp</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

        <script>
            $(function () {
                console.clear();
                console.debug('jq started..!')
                $("#listBtn").on('click', function () {
                    console.log('#listBtn button clicked.');

                    
                    location.href = "/event/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagePerPage=${cri.pagesPerPage}";
                    
                }); // .onclick

                $("#removeBtn").on('click', function () {
                    console.log('#removeBtn button clicked.');

                    

                    let formObj = $("form");     //블록변수 => 지역변수
                    formObj.attr('action', '/event/remove');  //**
                    formObj.attr('method', 'POST');

                    formObj.submit(); //실제전송
                    
                });

            }); //jq
        </script>
    </head>

    <body>
        <div id="container">
            <form action="/event/modify" method="POST">
                <!-- <input type="hidden" name="bno" value="${board.bno}"> -->
                <input type="hidden" name="currPage" value="${cri.currPage}">
                <input type="hidden" name="amount" value="${cri.amount}">
                <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                
                <table border="1">
                    <tr>
                        <td><label for="bno">글번호</label></td>
                        <td><input type="text" id="bno" name="bno" value="${event.bno}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="title">제목</label></td>
                        <td><input type="text" id="title" name="title" value="${event.title}"></td>
                    </tr>
                    <tr>
                        <td><label for="content">내용</label></td>
                        <td><input type="text" id="content" name="content" value="${event.content}"></td>
                    </tr>
                    <tr>
                        <td><label for="memberID">작성자</label></td>
                        <td><input type="text" id="memberID" name="memberID" value="${event.memberid}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="bName">게시판유형</label></td>
                        <td><input type="text" name="bName" id="bName" placeholder="게시판유형"></td>
                    </tr>
                </table>

                <button type="submit" id="submitBtn">수정하기</button>

                <button type="button" id="removeBtn">삭제</button>
                <button type="button" id="listBtn">목록보기</button>
            </form>
            
        </div>
    </body>
</html>