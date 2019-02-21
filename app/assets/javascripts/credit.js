$(function(){
  $(window).ready(function(){
    if (window.location.href.match(/creditcard/)){
     //ライン
      $('.progress-state--first--line').css("background","#ea352d");

      $('.progress-state--second--line-left').css("background","#ea352d");

      $('.progress-state--second--line-right').css("background","#ea352d");

      $('.progress-state--third--line-left').css("background","#ea352d");

      $('.progress-state--third--line-right').css("background","#ea352d");

      $('.progress-state--forth--line-left').css("background","#ea352d");

    //会員情報 文字
      $('li.member-information').css("color","#888");

    //電話番号認証 丸
      $('.progress-state--second').css("background","#ea352d");

    //お届け先住所 丸
      $('.progress-state--third').css("background","#ea352d");

    //支払い方法
      $('li.payment-method-bar').css("color","#ea352d");

      $('.progress-state--forth').css("background","#ea352d");
    }
  });
});
