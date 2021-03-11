window.onload = function(){
  $('.burger-btn').on('click',function(){
    $('.burger-btn').toggleClass('close');
    $('.nav-wrapper').fadeToggle(500);
  });
}
