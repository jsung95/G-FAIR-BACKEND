$(function(){
    console.log('uploadFile.. jq started....')
    var regex = new RegExp("(.*?)\.(JPG|PNG|jpg|png)$");//파일확장명 제한

    var maxSize = 2097152;//2mb

    function checkExtension(fileName,fileSize){//파일확장자와 크기를 확인해주는 메소드

        if(fileSize >= maxSize){
            alert("첨부파일이 너무 큽니다.");
            console.log("로그를 찍어보자1");

            return false;
        }//파일사이즈

        if(!regex.test(fileName)){
            alert("해당 종류의 파일은 업로드할 수 없습니다.");

            return false;
        }//확장자 체크

        return true;
    }//checkExtension

    // ---------------------------------------------

    // var cloneObj = $('.uploadDiv').clone();//uploadDiv를 복사
// -----------------------------------------------------------------------------------

    var uploadResult = $('.uploadResult ul');

    function showUploadedFile(uploadResultArr){//업로드파일 썸네일을 보여주고 다운로드 처리

        if(!uploadResultArr || uploadResultArr.length == 0){
            
            return;
        }//결과값이 있는지 확인

        var str = "";

        $(uploadResultArr).each(function(i, obj){//파일갯수에 따른 li태그 생성
            console.log('i의 값 :, obj의 값 :',i,obj)

            console.dir(obj);

            if(obj.fileType){//이미지파일일때
                //encoding 작업
                var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
                console.log('0. fileCallPath : ',fileCallPath);
                
                str += "<li data-uploadpath='"+obj.uploadPath+"'";
                str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-filetype='"+obj.fileType+"'";
                str += "><div>";
                // 여기까지 데이터전송값. DTO에서 받는다!

                str += "<span>"+obj.fileName+"</span>";

                // 아래 $('.uploadResult').on('click','button',function(e){에 있는 값 전송
                str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn-circle'><i class='times'>X</i></button><br>";
                str += "<img src='/file/display?fileName="+fileCallPath+"'>";
                str += "</div></li>";

            
                console.log(">>>>>>>>>>>>>>>>> str:",str);
            }else {//이미지 파일이 아닐때

                var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
                
                var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");

                str += "<li data-uploadpath='"+obj.uploadPath+"'";
                str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'data-filetype='"+obj.fileType+"'";
                str += "><div>";
                // 여기까지 데이터전송값. DTO에서 받는다!
                str += "<span>"+obj.fileName+"</span>";
                str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='file' class='btn-circle'><i class='times'>X</i></button><br>";
                str += "<a href='/file/download?fileName="+fileCallPath+"'>";
                str += "<img class='notImg' src='/resources/img/attach.png'></a>";
                str += "</div></li>";

                
                console.log(">>>>>>>>>>>>>>>>> str:",str);
            }//if-else
            
        });//파일갯수에 따른 li태그 생성

        uploadResult.append(str);
    }//showUploadedFile

// -----------------------------------------------------------------------------------

    $('input[type="file"]').change(function(e){//타입이 파일인 것을 찾아서 바꿔버림 
        //--> 파일 첨부하자마자 복사됌
        
        var formData = new FormData();

        var inputFile = $('input[name="uploadFile"]');

        var files = inputFile[0].files;
        console.log(files);
        
        for(var i=0; i<files.length; i++){//여러개의 파일이 업로드 됐을 때
            
            if(!checkExtension(files[i].name, files[i].size)){
                
                return false;
            }
            
            formData.append("uploadFile",files[i]);
        }

        $.ajax({
            url: '/file/uploadAjaxAction',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            dataType:'json',
            success: function(result){
                console.log(result);

                showUploadedFile(result);


                alert("Uploaded!")
            }//success
        });//ajaxSetting
    
    });//uploadBtn


// -----------------------------------------------------------------------------------


    // role이란, 시각장애인을 위한 태그. 해당부분이 form태그라는 것을 알려준다.
    var formObj = $('form[role="form"]')//폼태그 찾아서 넣음
    console.dir('확인1 : ',formObj);
    console.log('확인2 : ',formObj);

    $('#uploadBtn').on('click',function(e){
        console.log('submit clicked');

        e.preventDefault;//해당 버튼기능을 막는다.

        $('.uploadResult ul li').each(function(i,obj){
            console.log('i값 : ',i);
            console.log('obj값 : : ',obj);
            var jobj = $(obj);

            var regForm = $('#Reg');

            // regForm.attr('action','/anony/register');
            regForm.attr('method','POST');

            regForm.find('input[name=fileName]').val(jobj.data("filename"));
            regForm.find('input[name=uuid]').val(jobj.data("uuid"));
            regForm.find('input[name=uploadPath]').val(jobj.data("uploadpath"));
            regForm.find('input[name=fileType]').val(jobj.data("filetype"));

            regForm.submit();
        });

    })//button[type="submit"]

// -----------------------------------------------------------------------------------    
    // 삭제
    $('.uploadResult').on('click','button',function(e){
        console.log('delete file');

        var targetFile = $(this).data('file');
        var type = $(this).data('type');

        console.log('targetFile:',targetFile);
        console.log('type:',type);

        var targetLi = $(this).closest("li");//선택한 요소 중 가장 가까운 하나를 선택함.(버튼과 제일 가까운걸 찾음. ==> 내가 선택해서 누른 버튼의 다음 li를 찾아냄)

        $.ajax({
            url:'/file/deleteFile',
            data: {fileName: targetFile, type:type},
            dataType:'text',
            type: 'POST',
            success: function(result){
                alert(result);

                targetLi.remove();
            }//success
        })//.ajax

    })//uploadResult


})//.jq