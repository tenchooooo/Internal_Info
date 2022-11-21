/*global $*/

$(function(){
	$('#radioBtn input').on('click', function(){
	  var index = $('#radioBtn input').index(this);
	  $("#displayBox .cm_box").hide();
		$("#displayBox .cm_box").removeClass("active");
		$("#displayBox .cm_box").eq(index).addClass('active');
		// eq()は、複数のHTML要素の中からインデックス番号を指定することで特定の要素だけを取得する。
		$('#displayBox .active').show();
	});
	$('#radioBtn2 input').on('click', function(){
	  var index = $('#radioBtn2 input').index(this);
	  $("#tripBox .box").hide();
		$("#tripBox .box").removeClass("active");
		$("#tripBox .box").eq(index).addClass('active');
		$('#tripBox .active').show();
	});
});

// 内容書いた後のボタン変更時にテキストの中身をクリアしたいprop?