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

                    
                    location.href = "/photo/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagePerPage=${cri.pagesPerPage}";
                    
                }); // .onclick

                $("#removeBtn").on('click', function () {
                    console.log('#removeBtn button clicked.');

                    

                    let formObj = $("form");     //블록변수 => 지역변수
                    formObj.attr('action', '/photo/remove');  //**
                    formObj.attr('method', 'POST');

                    formObj.submit(); //실제전송
                    
                });

            }); //jq
        </script>
    </head>
    <body>
        <h1>/WEB-INF/views/photo/modify.jsp</h1>
        <hr>

        <div id="container">
            <form action="/photo/modify" method="POST">
                <!-- <input type="hidden" name="bno" value="${board.bno}"> -->
                <input type="hidden" name="currPage" value="${cri.currPage}">
                <input type="hidden" name="amount" value="${cri.amount}">
                <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                
                <table border="1">
                    <tr>
                        <td><label for="fid">fid</label></td>
                        <td><input type="text" id="fid" name="fid" value="${file.fid}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="title">title</label></td>
                        <td><input type="text" id="title" name="title" value="${board.title}"></td>
                    </tr>
                    <tr>
                        <td><label for="frename">frename</label></td>
                        <td><input type="text" id="frename" name="frename" value="${file.frename}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="fpath">fpath</label></td>
                        <td><input type="text" id="fpath" name="fpath" value="${file.fpath}" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="forname">forname</label></td>
                        <td><input type="text" id="forname" name="forname" value="${file.forname}" readonly></td>
                    </tr>
                    
                    
                </table>

                <button type="submit" id="submitBtn">수정하기</button>

                <button type="button" id="removeBtn">삭제</button>
                <button type="button" id="listBtn">목록보기</button>
            </form>
            
        </div>

    </body>
</html>