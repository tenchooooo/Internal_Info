// 複数の関数で表示できるようにする。
// 入力ダイアログで値を入力する。

let promptStr = prompt('何か好きな文字を入力してください。');

alert(promptStr);

// 今回は入力もできるように設定していきます。
// ブラウザ上で文字を入力数場合、通常はフォームが使われます。
// 今回は、入力ダイアログに入力して実行してみます。

// 起動し、好きな文字を入力してOKボタンをクリックすると、入力された文字列はprompt()関数の戻り値として、
// 変数「promptStr」に格納され、アラートウィンドウ上に表示される。