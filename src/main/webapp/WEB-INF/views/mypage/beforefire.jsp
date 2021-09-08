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

        <style>
                *{
                margin: 0 auto;
                padding: 0;
                font-family: "Noto Sans KR Light";
                
            }

            #content{
                width: 1200px;
                height: 600px;

                justify-content: space-around;
                display: flex;
                flex-direction: column;
                
            }

            #con1{
                height: 250px;
            }

            #con2{
                height: 150px;
            }
            button{
                cursor: pointer;
                border: solid 1px #005bbb;
                background-color: #005bbb;
                color: white;

                width: 498px;
                height: 44px;
                margin-bottom: 1px;
            }

            #cancelBtn{
                background-color: #7397bd;
                border: solid 1px #7397bd;
            }

        </style>

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