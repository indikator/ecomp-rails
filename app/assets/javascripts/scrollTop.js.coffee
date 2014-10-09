$(document).on "page:change", ->
  $(window).scroll ->
    if $(this).scrollTop() != 0
      $('#toTop').fadeIn()
    else $('#toTop').fadeOut()
  $('#toTop').click ->
    $('body,html').animate({scrollTop:0},800)