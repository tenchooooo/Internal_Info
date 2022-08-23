
function changeDisabled() {
    if ( document.Form1["schedule"][1].checked ) { // 「1」のラジオボタンをクリックしたとき
        document . Form1["inputNumber"] . disabled = ; // 「その他」のラジオボタンの横のテキスト入力欄を有効化
    } else { // 「その他」のラジオボタン以外をクリックしたとき
        document . Form1["inputNumber"] . disabled = true; // 「その他」のラジオボタンの横のテキスト入力欄を無効化
    }
}
window.onload = changeDisabled; // ページを表示したとき、changeDisabled() を呼び出す
// -->
