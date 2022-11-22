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
	$('#radioBtn3 input').on('click', function(){
	  var index = $('#radioBtn3 input').index(this);
	  $("#tripBox .box").hide();
		$("#tripBox .box").removeClass("active");
		$("#tripBox .box").eq(index).addClass('active');
		$('#tripBox .active').show();
	});
	
// 	違うラジオボタンを選択したときに前の設定を削除
	$('#radioBtn input').change(function(){
	  $('input[name="schedule[attendance]"]').removeAttr("checked").prop("checked", false).change();
	  $('input[name="schedule[schedule]"]').removeAttr("checked").prop("checked", false).change();
	  $('input[name="schedule[trip]"]').val('');
	  $('input[name="schedule[go_out]"]').val('');
	  $('input[name="schedule[other]"]').val('');
	});
	$('#radioBtn3 input').change(function(){
	  $('input[name="schedule[trip]"]').val('');
	  $('input[name="schedule[go_out]"]').val('');
	});
});

