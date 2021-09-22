<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>질문게시판</title>

        <style>
            *{
                margin: 0 auto;
                font-family: "Noto Sans KR Light";
            }

            #content{
                width: 1200px;
            }

            #register{
                width: 900px;
            }

            #title{
                display: inline-block;
                width: 900px;
                height: 30px;

                border: none;
                border-bottom: 1px solid grey;
                
            }

            #memberid{
                display: inline-block;
                width: 100px;
                height: 30px;

                border: none;
            }

    

            button{
                border: none;
                width: 100px;
                height: 40px;
                line-height: 40px;
                text-align: center;
                background: #005bbb;
                color: #fff;
                font-size: 15px;
            }
            #file{
                display: none;
            }
            .input-file-button{
                
                width: 100px;
                height: 40px;
                font-size: 15px;
                text-align: center;

                line-height: 40px;
                display: inline-block;
                background-color:white;
                /* border-radius: 4px; */
                color: #005bbb;
                cursor: pointer;

                border: 1px solid #005bbb;
            }

            td{
                padding: 5px;
            }
        </style>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" ></script>

        <!-- Summer note -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
        
        <script>
            $(function () {
               console.log("jq started..."); 

                 $('#listBtn').on('click',function () {
                   location.href="/question/list${cri.getPagingUri}" ; 
                
               });//onclick list

               $('#summernote').summernote({
                height: 300,
                width: 900,   
                toolbar: [
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['font', ['strikethrough', 'superscript', 'subscript']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']]
                ]
                });//summer note
            });//jq
        </script>
   
   
    </head>
    <body>
        <div id="content">

            <form action="/question/register" method="POST" enctype="multipart/form-data">
               	
                <table id="register">
                    <tr>
                        <td>
                            <input type="text" name="title" id="title" size="50" placeholder="제목을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            작성자 <input type="text" name="memberid" id="memberid" size="20" value="${__LOGIN__.memberid}">
                            <input type="radio" name="public_tf" value="T" checked>공개&nbsp;
                            <input type="radio" name="public_tf" value="F">비공개
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="summernote" name="editordata" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="file" class="input-file-button">파일업로드</label>
                            <input type="file" name="file" id="file">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" id="submitBtn">등록</button>
                            <button type="button" id="listBtn">목록</button>
                        </td>
                    </tr>
                    
                </table>

               
            </form>

        </div>
    </body>
</html>