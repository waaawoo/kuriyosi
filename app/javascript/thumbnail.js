$(function(){

  // サムネイル切り替え
  $(".thumbnail_image").on('click', function(){
    // srcを取得して
    let dataUrl = $(this).attr("src");
    // 書き換える
    $("#main_image_top").attr('src',dataUrl);
  });

  // FlashMessage
  setTimeout("$('.flash_message').fadeOut('slow')", 1500)
});
