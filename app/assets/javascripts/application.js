// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require_self

/* global $ */
//HTMLの読み込みが完了してからjQueryによる操作を開始するためreadyイベントを使用。
//$(document).ready()。省略形は$(function(){この中にjQuery});


// トリガー部分
$(function(){
  $(".trigger").click(function(){
    $(this).next().toggle();
  });
});

// 文字カウント
$(function(){
  $('.txt-field-1').on('keydown keyup keypress change', function(){
    var str = $(this).val();
    str = str.replace(/\n/g, '');
    var strCount = "現在" + str.length + "文字";
    $(".count_num_1").html(strCount);
  });
});

$(function(){
  $('.txt-field-2').on('keydown keyup keypress change', function(){
    var str = $(this).val();
    str = str.replace(/\n/g, '');
    var strCount = "現在" + str.length + "文字";
    $(".count_num_2").html(strCount);
  });
});

$(function(){
  $('.txt-field-3').on('keydown keyup keypress change', function(){
    var str = $(this).val();
    str = str.replace(/\n/g, '');
    var strCount = "現在" + str.length + "文字";
    $(".count_num_3").html(strCount);
  });
});

$(function(){
  $("#ttl-field").on("keydown keyup keypress change", function(){
    var str = $(this).val();
    str = str.replace(/\n/g, '');
    var strCount = "現在" + str.length + "文字";
    $(".count").html(strCount);
  });
});

// フォローボタン
$(function(){
  $(".following-btn").hover(function(){
    $(this).val('解除する');
  }, function() {
    $(this).val('フォロー中');
  });
});

// 機能ボタン
 //太字
$(function(){
  var field = document.getElementById('txt-field-2');
  var tag = new Array('<b>', '</b>');
   $(".bold").click(function(){
   var start = field.selectionStart;
   var end = field.selectionEnd;
   var selected = end - start;
   var target = selected ? field.value.substr(start, selected) : '';
   field.value = field.value.substr(0, start) + tag[0] + target + tag[1] +field.value.substr(end, field.value.length);
   field.focus();
   field.setSelectionRange(start, (start + tag[0].length + selected + tag[1].length));
  });
});
 //小文字
$(function(){
  var field = document.getElementById('txt-field-2');
  var tag = new Array('<small>', '</small>');
   $(".small-script").click(function(){
   var start = field.selectionStart;
   var end = field.selectionEnd;
   var selected = end - start;
   var target = selected ? field.value.substr(start, selected) : '';
   field.value = field.value.substr(0, start) + tag[0] + target + tag[1] +field.value.substr(end, field.value.length);
   field.focus();
   field.setSelectionRange(start, (start + tag[0].length + selected + tag[1].length));
  });
});
 //大文字
$(function(){
  var field = document.getElementById('txt-field-2');
  var tag = new Array('<big>', '</big>');
   $(".big-script").click(function(){
   var start = field.selectionStart;
   var end = field.selectionEnd;
   var selected = end - start;
   var target = selected ? field.value.substr(start, selected) : '';
   field.value = field.value.substr(0, start) + tag[0] + target + tag[1] +field.value.substr(end, field.value.length);
   field.focus();
   field.setSelectionRange(start, (start + tag[0].length + selected + tag[1].length));
  });
});

 //トップページへ戻るボタン
function updateButton(){
    if ($(this).scrollTop() >= 800){
        $("#back-to-top").fadeIn();
    } else {
        $("#back-to-top").fadeOut();
    }
}

$(document).ready(function(){
    $(window).scroll(updateButton);
    $("#back-to-top").click(function(){
        $("html, body").animate(
            {
                scrollTop: 0
            },
            600
            );
            return false;
    });
});