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

                 $('#listBtn').on('click',function () {
                   location.href="/question/list${cri.getPagingUri}" ; 
                
               });//onclick list

            });//jq
        </script>
    </head>
    <body>
        <div id="wrapper">

            <form action="/question/register" method="POST" enctype="multipart/form-data">
               	
                
                <table border="1">
                    <tbody>
                       
                            <tr>
                                <td><label for="title">제목</label></td>
                                <td><input type="text" name="title" id="title" size="50" placeholder="제목을 입력하세요"></td>
                            </tr>
        
                            <tr>
                                <td><label for="memberid">작성자</label></td>
                                <td><input type="text" name="memberid" id="memberid" size="20" placeholder="작성자"></td>
                            </tr>
                            
                            <tr>
                                <td><label for="content">내용</label></td>
                                <td><textarea name="content" id="content" cols="48" rows="10" placeholder="내용을 입력하세요"></textarea></td>
                            </tr>
        
                            <tr>
                                <td colspan="2"><input type="file" name="file"></td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td><input type="radio" name="public_tf" value="T" checked>공개</td>
                                <td><input type="radio" name="public_tf" value="F">비공개</td>
                            </tr>
        
                            <tr>
                                <td colspan="2">
                                    <button type="submit" id="submitBtn">SUBMIT</button>
                                    <button type="button" id="listBtn">LIST</button>
                                </td>
                            </tr>
                    </tbody>
                </table>
                
            </form>

        </div>
    </body>
</html>