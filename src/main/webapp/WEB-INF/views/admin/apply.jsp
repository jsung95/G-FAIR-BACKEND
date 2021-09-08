<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>기업 전시 참가신청 관리</title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <script>
            $(function () {
                
                $('#agreeUpdateBtn').on('click', function () {
                    console.debug('agreeUpdateBtn click event triggered.. ');

                    var applyForm = $('#apply');
                    
                    applyForm.attr('action', '/admin/applyUpdateAgree');
                    applyForm.attr('method', 'POST');

                    applyForm.submit();

                });// on click event

                $('#paymentUpadateBtn').on('click', function () {
                    console.debug('paymentUpadateBtn click event triggered...');

                    var applyForm = $('#apply');
                    
                    applyForm.attr('action', '/admin/applyUpdatePayment');
                    applyForm.attr('method', 'POST');

                    applyForm.submit();

                });// on click event
            });//.jq
        </script>
    </head>
    <body>
        <div id="content">
            <form id="apply">
                <button type="button" id="agreeUpdateBtn">승인</button>
                <button type="button" id="paymentUpadateBtn">결제확인</button>
                <div id="list">
                    <table>
                        <thead>
                            <tr>
                                <td>체크</td>
                                <td>참가번호</td>
                                <td>참가전시회</td>
                                <td>부스번호</td>
                                <td>회사명</td>
                                <td>사업자등록번호</td>
                                <td>연락처</td>
                                <td>이메일</td>
                                <td>아이디</td>
                                <td>승인여부</td>
                                <td>결제여부</td>
                                <td>결제번호</td>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${__APPLY__}" var ="app">
                                <tr>
                                    <td><input type="checkbox" name="applyno" value="${app.applyno}"></td>
                                    <td>${app.applyno}</td>
                                    <td>${app.applyname}</td>
                                    <td>${app.applycompany}</td>
                                    <td>${app.btno}</td>
                                    <td>${app.cbno}</td>
                                    <td>${app.phone}</td>
                                    <td>${app.email}</td>
                                    <td>${app.memberid}</td>
                                    <td>${app.agrstate_tf}</td>
                                    <td>${app.payment_tf}</td>
                                    <td>${app.pno}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </form>
        </div>
    </body>
</html>