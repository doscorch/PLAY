/**************************************************** 
** Christian Strauss
** Tristan Rooney
** Dr Sauppe
** Project - play.js
** 3-18-2018
****************************************************/  

// function toggles tabs
$(document).ready(function () {
    $('li.tab').click(function () {
    $('.tabs li.tab').removeClass('active');
    $(this).addClass('active');
    var id = $(this).find('a').attr('href');
    $('.tab-content').removeClass('active');
    $(id).addClass('active');
    });
});
