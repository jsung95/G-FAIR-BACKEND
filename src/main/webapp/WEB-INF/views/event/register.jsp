<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>register.jsp</title>
        <style> 

            #submitBtn{
                width: 100px;
                height: 40px;

                border: 0;

                font-size: 15px;
                font-weight: bold;

                color: white;
                background-color: green;

            }
            #submitBtn:hover{
                cursor: pointer;

            }
            #listBtn{
                width: 100px;
                height: 40px;

                border: 0;

                font-size: 15px;
                font-weight: bold;

                color: white;
                background-color: blue;

            }
            #listBtn:hover{
                cursor: pointer;

            }
        </style>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

        <script>
            $(function () {
                console.clear();
                console.debug("jq started.");

                $('#listBtn').click(function () {
                    
                    //GET, Request URI: /board/list
                    location.href = "/event/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPages=${cri.pagesPerPage}";

                });//onclick for #listBtn

            }); //jq
        </script>
    </head>
    <body>
        <h1>Register</h1>
        <hr>
        <div id="container">
            <form action="/event/register" method="POST" enctype="multipart/form-data">
                <!-- 어느화면에서든, 게시판 목록 페이지로 이동시, 반드시 아래 3개의 기준 전송파라미터를 전송시키기위해,
                    hiiden 값으로 설정 -->
                <input type="hidden" name="currPage" value="${cri.currPage}">
                <input type="hidden" name="amount" value="${cri.amount}">
                <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                    
                <table>
                    <div class="uploadDiv">
                        <input type="file" id="file" name="uploadFile">
                    </div>
                    <tr>
                        <td><label for="title"></label> 제목</td>
                        <td><input type="text" name="title" id="title" size="50" placeholder="제목을 입력하세요"></td>
                    </tr>
                    <tr>
                        <td><label for="content"></label>내용</td>
                        <td><textarea name="content" id="content" cols="48" rows="10" placeholder="내용을 입력하세요"></textarea></td>
                    </tr>
                    <tr><!-- <c:out value="${__LOGIN__.memberID}"></c:out> -->
                        <td><label for="memberID"></label>작성자</td>
                        <td><input type="text" name="memberID" id="memberID" size="20" placeholder="작성자"></td>
                    </tr>
                    <tr>
                        <td><label for="bName">게시판유형</label></td>
                        <td><input type="text" name="bName" id="bName" size="50" placeholder="게시판유형"></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" id="submitBtn">Register</button>
                            <button type="button" id="listBtn">List</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>