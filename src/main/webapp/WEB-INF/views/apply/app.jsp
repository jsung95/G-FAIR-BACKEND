<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>전시회 참가신청</title>
        <style>
            *{
                margin: 0 auto;
                padding: 0;
                font-family: "Noto Sans KR Light";
                
            }

            #content{
                width: 1200px;
                height: 1600px;

                justify-content: space-around;
                display: flex;
                flex-direction: column;
                
            }
            #user_info{
                width: 1100px;
                height: 1400px;
            }
            #user_agree{
                width: 1100px;
                height: 150px;

                display: flex;
                flex-direction: column;
                justify-content: space-around;
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

            input{
                
                width: 30px;
                height: 20px;

                display: inline-block;

                border: none;
                border-bottom: 1px solid grey;

                align-self: stretch;
            }

            form{
                display: flex;
                justify-content: space-around;
            }
        </style>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function () {
                console.debug('jq started..');

                $('#agreeBtn').on('click',function () {
                    console.debug('agreeBtn on click event triggered..');

                    if(document.querySelector('#agree').checked){
                        let form = $('form');
                        form.submit();
                    }else{
                        alert('약관에 동의를 해야지만 신청서 작성이 가능합니다. ');
                    }//if-else

                });//on click
            });//.jq
        </script>

    </head>
    <body>
        <div id="content">
            <div id="user_info">
                <h2>중소기업 지원사업 통합관리시스템 정보 활용을 위한 동의서</h2>
                <br/>
                <h3>□ 목적</h3>
                <p>①정부와 지자체 중소기업 지원사업의 효율적 수행을 위해 운영하는 "중소기업 지원사업 통합관리시스템" 에서 신청기업 및 지원기업 지원이력 정보의 수집‧조회 및 활용</p>
                <p>②동 통합관리시스템에서 관리하는 기업정보의 확인, 지원효과 분석, 통계관리 등 효율적인 중소기업 정책 수립을 위해 국세청‧관세청‧고용부 등에서 보유하고 있는 과세정보 등의 수집‧활용</p>
                <br/>
                <h3>□ 수집‧조회 및 활용 정보</h3>
                <p>①(지원이력정보) 사업자등록번호 등 기업 식별정보 및 신청일, 지원금액 등 사업의 신청 및 수혜정보</p>
                <p>②(과세정보 및 행정정보 등) 중소기업 지원사업에 신청한 기업의 국세기본법 제81조의13의 과세정보로서 매출액 등 재무정보 및 창․휴․폐업일, 소득세 원천징수 인원 등, 관세법 제116조에 따른 수출액 등, 고용보험법 제2조의1의 피보험자수 등</p>
                <p>③(인증정보) 기업의 인증‧확인정보로서 신청일, 획득일, 유효기간 등</p>
                <br/>
                <h3>□ 수집‧조회 및 활용 기관</h3>
                <p>◦ 해당 지원사업 소관부처(집행기관 포함), 중소기업 통합관리시스템 운영기관</p>
                <br/>
                <h3>□ 동의 효력기간</h3>
                <p>◦ 사업자가 사업 신청시 본 동의서를 제출한 시점 이후</p>
                <p>* 제공된 목적달성 후에는 중소기업 지원사업 통합관리시스템의 효율적인 운영을 위해 필요한 범위 내에서만 보유‧이용</p>
                <p>◦ 기업정보 수집 시점 : 신청 및 수혜기업의 사업 신청 이전 3개년부터 참여 이후 10년간</p>
                <p>* 보유 정보가 없을 경우 수집하지 않음</p>
                <p>※ 본 동의서식의 동의서 징구는 민법 제114조의 행정행위의 대리권 행사방식의 현명주의를 적용하여, 중소기업 지원사업의 효율적인 운영을 위해 본 사업의 소관부처 및 수행기관이 대신하여 받는 것임을 알려 드립니다.</p>
                <br/>
                <h3>□ 경기도 기업지원 정책정보 통합관리 시스템 (이지비즈, www.egbiz.or.kr) 안내</h3>
                <p>
                    이지비즈(www.egbiz.or.kr)는 경기도 및 도내 중소기업지원기관의 지원정보를 고객(개인/기업)에게<br/>
                    신속하고 일관성 있게 전달하기 위하여 구축된 시스템으로써 'G-FAIR'는 본 시스템의 통합운영 및<br/>
                    회원관리 정책을 따르고 있습니다.</p>
                <br/>	
                <h3>□ G-FAIR 참가신청</h3>
                <p>
                    'G-FAIR'에 참가하기 위해서는 온라인 통합관리시스템의 회원가입(이지비즈, www.egbiz.or.kr)이 필수입니다.
                    다만, 우편/내방/팩스 등의 서면제출의 경우에는 운영사무국에서 귀사(하)를 대신하여 회원가입 후 귀사(하)
                    에게 통지할 계획입니다. 이와 관련된 개인정보는 법률 제10465호 개인정보 보호법에 의거해 아래와 같이
                    이용․보호됨을 알려드립니다.
                </p>
                <br/>
                <p>
                    1. 경기도 경제시책정보 제공을 위하여 개인을 고유하게 구별하기 위해 부여된 식별정보를 포함한 개인정보를 다음과 같이 경기도와 경기도경제과학진흥원 운영정보망(이지비즈)에 수집․관리하고 있습니다.<br/>
                    ※저장매체인 '이지비즈'는 'G-FAIR' 참여자에 대한 정보관리시스템을 포함하고 있습니다.<br/>
                    ◦ 개인정보의 수집․이용․제공 목적: 'G-FAIR' 운영 및 경기도 경제시책정보 제공 등에 활용<br/>
                    ◦ 수집하는 개인정보 항목: 성명, 사업자번호, 주소, 연락처 등<br/>
                    ◦ 개인정보의 보유 및 이용기간: 경기도 경제시책정보 안내를 위해 반영구적으로 수집․관리<br/>
                    ◦ 파기 : 'G-FAIR' 및 '이지비즈'의 회원탈퇴시 개인정보가 파기
                </p>
                <br/>
                <p>2. 경기도와 경기도경제과학진흥원은「개인정보 보호법」에 의거하여 제공받는 개인정보를 보호합니다.</p>
                <br/>
                <p>3. 경기도와 경기도경제과학진흥원은 처리 목적에 필요한 범위에서 적합하게 처리하고 그 목적 이외의 용도로 사용하지 않으며, 개인정보 제공자는 언제나 자신이 입력한 개인정보의 열람․수정을 신청할 수 있습니다.</p>
                <br/>
                <p>4. 개인정보 제공자는 개인정보의 수집·이용·제공에 동의하지 아니할 권리가 있으며 이 경우에는 정보제공 등이 제한될 수 있습니다.</p>
                <br/>
                <p>5. 수집된 개인정보는 'G-FAIR'와 관련하여 지속적인 사후관리를 요할 경우 제3자에게 제공될 수 있으며, 'G-FAIR' 및 경기도 경제시책정보 제공의 목적으로 위탁될 수 있습니다.</p>
                <br/>
                <p>6. 수집된 개인정보를 제3자 제공, 외부위탁 등의 경우 상업적 목적으로는 제공되지 않습니다.</p>
                <br/>
                <p>7. 본인은 위 1~6의 내용에 따른 'G-FAIR' 및 경기도 경제시책정보를 제공받기 위하여 개인식별정보를 제공할 것을 동의합니다.</p>
                <br/>
            </div>
            <div id="user_agree">
                                
                <form action="/apply/appform" method="POST">
                    <h4>본인은 위 목적으로 동의서에 적시된 정보 및 기관에 한해 본인의 기업정보를 수집․조회 및 활용하는 것에 동의합니다. &nbsp;</h4>
                    <input type="radio" id="agree" name="agree" value="Y"> 예
                    <input type="radio" id="agree2" name="agree" value="N" checked="checked"> 아니오<br>
                </form>

                <button type="button" id="agreeBtn">다음</button>

            </div>
            
        </div>
    </body>
</html>
    