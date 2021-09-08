<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>사전관람신청</title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script>
            $(function () {
                $("#quitBtn").on("click", function () {
                    location.href = "/event/listPerPage";
                });


                $("#submitBtn").on("click", function () {
                    let exhiname = $('#exname').val();
                    let exno = 0;
                    console.log('exhiname: ', exhiname);

                    <c:forEach items="${__EXHI__}" var="ex">
                        if('${ex.exname}' == exhiname){
                            console.log('exno', '${ex.exno}'),
                            exno = '${ex.exno}',
                            $('#exno').attr('value', exno)
                        }
                    </c:forEach>

                    console.log("exno ==========>", $('#exno').val());
                    if(exhiname == 'selected'){
                        alert('전시회를 선택해주세요')
                    }else{
                        let formObj = $('form')
                        formObj.submit();

                    }//if - else
                });

            });
        </script>
    </head>
    <body>
        <div class="container">
            <form action="/pre/registerAction" method="POST">
                <table border="1">
                    <tbody>
                        <tr>
                            <th>
                                <label for="applyer">성명</label>
                            </th>
                            <td>
                                <div>
                                    <input type="text" id="applyer" name="applyer" value="${member.memberName}" readonly>
                                </div>
                            </td>
                            <th><label for="email">전자우편</label></th>
                            <td>
                                <input type="text" id="email" name="email" value="${member.email}" readonly>
                            </td>
                        </tr>   
                        <tr>
                            <th><label for="phone">휴대전화</label></th>
                            <td><input type="text" id="phone" name="phone" value="${member.phone}" readonly></td>
                            <th><label for="appname">전시회</label></th>
                            <td>
                                <div>
                                    <input type="hidden" name="memberid" value="Blognation">
                                    <select name="appname" id="exname">
                                        <option value="selected">전시회 선택</option>
                                        <c:forEach items="${__EXHI__}" var="ex">
                                            <option value="${ex.exname}">${ex.exname} (
                                                <fmt:formatDate value="${ex.exstart}" type="date"/> ~
                                                <fmt:formatDate value="${ex.exend}" type="date"/>
                                                )
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" name="exno" id="exno" value="">

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="c213">회사분류</label>
                            </th>
                            <td colspan="3">
                                <div>
                                    <input type="checkbox" value="a" name="fnCode1_new" id="c213_1" class="i_radio">
                                    <label for="c213_1">정부/공공기관</label>
                                    <br>
                                    <input type="checkbox" value="b" name="fnCode1_new" id="c213_2" class="i_radio">
                                    <label for="c213_2">서비스업</label>
                                    <br>
                                    <input type="checkbox" value="c" name="fnCode1_new" id="c213_3" class="i_radio">
                                    <label for="c213_3">제조업</label>
                                    <br>
                                    <input type="checkbox" value="d" name="fnCode1_new" id="c213_4" class="i_radio">
                                    <label for="c213_4">협회/단체</label>
                                    <br>
                                    <input type="checkbox" value="e" name="fnCode1_new" id="c213_5" class="i_radio">
                                    <label for="c213_5">무역업(바이어)</label>
                                    <br>
                                    <input type="checkbox" value="f" name="fnCode1_new" id="c213_6" class="i_radio">
                                    <label for="c213_6">학교/연구/교육기관</label>
                                    <br>
                                    <input type="checkbox" value="g" name="fnCode1_new" id="c213_7" class="i_radio">
                                    <label for="c213_7">유통업체</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode1_new" id="c213_8" class="i_radio">
                                    <label for="c213_8">기타</label>
                                    <br>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="c214">업무분야</label>
                            </th>
                            <td colspan="3">
                                <div>
                                    <input type="checkbox" value="a" name="fnCode2_new" id="c214_1" class="i_radio">
                                    <label for="c214_1">사무/경영/관리</label>
                                    <br>
                                    <input type="checkbox" value="b" name="fnCode2_new" id="c214_2" class="i_radio">
                                    <label for="c214_2">학생</label>
                                    <br>
                                    <input type="checkbox" value="c" name="fnCode2_new" id="c214_3" class="i_radio">
                                    <label for="c214_3">판매/영업/마케팅</label>
                                    <br>
                                    <input type="checkbox" value="d" name="fnCode2_new" id="c214_4" class="i_radio">
                                    <label for="c214_4">주부</label>
                                    <br>
                                    <input type="checkbox" value="e" name="fnCode2_new" id="c214_5" class="i_radio">
                                    <label for="c214_5">기술/연구개발</label>
                                    <br>
                                    <input type="checkbox" value="f" name="fnCode2_new" id="c214_6" class="i_radio">
                                    <label for="c214_6">자영업자</label>
                                    <br>
                                    <input type="checkbox" value="g" name="fnCode2_new" id="c214_7" class="i_radio">
                                    <label for="c214_7">생산/품질관리</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode2_new" id="c214_8" class="i_radio">
                                    <label for="c214_8">기타</label>
                                    <br>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="c215">참관목적</label>
                            </th>
                            <td colspan="3">
                                <div>
                                    <input type="checkbox" value="a" name="fnCode3_new" id="c215_1" class="i_radio">
                                    <label for="c215_1">정보수집/창업정보</label>
                                    <br>
                                    <input type="checkbox" value="b" name="fnCode3_new" id="c215_2" class="i_radio">
                                    <label for="c215_2">일반관람</label>
                                    <br>
                                    <input type="checkbox" value="c" name="fnCode3_new" id="c215_3" class="i_radio">
                                    <label for="c215_3">시장/신상품 정보조사</label>
                                    <br>
                                    <input type="checkbox" value="d" name="fnCode3_new" id="c215_4" class="i_radio">
                                    <label for="c215_4">차기전시회참가</label>
                                    <br>
                                    <input type="checkbox" value="e" name="fnCode3_new" id="c215_5" class="i_radio">
                                    <label for="c215_5">구매상담/신규 거래선 확보</label>
                                    <br>
                                    <input type="checkbox" value="f" name="fnCode3_new" id="c215_6" class="i_radio">
                                    <label for="c215_6">기타</label>
                                    <br>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="c216">인지경로</label>
                            </th>
                            <td colspan="3">
                                <div>
                                    <input type="checkbox" value="a" name="fnCode4_new" id="c216_1" class="i_radio">
                                    <label for="c216_1">TV광고(지상파)</label>
                                    <br>
                                    <input type="checkbox" value="b" name="fnCode4_new" id="c216_2" class="i_radio">
                                    <label for="c216_2">TV광고 (케이블)</label>
                                    <br>
                                    <input type="checkbox" value="c" name="fnCode4_new" id="c216_3" class="i_radio">
                                    <label for="c216_3">TV프로그램/뉴스</label>
                                    <br>
                                    <input type="checkbox" value="d" name="fnCode4_new" id="c216_4" class="i_radio">
                                    <label for="c216_4">라디오광고</label>
                                    <br>
                                    <input type="checkbox" value="e" name="fnCode4_new" id="c216_5" class="i_radio">
                                    <label for="c216_5">신문/잡지/전단지</label>
                                    <br>
                                    <input type="checkbox" value="f" name="fnCode4_new" id="c216_6" class="i_radio">
                                    <label for="c216_6">지하철/버스 영상광고</label>
                                    <br>
                                    <input type="checkbox" value="g" name="fnCode4_new" id="c216_7" class="i_radio">
                                    <label for="c216_7">버스외부 광고</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode4_new" id="c216_8" class="i_radio">
                                    <label for="c216_8">인터넷/SNS/홈페이지</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode4_new" id="c216_9" class="i_radio">
                                    <label for="c216_9">모바일 초청장/캔고루</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode4_new" id="c216_10" class="i_radio">
                                    <label for="c216_10">홍보물(초청장/브로슈어/포스터)</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode4_new" id="c216_11" class="i_radio">
                                    <label for="c216_11">옥외광고(홍보탑/전광판/육교현판/가로등배너)</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode4_new" id="c216_12" class="i_radio">
                                    <label for="c216_12">생활접정형 광고(편의점, 마트 외)</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode4_new" id="c216_13" class="i_radio">
                                    <label for="c216_13">거래업체/유관기관/지인소개</label>
                                    <br>
                                    <input type="checkbox" value="h" name="fnCode4_new" id="c216_14" class="i_radio">
                                    <label for="c216_14">기타</label>
                                    <br>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="c217">관심분야</label>
                            </th>
                            <td colspan="3">
                                <div>
                                    <input type="checkbox" value="a" name="fnCode5_new" id="c217_1" class="i_radio">
                                    <label for="c217_1">생활용품</label>
                                    <br>
                                    <input type="checkbox" value="b" name="fnCode5_new" id="c217_2" class="i_radio">
                                    <label for="c217_2">주방용품</label>
                                    <br>
                                    <input type="checkbox" value="c" name="fnCode5_new" id="c217_3" class="i_radio">
                                    <label for="c217_3">뷰티용품</label>
                                    <br>
                                    <input type="checkbox" value="d" name="fnCode5_new" id="c217_4" class="i_radio">
                                    <label for="c217_4">건강용품</label>
                                    <br>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <button type="button" id="submitBtn">등록</button>
                <button type="button" id="quitBtn">취소</button>
            </form>
        </div>
    </body>
    </html>