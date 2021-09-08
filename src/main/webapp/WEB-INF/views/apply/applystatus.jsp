<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>참가신청 상태확인</title>

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
                width: 1100px;
                height: 700px;

                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
            }

            #inner_con h3{
                color: #005bbb;
            }
            #apply_status{
                width: 1100px;
                height: 150px;

                background-color: #fbfbfb;

            }

            #status{
                width: 1100px;
                height: 100px;

                display: flex;
                justify-content: space-around;

                text-align: center;
            }
            #status2{
                width: 1100px;
                height: 50px;

                display: flex;
                justify-content: space-around;

                text-align: center;
            }

            #status span{
                width: 100px;
                height: 100px;

                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            #status2 span{
                width: 100px;
                height: 50px;

                display: flex;
                flex-direction: column;
                justify-content: center;

                font-size: 10%;
            }

            .st{
                background-color:#244870d9;
                color: white;

                border-radius: 50%;
            }

            #now_status{
                background-color:#005bbb;
                /* border: 1px solid #005bbb; */
            }

            #info{
                width: 1100px;
                height: 450px;

                background-color: #fbfbfb;

                display: flex;
                flex-direction: column;
                justify-content: space-around;
            }

            #information{
                width: 800px;
                height: 300px;

                display: flex;
                flex-direction: column;
                justify-content: space-around;
                
            }

            #information h4,h5{
                margin: 0;
            }

            #information h4{
                color: #005bbb;
            }
        </style>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function () {
                var result = '${__RESULT__}';

                if(result.length>0){
                    alert(result);
                }//if


            });//.jq
        </script>
    </head>
    <body>
        <div id="content">
            
            <c:choose>
                
                <%--1. 참가 신청 관리자 승인 전 --%>
                <c:when test="${__APPLY__[0].agrstate_tf eq 'F'}">
                    <div id="inner_con">
                        <div id="apply_status">
                            <div id="status">
                                <span class="st" id="now_status"><h4>승인 대기</h4></span>
                                <span><h4><img src="/resources/img/applystatus_arrow.png" alt="" width="70" height="70"></h4></span>
                                <span class="st"><h4>결제 대기</h4></span>
                                <span><h4><img src="/resources/img/applystatus_arrow.png" alt="" width="70" height="70"></h4></span>
                                <span class="st"><h4>결제 완료</h4></span>
                            </div>
                            <div id="status2">
                                <span><strong>참가신청 양식</strong>을 작성 완료하였습니다.</span>
                                <span></span>
                                <span>승인 완료 후<strong>결제 대기</strong> 상태입니다.</span>
                                <span></span>
                                <span><strong>결제 완료</strong>되었습니다.</span>
                            </div>
                        </div>


                        <h3>${__APPLY__[0].applycompany} 님은 현재 관리자 승인 대기중입니다.</h3>

                        <div id="info">
                           <h4>${__APPLY__[0].applycompany} 님의 전시회 신청 정보입니다.</h4> 

                           <div id="information">
                               <h4>전시회명</h4>
                               <h5>${__APPLY__[0].applyname}</h5>
                               <h4>연락처</h4>
                               <h5>${__APPLY__[0].phone}</h5>
                               <h4>사업자등록번호</h4>
                               <h5>${__APPLY__[0].cbno}</h5>
                           </div>
                           
                            
                        </div>
                    </div>    
                </c:when >

                <%--3. 결제 완료시! 결제 테이블에 있는 DB 정보 보여줌. --%>
				
                <c:when test="${__APPLY__[0].payment_tf eq 'T'}">
                    <div id="inner_con">

                        <div id="apply_status">
                            <div id="status">
                                <span class="st"><h4>승인 대기</h4></span>
                                <span><h4><img src="/resources/img/applystatus_arrow.png" alt="" width="70" height="70"></h4></span>
                                <span class="st"><h4>결제 대기</h4></span>
                                <span><h4><img src="/resources/img/applystatus_arrow.png" alt="" width="70" height="70"></h4></span>
                                <span class="st"  id="now_status"><h4>결제 완료</h4></span>
                            </div>
                            <div id="status2">
                                <span><strong>참가신청 양식</strong>을 작성하였습니다.</span>
                                <span></span>
                                <span><strong>결제 대기</strong> 상태입니다.</span>
                                <span></span>
                                <span><strong>결제 완료</strong>되었습니다.</span>
                            </div>
                        </div>

                        <h3>${__APPLY__[0].applycompany} 님의 결제가 완료 되었습니다. </h3>

                        <div id="info">
                           <h4>${__APPLY__[0].applycompany} 님의 전시회 신청 정보입니다.</h4> 

                           <div id="information">
                                <h4>전시회명</h4>
                                <h5>${__APPLY__[0].applyname}</h5>
                                <h4>연락처</h4>
                                <h5>${__APPLY__[0].phone}</h5>
                                <h4>사업자등록번호</h4>
                                <h5>${__APPLY__[0].cbno}</h5>
                                <h4>결제번호</h4>
                                <h5>${__PAYMENT__.pno}</h5>
                                <h4>부스번호</h4>
                                <h5>${__PAYMENT__.btno}</h5>
                                <h4>가격</h4>
                                <h5>${__PAYMENT__.btprice}</h5>
                           </div>

                           <h6>전시회 취소 및 변경은 관리자에게 문의하세요 (02-123-45678) </h6>
                        </div>
                    </div>  
                </c:when >
                
                <%--2. 참가 신청 승인 완료시! 결제 정보 보여줌. 무통장 입금 --%>
                <c:when test="${__APPLY__[0].agrstate_tf eq 'T'}">
                    <div id="inner_con">
                        
                        <div id="apply_status">
                            <div id="status">
                                <span class="st"><h4>승인 대기</h4></span>
                                <span><h4><img src="/resources/img/applystatus_arrow.png" alt="" width="70" height="70"></h4></span>
                                <span class="st" id="now_status"><h4>결제 대기</h4></span>
                                <span><h4><img src="/resources/img/applystatus_arrow.png" alt="" width="70" height="70"></h4></span>
                                <span class="st"><h4>결제 완료</h4></span>
                            </div>
                            <div id="status2">
                                <span><strong>참가신청 양식</strong>을 작성 완료하였습니다.</span>
                                <span></span>
                                <span>승인 완료 후<strong>결제 대기</strong> 상태입니다.</span>
                                <span></span>
                                <span><strong>결제 완료</strong>되었습니다.</span>
                            </div>
                        </div>

                        <h3>${__APPLY__[0].applycompany} 님의 관리자 승인이 완료 되었습니다. </h3>

                        <div id="info">
                           <h4>${__APPLY__[0].applycompany} 님의 결제 정보입니다.</h4> 

                           <div id="information">
                               <h4>결제번호</h4>
                               <h5>${__PAYMENT__.pno}</h5>
                               <h4>부스번호</h4>
                               <h5>${__PAYMENT__.btno}</h5>
                               <h4>가격</h4>
                               <h5>${__PAYMENT__.btprice}</h5>
                               <h4>입금처</h4>
                               <h5>예금주 : 지페어 농협 1234-5678-910</h5>
                           </div>
                        </div>
                    </div>  
                </c:when >

               
                
            </c:choose>
        </div>
    </body>
</html>