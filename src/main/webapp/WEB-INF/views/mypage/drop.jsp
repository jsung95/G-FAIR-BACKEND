<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원탈퇴</title>

        <style>
            *{
                margin: 0 auto;
                padding: 0;
                font-family: "Noto Sans KR Light";
                
            }

            #content{
                width: 1200px;
                
                
            }

            form{
                width: 1100px;
                height: 1000px;

                justify-content: space-around;
                display: flex;
                flex-direction: column;
            }


            input{
                display: inline-block;
                width: 548px;
                height: 30px;

                margin-bottom: 15px;
                margin-top: 15px;

                border: none;
                border-bottom: 1px solid grey;

                align-self: stretch;
            }

            button{
                cursor: pointer;
                border: solid 1px #005bbb;
                background-color: #005bbb;
                color: white;

                width: 100px;
                height: 44px;
                margin-bottom: 1px;
            }

            div#info_agree{
                width: 1000px;
                height: 500px;

                background-color: #fbfbfb;
                
                display: flex;
                flex-direction: column;
                justify-content: space-around;
            }

            div.info_user{
                width: 900px;
                height: 100px;

                border: 1px solid #e1e1e1;
            }

            div.info_user em{
                font-style: normal;
                color: #005bbb;
            }

            h2 strong{
                color: #005bbb;
            }

            div#info_user_check{
                display: flex;
                justify-content: space-around;
            }
            input#agreement{
                width: 30px;
                margin: 0 15px;
            }

            div#info_user_check h3{
                display: inline;
                
            }

            div#formdata,div#formdata2{
                width: 700px;
                display: flex;
            }

            div#emailbox{
                width: 900px;
                height: 250px;

                display: flex;
                flex-direction: column;
                justify-content: space-around;

                border: 1px solid #e1e1e1;
            }
            
    
        </style>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>

            var code;   //인증코드

            $(function () {
                $('div#formdata2').hide();
                $('#emailAuthAndNextBtn').hide();

                var result ='${__RESULT__}';
                
               if(result.length>0){
                alert('잘못된 접근입니다.')
                location.href="/mypage/dropauth";
               }//if

                
                
                //-----------------------------------------------------------------------------//
                //1. emailSendBtn onclick event
                //-----------------------------------------------------------------------------//
                
                $('#emailSendBtn').on('click',function () {
                    console.debug('emailSendBtn click event triggerd');

                    
                    $('div#formdata2').show();
                    $('#emailAuthAndNextBtn').show();
                   
                    $.ajax({
                        method:'GET',
                        url:'/mypage/sendemail',
                        dataType:'json',
                        success:function (data) {
                            console.debug('send success');
                            
                            if(data.result.length>0){
                                alert('회원정보에 등록된 이메일로 인증번호가 발송 되었습니다.');
                                code=data.result;
                            }else{
                                alert('인증메일 발송에 실패하였습니다. ');
                            }//if-else
                            
                        },//success

                        error:function (data){
                            console.debug('send fail');
                            console.log(data);
                            alert('인증메일 발송에 실패하였습니다. ')
                        }//error
                    })//ajax
                   
                    document.querySelector('#emailSendBtn').innerHTML="재발송"
                });//onclick

                
                
                //emailSend 비동기 검증. 

                //-----------------------------------------------------------------------------//
                //2. emailAuthAndNextBtn               
                //-----------------------------------------------------------------------------//

                $('#emailAuthAndNextBtn').on('click',function () {
                    console.debug('emailAuthAndNextBtn click event triggerd');

                    //2-1 Check Box != '' 검증 
                    var checkedAgree =$('input:checkbox[id="agreement"]').is(":checked");
                    console.debug('checked :', checkedAgree);

                    //2-2 email인증번호 검증 ajax 비동기.
                    var emailCode =$('#emailValue').val();
                    console.debug('emailCode :', emailCode);
                    
                

                    if(emailCode == ''){
                        alert('인증번호를 입력해주세요')
                    }else if(!checkedAgree){
                        alert('회원탈퇴를 위해 약관에 동의해주세요');
                    }else if(emailCode != code ){
                        alert('유효하지 않은 인증번호입니다.')
                    }else if(emailCode == code  && checkedAgree){    //checkedAgree
                        console.log('최종 제출지점.')
                       

                      let form =$('#dropForm');
                      form.submit();
                  }//if
                });//onclcik
            
                

            });//jq
        </script>
    </head>
    <body>
        <div id="content">
            <div id="inner_con">
                <form action="/mypage/beforefire" method="POST" id="dropForm">
                    <h2>회원탈퇴에 앞서 <strong>유의사항 및 안내</strong>를 반드시 읽고 진행해주세요.</h2>
                    <div id="info_agree">
                        <div class="info_user">
                            <strong>1. G-FAIR 아이디 재사용 및 복구 불가 안내.</strong> <br> 
                            회원탈퇴 진행 시 본인을 포함한 타인 모두 <em>아이디 재사용이나 복구가 불가능합니다.</em> 신중히 선택하신 후 결정해주세요. <br>
                        </div>
                        <div class="info_user">
                            <strong>2. 개인 정보 및 서비스 이용기록 삭제 안내.</strong> <br>
                            전시 참가 내역, 전시회 신청 정보가 삭제 되며 <em>삭제된 데이터는 복구되지 않습니다. </em>
                        </div>
                        <div class="info_user">
                            <strong>3. 게시판형 서비스에 등록한 게시글, 댓글 삭제 불가 안내</strong><br>
                            삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
                            탈퇴후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어 <em>게시글을 임의로 삭제해드릴 수 없습니다.</em> 
                        </div>
                        <div id="info_user_check">
                            <h3>위의 사항에 동의합니다.</h3>
                            <input type="checkbox" name="agreement" id="agreement">
                        </div>
                        
                    </div>
                    <div id="emailbox">
                        <div id="formdata">
                            <h4>본인확인을 위해 이메일 인증을 진행합니다.</h4>
                            <button type="button" id="emailSendBtn">인증번호 발송</button>
                        </div>
                        <div id="formdata2">
                            <input type="text" name="emailValue" id="emailValue" placeholder="인증번호를 입력하세요">
                        </div>
                        <button type="button" id="emailAuthAndNextBtn">다음</button>

                    </div>
                    
                </form>
            </div>
          
        </div>
    </body>
</html>