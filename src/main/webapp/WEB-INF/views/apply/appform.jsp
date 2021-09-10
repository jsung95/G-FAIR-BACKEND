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

        <link rel="stylesheet" href="/resources/css/apply_appform.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>
        
        <script>
            $(function () {
                var result = '${__RESULT__}'

                if(result.length>0){
                    alert(result);
                }//if
            });//.jq
        </script>
        
        <script src="/resources/js/apply_appform.js"></script>
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
                        <input type="text" name="applycompany" value="">
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