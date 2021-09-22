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
        
        <title>get.jsp</title>
        
        <!-- ======================== JQUERY ======================= -->
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        <script src="/resources/js/reply.js"></script>
        


        <!-- ======================== Bootstrap ======================= -->
        
        <!-- 합쳐지고 최소화된 최신 CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        
        <!-- 부가적인 테마 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        
        <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        
        <script>

            $(function () {
                console.debug("jq started.");
                console.log("================ JS TEST ===============");
                
                var bnoValue = '<c:out value = "${event.bno}"/>'
                var replyUL = $(".chat");

                showList(1);

                function showList(page) {
                    console.debug("showList invoked.")
                    console.log("showList: " + page)
                
                    replyService.getList({
                        bno:"${event.bno}", page: page || 1}, function (replyCnt, list) {
                            console.log("page: " + page)
                            console.log("replyCnt: " + replyCnt);
                            console.log("list: " + list);

                            if(page == -1){
                                currPage = Math.ceil(replyCnt / 10.0);
                                showList(currPage);
                                return;
                                
                            }//if
                            
                            var str="";

                            if(list == null || list.length == 0){
                                                                
                                return;
                                
                            }//if

                            for(var i = 0, len = list.length || 0; i < len; i++){
                                str +="<li class='left clearfix' data-reno='" + list[i].reno + "'>";
                                str +="<div><div class='header'><strong class='primary-font'>[" + list[i].reno + "] " + list[i].memberid + "</Strong>";
                                str +="<small class='pull-right text-muted'>" + replyService.displayTime(list[i].redate) + "</small></div>";
                                str +="<p>" + list[i].recontent + "</p></div></li>";
                            }//for

                            replyUL.html(str);

                            showReplyPage(replyCnt);
                        });//end function
                }//showList()




                //==================== modal관련 객체 =====================//
                // 여러 함수에서 사용할 것이라서 바깥쪽에 빼둠 
                var modal = $(".modal");
                var modalInputRecontent = modal.find("input[name='recontent']");
                var modalInputMemberID = modal.find("input[name='memberid']");
                var modalInputReDate = modal.find("input[name='redate']");
                
                var modalModBtn = $("#modalModBtn");
                var modalRemoveBtn = $("#modalRemoveBtn");
                var modalRegisterBtn = $("#modalRegisterBtn");
                //==================== modal관련 객체 =====================//


                //NewReply버튼 클릭시 모달창을 띄운다
                $("#addReplyBtn").on("click", function (e) {
                    console.log("NewReply clicked.");

                    modal.find("input").val("");
                    modalInputReDate.closest("div").hide();
                    modal.find("button[id != 'modalCloseBtn']").hide();
                    
                    modalRegisterBtn.show();
                    
                    $(".modal").modal("show")
                    
                });//onclick


                
                modalRegisterBtn.on("click", function (e) {

                    var reply = {
                        recontent: modalInputRecontent.val(),
                        memberid: modalInputMemberID.val(),
                        bno:bnoValue
                    };
                
                    replyService.add(reply, function (result) {
                        alert(result);

                        modal.find("input").val("");
                        modal.modal("hide");

                        // showList(1);
                        showList(-1);
                    }); //add

                });//onclick
                
                //선택자로 ul태그 .chat을 넣었지만 실제이벤트 대상은 li이다
                //li클릭시 reno값 가져오기(data객체)
                //댓글 조회 클릭 이벤트 처리
                $(".chat").on("click", "li", function (e) {
                    console.log("list clicked.");

                    var reno = $(this).data("reno");

                    replyService.get(reno, function (reply) {
                        modalInputRecontent.val(reply.recontent);
                        modalInputMemberID.val(reply.memberid);
                        modalInputReDate.val(replyService.displayTime(reply.redate)).attr("readonly", "readonly");
                        modal.data("reno", reply.reno);

                        modal.find("button[id !='modalCloseBtn']").hide();
                        modalModBtn.show();
                        modalRemoveBtn.show();

                        $(".modal").modal("show");
                    })
                    console.log(reno);
                });//click li

                modalModBtn.on("click", function (e) {
                    console.log("ModifyBtn clicked.");

                    var recontent = {reno:modal.data("reno"), recontent:modalInputRecontent.val()};

                    replyService.update(recontent, function (result) {
                        alert(result);

                        modal.modal("hide");

                        showList(currPage);
                    });
                })//modalModBtn.onclick

                modalRemoveBtn.on("click", function (e) {
                    console.log("removeBtn clicked.");

                    var reno = modal.data("reno");

                    replyService.remove(reno, function (result) {
                        alert(result);

                        modal.modal("hide");

                        showList(currPage);
                    });
                });
                

                var currPage = 1;                 //출력시킬 현재페이지번호
                var amount = 5;                   //한 페이지에 보여줄 댓글 수
                var replyPerPage = 5;            //각 페이지 아래에 보여줄, 페이지 번호목록의 길이

                var replyPageFooter = $(".panel-footer");
                
                function showReplyPage(replyCnt) {
                    console.debug("showReplyPage(replyCnt) invoked.");
                    console.log("\t+ replyCnt: " + replyCnt);

                    //끝페이지번호
                    var endPage = Math.ceil( (currPage * 1.0) / replyPerPage ) * replyPerPage;
                    
                    //현재페이지의 페이지번호목록의 시작번호 구하기
                    var startPage = endPage - (replyPerPage - 1);

                    //이전페이지목록 이동가능여부
                    var prev = startPage > 1;

                    //다음페이지목록 이동가능여부
                    var next = false;

                    if(endPage * amount >= replyCnt){
                        endPage = Math.ceil(replyCnt * 1.0 / amount);

                    }//if

                    if(endPage * amount < replyCnt){
                        next = true;

                    }//if

                    var str = "<ul class='pagination pull-right'>";

                        if(prev){
                            str += "<li class='page-item'><a class='page-link' href='" + (startPage -1) + "'>Previous</a></li>";

                        }//if

                        for(var i = startPage; i <= endPage; i++){
                            var active = currPage == i ? "active" : "";

                            str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
                        }//for

                        if(next){
                            str += "<li class='page-item'><a class='page-link' href='" + (endPage + 1) + "'>Next</a></li>";
                        }//if

                        str += "</ul></div>";
                        
                        console.log(str);

                        replyPageFooter.html(str);
                        
                }//showReplyPage

                
                replyPageFooter.on("click", "li a", function (e) {
                    e.preventDefault();

                    console.debug("page clicked.");

                    var targetPageNum = $(this).attr("href");

                    console.log("targetPageNum: " + targetPageNum);

                    currPage = targetPageNum;

                    showList(currPage);
                });


                
                
                //========================= add test ==========================//
                // replyService.add(
                //     {recontent:"JS Test", memberid:"Blognation", bno:bnoValue},
                //     function (result) {
                //         alert("ADDED: " + result);
                        
                //     }
                    
                //     ); //add
                    
                    
                    
                //========================= getList test ==========================//
                // replyService.getList(
                //     {bno:"${event.bno}", page: 1},
                //     function (list) {
                //         for(var i = 0, len = list.length||0; i < len ; i++){
                //             console.log(list[i]);
                            
                //         }//for
                    
                //     }
                    
                //     );//getList
                        
                        
                        
                //========================= remove test ==========================//
                // replyService.remove(39, function (count) {
                //     console.debug("remove() invoked.");
                //     console.log(count);
                    
                //     if(count == "success"){
                //         alert("REMOVED");
                        
                //     }//if
                    
                // },function (err) {
                //     alert("ERROR...");
                // }
                // );//remove
                        
                        
                        
                //========================= update test ==========================//
                // replyService.update({
                //     reno: 23,
                //     bno: bnoValue,
                //     recontent: "Modified Reply...."
                // }, function (result) {
                //     alert("수정완료!")
                    
                // });//update
                        
                        
                // //========================= get test ==========================//
                // replyService.get(10, function (data) {
                //     console.log(data);
                    
                // });//get
                        
            });//jq

        </script>

        <!-- 기존 javascript -->
        <script>
            $(function () {
                console.clear();
                console.debug('jq started..!');
                
                // $("#listBtn").on('click', function () {
                //     console.log('#listBtn button clicked.');
                    
                    
                //     location.href = "/event/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage${cri.pagesPerPage}";
                    
                // }); // .onclick
                
                
                // $("#modifyBtn").on('click', function () {
                //     console.log('#modifyBtn button clicked..');

                //             // location.href = "/board/modify?bno=${board.bno}";
                //             location.href = "/event/modify?bno=${event.bno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage${cri.pagesPerPage}";
                // }) // .onclick

                
                // iframe 높이 자동조절
                let iframe = document.querySelector("#child-iframe");

                iframe.addEventListener('load', function () {
                    iframe.style.height = iframe.contentDocument.body.scrollHeight + 'px';
                });

            }); //jq

        </script>

        <style>
            *{
                margin: 0 auto;
                padding: 0;
                list-style: none;
            }

            #container1{
                width: 1200px;
                margin-top: 50px;
                font-weight: bold;
            }
            .clear{
                clear: both;
            }

            #title_area{
                border-bottom: 1px solid rgb(201, 201, 201);
                border-top: 1px solid #6f2b89;
                height: 40px;
                line-height: 40px;
                font-size: 20px;
            }

            #title{
                margin-left: 10px;
                float: left;
                width: 70%;
            }
            
            #writer{
                float: right;
                width: 20%;
            }
            
            #date_area{
                background-color: #eee;
                font-size: 15px;
                height: 40px;
                line-height: 40px;

            }
            
            #register_date{
                margin-left: 10px;
                width: 85%;
                float: left;
            }

            #readCnt{
                width: 11%;
                float: right;
            }

            #top_space{
                margin-top: 10px;
            }

            #contents{
                border-top: 1px solid #999;
                border-bottom: 1px solid #999;
            }

            #wrote{
                padding: 30px 0 30px 10px;
                font-size: 15px;
                font-weight: bold;
            }   

            #content_img{
                margin: 0 auto;
            }
            .btn {
                width: 100px;
                height: 40px;

                border: 0;
                
                text-align: center;
                background: #005bbb;
                color: #fff;
                font-size: 15px;
                
                cursor: pointer;
            }

            #bottom_space{
                line-height: 50px;
                height: 50px;
            }
            #listBtn{
                margin-top: 5px;
                float: right;
            }
        </style>
        
    </head>
    <body>
        <div id="container1">

            <!-- 제목, 작성자, 등록일, 수정일, 조회수 -->
            <div id="tables">
                <div id="title_area">
                    <div id="title">${board.title}</div>
                    <div id="writer">작성자 : ${board.memberid}</div>
                </div>
                <div class="clear"></div>
                
                <div id="date_area">
                    <div id="register_date">등록일 : <fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${board.insert_ts}" /></div>
                    <div id="readCnt">조회수 : ${board.readcnt}</div>
                </div>
            </div>
            <div id="top_space"></div>

            <!-- 콘탠츠내용, 이미지 -->
            <div id="contents">
                <p id="wrote">
                    ${board.content} <br>
                </p>
                <div id="content_img">
                    <img src="/resources/event_img/${photo.fpath}${photo.frename}" alt="">
                </div>
            </div>


            <!-- 글수정, 답변, 목록 버튼 -->
            <!-- <div id="bottom_space">
                <div id="btn_area">
                    <button type="button" class="btn" id="modifyBtn">글 수정</button>
                    <button type="button" class="btn" id="listBtn">목록</button>
                </div>
            </div> -->
        
        </div>            


            <div class="row">
                <div class="col-lg-12">
                    
                    <!-- /.panel -->
                    <div class="panel panel-default">

                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>Reply
                            <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">NewReply</button>
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="chat">
                                <!-- start reply -->
                                <li class="left clearfix" data-reno="10">
                                    <div>
                                        <div class="header">
                                            <!-- <strong class="primary-font">Blognation</strong>
                                            <small class="pull-right next-muted">2021-09-01 10:14</small> -->
                                        </div>
                                        <!-- <p>Good Job!</p> -->
                                    </div>
                                </li>
                                <!-- end reply -->
                            </ul>
                            <!-- ./end ul -->
                        </div>
                        <!-- /.panel .chat-panel -->
                        <div class="panel-footer">
                            
                        </div>
                    </div>
                </div>
                <!-- ./end row -->
            </div>


            <!-- Modal창 -->
            <div 
            class="modal fade" 
            id="myModal" 
            tabindex="-1" 
            role="dialog" 
            aria-labelledby="myModalLabel"
            aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button 
                                type="button" 
                                class="close" 
                                data-dismiss="modal" 
                                aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
                        </div>
                        <div class="modal-body">
                            <h1>id : ${__LOGIN__.memberid}</h1>
                            <div class="form-group">
                                <label>recontent</label>
                                <input class="form-control" name="recontent" value="NewReply!!!">
                            </div>
                            <div class="form-group">
                                <label>memberid</label>
                                <input class="form-control" name="memberid" value="${__LOGIN__.memberid}" readonly>
                            </div>
                            <div class="form-group">
                                <label>redate</label>
                                <input class="form-control" name="redate" value="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
                            <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                            <button id="modalRegisterBtn" type="button" class="btn btn-default">Register</button>
                            <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- modal-content/ -->
                </div>
                <!-- modal-dialog -->
            </div>
            <!-- modal -->
            
        </div>
    </body>
</html>