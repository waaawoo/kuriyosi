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

  //合計金額出力よう
  // 変数へ代入
  const nums_all = document.querySelectorAll('.num');
  const numsLength = nums_all.length;
  const sum_price = [numsLength];
  // 要素分イベントを用意
  document.querySelectorAll('.num').forEach((nums) => {
    nums.addEventListener('keyup', () => {
      // どの要素をクリックしたか判定
      roop_count = [].slice.call(nums_all).indexOf(nums);
      let count = nums.value;
      price = document.getElementsByClassName('sales_price');
      // クリックした要素ならば計算して変数に代入
      for(let index = 0; index < numsLength; index++){
        if(index == roop_count){
          sum = (parseFloat(price[index].innerText) * count)
        }
      }
      // 要素ごとに配列へ格納
      for(let roop = 0; roop < numsLength; roop++){
        if(roop == roop_count){
          sum_price[roop] = sum;
        }
      }
      // 配列の合計値を変数へ格納
      let totalsum = sum_price.reduce(function(a, x){return a + x;});
      console.log("合計"  + totalsum);
      document.getElementById("sales_price_price").value = totalsum;
    });
  });

  // スクロール時固定
  $(function($) {
    var nav = $('.sales__suminput'),
    offset = nav.offset();
    $(window).scroll(function () {
      if($(window).scrollTop() > offset.top) {
        nav.addClass('sales__suminput');
      } else {
        nav.removeClass('sales__suminput');
      }
    });
  });
});
