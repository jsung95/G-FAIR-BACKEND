<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>비밀번호 변경</title>

     
        <style>
            *{
                margin: 0 auto;
                padding: 0;
                font-family: "Noto Sans KR Light";
                
            }

            #content{
                width: 1200px;
            }
            #inner_con{
                width: 500px;
                display: flex;
                flex-direction: column;
            }
            input{
                display: block;
                width: 498px;
                height: 30px;

                margin-bottom: 15px;
                margin-top: 15px;

                border: none;
                border-bottom: 1px solid grey;
                
            }

            button{
                cursor: pointer;
                border: solid 1px #005bbb;
                background-color: #005bbb;
                color: white;
            }

            #captcha{
                height: 200px;
                display: flex;
                
                flex-direction: column;

                margin-top: 20px;
              
            }
            input#value{
                width: 298px;
                height: 40px;
               
            }

            #captcha_top{
                display: flex;
            }

            #capBtn{
                display: flex;
                flex-direction: column;
            }

            #captcha_top button{
                width: 95px;
                height: 44px;
                margin-bottom: 2px;
                margin-left: 5px;
             
            }

            h6{
                margin: 0;
            }
            
            h4{
                margin: 0;
                color: #005bbb;

            }

            #modifyPasswordBtn{
                width: 100px;
                height: 45px;
            }
            #passwordInvalidMessage{
                color: red;
            }
   
        </style>
  

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            // window.onload = function () {
            //     console.debug('onload() invoked.');

            //     var xhr = new XMLHttpRequest();

            //     xhr.open('GET', '/resources/captcha/${__CAPTCHA_IMG__}',false);
            //     xhr.send();
            //     if(xhr.readyState==4){  //응답 완료라면 
            //         $('#captcha').find('#capImg').attr('src','/resources/captcha/${__CAPTCHA_IMG__}'); 
            //     }//if

            //     console.log(xhr);
            // };//onload

           

            // --------------------------------------------------------------------------------------------------//
            // 0. Captcha 이미지 로드            
            // --------------------------------------------------------------------------------------------------//

            setTimeout(function () {
                    console.debug('setTimeout() invoked.');
                    $('#captcha').find('#capImg').attr('src','/resources/captcha/${__CAPTCHA_IMG__}'); 
            }, 5000);//setTimeout


            $(function () {

                var captchaSuccess=false;
                var passwordInvalidate=false;

                var reloadKey;
                var result = '${__RESULT__}';
                
                if(result.length>0){
                    alert('${__RESULT__}');
                }//if


                console.debug('jq started...')
                // --------------------------------------------------------------------------------------------------//
                //1. 새로운 비밀번호 검증
                // --------------------------------------------------------------------------------------------------//
                
                $('#newPass1, #newPass2').keyup(function () {
                    console.debug('newPass1, newPass2 keyup event triggered');

                    let pass1 = $('#newPass1').val();
                    let pass2 = $('#newPass2').val();
                    let invalid =/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

                    if(pass1 != pass2){
                        document.querySelector('#passwordInvalidMessage').innerHTML="비밀번호가 일치하지 않습니다."
                    }else{  //입력한 두 비밀번호가 일치 했을때. 
                        document.querySelector('#passwordInvalidMessage').innerHTML="&nbsp;"


                        if(!invalid.test(pass1)){   //비밀번호 제약 조건 위배 했을 때.
                            console.log('invalidate check..')
                            $("#passwordInvalidMessage").css('color','red')
                            document.querySelector("#passwordInvalidMessage").innerText="비밀번호는 8~20 이내의 영문,숫자,특수문자를 포함해야합니다";
                            passwordInvalidate=false;
                        }else{
                            console.log('invalidate success')
                            $("#passwordInvalidMessage").css('color','#005bbb')
                            document.querySelector("#passwordInvalidMessage").innerText="사용가능한 비밀번호 입니다.";
                            passwordInvalidate=true;
                        }//if

                    }//if-else
                });//keyup event

                // --------------------------------------------------------------------------------------------------//
                // 2. Captcha 인증번호 검증                 
                // --------------------------------------------------------------------------------------------------//

                $('#captchaBtn').on('click',function () {
                    console.debug('captchaBtn click event triggered');
                    
                    
                    let inputValue=$('#value');
                    let key = '${__KEY__}'

                    if(reloadKey != null){
                        key=reloadKey;
                        console.log('key : ', key)
                    }//if

                    console.log( 'value=',inputValue.val());

                    $.ajax({
                        // 1. HTTP method 설정
                        method:'POST',

                        //2. 요청 데이터 & 데이터 타입 설정
                        data : {"key" : key , "value":inputValue.val()},
                        contentType:'application/x-www-form-urlencoded; charset=utf8',
                       
                        //3. 응답설정. 
                        url: '/mypage/captchaAuth',
                        dataType: 'json',
                        
                        //성공시 callback
                        success: function (data) {
                            console.log(data);
                            console.log(typeof data);
                            console.log(data.result);
                            console.log(data.responseTime);

                            if(data.result){    //인증 성공시
                                alert('성공');
                                //검증할 결과 담을 변수에 true 저장. 
                                captchaSuccess=true;

                                $('#captcha').hide();   //captcha 인증 화면 숨김. 

                            }else{
                                alert('실패');
                                captchaSuccess=false;
                            }//if-else
                            
                        },//success

                        error:(jqXHR, textStatus, errorThrown) =>{
                            console.log("error invoked.");
                            alert('다시 시도 해주십시오');
                        }//error

                    });//ajax
                });//on click event
                
                
                // --------------------------------------------------------------------------------------------------//
                // 3. Captcha 재발급.           
                // --------------------------------------------------------------------------------------------------//
                $('#captchaReloadBtn').on('click',function () {
                    console.debug('captchaReloadBtn click event triggered');
                    
                    $('#captcha').find('#capImg').attr('alt', '이미지 재로딩 중입니다...');

                    $.ajax({
                        method:'GET',
                        url: '/mypage/captchaReload',
                        dataType:'json',

                        success : function (data) {
                            console.log('success... ');
                            reloadKey=data.key; //전역 변수에 응답으로 받은 키 저장. 
                           
                            setTimeout(function () {
                                    console.debug('setTimeout() invoked.');
                                    $('#captcha').find('#capImg').attr('src','/resources/captcha/'+data.imgPathAndName); //리로드 된 이미지로 변경
                            }, 5000);//setTimeout
                        },//success

                        error:function(data){
                            console.debug('error....');

                            console.log(data);
                        }
                    });//ajax
                }); //on click

                // --------------------------------------------------------------------------------------------------//
                // 4. 비밀번호 변경 button click event                
                // --------------------------------------------------------------------------------------------------//
                $('#modifyPasswordBtn').on('click',function () {
                    console.debug('click event triggered');
                    
                    var currPass = $('#currPass').val();    //currPass에 입력된 값을 지역변수에 저장. 
                    
                    if(currPass.length>0 && captchaSuccess && passwordInvalidate){    //기존 비밀번호가 null 이 아닐때, 1,2 검증 성공 했을때 
                        let modifyForm = $('#modifyForm');  //form 태그를 지역변수에 저장. 
                        modifyForm.submit();                //제출 
                    }else{
                        alert('잘못된 접근입니다.');
                    }//if
                });//onclick event
    

            });//.jq

            
           
        </script>
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
                                <button type="button" id="captchaReloadBtn"><img src="/resources/img/pw_refresh.png" alt="새로고침" width="15" height="15">새로고침</button>
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