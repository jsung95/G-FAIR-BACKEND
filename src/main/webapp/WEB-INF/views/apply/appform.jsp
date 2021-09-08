<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>참가신청 양식 작성</title>

        <style>
            *{
                margin: 0 auto;
                padding: 0;
                font-family: "Noto Sans KR Light";
                
            }

         

            input{
                display: inline-block;
                width: 498px;
                height: 30px;

                margin-bottom: 15px;
                margin-top: 15px;

                border: none;
                border-bottom: 1px solid grey;
                
            }

            #appBtn{
                width: 100px;
                height: 45px;

                cursor: pointer;
                border: solid 1px #005bbb;
                background-color: #005bbb;
                color: white;
            }

            #content{
                width: 1200px;
            }

            #apply{
                height: 1480px;

                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
            }

            #apply_content{
                width: 1100px;
                height: 500px;

                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
            }

            #boothSelect{
                width: 1100px;
                height: 600px;
            }

            #booth_info1{
                height: 50px;
                width: 1100px;
            }
            #booth_info2{
                height: 140px;
                width: 1100px;

                background-color: #fbfbfb;
            }

           
            .isSelected{
                width: 50px;
                height: 50px;
                margin-bottom: 3px;

                border: 1px solid black;
                background-color: grey;
                text-align: center;

                display: inline-block;

                font-size: 20%;
            }

            .bttypeIsA{
                width: 50px;
                height: 50px;
                margin-bottom: 3px;

                border: 1px solid black;
                background-color: #fbfbfb;
                text-align: center;

                display: inline-block;

                cursor: pointer;
            }

            .bttypeIsB{
                width: 50px;
                height: 50px;
                margin-bottom: 3px;

                border: 1px solid black;
                background-color: #fbfbfb;
                text-align: center;

                display: inline-block;

                cursor: pointer;
            }

            #member_info{
                width: 810px;
                height: 400px;

               
            }

            #member_info h4{
                width: 300px;
                margin: 0;

                display: inline-block;

                color: #043a74;
                
            }

            #exname{
                width: 300px;
                height: 30px;
                margin-right: 200px;
                display: inline-block;
            }

            h2{
                background-color: #fbfbfb;
                color: #005bbb;
                margin: 0;
            }
        </style>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function () {
                console.debug('jq started...');

                var result = '${__RESULT__}'

                if(result.length>0){
                    alert(result);
                }//if

                var btno="";
                var boothId="";
                

                $('.bttypeIsA, .bttypeIsB').on('click', function (data) {
                    console.debug('.bttypIsA on click event triggered...');
                    if(btno.length<1){  //선택된 부스가 없을 때 
                        btno =data.target.getAttribute('value');
                        
                        $('#boo'+btno).css('background-color', '#005bbb');

                        document.querySelector('#btnois').innerHTML ='부스번호 : ' +btno;
                        $('#btno').attr('value', btno);
                    }else{
                        alert('부스는 하나만 선택 가능합니다. 선택한 부스로 정보가 변경됩니다.');
                        // 초기화
                        $('#boo'+btno).css('background-color', '#fbfbfb');

                        // 새로 선택된 부스로 정보 변경. 
                        btno =data.target.getAttribute('value');
                        boothId ='#btno'+btno;
                        $('#boo'+btno).css('background-color', '#005bbb');

                        document.querySelector('#btnois').innerHTML ='부스번호 : ' +btno;
                        $('#btno').attr('value', btno);

                    }//if-else

                    var bttype = data.target.getAttribute('class');

                    console.log("bttype",bttype);

                    if(bttype == 'bttypeIsA'){
                        document.querySelector('#bttype').innerHTML  ='부스 타입 : A ';
                        document.querySelector('#btprice').innerHTML ='부스 가격 : 1000000원';
                    }else{
                        document.querySelector('#bttype').innerHTML  ='부스 타입 : B';
                        document.querySelector('#btprice').innerHTML ='부스 가격 : 2000000원';
                    }//if else
                    
                    
                    // alert('boo'+btno);
                });//onclick event

                $('#appBtn').on('click', function () {
                    console.debug('appBtn on click event triggered... ');

                    if(btno==""){
                        alert('부스를 선택해주세요.')
                    }else if($('input[name=applycompany]').val() == ""){
                        alert('기업명을 입력해주세요.')
                    }else{
                        let applyForm = $('#apply');

                        applyForm.submit();
                    }//if-else

                });// on click envent
            });//.jq
        </script>
    </head>
    <body>
        <div id="content">
            <form id="apply" action="/apply/applyform" method="POST">
                <div id="apply_content">
                    
                    <h2>신청정보 입력</h2>
                    <div id="member_info">
                        <!-- 전시회 명 가져오기 select box -->
                        <h4>전시회</h4>
                        <select name="applyname" id="exname">
                            <c:forEach items="${__EXHI__}" var="ex">
                                <option value="${ex.exname}"> 
                                    ${ex.exname} (
                                        <fmt:formatDate value="${ex.exstart}" type="date"/> ~ 
                                        <fmt:formatDate value="${ex.exend}" type="date"/>
                                        )
                                    
                                </option>
                            </c:forEach>
                            <option value="초콜릿전시회">초콜릿전시회</option>
                            <option value="사탕전시회">사탕전시회</option>
                            <option value="젤리전시회">젤리전시회</option>
                        </select>

                        <!-- member info 가져오기 -->
                        <!-- CBNO, FID, PHONE, EMAIL  가져오기-->
                        <h4>아이디</h4>
                        <input type="text" name="memberid" value="${__MEMBERINFO__.memberid}" readonly>
                        <h4>사업자등록번호</h4>
                        <input type="text" name="cbno" value="${__MEMBERINFO__.cbno}" readonly>
                        <input type="hidden" name="fid" value="${__MEMBERINFO__.fid}">
                        <h4>연락처</h4>
                        <input type="tel" name="phone" value="${__MEMBERINFO__.phone}" readonly>
                        <h4>이메일</h4>
                        <input type="email" name="email" value="${__MEMBERINFO__.email}" readonly>
                        
                        <!-- APPLYCOMPANY 입력받기 -->
                        <h4>회사명</h4>
                    </div>
                </div>

                
                <div id="booth_info1">
                    <h2>부스정보</h2>
                </div>
                
                <div id="boothSelect">
                    <c:forEach items='${__BOOTH__}' var='boo'>
                        <c:choose>
                            <c:when test="${boo.bttype =='A' && boo.btisselected eq 'F'}">
                                <button  type="button" class="bttypeIsA" id="boo${boo.btno}" value="${boo.btno}">A${boo.btno}</button>
                            </c:when >
                            <c:when test="${boo.bttype =='B' && boo.btisselected eq 'F'}">
                                <button  type="button" class="bttypeIsB" id="boo${boo.btno}" value="${boo.btno}">B${boo.btno}</button>
                            </c:when>
                            <c:otherwise>
                                <button  type="button" class="isSelected" id="boo${boo.btno}" value="${boo.btno}">선택불가</button>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                   
                </div>

                <div id="booth_info2">
                    <input type="hidden" id="btno" name="btno" value="" readonly>
                    <h4 id="btnois">&nbsp;</h4>
                    <h4 id="bttype">&nbsp;</h4>
                    <h4 id="btprice">&nbsp;</h4>
                </div>

                <button type="button" id="appBtn">신청</button>
            </form>
        </div>
    </body>
</html>