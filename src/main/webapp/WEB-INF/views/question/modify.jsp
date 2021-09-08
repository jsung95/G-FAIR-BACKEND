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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>


        <script>
            $(function () {
               console.log("jq started..."); 

               $('#removeBtn').on('click', function () {
                   let form =$("form");

                   form.attr('action','/question/remove?bno=${__LIST__.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}');
                   form.attr('method','POST');

                   form.submit();
               });//onclick remove

               $('#listBtn').on('click',function () {
                   location.href="/question/list?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}" ; 
                
               });//onclick list

            });//jq
        </script>
    </head>
    <body>
        <div id="wrapper">

            <form action="/question/modify" method="POST">
                <input type="hidden" name="currPage" value="${cri.currPage}">
                <input type="hidden" name="amount" value="${cri.amount}">
                <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
                
                <table border="1">
                    <tbody>
                        <tr>
                            <th><label for="title">title</label></th>   <!-- for 속성에는 id 값을 넣는다. -->
                            <th colspan="3">제목 : <input type="text" id="title" name="title" value="${__LIST__.title}"></th>
                        </tr>
                        <tr>
                            <td><label for="writer">writer</label></td>
                            <td>작성자 : <input type="text" id="writer" name="memberid" value="${__LIST__.memberid}" readonly></td>

                            <td><label for="bno">bno</label></td>
                            <td>글번호 : <input type="text" name="bno" value="${__LIST__.bno}" readonly></td>
                        </tr>
                        <tr>
                            <td><label for="content">content</label></td>
                            <td colspan="3">내용 : <input type="text" id="content" name="content" value="${__LIST__.content}"></td>
                        </tr>
                        <tr>
                            <td><input type="file" name="file"></td>
                            <td><input type="hidden" name="notice_tf" value="F"></td>
                        </tr>

                        <tr>
                            <td><input type="radio" name="public_tf" value="T" checked>공개</td>
                            <td><input type="radio" name="public_tf" value="F">비공개</td>
                        </tr>
                    </tbody>
                </table>
                
                <button type="submit" id="submitBtn">SUBMIT</button>

                <button type="button" id="removeBtn"> REMOVE</button>
                <button type="button" id="listBtn"> LIST</button>
            </form>

        </div>
    </body>
</html>