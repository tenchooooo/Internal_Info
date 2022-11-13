/*global $*/
// $(function(){
  // $('.box1').mouseover(function(){
    // $('.box1').css({'background-color' : '#0000FF'});
  // });
  // $('.box1').mouseout(function(){
    // $('.box1').css({'background-color' : '#FF0000'});
  // })
// });

// 個の記述では、マウスカーソルのイベントを検出して、その都度CSSを変更させています。
// この記述だと、すべてのCSSをいちいち書かねばならず、手間がかかってしまう。
// そこで、マウスオーバー時のCSS（class)をあらかじめ定義しておき、マウスカーソルの状況に応じて、そのCSSを追加
// または解除するように設定する。

// $(function(){
  // $('.box1').mouseover(function(){
    // $('.box1').addClass('box1-ext');
  // })
  // $('.box1').mouseout(function(){
    // $('.box1').removeClass('box1-ext');
  // });
// });

// マウス操作のイベントとして、「マウスクリック」のイベントも設定できる。
// HTML要素がクリックされたときに以下２つのイベントが行われるように設定する。
// ・.box1がクリックされたときは、box1-extのclassを追加する
// ・マウスアウトされたときは、box1-extのclassを削除する
// マウスクリックのイベントには、.click()もあります。しかし、.clickの場合は、クリックされた時点でイベントが終わってしまいます。
// 今回は、クリック後に複数のイベントが行われるようにしたいので、onをつけたいかのような書き方をする。

// $('セレクタ名').on('click',function(){
  // イベント発生時に行われる処理
// });

$(function(){
  $('.box1').on('click', function(){
    $('.box1').addClass('box1-ext');
  });
  $('.box1').mouseout(function(){
    $('.box1').removeClass('box1-ext');
  });
});