$(function(){
  $(".file").on('change', function(){
    let fileprop = $(this).prop('files')[0],
        find_img = $(this).parent().find('img'),
        filereader = new FileReader(),
        view_box = $(this).parent('.item_image__filed');

    if(find_img.length){
      find_img.nextAll().remove();
      find_img.remove();
    }

    let img = '<div class="img_view"><img alt="" class="img"><p><a href="#" class="img_del">画像を削除する</a></p></div>';

    view_box.append(img);

    filereader.onload = function() {
      view_box.find('img').attr('src', filereader.result);
      img_del(view_box);
    }
    filereader.readAsDataURL(fileprop);
  });

  function img_del(target){
    target.find("a.img_del").on('click',function(){
      let self = $(this),
          parentBox = self.parent().parent().parent();
      if(window.confirm('画像を削除します。\nよろしいですか？')){
        setTimeout(function(){
          parentBox.find('input[type=file]').val('');
          parentBox.find('.img_view').remove();
        } , 0);
      }
      return false;
    });
  }

  //
  $('#content').keyup(function(){
    let count = $(this).val().length;
    $(".content_count").text(count);
  });

  //
  $(function(){
    $('.news_form__image__area').change(function(){
      // imgタグを削除する
      $('img').remove();
      let file = $(this).prop('files')[0];
      let fileReader = new FileReader();
      fileReader.onloadend = function(){
        $('#preview').html('<img class="news_preview" src="' + fileReader.result + '"/>');
      }
      fileReader.readAsDataURL(file);
    });
  });

});
