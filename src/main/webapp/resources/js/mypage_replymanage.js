/**mypage/replymanage.js
 * 
 */

$(function () {
    console.debug('jq started...2');
    
    $('#searchBtn').on('click',function () {
        console.log('searchBtn on click triggered');

        let searchForm = $('#replyForm');
        
        searchForm.attr('action', '/mypage/replymanage');
        searchForm.attr('method', 'GET');

        searchForm.submit();
    });//sarch on click

    $('#bname').on('change',function () {
        console.debug('bname on change event triggered');
        
        // alert(this.value);

        let searchForm = $('#replyForm');
        
        searchForm.attr('action', '/mypage/replymanage');
        searchForm.attr('method', 'GET');
        
        searchForm.submit();
    }); //on change
});//.jq