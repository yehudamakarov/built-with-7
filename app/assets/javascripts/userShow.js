$(function () {
    $('.js-show').click(function getUserInfo(e) {
        e.preventDefault
        $.getJSON(`${e.target.pathname}.json`, function(respData) {
            console.log('respData :', respData);
        })
        // get link from this or e and use it for the get request
    })
})