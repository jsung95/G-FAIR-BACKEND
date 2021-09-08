<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>get.jsp</title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

        <script>
            $(function () {
                console.clear();
                console.debug('jq started..!')
                $("#listBtn").on('click', function () {
                    console.log('#listBtn button clicked.');

                    
                    location.href = "/photo/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage${cri.pagesPerPage}";
                    
                }); // .onclick
                

                $("#modifyBtn").on('click', function () {
                    console.log('#modifyBtn button clicked..');

                    // location.href = "/board/modify?bno=${board.bno}";
                    location.href = "/photo/modify?fid=${file.fid}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage${cri.pagesPerPage}";
                }) // .onclick


            }); //jq
        </script>   


        <style>
            /* *{
                margin: 0 auto;
                padding: 0;
                list-style: none;
            } */
        </style>
    </head>
    <body>
        <h1>get.jsp</h1>
        <hr>

        <div id="container">
            <form action="#">
                <table border="1">
                    <tr>
                        <td>파일번호 : ${file.fid}</td>
                    </tr>
                    <tr>
                        <td>파일이름 : ${file.forname}</td>
                    </tr>
                </table>
                <div>
                    <h1><img src="/resources/img/${file.fpath}${file.frename}" alt=""></h1>
                </div>

                <button type="button" id="modifyBtn">수정</button>
                <button type="button" id="listBtn">목록보기</button>
            </form>
            
        </div>

    </body>
</html>