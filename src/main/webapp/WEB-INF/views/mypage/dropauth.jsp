<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원탈퇴</title>

		<link rel="stylesheet" href="/resources/css/mypage_dropauth.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function () {
                $('#passBtn').on('click',function () {
                	console.debug('passBtn event triggered');
                        var pass =$('#memberpw').val();
                        
                        if(pass.length >0){
                            let form =$('#passAuth');
                            form.submit();
                        }else{
                            alert('잘못된 접근입니다.')
                        }//if
                });//onclick


            })//.jq
        </script>
    </head>
    <body>
        <div id="content">
            <div id="inner_con">
                <h3>회원탈퇴를 위해 비밀번호를 인증해주세요</h3>

                <form action="/mypage/drop" method="POST" id="passAuth">
                    <div>
                        <h4>비밀번호</h4>
                        <input type="password" id="memberpw" name="memberpw">
                    </div>
                    
                    <button type="button" id="passBtn">확인</button>
                </form>
            </div>
        </div>
    </body>
</html>