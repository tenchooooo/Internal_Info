/*global $*/
// $(document).ready(function(){  HTMLの読み込みが終わってからjQueryが実行されるように記述する必要がある。
// 頻繁に使うコードなので、省略形も用意されている。
// ↓↓↓
$(function(){
  $("p").html("<h1>Hello jQuery!!!!!!</h1>");
});

// jQueryの基本書式は下記
// $(セレクタ).メソッド(パラメータ);
// セレクタは、捜査の対象になる部分。セレクタという呼び名は、CSSでおなじみ。
// メソッドでは、何を行うのかを記述。
// メソッドにパラメータを指定すると、その内容に書き換えられる。
// パラメータを指定しない場合は、メソッドが取得される。

// このようにjQueryでは、セレクタとメソッド、さらにパラメータを用いて、「どこに対して何を行うか」を記述する。

// $(function(){
  // $('.box1').css({
    // 'background-color': '#0000FF',
    // 'height': '100px'
  // });
// });

// CSSのスタイルをjQueryで変更するときは、「CSSメソッド」を使う。
// 1つのCSSを記述するときは、プロパティと値をそれぞれ「'」で囲み、間を「,」で区切るシンプルな書き方をする。

// $('セレクタ').css('background-color,'#000FF);

// 今回のように複数のプロパティを指定するときは、少し書き方が変わる。
// $('セレクタ').css({
  // 'プロパティ1': '値1',
  // 'プロパティ2': '値2'
// });

// アニメーション

// 上から下
// (CSSにdisplay: noneを追加)
// $(function(){
  // $('.box1').slideDown();
// });

// 下から上
// （CSSのdisplay: noneを削除）
// $(function() {
    // $('.box1').slideUp();
// });

// 要素の表示、非表示
// 非表示要素をjQueryで表示させる

// （CSSでdisplay: none;を追記）
// $(function() {
    // $('.box1').show();
    // $('.box1').css({'background-color': '#0000FF'});
// });

// 表示要素をjQueryで非表示に
// (CSSでdisplay: none;を削除)
// $(function() {
  // $('.box1').hide();
// });

// 1.要素を上から下へスライドさせた後、赤色の正方形を青色の長方形（幅200px、高さ100px）に変更する。
// 2.1のあと、設楽加上へスライドさせるようにする。

// CSSでdisplay: none;を追加
$(function() {
  $('.box1').slideDown(function() {
    $('.box1').css({
      'background-color': '#0000FF',
      'width': '200px',
      'height': '100px'
    }).slideUp();
  });
});