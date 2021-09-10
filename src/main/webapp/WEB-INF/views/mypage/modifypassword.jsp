<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>비밀번호 변경</title>

     	<link rel="stylesheet" href="/resources/css/mypage_modifypassword.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            
            var key = '${__KEY__}'
            var reloadKey;

            // --------------------------------------------------------------------------------------------------//
            // 0. Captcha 이미지 로드            
            // --------------------------------------------------------------------------------------------------//
            setTimeout(function () {
                console.debug('setTimeout() invoked.');
                $('#captcha').find('#capImg').attr('src','/resources/captcha/${__CAPTCHA_IMG__}'); 
            }, 5000);//setTimeout

            $(function () {
                console.debug('jq started...1')
                
                var result = '${__RESULT__}';
                
                if(result.length>0){
                    alert('${__RESULT__}');
                }//if

            });//.jq
        </script>
        <script src="/resources/js/mypage_modifypassword.js"></script>

    </head>
    <body>
        <div id="content">

            <form action="/mypage/modifypassword" method="POST" id="modifyForm">
                
                <div id="inner_con"> 
                    <h4>기존 비밀번호 </h4>
                    <input type="password" id="currPass" name="memberpw" autocomplete="off" placeholder=" 기존 비밀번호">
                    <h4>새 비밀번호 </h4>
                    <input type="password" id="newPass1" name="newMemberpw" autocomplete="off" placeholder=" 새 비밀번호">
                    <h4>새 비밀번호 확인</h4>
                    <input type="password" id="newPass2" autocomplete="off" placeholder=" 비밀번호 확인">
                	<h6 id="passwordInvalidMessage">&nbsp;</h6>
                    
                    <div id="captcha">
                        
                        <h6>아래의 이미지를 보이는 대로 입력해주세요.</h6>
                        <div id="captcha_top">
                            
                            <img src="" alt="이미지 로드중입니다..." id="capImg" width="200" height="90">
                            <div id="capBtn">
                                <button type="button" id="captchaReloadBtn"><img src="/resources/img/mypage_modifypassword_refresh.png" alt="새로고침" width="15" height="15">새로고침</button>
                                <button type="button" id="captchaBtn">인증</button>
                            </div>
                        </div>
                      
                        <input type="text" id="value" placeholder=" 자동입력 방지 문자">
                    </div>

                    <button type="button" id="modifyPasswordBtn">비밀번호 변경</button>
                </div>
                
            </form>
        </div>
    </body>
</html>