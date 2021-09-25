/*apply/app.jsp
 * 
 */

$(function () {
    console.debug('jq started..');

    $('#agreeBtn').on('click',function () {
        console.debug('agreeBtn on click event triggered..');

        if(document.querySelector('#agree').checked){
            let form = $('#appForm');
            form.submit();
        }else{
            alert('약관에 동의를 해야지만 신청서 작성이 가능합니다. ');
        }//if-else

    });//on click
});//.jq