$(function(){
  $(window).ready(function(){
    if (window.location.href.match(/check/)){
      $('.progress-state--first--line').css("background","#ea352d");

          $('.progress-state--second--line-left').css("background","#ea352d");
      $('.progress-state--second--line-left').css("background","#ea352d");

      $('.progress-state--second').css("background","#ea352d");

    //電話番号認証 文字
      $('li.phone-number').css("color","#ea352d");

      $('li.member-information').css("color","#888");
    }
  })
});
