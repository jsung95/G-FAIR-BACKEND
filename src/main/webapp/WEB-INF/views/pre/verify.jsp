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

        <title>verify.jsp</title>

        <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
        <link href="/resources/css/sub.css" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
        <script src="/resources/js/fullnav.js"></script>


        <style>
            th{
                width:150px;
                height: 50px;
            }

            td{
                width: 300px;
                text-align: center;
            }

            tr{
                border-bottom: solid 1px black;
            }
            
            h1{
                font-size: 25px;
                font-weight: bold;
            }
            .show_member_info{
                border-bottom: solid 1px black;
                border-top: solid 1px black;
                border-right: solid 1px black;
                border-left: solid 1px black;
            }
        </style>
    </head>
    
    <body>
        <div id="wrap">
 	
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        
                <div id="container">
                    <div id="aside">
                        <h2 class="asideMenu">관람정보</h2>
                        <ul id="parent">
                            <li><a class="chk" href="/pre/guide">사전관람안내</a></li>
                            <li><a class="chk" href="/pre/register">사전관람신청</a></li>
                            <li><a class="chk" href="/pre/verify">사전관람신청자 확인</a></li>
                        </ul>
        
                    </div>
                    <div id="content">
                        <div class="title">
                            <div class="map">home > 관람정보 > 사전관람신청자 확인 </div>
                            <h2 class="subName">사전관람신청자 확인</h2>
                        </div>
                        <div class="contentIn">
                            
                            <!-- 여기에 게시판 넣으면 됩니다. -->
                            <div class="sub_container">

                                <div class="sub_top">
                                    <br>
                                    <h1>${__LOGIN__.membername}님의 사전관람신청 현황입니다.</h1>
                                </div>
                                <!-- <tr>
                                    <th><label for="name">신청자명</label></th>
                                    <td>${__LOGIN__.membername}</td>
                                </tr>
                                <tr>
                                    <th><label for="phone">연락처</label></th>
                                    <td>${__LOGIN__.phone}</td>
                                </tr> -->
                                <c:forEach items="${__APP__}" var="app">
                                    <br>
                                    <table class="show_member_info">
                                        <tbody>
                                            <tr>
                                                <th><label for="appname">신청 전시회명/기간</label></th>
                                                <td>
                                                    ${app.appname} ( 
                                                    <fmt:formatDate pattern="YYYY.MM.dd" value="${app.exstart}" type="date"/> ~
                                                    <fmt:formatDate pattern="YYYY.MM.dd" value="${app.exend}" type="date"/> )
                                                    <br>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <th><label for="app.appdate">신청일</label></th>
                                                <td>
                                                    <fmt:formatDate pattern="YYYY.MM.dd" value="${app.appdate}" type="date"/><br>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                </c:forEach>
                            </div>
                        
                        </div>
                    </div>
                </div>
        
           
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
            </div> <!--wrap-->
    </body>
</html>