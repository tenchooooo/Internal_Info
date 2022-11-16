/*global $*/

$('#box-contents .box[id != "box1"]').hide();
$(function(){
  $('[name=schedule[select_schedule]:radio').change( function(){
    if($('[id="schedule_select_schedule_1"]').prop("checked")){
      $('.box').fadeOut();
      $('.box1').fadeIn();
    } else if($('[id="schedule_select_schedule_2"]').prop("checked")){
      $('.box').fadeOut();
      $('.box2').fadeIn();
    } else if($('[id="schedule_select_schedule_3"]').prop("checked")){
      $('.box').fadeOut();
      $('.box3').fadeIn();
    }
  });
});