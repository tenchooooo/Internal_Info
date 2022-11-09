// 複数の関数を定義する。
// 次に、入力した値を処理する関数を作成していきます。
// 今回は、ユーザが入力したじゃんけんの手（グー・チョキ・パー）と、JavaScriptがランダムに出すじゃんけんの手を比較し
// 勝ち負けの結果を表示させる関数を定義します。
// まず、じゃんけんの手を入力するプロンプト欄を作成します。

// let user_hand = prompt('じゃんけんの手をグー、チョキ、パーから選んでください。');
// alert('あなたの選んだ手は' + user_hand + 'です。');

// これだけだと入力したじゃんけんと同じものがアラートウィンドウに表示されるだけになる。
// この処理に、相手のじゃんけんの手をランダムに選択する関数を追加していきます。

// function getJShand() {
  // let js_hand_num = Math.floor(Math.random() * 3);
  // この行では、乱数を生成する関数を設定しています。これにより、グー、チョキ、パーがランダムに表示されるようになります。
  // Math.floor（Math.random（）*3）は、0～2までのランダムな整数値を生成します。
  // 関数内の「3」は、ランダム生成したい整数値の+1を指定しています。

  // if(js_hand_num == 0) {
    // js_hand = "グー";
  // } else if(js_hand_num == 1) {
    // js_hand = "チョキ";
  // } else if(js_hand_num == 2) {
    // js_hand = "パー";
  // }
  // ランダム生成された数値をもとに条件分岐させ、グーチョキパーを出しわけます。


  // return js_hand;
// }
// 最後に関数の戻り値として、グー、チョキ、バーの文字列を返します。
// これを応用し、入力されたグー、チョキ、バーとJavaScriptで生成したランダムなじゃんけんの手を比べ、価値・負け・引き分けの結果を表示しています。




// じゃんけんの手を入力してもらうプロンプト欄を生成。
let user_hand = prompt('じゃんけんの手をグー、チョキ、パーから選んでください。');

// 「"グー"以外且つ、"チョキ"以外且つ、"パー"以外且つ、キャンセルボタン以外だったら」という条件を記述。
while ((user_hand != "グー") && (user_hand != "チョキ") && (user_hand != "パー") && (user_hand != null)) {
  alert('グー・チョキ・パーのいずれかを入力してください');
  user_hand = prompt('じゃんけんの手をグー、チョキ、パーから選んでください');
}

// じゃんけんの手をランダムに作成する関数を呼び出す。
let js_hand = getJShand();

// ユーザの手とJavaScriptのじゃんけんの手を比べる関数を呼び出し、結果をjudgeに入れる。
let judge = winLose(user_hand, js_hand);

// 結果を表示する。
// 「キャンセルじゃなかったら(user_hand != null)」じゃんけんの結果を出し、
// elseで「キャンセルだったら」"またチャレンジしてね"という文言が出せる処理をする。
if (user_hand != null) {
  alert('あなたの選んだ手は' + user_hand + 'です。\nJavaScriptの選んだ手は' + js_hand + 'です。\n結果は' + judge + 'です。');
} else {
  alert('またチャレンジしてね');
}

// ランダムでじゃんけんの手を作成する関数
function getJShand() {
  let js_hand_num = Math.floor(Math.random() * 3);
  let hand_name;

  if (js_hand_num == 0){
    hand_name = "グー";
  } else if (js_hand_num == 1) {
    hand_name = "チョキ";
  }else if (js_hand_num == 2) {
    hand_name = "パー";
  }


  return hand_name;
}

// ユーザの手とJavaScriptのじゃんけんの手を比べる関数
function winLose(user, js) {
  let winLoseStr;

  if(user == "グー"){
    if(js == "グー"){
      winLoseStr = "あいこ";
    } else if (js == "チョキ"){
      winLoseStr = "勝ち";
    } else if (js == "パー"){
      winLoseStr = "負け";
    }
  }else if (user == "チョキ"){
    if(js == "グー") {
      winLoseStr ="負け";
    } else if (js =="チョキ"){
      winLoseStr = "あいこ";
    } else if (js == "パー"){
      winLoseStr = "勝ち";
    }
  }else if (user == "パー") {
    if(js == "グー"){
      winLoseStr = "勝ち";
    }else if (js == "チョキ") {
      winLoseStr = "負け";
    }else if (js == "パー") {
      winLoseStr = "あいこ"
    }
  }

  return winLoseStr;
}