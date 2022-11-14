/*global $*/
$(function(){
  $('.menu-trigger').on('click', function(event){
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  })
})

// どのような処理が行われるか、見ていきます。
// .tggleClass()で、class属性を切り替える。
// 指定されているclass（ここではactive）をトグル処理するメソッドです。
// トグル処理では、該当のclass属性がある場合にはclassが削除され、無い場合にはclassが追加されます。

// aタグclassには、menu-triggerが指定され、activeは指定されていません。
// この時に.toggleClass()を設定すると、アイコンがクリックされたときにactiveクラスが追加され、もう一度クリックすると削除されます。
// このように、.toggleClass()によって、class属性の追加と削除が交互に行われます。
// さらに、menu-trigger.active span:nth-child(1)～(3)の各CSSによって、activeクラスになったときにアイコンが「×」になるように設定されています。
// このため、以下のように書くことで、アイコンが切り替わります。
// $(this)は7章で学習済みです。クリックされた要素自体を表します。
// $(this).toggreClass('active');

// .fadeToggle()でフェードイン・フェードアウトを切り替える。
// $('#sp-manu').fadeTggle();
// .fadeTggle()は、要素のフェードイン、フェードアウトを切り替えるメソッド。
// このメソッドを使って、ハンバーガーメニューを開いた時の状態を設定します。
// ここでは、#sp-manuが開いたときに、.fadeTggle()が処理されるように設定しています。
// #sp-menuはどこに設定されているかというと、ハンバーガーメニュー<div id="sp-manu">に設定されています。

// このように設定することで、ハンバーガーメニューがクリックされたときに、フェードインとフェードアウトが交互に実行されるようになります。
