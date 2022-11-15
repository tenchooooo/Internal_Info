/*global $*/
// HTMLとCSSだけでは、4つのタブのコンテンツがすべて縦に並んで表示されてしまいます。
// jQueryを使って、クリックされたタブのコンテンツだけが表示されるように設定していきます。

// jQueryで「クリックイベント」を設定する。

$('#tab-contents .tab[id != "tab1"]').hide();
// ある値に等しくない要素を非表示にする。
// $()関数では、特定の属性を持つ要素や属性値を絞り込むことができます。
// 特定の属性を持つ要素のみ取得したいときは、以下のように記述します。
// $('要素[属性]')
// 属性値が特定の値に等しい要素だけを取得したいときは、以下のように記述します。
// $('要素[属性 = "値"]');
// 今回は、初期設定で表示されるのはTAB1のコンテンツだけにして、それ以外の内容は非表示にしたいと思います。
// 属性値が特定の値に等しくない要素だけを取得したいときは、以下のように記述します。
// $('要素[属性!="値]')
// また、.hide();は、特定のHTML要素を非表示にするメソッドです。
// このため、$('#tab-contents .tab[id != "tab1]').hide();と記述することで、id="tab-contents"のうち、class="tab"であり、
// id="tab1"ではない要素が非表示になります。

// クリックされたときの動作を設定する。
// 2行目からは、それぞれのタブがクリックされたときのイベントを設定しています。
$('#tab-menu a').on('click', function(event) {
// $('#tab-menu a').on('click',function(event){
  // イベント発生時に行われる処理
// });
// この書式は、「id="tab-menu"のaタグがクリックされたときに、処理を実行してください」の意味になります。
  $("#tab-contents .tab").hide();
  // id="tab-contents"内のいずれかのタブがクリックされたときに、その他部内の全コンテンツを一旦非表示にしています。
  $("#tab-menu .active").removeClass("active");
  // .removeClass()は、クラス属性が設定されているHTML要素から、クラスを削除するメソッドです。
  // ここでは、activeが削除対象のクラスとして指定されています。
  // CSSの#tab-menu .activeの設定では、タブのクラスがactiveの時は背景色が白色/文字色が黒になるように設定されています。
  // タブを切り替えるときは、このCSS設定を一旦削除しなければなりません。このため、.removeClass()にactiveクラスを指定しています。
  $(this).addClass("active");
  // .addClass()は、任意のHTML要素にクラス属性を追加できるメソッドです。
  // ここでは、activeが追加対象のクラスとして指定されています。
  // どのときにactiveクラスが追加されるかというと、$(this)のとき、つまり、タブがクリックされたときです。
  $($(this).attr("href")).show();
  // .attr()は、HTML要素の属性を取得したり設定できるメソッドです。
  // ここでは、href属性を取得するように指定しています。
  // さらに、.show()は、要素を表示するメソッドなので、取得したhref属性の中身が表示されることになります。
  // どのときに表示されるかというと、$(this)の時、つまり、タブがクリックされたときです。
  event.preventDefault();
  // これで完成です。
});