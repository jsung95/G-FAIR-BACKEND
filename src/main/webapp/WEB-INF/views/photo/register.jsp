<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Register.jsp</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

        
    </head>
    <body>
        <h1>Register1</h1>
        <hr>
        <div id="container">
            <form action="/photo/register" method="POST" enctype="multipart/form-data">
                <div class="uploadDiv">
                    <input type="file" id="file" name="uploadFile">
                    
                    <label for="title">제목</label>
                    <input type="text" name="title" placeholder="제목을 입력하세요" required>

                    
                    <input type="hidden" name="content" value="content">
                    <input type="hidden" name="memberID" value="Blognation">
                    <input type="hidden" name="bName" value="포토게시판">

                </div>
                <br>
                <button type="submit" id="uploadBtn">Upload</button>

            </form>
        </div>
    </body>
</html>