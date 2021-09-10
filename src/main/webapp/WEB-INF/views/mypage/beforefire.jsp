<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>

        <link rel="stylesheet" href="/resources/css/mypage_beforefire.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function(){
                $('#fireBtn').on('click',function(){
                    let form =$('form');

                    form.submit();
                });//onclick

                $('#cancelBtn').on('click',function () {
                    location.href="/main";
                });//onclick

            })//.jq
        </script>

    </head>
    <body>
        <div id="content">
            <form action="/mypage/fire" method="POST">
                <div id="con1">
                    <h3>정말 <strong>탈퇴</strong>하시겠습니까?</h3>
                </div>
                <div id="con2">
                    <button type="button" id="fireBtn">탈퇴</button>
                    <button type="button" id="cancelBtn">취소</button>
                </div>
            </form>
        </div>
    </body>
</html>